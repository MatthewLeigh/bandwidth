<template>
    <v-container>

        <!-- Page Title -->
        <div class="page-title">
            <div class="hero-image-wrapper">
                <div class="hero-image-text">
                    <h1>Artist Search</h1>
                </div>
                <img
                    class="hero-image"
                    :src="require('../assets/artists-hero.png')"
                    alt="Events Hero"
                >
            </div>
            <div class="hero-subtext">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi dolorem aliquam
                    commodi sint minus modi sed necessitatibus, dolores ut quidem recusandae corporis
                    suscipit earum nostrum, ducimus similique qui, ullam nemo.
                </p>
            </div>
        </div>

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

                        <!-- Artists -->
                        <v-combobox
                            v-model="selectedArtistName"
                            :items="getArtistNames"
                            label="Search By Name"
                            clearable
                            required
                        />

                        <!-- Country -->
                        <v-combobox
                            v-model="selectedCountry"
                            :items="getArtistCountries"
                            label="Search By Country"
                            clearable
                            required
                            @click:clear="selectedState = ''"
                        />

                        <!-- State -->
                        <v-combobox
                            v-model="selectedState"
                            :items="getArtistStates"
                            label="Search By State"
                            clearable
                            required
                            :disabled="!selectedCountry"
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
            <DividerBar :text="'Artists'" />

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

        <!-- Artists Grid -->
        <FocusCardGrid :focus-list="getFocusArrayFromArtists" />

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
    import RandomBanner from '@/components/RandomBanner.vue';
    import DividerBar from '@/components/DividerBar.vue';
    import { ArtistSearchItem } from '@/models/ArtistSearchItem';

    export default defineComponent({
        name: 'EventSearchView',

        components: {
            FocusCardGrid,
            RandomBanner,
            DividerBar
        },

        data() {
            return {
                artists: [] as ArtistSearchItem[],
                currentPage: 1,
                artistsPerPage: 24,
                numFilteredArtists: 0,
                selectedCountry: '',
                selectedState: '',
                selectedArtistName: '',
                hasUpcomingEvents: false
            };
        },

        async mounted() {
            try {

                const response = await fetch(`${Server}/all-artist-ids`);
                const data = await response.json();

                this.artists = data.result.map(( artist: {
                    ArtistID: number,
                    Title: string,
                    Country: string,
                    State: string,
                    Featured: boolean,
                    hasUpcomingEvent: boolean
                }) => new ArtistSearchItem(
                    new Focus(artist.ArtistID, FocusType.Artist),
                    artist.Title,
                    artist.Country,
                    artist.State,
                    artist.Featured,
                    artist.hasUpcomingEvent
                ));

            } catch (error) {
                console.error('Error fetching data:', error);
            }
        },

        computed: {

            totalPages() : number {
                return Math.ceil(this.numFilteredArtists / this.artistsPerPage);
            },

            paginatedArtists() : ArtistSearchItem[] {
                const start = (this.currentPage - 1) * this.artistsPerPage;
                const end = start + this.artistsPerPage;

                const filteredArtists = this.applyFilters();

                return filteredArtists.slice(start, end);
            },

            getFocusArrayFromArtists() : Focus[] {
                return this.paginatedArtists.map(artist => artist.focus);
            },

            getArtistNames() : string[] {
                return this.applyFilters()
                    .filter((artist, index, self) => self.findIndex(a => a.title === artist.title) === index)
                    .map(artist => artist.title)
                    .sort();
            },

            getArtistCountries() : string[] {
                return this.applyFilters()
                    .filter((artist, index, self) => self.findIndex(a => a.country === artist.country) === index)
                    .map(artist => artist.country)
                    .sort();
            },

            getArtistStates() : string[] {

                if (!this.selectedCountry) return [];

                return this.applyFilters()
                    .filter(artist => artist.country === this.selectedCountry)
                    .filter((artist, index, self) => self.findIndex(a => a.state === artist.state) === index)
                    .map(artist => artist.state)
                    .sort();
            },

        },

        methods: {

            hasFiltersApplied() : boolean {
                return (
                    this.selectedCountry !== '' ||
                    this.selectedState !== '' ||
                    this.selectedArtistName !== '' ||
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

            applyFilters() : ArtistSearchItem[] {
                const filteredArtists =  this.artists.filter(artist => {
                    return (
                        (!this.selectedCountry || artist.country === this.selectedCountry) &&
                        (!this.selectedState || artist.state === this.selectedState) &&
                        (!this.selectedArtistName || artist.title.toLowerCase().includes(this.selectedArtistName.toLowerCase())) &&
                        (!this.hasUpcomingEvents || artist.hasUpcomingEvents)
                    );
                });

                this.numFilteredArtists = filteredArtists.length;

                return filteredArtists;
            }
        },

        watch: {
            selectedCountry() {
                this.currentPage = 1;
            },
            selectedState() {
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
