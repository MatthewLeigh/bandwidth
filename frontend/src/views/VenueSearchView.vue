<template>
    <v-container>

        <!-- Page Title -->
        <div class="page-title">
            <div class="hero-image-wrapper">
                <div class="hero-image-text">
                    <h1>Venue Search</h1>
                </div>
                <img
                    class="hero-image"
                    :src="require('../assets/venues-hero.png')"
                    alt="Events Hero"
                >
            </div>
            <div class="hero-subtext">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam accusamus autem
                    eveniet omnis magnam aliquid natus numquam qui ipsam quibusdam magni, neque
                    architecto, nostrum assumenda impedit excepturi facere, atque ea? Lorem ipsum dolor
                    sit amet consectetur adipisicing elit. Aspernatur voluptatibus ad, iure repudiandae
                    eum ipsa facilis nemo quidem magnam ullam eos impedit dicta cupiditate aliquam
                    perferendis qui est mollitia quibusdam.
                </p>
            </div>
        </div>

        <!-- Map -->
        <DividerBar :text="'Melbourne Venue Map'" />
        <MapEmbed :embedUrl="mapUrl"/>


        <!-- Filters -->
        <v-expansion-panels>
            <v-expansion-panel>

                <!-- Title -->
                <v-expansion-panel-title>
                    <div class="filter-icon-wrapper">
                        <v-icon class="filter-icon">mdi-filter-variant</v-icon>
                        <div v-if="hasFiltersApplied()" class="filter-icon-dot"></div>
                    </div>
                    <span>Filter Search</span>
                </v-expansion-panel-title>

                <!-- Content -->
                <v-expansion-panel-text>
                    <div class="filter-wrapper">

                       <!-- Venues -->
                        <v-combobox
                            v-model="selectedVenueName"
                            :items="getVenueNames"
                            label="Search By Name"
                            clearable
                            required
                        />

                        <!-- City -->
                        <v-combobox
                            v-model="selectedCity"
                            :items="getVenueCities"
                            label="Search By Suburb"
                            clearable
                            required
                        />

                        <!-- Has Upcoming Events -->
                        <div class="checkbox-background">
                            <v-text-field @click="hasUpcomingEvents = !hasUpcomingEvents" />
                            <v-checkbox
                                v-model="hasUpcomingEvents"
                                label="Has Upcoming Events"
                                clearable
                            />
                        </div>


                    </div>
                </v-expansion-panel-text>
            </v-expansion-panel>
        </v-expansion-panels>

        <!-- Title Wrapper -->
        <div class="title-wrapper">

            <!-- Divider Bar -->
            <DividerBar :text="'Venues'" />

            <!-- Pagination -->
            <div v-if="totalPages > 1" class="pagination" id="pagination-1">

                <!-- Previous -->
                <button
                    @click="prevPage"
                    :disabled="currentPage === 1"
                    :style="{ color: currentPage === 1 ? 'var(--c-text-muted)' : 'inherit' }"
                >
                    Previous
                </button>

                <!-- Page Count -->
                <span>Page {{ currentPage }} of {{ totalPages }}</span>

                <!-- Next -->
                <button
                    @click="nextPage"
                    :disabled="currentPage === totalPages"
                    :style="{ color: currentPage === totalPages ? 'var(--c-text-muted)' : 'inherit' }"
                >
                    Next
                </button>

            </div>
        </div>

        <!-- Venues Grid -->
        <FocusCardGrid :focusList="getFocusArrayFromVenues" />

        <!-- Bottom Wrapper -->
        <div v-if="totalPages > 1" class="bottom-wrapper">

            <!-- Divider Bar Left -->
            <DividerBar />

            <!-- Pagination 2 -->
            <div class="pagination" id="pagination-2">
                <!-- Previous -->
                <button
                    @click="prevPage"
                    :disabled="currentPage === 1"
                    :style="{ color: currentPage === 1 ? 'var(--c-text-muted)' : 'inherit' }"
                >
                    Previous
                </button>
                <!-- Page Count -->
                <span>Page {{ currentPage }} of {{ totalPages }}</span>
                <!-- Next -->
                <button
                    @click="nextPage"
                    :disabled="currentPage === totalPages"
                    :style="{ color: currentPage === totalPages ? 'var(--c-text-muted)' : 'inherit' }"
                >
                    Next
                </button>
            </div>

            <!-- Divider Bar Right -->
            <DividerBar />

        </div>

        <!-- Random Banner -->
        <RandomBanner />

    </v-container>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { Focus } from '@/models/Focus';
    import { FocusType } from '@/models/FocusType';
    import { Server } from '@/config/Server';
    import FocusCardGrid from '@/components/FocusCardGrid.vue';
    import MapEmbed from '@/components/MapEmbed.vue';
    import DividerBar from '@/components/DividerBar.vue';
    import RandomBanner from '@/components/RandomBanner.vue';
    import { VenueSearchItem } from '@/models/VenueSearchItem';


    export default defineComponent({
        name: 'EventSearchView',

        components: {
            FocusCardGrid,
            MapEmbed,
            DividerBar,
            RandomBanner
        },

        data() {
            return {
                venues: [] as VenueSearchItem[],
                mapUrl: 'https://www.google.com/maps/d/u/0/embed?mid=1XnFb-G5D2UeK2wSUFVqxgBii8aeZ_lQ&ehbc=2E312F',
                currentPage: 1,
                venuesPerPage: 6,
                numFilteredVenues: 0,
                selectedCity: '',
                selectedVenueName: '',
                hasUpcomingEvents: false
            };
        },

        async mounted() {
            try {
                const response = await fetch(`${Server}/all-venue-ids`);
                const data = await response.json();

                this.venues = data.result.map(( venue: {
                    VenueID: number,
                    Title: string,
                    City: string,
                    Featured: boolean,
                    hasUpcomingEvent: boolean
                }) => new VenueSearchItem(
                    new Focus(venue.VenueID, FocusType.Venue),
                    venue.Title,
                    venue.City,
                    venue.Featured,
                    venue.hasUpcomingEvent
                ));

            } catch (error) {
                console.error('Error fetching data:', error);
            }
        },

        computed: {

            totalPages() : number {
                return Math.ceil(this.numFilteredVenues / this.venuesPerPage);
            },

            paginatedVenues() : VenueSearchItem[] {
                const start = (this.currentPage - 1) * this.venuesPerPage;
                const end = start + this.venuesPerPage;

                const filteredVenues = this.applyFilters();

                return filteredVenues.slice(start, end);
            },

            getFocusArrayFromVenues() : Focus[] {
                return this.paginatedVenues.map(venue => venue.focus);
            },

            getVenueNames() : string[] {
                return this.applyFilters()
                    .filter((venue, index, self) => self.findIndex(a => a.title === venue.title) === index)
                    .map(venue => venue.title)
                    .sort();
            },

            getVenueCities() : string[] {
                return this.applyFilters()
                    .filter((venue, index, self) => self.findIndex(a => a.city === venue.city) === index)
                    .map(venue => venue.city)
                    .sort();
            },


        },

        methods: {

            hasFiltersApplied() : boolean {
                return (
                    this.selectedCity !== '' ||
                    this.selectedVenueName !== '' ||
                    this.hasUpcomingEvents
                );
            },

            nextPage() {
                if (this.currentPage < this.totalPages) {
                    this.currentPage++;
                }
            },

            prevPage() {
                if (this.currentPage > 1) {
                    this.currentPage--;
                }
            },

            applyFilters() : VenueSearchItem[] {
                const filteredVenues =  this.venues.filter(venue => {
                    return (
                        (!this.selectedCity || venue.city === this.selectedCity) &&
                        (!this.selectedVenueName || venue.title.toLowerCase().includes(this.selectedVenueName.toLowerCase())) &&
                        (!this.hasUpcomingEvents || venue.hasUpcomingEvents)
                    );
                });

                this.numFilteredVenues = filteredVenues.length;

                return filteredVenues;
            }
        },

        watch: {
            selectedCity() {
                this.currentPage = 1;
            },

            selectedArtistName() {
                this.currentPage = 1;
            },
            hasUpcomingEvents() {
                this.currentPage = 1;
            }
        },

    });
</script>

<style scoped>

    .filter-wrapper {
        margin-top: 24px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    }

    .checkbox-background {
        position: relative;
        cursor: pointer;
    }

    .v-checkbox {
        position: absolute;
        left: 0;
        top: 0;
        color: var(--c-text-secondary);
    }

    .title-wrapper,
    .bottom-wrapper {
        display: flex;
        flex-direction: row;

        align-items: center;
        justify-content: center;
        gap: 16px;
    }

    .bottom-wrapper {
        margin-top: 48px
    }

    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-shrink: 0;
    }

    .pagination button {
        margin: 0 10px;
    }

</style>
