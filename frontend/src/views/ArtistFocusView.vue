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

        <!-- Loading -->
        <template v-if="isLoading">

            <div class="loading-wrapper">
                <v-skeleton-loader type="text" class="s-label" />
                <v-skeleton-loader type="text" class="s-title" />
                <v-skeleton-loader type="divider" class="s-divider-1" />
                <v-skeleton-loader type="text" class="s-location" />
                <v-skeleton-loader boilerplate class="s-divider-2">
                    <v-divider vertical></v-divider>
                </v-skeleton-loader>
                <v-skeleton-loader type="text" class="s-founded" />
                <v-skeleton-loader type="divider" class="s-divider-3" />
                <v-skeleton-loader type="paragraph" class="s-description" />

            </div>

        </template>

        <!-- Error -->
        <template v-else-if="isError">
            <p class="mt-15 mb-15 text-center">Unable to load page. Please try again later.</p>
        </template>

        <!-- Loaded -->
        <template v-else>

            <!-- Title -->
            <div class="title-wrapper">
                <p v-if="isFeatured" class="featured">| Featured Artist</p>
                <p v-else class="muted">| Artist</p>
                <h1 class="title">{{ artistTitle }}</h1>
                <hr>
            </div>

             <!-- Location and Year -->
            <div
                v-if="artistState || artistCountry || artistYearFounded"
                class="location-and-year row-narrow"
            >
                <p v-if="artistState || artistCountry">
                    <span v-if="artistState">{{ artistState }}</span>
                    <span v-if="artistState && artistCountry">, </span>
                    <span v-if="artistCountry">{{ artistCountry }}</span>
                </p>
                <div
                    v-if="artistState || artistCountry || artistYearFounded"
                    class="spacer"
                ></div>
                <p
                    v-if="artistYearFounded"
                >
                        Founded {{ artistYearFounded }}
                    </p>
            </div>

             <!-- Description -->
            <div v-if="artistDescription" class="description row bottomless">
                <p v-html="artistDescription.replace(/\n/g, '<br>')"></p>
            </div>

            <!-- Upcoming Events -->
            <template v-if="focusArrayForUpcomingEvents.length != 0">
                <DividerBar text="Upcoming events" />
                <FocusCardRow :focusList="focusArrayForUpcomingEvents" />
            </template>

            <!-- Socials -->
            <SocialsList :focus="focus" />

            <!-- Check Them Out -->
            <ArtistEmbeds :focusId="focusId"/>

            <!-- Comment Section -->
            <CommentsSection :focus="focus" />

            <!-- Banner -->
            <RandomBanner />

        </template>

    </v-container>
</template>

<script lang="ts">
    import { defineComponent } from 'vue'
    import ImageCarousel from '@/components/ImageCarousel.vue'
    import DividerBar from '@/components/DividerBar.vue';
    import FocusCardRow from '@/components/FocusCardRow.vue';
    import SocialsList from '@/components/SocialsList.vue';
    import ArtistEmbeds from '@/components/ArtistEmbeds.vue';
    import RandomBanner from '@/components/RandomBanner.vue';
    import CommentsSection from '@/components/CommentsSection.vue';
    import { Focus } from '@/models/Focus';
    import { FocusType } from '@/models/FocusType';
    import { Server } from '@/config/Server';

    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';
    import { useSnackbarStore } from '@/stores/showSnackbar';


    export default defineComponent({
        name: 'ArtistFocusView',

        setup() {
            const snackbar = useSnackbarStore();
            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);

            return { snackbar, sessionStore, user };
        },

        components: {
            ImageCarousel,
            DividerBar,
            FocusCardRow,
            SocialsList,
            ArtistEmbeds,
            RandomBanner,
            CommentsSection
        },

        data() {
            return {
                focusId: Number(this.$route.params.id),
                focus: new Focus(Number(this.$route.params.id), FocusType.Artist),
                focusArrayForImages: [new Focus(Number(this.$route.params.id), FocusType.Artist)] as Focus[],
                focusArrayForUpcomingEvents: [] as Focus[],
                artistTitle: '',
                artistDescription: '',
                artistState: '',
                artistCountry: '',
                artistYearFounded: '',
                isFeatured: false,
                isFavourite: false,

                isLoading: true,
                isError: false
            };
        },

        methods: {
            async postIsFavouriteArtist() {
                try {
                    const response = await fetch(
                        `${Server}/post/artist/is-favourite/${this.user.userId}/${this.focus.id}`,
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

                    this.isFavourite = !this.isFavourite;
                    this.snackbar.showSnackbar('Artist added to favourites!');

                } catch (error) {
                    console.error("Error marking artist as favorite:", error);
                }
            },

            async deleteIsFavouriteArtist() {
                try {
                    const response = await fetch(
                        `${Server}/delete/artist/is-favourite/${this.user.userId}/${this.focus.id}`,
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
                    this.snackbar.showSnackbar('Artist removed from favourites');


                    this.isFavourite = !this.isFavourite;
                } catch (error) {
                    console.error("Error deleting artist from favorites:", error);
                }
            },

            iconMethod() {
                (this.isFavourite) ? this.deleteIsFavouriteArtist() : this.postIsFavouriteArtist();
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

                // Artist Details
                const response = await fetch(`${Server}/focus-artist-details/${this.focusId}`);
                const data = await response.json();
                const flatData = data[0];

                this.artistTitle = flatData.Title;
                this.artistDescription = flatData.Description;
                this.artistState = flatData.State;
                this.artistCountry = flatData.Country;
                this.artistYearFounded = flatData.YearFounded;
                this.isFeatured = flatData.Featured;

                // Is Favourite Venue
                if (this.user) {
                    const response2 = await fetch(`${Server}/get/artist/is-favourite/${this.user.userId}/${this.focusId}`);
                    const data2 = await response2.json();

                    this.isFavourite = data2[0].isFavourite;
                }

                // Upcoming Events
                const response3 = await fetch(`${Server}/upcoming-events-for-artist/${this.focusId}`);
                const data3 = await response3.json();

                this.focusArrayForUpcomingEvents = data3.map(
                    (item: { EventID: number }) => new Focus(item.EventID, FocusType.Event)
                );

            } catch (error) {
                console.error('Error fetching data:', error);
                this.isError = true;

            } finally {
                this.isLoading = false;
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

    .spacer {
        margin: 0;
        width: 1px;
        height: 24px;
        background-color: rgb(219, 219, 219);
    }

    .location-and-year {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
    }

    .location-and-year p {
        flex: 1;
        text-align: center;
    }

    .mt-custom {
        margin-top: 48px;
    }

    .loading-wrapper {
        position: relative;
        height: 400px;
    }

    .v-skeleton-loader {
        display: block;
        position: absolute;
        overflow: hidden;
        transform-origin: left center;
    }

    .s-label {
        width: 160px;
        z-index: 3;
        top: 24px;
        left: -16px;
    }

    .s-title {
        width: 300px;
        transform: scale(2);
        z-index: 2;
        top: 60px;
        left: -32px;
    }

    .s-divider-1 {
        width: 100%;
        height: 1px;
        top: 155px;
    }

    .s-location {
        width: 160px;
        z-index: 3;
        top: 170px;
        left: 25%;
        transform: translateX(-50%);
    }

    .s-divider-2 {
        width: 1px;
        z-index: 4;
        height: 24px;
        top: 180px;
        left: 50%;
        background-color: var(--c-bg-secondary);
    }


    .s-founded {
        width: 160px;
        z-index: 3;
        top: 170px;
        left: 75%;
        transform: translateX(-50%);
    }

    .s-divider-3 {
        width: 100%;
        height: 1px;
        top: 229px;
    }

    .s-description {
        top: 264px;
        width: 100%;
        left: -16px;
    }

    @media (max-width: 1200px) {

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

    @media (max-width: 722px) {

        .location-and-year {
            flex-direction: column;
        }

        .location-and-year p:first-child {
            font-family: 'Poppins-SemiBold', sans-serif;
            font-size: 1.1rem;
            margin-bottom: 2px;

        }

        .spacer {
            display: none;
        }

        .row-narrow {
            padding: 12px;
            margin: 0;
        }

    }

</style>