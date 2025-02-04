<template>
    <v-container>

        <!-- Page Title -->
        <div class="page-title">
            <div class="hero-image-wrapper">
                <div class="hero-image-text">
                    <h1>Event Search</h1>
                </div>
                <img
                    class="hero-image"
                    :src="require('../assets/events-hero.png')"
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

                        <!-- Date Pickers -->
                        <v-date-picker
                            class="custom-date-picker"
                            v-model="selectedDatesStore.selectedDates"
                            :min="getTodayAsDate()"
                            :max="getLastEventDate()"
                            :width="$isMobile.value ? '100%' : undefined"
                            multiple
                        />

                        <!-- Chips -->
                        <div class="chips-wrapper">

                            <!-- Price Range -->
                            <h3 class="filter-title">Price Range</h3>
                            <div class="price-wrapper">

                                <!-- Price Chip -->

                                <v-chip-group class="price-chip-wrapper" column>
                                    <v-chip
                                        id="price-chip"
                                        variant="outlined"
                                        @click="toggleMaxPrice"
                                    >
                                        <span v-if="maxPrice === hardcodedMaxPrice">Any Price</span>
                                        <span v-else-if="maxPrice > 0 && maxPrice != hardcodedMaxPrice">Events Under ${{ maxPrice }}</span>
                                        <span v-else>Free Events</span>
                                    </v-chip>
                                </v-chip-group>

                                <!-- Price Slider -->
                                <div class="price-slider-wrapper">
                                    <v-slider
                                        id="price-slider"
                                        v-if="showSlider"
                                        v-model="maxPrice"
                                        min="0"
                                        :max="hardcodedMaxPrice"
                                        step="1"
                                        thumb-label
                                        class="mt-3"
                                    />
                                </div>
                            </div>

                            <!-- Filters -->
                            <h3 class="filter-title">Filters</h3>
                            <v-chip-group column>

                                <!-- Venue Chip -->
                                <v-chip
                                    variant="outlined"
                                    @click="toggleFilterFavouriteVenues"
                                    :class="!user ? 'muted-chip' : ''"
                                >
                                    <span v-if="!user">All Venues</span>
                                    <span v-else-if="user && filterFavouriteVenues" class="selected-chip">Favourite Venues</span>
                                    <span v-else>All Venues</span>
                                </v-chip>

                                <!-- Venue Chip -->
                                <v-chip
                                    variant="outlined"
                                    @click="toggleFilterFavouriteArtists"
                                    :class="!user ? 'muted-chip' : ''"
                                >
                                    <span v-if="!user">All Artists</span>
                                    <div v-else>
                                        <span v-if="filterFavouriteArtists" class="selected-chip">Favourite Artists</span>
                                        <span v-else>All Artists</span>
                                    </div>
                                </v-chip>

                            </v-chip-group>

                            <!-- Selected Dates -->
                            <h3 class="filter-title">Selected Dates</h3>
                            <div class="dates-wrapper">
                                <v-chip-group
                                    id="dates"
                                    column
                                >

                                    <!-- Selected Dates -->
                                    <v-chip
                                        v-for="date in selectedDates"
                                        :key="date"
                                        variant="outlined"
                                        closable
                                        @click:close="selectedDatesStore.unselectDate(date)"
                                    >
                                        {{ formatDateLong(date) }}
                                    </v-chip>

                                    <!-- Clear Dates -->
                                    <v-chip
                                        v-if="selectedDatesStore.selectedDates.length"
                                        @click="selectedDatesStore.clearDates()"
                                        variant="outlined"
                                        class="clear-chip"
                                    >
                                        Clear Dates
                                    </v-chip>

                                </v-chip-group>

                            </div>
                        </div>
                    </div>
                </v-expansion-panel-text>
            </v-expansion-panel>
        </v-expansion-panels>

        <!-- Events -->
        <div class="events-wrapper">

            <!-- Loading -->
            <template v-if="isLoading">
                <v-progress-linear indeterminate color="primary"></v-progress-linear>
            </template>

            <!-- Error -->
            <template v-else-if="isError">
                Error fetching events. Please try again later.
            </template>

            <!-- Loaded -->
            <template v-else>

                <!-- No Events Matching Criteria -->
                <div v-if="!hasEvents">No events for search criteria</div>

                <!-- Events Matching Criteria -->
                <template
                    v-else
                    v-for="(events, date) in filteredEventsGroupedByDate"
                    :key="date"
                >
                    <div v-if="events.length > 0" >
                        <DividerBar :text="formatIsoDateTimeToDateLong(date)" class="mt-custom"></DividerBar>
                        <FocusCardGrid :focus-list="events" class="mt-6"></FocusCardGrid>
                    </div>
                </template>
            </template>
        </div>

        <!-- Random Banner -->
        <RandomBanner />

    </v-container>
</template>


<script lang="ts">
    import { defineComponent } from 'vue';
    import { FocusType } from '@/models/FocusType';
    import { EventSearchItem } from '@/models/EventSearchItem';
    import { Server } from '@/config/Server';
    import FocusCardGrid from '@/components/FocusCardGrid.vue';
    import DividerBar from '@/components/DividerBar.vue';
    import RandomBanner from '@/components/RandomBanner.vue';
    import { formatDateLong, formatIsoDateTimeToDateLong, getTodayAsDate } from '@/utils/formatDateTime';

    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';
    import { useSelectedDatesStore } from '@/stores/useSelectedDatesStore';
    import { useSnackbarStore } from '@/stores/showSnackbar';

    export default defineComponent({
        name: 'EventSearchView',

        setup() {
            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);

            const selectedDatesStore = useSelectedDatesStore();
            const { selectedDates } = storeToRefs(selectedDatesStore);

            const snackbar = useSnackbarStore();

            return { sessionStore, user, selectedDatesStore, selectedDates, snackbar };
        },

        components: {
            FocusCardGrid,
            DividerBar,
            RandomBanner
        },

        data() {
            return {
                allEvents: [] as EventSearchItem[],
                allEventsGroupedByDate: {} as Record<string, EventSearchItem[]>,
                hardcodedMaxPrice: 150,
                maxPrice: 150,
                showSlider: true,
                filterFavouriteArtists: false,
                filterFavouriteVenues: false,

                isLoading: true,
                isError: false,
            };
        },

        computed: {

            // Filtered events by selected dates
            filterEventsBySelectedDates() : Record<string, EventSearchItem[]> {

                // Return the grouped events based on selected dates
                if (this.selectedDatesStore.selectedDates.length === 0) return this.allEventsGroupedByDate;

                // Convert selectedDates to a Set for faster lookup
                const selectedDatesSet = new Set(this.selectedDatesStore.selectedDates.map(date => new Date(date).toISOString()));

                // Create array to store filtered dates
                const filteredEvents = {} as Record<string, EventSearchItem[]>;

                // Iterate over each date in allEventsGroupedByDate
                for (const date in this.allEventsGroupedByDate) {

                    // Check if the date is in the selectedDatesSet
                    if (selectedDatesSet.has(date)) {

                        // Add the events for this date to the filteredEvents object
                        filteredEvents[date] = this.allEventsGroupedByDate[date];
                    }
                }

                return filteredEvents;
            },

            // Filter events by price, favourite artists, and favourite venues
            filteredEventsGroupedByDate() : Record<string, EventSearchItem[]> {

                // If no filters are applied, return all events
                if (
                    this.selectedDatesStore.selectedDates.length === 0 &&
                    this.maxPrice === this.hardcodedMaxPrice &&
                    !this.filterFavouriteArtists &&
                    !this.filterFavouriteVenues
                ) {
                    return this.filterEventsBySelectedDates;
                }

                // Create a new object to store filtered events
                const filteredEvents = {} as Record<string, EventSearchItem[]>;

                // For each date, filter events by search criteria
                for (const date in this.filterEventsBySelectedDates) {

                    // Filter by max price
                    filteredEvents[date] = this.filterEventsBySelectedDates[date].filter(event =>
                        event.price <= this.maxPrice
                    );

                    // Filter by favourite artists
                    if (this.filterFavouriteArtists) {
                        filteredEvents[date] = filteredEvents[date].filter(event =>
                            event.isUserFavouriteArtist
                        );
                    }

                    // Filter by favourite venues
                    if (this.filterFavouriteVenues) {
                        filteredEvents[date] = filteredEvents[date].filter(event =>
                            event.isUserFavouriteVenue
                        );
                    }
                }

                return filteredEvents;
            },

            // Checks if there are any events once filters have been applied
            hasEvents() : boolean {
                for (const date in this.filteredEventsGroupedByDate) {
                    if (this.filteredEventsGroupedByDate[date].length > 0) return true;
                }
                return false;
            },

        },

        methods: {

            hasFiltersApplied() : boolean {
                return (
                    this.selectedDatesStore.selectedDates.length > 0 ||
                    this.maxPrice !== this.hardcodedMaxPrice ||
                    this.filterFavouriteArtists ||
                    this.filterFavouriteVenues
                );
            },

            clearFilters() {
                this.selectedDatesStore.clearDates();
                this.maxPrice = this.hardcodedMaxPrice;
                this.filterFavouriteArtists = false;
                this.filterFavouriteVenues = false;
            },

            formatDateLong,
            getTodayAsDate,
            formatIsoDateTimeToDateLong,

            toggleMaxPrice() {
                this.maxPrice = (this.maxPrice != this.hardcodedMaxPrice) ? this.hardcodedMaxPrice : 0;
            },

            toggleFilterFavouriteArtists() {
                if (this.user) {
                    this.filterFavouriteArtists = !this.filterFavouriteArtists;
                } else {
                    this.snackbar.showSnackbar('Please Login or Sign Up to use this filter.');
                }
            },

            toggleFilterFavouriteVenues() {
                if (this.user) {
                    this.filterFavouriteVenues = !this.filterFavouriteVenues;
                } else {
                    this.snackbar.showSnackbar('Please Login or Sign Up to use this filter.');
                }
            },

            getLastEventDate() : string {
                const dates = Object.keys(this.allEventsGroupedByDate);
                return dates.length ? dates[dates.length - 1] : '';
            }

        },

        async mounted() {

            const id = (this.user) ? this.user.userId : -1;

            try {
                const response = await fetch(`${Server}/upcoming-event-ids/${id}`);
                const data = await response.json();

                // Map event data
                this.allEvents = data.map((event: {
                    Id: number,
                    Date: string,
                    Price: number,
                    isUserFavouriteVenue: boolean,
                    isUserFavouriteArtist: boolean
                }) => ({
                    id: event.Id,
                    type: FocusType.Event,
                    date: event.Date,
                    price: event.Price,
                    isUserFavouriteVenue: event.isUserFavouriteVenue,
                    isUserFavouriteArtist: event.isUserFavouriteArtist
                }));

                // Group events by date
                this.allEventsGroupedByDate = this.allEvents.reduce((groups, event) => {

                    // Create grouping for a date if it doesn't already exist.
                    if (!groups[event.date]) groups[event.date] = [];

                    // Add event to date grouping
                    groups[event.date].push(event);

                    // Return the updated groups
                    return groups;

                }, {} as Record<string, EventSearchItem[]>);

            } catch (error) {
                console.error('Error fetching upcoming events:', error);
                this.isError = true;

            } finally {
                this.isLoading = false;
            }

        },
    });
</script>

<style scoped>

    .custom-date-picker :deep(.v-date-picker-header),
    .custom-date-picker :deep(.v-picker-title) {
        display: none !important;
    }

    .filter-wrapper {
        display: flex;
        flex-direction: row;
        gap: 24px;
    }

    .dates-wrapper {
        height: 120px;
        overflow: auto;
    }

    .events-wrapper {
        margin-top: 12px;
        display: flex;
        flex-direction: column;
        gap: 72px;
    }

    .price-wrapper {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: flex-start;
        width: 100%;
    }

    .price-chip-wrapper {
        width: 312px;
    }

    .price-slider-wrapper {
        width: 100%;
        transform: translateY(-4px);
    }


    @media (max-width: 722px) {
        .filter-wrapper {
            flex-direction: column;
            gap: 16px;
        }

        .chips-wrapper {
            margin: 0;
            padding: 12px;
        }

        .events-wrapper {
            gap: 48px;
        }
    }

</style>