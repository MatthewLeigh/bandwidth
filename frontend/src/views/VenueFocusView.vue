<template>
    <v-container>

        <!-- Images -->
        <div class="carousel-wrapper">
            <ImageCarousel :focusArray="focusArrayForImages" />

            <div class="carousel-icon-wrapper">

                <!-- Share -->
                <v-btn
                    class="carousel-icon"
                    icon="mdi-share-variant"
                    @click="sharePage"
                />

                <!-- Favourite -->
                <v-btn
                    v-if="user"
                    class="carousel-icon"
                    :style="isFavourite ? 'color: var(--c-icon-favourite)' : ''"
                    :icon="iconType"
                    @click="iconMethod"
                />

            </div>
        </div>

        <!-- Title -->
        <div class="title-wrapper">
            <p v-if="isFeatured" class="featured">| Featured Venue</p>
            <p v-else class="muted">| Venue</p>
            <div class="title-text">
                <h1 class="title">{{ venueTitle }}</h1>
                <div class="subtitle">
                    <v-icon icon="mdi-map-marker"></v-icon>
                    <p>{{ formattedAddress() }}</p>
                </div>
            </div>

        </div>
        <hr>

        <!-- Description -->
        <div v-if="venueDescription" class="description row">
            <p>{{ venueDescription }}</p>
        </div>

        <!-- Info -->
        <div class="info row bottomless">

            <!-- Map -->
            <MapEmbed class="map"/>

            <div class="text">

                <!-- Address -->
                <div class="text-row">
                    <v-icon icon="mdi-map-marker"></v-icon>
                    <p>{{ formattedAddress() }}</p>
                </div>

                <!-- Website -->
                <div class="text-row">
                    <v-icon icon="mdi-web"></v-icon>
                    <a
                        v-if="venueWebsite"
                        :href="venueWebsite"
                        target="_blank"
                        rel="noopener noreferrer"
                        class="clickable"
                    >
                        {{ venueWebsite }}
                    </a>
                </div>

                <!-- Phone Number -->
                <div class="text-row">
                    <v-icon icon="mdi-cellphone"></v-icon>
                    <p>{{ venuePhoneNumber }}</p>
                </div>

                <!-- Opening Hours -->
                <div class="text-row">
                    <v-icon icon="mdi-calendar-range"></v-icon>
                    <OpeningHours :focusId="focusId"/>
                </div>
            </div>

        </div>

        <!-- Upcoming Events -->
        <DividerBar v-if="focusArrayForUpcomingEvents.length != 0" text="Upcoming events" />
        <FocusCardRow :focusList="focusArrayForUpcomingEvents" />

        <!-- Socials -->
        <SocialsList :focus="focus" />

        <!-- Comments -->
        <CommentsSection :focus="focus" />

        <!-- Random Banner -->
        <RandomBanner />

    </v-container>
</template>

<script lang="ts">
    import { defineComponent } from 'vue'
    import { Focus } from '@/models/Focus';
    import { FocusType } from '@/models/FocusType';
    import { Server } from '@/config/Server';
    import ImageCarousel from '@/components/ImageCarousel.vue';
    import SocialsList from '@/components/SocialsList.vue';
    import RandomBanner from '@/components/RandomBanner.vue';
    import DividerBar from '@/components/DividerBar.vue';
    import FocusCardRow from '@/components/FocusCardRow.vue';
    import MapEmbed from '@/components/MapEmbed.vue';
    import OpeningHours from '@/components/OpeningHours.vue';
    import CommentsSection from '@/components/CommentsSection.vue';

    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';
    import { useSnackbarStore } from '@/stores/showSnackbar';

    export default defineComponent({
        name: 'VenueFocusView',

        setup() {
            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);
            const snackbar = useSnackbarStore();

            return { sessionStore, user, snackbar };
        },

        components: {
            ImageCarousel,
            RandomBanner,
            SocialsList,
            DividerBar,
            FocusCardRow,
            MapEmbed,
            OpeningHours,
            CommentsSection
        },

        data() {
            return {
                focusId: Number(this.$route.params.id),
                focus: new Focus(Number(this.$route.params.id), FocusType.Venue),
                focusArrayForImages: [new Focus(Number(this.$route.params.id), FocusType.Venue)] as Focus[],
                focusArrayForUpcomingEvents: [] as Focus[],
                venueTitle: '',
                venueDescription: '',
                venueStreetAddress: '',
                venueCity: '',
                venueState: '',
                venuePostCode: '',
                venueWebsite: '',
                venuePhoneNumber: '(03) 4240 4726', /* TODO: Add column to db. */
                isFeatured: false,
                isFavourite: false
            }
        },

        methods: {
            formattedAddress() {
                return `${this.venueStreetAddress}, ${this.venueCity}, ${this.venueState} ${this.venuePostCode}`;
            },

            async postIsFavouriteVenue() {
                try {
                    const response = await fetch(
                        `${Server}/post/venue/is-favourite/${this.user.userId}/${this.focus.id}`,
                        {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json",
                            },
                        }
                    );

                    if (!response.ok) {
                        throw new Error("Failed to update favorite status.");
                    }

                    const result = await response.json();
                    console.log("Favorite status updated:", result);
                    this.snackbar.showSnackbar('Venue added to favourites!');


                    this.isFavourite = !this.isFavourite;
                } catch (error) {
                    console.error("Error marking venue as favorite:", error);
                }
            },

            async deleteIsFavouriteVenue() {
                try {
                    const response = await fetch(
                        `${Server}/delete/venue/is-favourite/${this.user.userId}/${this.focus.id}`,
                        {
                            method: "DELETE",
                            headers: {
                                "Content-Type": "application/json",
                            },
                        }
                    );

                    if (!response.ok) {
                        throw new Error("Failed to delete favorite status.");
                    }

                    const result = await response.json();
                    console.log("Favorite status deleted:", result);
                    this.snackbar.showSnackbar('Venue removed from favourites');


                    this.isFavourite = !this.isFavourite;
                } catch (error) {
                    console.error("Error deleting venue from favorites:", error);
                }
            },

            iconMethod() {
                (this.isFavourite) ? this.deleteIsFavouriteVenue() : this.postIsFavouriteVenue();
            },

            async sharePage() {

                try {
                    await navigator.clipboard.writeText(window.location.href);
                    this.snackbar.showSnackbar('Address copied to clipboard');

                } catch (error) {
                    console.error("Failed to copy address: ", error);
                    this.snackbar.showSnackbar('Failed to copy address to clipboard');

                }
            }
        },

        computed: {

            iconType(): string {
                return (this.isFavourite) ? 'mdi-heart' : 'mdi-heart-outline';
            }
        },

        async mounted() {
            try {

                // Venue Details
                const response = await fetch(`${Server}/focus-venue-details/${this.focusId}`);
                const data = await response.json();
                const flatData = data[0];

                this.venueTitle = flatData.Title;
                this.venueDescription = flatData.Description;
                this.venueStreetAddress = flatData.StreetAddress;
                this.venueCity = flatData.City;
                this.venueState = flatData.State;
                this.venuePostCode = flatData.PostCode;
                this.venueWebsite = flatData.Website;
                this.isFeatured = flatData.Featured;

                // Is Favourite Venue
                if (this.user) {
                    const response2 = await fetch(`${Server}/get/venue/is-favourite/${this.user.userId}/${this.focusId}`);
                    const data2 = await response2.json();

                    this.isFavourite = data2[0].isFavourite;
                }

                // Upcoming Events
                const response3 = await fetch(`${Server}/upcoming-events-for-venue/${this.focusId}`);
                const data3 = await response3.json();

                this.focusArrayForUpcomingEvents = data3.map(
                    (item: {EventID: number}) => new Focus(item.EventID, FocusType.Event)
                );


            } catch (error) {
                console.error('Error fetching data: ', error);
            }
        }

    });
</script>

<style scoped>

    .carousel-wrapper {
        position: relative
    }

    .carousel-icon-wrapper {
        position: absolute;
        top: 32px;
        right: 32px;
        z-index: 1;
        display: flex;
        flex-direction: row;
        gap: 16px;
    }

    .carousel-icon {
        color: var(--c-icon);
        background: var(--c-bg-icon);
        font-size: 1.1rem;
    }

    .title-text {
        flex: 1;
    }

    .info {
        display: flex;
        flex-wrap: wrap-reverse;
        align-items: center;
        justify-content: space-evenly;
        gap: 40px;
        margin-top: 20px;
        max-width: 100%;
    }

    .map {
        flex: 3;
        margin-top: 0;
    }

    .text {
        min-width: fit-content;
        flex: 2;
    }

    .text-row {
        display: flex;
        align-items: flex-start;
        gap: 20px;
        padding: 10px 0;
    }

    .subtitle {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    a {
        color: black;
        text-decoration: none;
    }

    .mt-custom {
        margin-top: 48px;
    }

    @media (max-width: 1200px) {

        .info {
            flex-direction: column-reverse;
        }

        .carousel-icon-wrapper {
            top: 12px;
            right: 8px;
            gap: 0px;
        }

        .carousel-icon {
            color: var(--c-icon);
            background: var(--c-bg-icon);
            font-size: 1rem;
            scale: 0.75;
        }

    }




</style>