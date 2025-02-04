<template>
    <v-container>
        <v-container class="banner-wrapper">

            <!-- Background Image -->
            <img
                class="banner-background"
                :src="require('../assets/profile-banner-background.svg')"
                alt="Profile Banner Background"
            />

            <!-- Banner Content -->
            <div class="banner-content">

                <!-- Image -->
                <div class="img-wrapper">
                    <v-img
                        v-if="userImg"
                        :src="userImg"
                        alt="User Image"
                        cover
                        class="user-img"
                    ></v-img>
                </div>

                <!-- Name and Location -->
                <p class="user-name">{{ userFirstName }} {{ userLastName }}</p>
                <p class="user-location">{{ userCountry }}, {{ userState }}</p>

                <!--  Tally Row -->
                <div class="tally-row">

                    <!-- Saved Events -->
                    <div class="tally">
                        <p class="tally-count">{{ savedEvents.length }}</p>
                        <p class="tally-label">Saved Events</p>
                    </div>
                    <div class="spacer"></div>

                    <!-- Recently Artists -->
                    <div class="tally">
                        <p class="tally-count">{{ favouriteArtists.length }}</p>
                        <p class="tally-label">Favourite Artists</p>
                    </div>
                    <div class="spacer"></div>

                    <!-- Favourite Venues -->
                    <div class="tally">
                        <p class="tally-count">{{ favouriteVenues.length }}</p>
                        <p class="tally-label">Favourite Venues</p>
                    </div>

                </div>

                <!-- Logout Button -->
                <v-btn
                    class="logout-button"
                    @click="handleLogout()"
                    flat
                >
                    <v-icon icon="mdi-logout" />
                    <span>Sign Out</span>
                </v-btn>

            </div>

        </v-container>

        <!-- Saved Events -->
        <div class="bar-wrapper mt-15">
            <DividerBar :text="'Saved events'" />
            <div
                class="icon-wrapper"
                @click="isRow.savedEvents = !isRow.savedEvents"
            >
                <v-icon v-if="isRow.savedEvents">mdi-dots-horizontal</v-icon>
                <v-icon v-else>mdi-dots-grid</v-icon>
            </div>
        </div>
        <FocusCardRow v-if="isRow.savedEvents" :focusList="savedEvents" title="Saved Events" />
        <FocusCardGrid v-else :focusList="savedEvents" title="Saved Events" />

        <!-- Recently Viewed Events -->
        <div class="bar-wrapper mt-15">
            <DividerBar :text="'Recently viewed events'" />
            <div
                class="icon-wrapper"
                @click="isRow.recentlyViewedEvents = !isRow.recentlyViewedEvents"
            >
                <v-icon v-if="isRow.recentlyViewedEvents">mdi-dots-horizontal</v-icon>
                <v-icon v-else>mdi-dots-grid</v-icon>
            </div>
        </div>
        <FocusCardRow v-if="isRow.recentlyViewedEvents" :focusList="recentlyViewedEvents" title="Recently Viewed Events" />
        <FocusCardGrid v-else :focusList="recentlyViewedEvents" title="Recently Viewed Events" />


        <!-- Favourite Artists -->
        <div class="bar-wrapper mt-15">
            <DividerBar :text="'Favourite artists'" />
            <div
                class="icon-wrapper"
                @click="isRow.favouriteArtists = !isRow.favouriteArtists"
            >
                <v-icon v-if="isRow.favouriteArtists">mdi-dots-horizontal</v-icon>
                <v-icon v-else>mdi-dots-grid</v-icon>
            </div>
        </div>
        <FocusCardRow v-if="isRow.favouriteArtists" :focusList="favouriteArtists" title="Favourite Artists" />
        <FocusCardGrid v-else :focusList="favouriteArtists" title="Favourite Artists" />

        <!-- Favourite Venues -->
        <div class="bar-wrapper mt-15">
            <DividerBar :text="'Favourite venues'" />
            <div
                class="icon-wrapper"
                @click="isRow.favouriteVenues = !isRow.favouriteVenues"
            >
                <v-icon v-if="isRow.favouriteVenues">mdi-dots-horizontal</v-icon>
                <v-icon v-else>mdi-dots-grid</v-icon>
            </div>
        </div>
        <FocusCardRow v-if="isRow.favouriteVenues" :focusList="favouriteVenues" title="Favourite Venues" />
        <FocusCardGrid v-else :focusList="favouriteVenues" title="Favourite Venues" />


        <RandomBanner />
    </v-container>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { Focus } from '@/models/Focus';
    import { FocusType } from '@/models/FocusType';
    import { Server } from '@/config/Server';
    import RandomBanner from '@/components/RandomBanner.vue';
    import FocusCardRow from '@/components/FocusCardRow.vue';
    import DividerBar from '@/components/DividerBar.vue';
    import FocusCardGrid from '@/components/FocusCardGrid.vue';

    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';
    import { useSnackbarStore } from '@/stores/showSnackbar';
    import { useNavigation } from '@/composables/useNavigation';




    export default defineComponent({
        name: 'EventSearchView',

        setup () {
            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);
            const snackbar = useSnackbarStore();
            const { goTo } = useNavigation();

            return { sessionStore, user, snackbar, goTo };
        },

        components: {
            RandomBanner,
            FocusCardRow,
            DividerBar,
            FocusCardGrid
        },

        data() {
            return {
                savedEvents: [] as Focus[],
                recentlyViewedEvents: [] as Focus[],
                favouriteArtists: [] as Focus[],
                favouriteVenues: [] as Focus[],
                userImg: '',
                userFirstName: '',
                userLastName: '',
                userEmail: '',
                userCountry: '',
                userState: '',
                isRow: {
                    savedEvents: true,
                    recentlyViewedEvents: true,
                    favouriteArtists: true,
                    favouriteVenues: true
                }
            };
        },

        async mounted() {
            try {
                // Fetch User Details
                const userImgResponse = await fetch(`${Server}/user-details/${this.user.userId}`);
                const userImgData = await userImgResponse.json();

                this.userImg = userImgData[0].ImageURL;
                this.userFirstName = userImgData[0].FirstName;
                this.userLastName = userImgData[0].LastName;
                this.userEmail = userImgData[0].Email;
                this.userCountry = userImgData[0].Country;
                this.userState = userImgData[0].State;

                // Fetch and map Saved Events
                const savedEventResponse = await fetch(`${Server}/user-saved-event-ids/${this.user.userId}`);
                const savedEventData = await savedEventResponse.json();
                this.savedEvents = savedEventData.ids.map((id: number) => new Focus(id, FocusType.Event));

                // Fetch and map Recently Viewed Events
                const recentlyViewedEventResponse = await fetch(`${Server}/user-recently-viewed-event-ids/${this.user.userId}`);
                const recentlyViewedEventData = await recentlyViewedEventResponse.json();
                this.recentlyViewedEvents = recentlyViewedEventData.ids.map((id: number) => new Focus(id, FocusType.Event));

                // Fetch and map Favourite Artists
                const favouriteArtistResponse = await fetch(`${Server}/user-favourite-artist-ids/${this.user.userId}`);
                const favouriteArtistData = await favouriteArtistResponse.json();
                this.favouriteArtists = favouriteArtistData.ids.map((id: number) => new Focus(id, FocusType.Artist));

                // Fetch and map Favourite Venues
                const favouriteVenueResponse = await fetch(`${Server}/user-favourite-venue-ids/${this.user.userId}`);
                const favouriteVenueData = await favouriteVenueResponse.json();
                this.favouriteVenues = favouriteVenueData.ids.map((id: number) => new Focus(id, FocusType.Venue));

            } catch (error) {
                console.error('Error fetching data:', error);
            }
        },

        methods: {
            handleLogout() {
                this.sessionStore.logout();
                this.snackbar.showSnackbar('Sign Out Successful.');
                this.goTo('home');
            }
        }
    });
</script>

<style scoped>

    .banner-wrapper {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
        background-color: var(--c-bg-secondary);
        padding: 64px;
        margin-top: 24px;
        position: relative;
        overflow: hidden;
    }

    .banner-background {
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
        width: 100%;
        scale: 1.05;
    }

    .banner-content {
        z-index: 1;
    }

    .img-wrapper {
        margin: 0 auto;
        height: 300px;
        width: 300px;
        border-radius: 50%;
        overflow: hidden;
    }

    .user-img {
        height: 100%;
        width: 100%;
        min-width: 100%;
        min-height: 100%;
    }

    .user-name {
        margin: 24px auto 0;
        font-family: 'Poppins-SemiBold', sans-serif;
        font-size: 32px;
        text-align: center;
    }

    .user-location {
        margin: -8px auto 0;
        font-size: 14px;
        text-align: center;
    }

    .tally-row {
        margin: 40px auto 0;
        display: flex;
        flex-direction: row;
        align-items: center;
        gap: 40px;
    }

    .tally {
        text-align: center;
    }

    .tally-count {
        font-family: 'Poppins-SemiBold', sans-serif;
        font-size: 48px;
    }

    .tally-label {
        margin-top: -4px;
    }

    .spacer {
        width: 1px;
        height: 40px;
        background-color: var(--c-text-secondary);
    }

    .logout-button {
        background-color: transparent;
        color: var(--c-text-secondary);
        font-family: 'Poppins-SemiBold', sans-serif;
        position: absolute;
        top: 20px;
        right: 16px;
    }

    .logout-button span {
        margin-left: 8px;
    }

    .bar-wrapper {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
        gap: 20px;
    }

    .icon-wrapper {
        cursor: pointer;
    }

    .v-icon {
        color: var(--c-text-secondary)
    }

    @media (max-width: 722px) {

        .img-wrapper {
            width: 200px;
            height: 200px;
        }

        .user-name {
            font-size: 24px;
        }

        .tally-row {
            width: 100%;
            align-items: space-between;
            gap: 24px;
        }

        .tally-count {
            font-size: 32px;
        }

        .banner-wrapper {
            margin-top: 0;
        }

        .banner-background {
            width: 300%;
        }
    }

</style>