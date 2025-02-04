<template>
    <v-card
        @click="goTo(focus.type, focus.id, $event)"
        flat
    >

        <!-- Loading -->
        <FocusCardSkeleton v-if="isLoading"/>

        <!-- Loaded -->
        <template v-else>

            <!-- Image -->
            <div class="img-wrapper">

                <!-- Icon -->
                <div
                    v-if="user"
                    class="icon-wrapper"
                    @click.stop="iconMethod"
                >
                    <v-btn
                        v-if="isSavedOrFavourite"
                        class="icon"
                        :icon="iconType"
                        style="color: var(--c-icon-favourite)"
                    />
                    <v-btn
                        v-else
                        class="icon"
                        :icon="iconType"
                    />
                </div>

                <!-- If Image Load Unsuccessful -->
                <v-img
                    v-if="!imgError"
                    class="img"
                    :src="imgUrl"
                    :alt="title"
                    cover
                    @error="onImgError"
                />

                <!-- If Image Load Successful -->
                <div
                    v-else
                    class="img-placeholder"
                    :style="{ backgroundColor: backgroundColor }"
                >
                    <span>{{ title }}</span>
                </div>

            </div>

            <!-- Text -->
            <div class="text">
                <v-card-text class="upper-row" >
                    <span>{{ topLeftString }}</span>
                    <span>{{ topRightString }}</span>
                </v-card-text>
                <v-card-title class="title">{{ title }}</v-card-title>
                <v-card-subtitle class="subtitle">{{ subtitle }}</v-card-subtitle>
            </div>

        </template>
    </v-card>
</template>

<script lang="ts">
    import { defineComponent } from 'vue'
    import { Focus } from '@/models/Focus'
    import { FocusType } from '@/models/FocusType';
    import { useNavigation } from '@/composables/useNavigation';
    import { useSnackbarStore } from '@/stores/showSnackbar';
    import { Server } from '@/config/Server';
    import FocusCardSkeleton from './FocusCardSkeleton.vue';
    import getRandomColor, { Contrast } from '@/utils/getRandomColor';

    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';

    export default defineComponent({
        name: "FocusCard",

        setup() {
            const { goTo } = useNavigation();
            const sessionStore = useSessionStore();
            const snackbar = useSnackbarStore();
            const { getUser: user } = storeToRefs(sessionStore);
            return { goTo, sessionStore, snackbar, user };
        },

        props: {
            focus: {
                type: Object as () => Focus,
                required: true
            }
        },

        components: {
            FocusCardSkeleton
        },

        data () {
            return {
                imgUrl: "",
                title: "",
                subtitle: "",
                topLeftString: "",
                topRightString: "",
                backgroundColor: '',
                isSavedOrFavourite: false,
                isLoading: true,
                isError: false,
                imgError: false,
            }
        },

        computed: {

            iconType(): string {
                if (this.focus.type === FocusType.Event) {
                    return (this.isSavedOrFavourite) ? 'mdi-bookmark' : 'mdi-bookmark-outline'
                }

                else {
                    return (this.isSavedOrFavourite) ? 'mdi-heart' : 'mdi-heart-outline'
                }
            }

        },

        methods: {

            onImgError() {
                this.imgError = true;
                this.backgroundColor = getRandomColor(Contrast.Dark, this.title);
            },

            formatDate(date: string) {
                return new Date(date).toLocaleDateString('en-AU', {
                    year: 'numeric',
                    month: 'short',
                    day: 'numeric',
                });
            },

            formatLocation(StreetAddress: string, City: string, State: string, PostCode: string) {
                return `${StreetAddress}, ${City} ${State} ${PostCode}`;
            },

            preloadImage(url: string) {
                return new Promise((resolve, reject) => {
                        const img = new Image();
                        img.src = url;
                        img.onload = resolve;
                        img.onerror = reject;
                    });
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

                    this.isSavedOrFavourite = !this.isSavedOrFavourite;
                    this.snackbar.showSnackbar('Venue added to favourites!');


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

                    this.isSavedOrFavourite = !this.isSavedOrFavourite;
                    this.snackbar.showSnackbar('Venue removed from favourites');

                } catch (error) {
                    console.error("Error deleting venue from favorites:", error);
                }
            },

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

                    this.isSavedOrFavourite = !this.isSavedOrFavourite;
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

                    this.isSavedOrFavourite = !this.isSavedOrFavourite;
                    this.snackbar.showSnackbar('Artist removed from favourites');

                } catch (error) {
                    console.error("Error deleting artist from favorites:", error);
                }
            },

            async postIsSavedEvent() {
                try {
                    const response = await fetch(
                        `${Server}/post/event/is-saved/${this.user.userId}/${this.focus.id}`,
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

                    this.isSavedOrFavourite = !this.isSavedOrFavourite;
                    this.snackbar.showSnackbar('Event added to saved events!');

                } catch (error) {
                    console.error("Error marking event as favorite:", error);
                }
            },

            async deleteIsSavedEvent() {
                try {
                    const response = await fetch(
                        `${Server}/delete/event/is-saved/${this.user.userId}/${this.focus.id}`,
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

                    this.isSavedOrFavourite = !this.isSavedOrFavourite;
                    this.snackbar.showSnackbar('Event removed from saved events');

                } catch (error) {
                    console.error("Error deleting event from favorites:", error);
                }
            },

            iconMethod() {
                if (this.focus.type === FocusType.Venue) {
                    if (this.isSavedOrFavourite) this.deleteIsFavouriteVenue();
                    else this.postIsFavouriteVenue();
                }

                else if (this.focus.type === FocusType.Artist) {
                    if (this.isSavedOrFavourite) this.deleteIsFavouriteArtist();
                    else this.postIsFavouriteArtist();
                }

                else if
                    (this.focus.type === FocusType.Event) {
                        if (this.isSavedOrFavourite) this.deleteIsSavedEvent();
                        else this.postIsSavedEvent();
                    }
            }
        },

        async mounted() {
            try {

                // Venue
                if (this.focus.type === FocusType.Venue) {

                    // Card Details
                    const response = await fetch(`${Server}/single-venue-focus-card-details/${this.focus.id}`);
                    const data = await response.json();
                    const venue = data[0];

                    this.imgUrl = venue.ImageURL;
                    this.title = venue.Title;
                    this.subtitle = venue.EventCount + ' Upcoming Event' + (venue.EventCount === 1 ? '' : 's');
                    this.topLeftString = this.formatLocation(venue.StreetAddress, venue.City, venue.State, venue.PostCode);

                    // Check if favourite venue for user
                    if (this.user) {
                        const response2 = await fetch(`${Server}/get/venue/is-favourite/${this.user.userId}/${this.focus.id}`);
                        const data2 = await response2.json();

                        this.isSavedOrFavourite = data2[0].isFavourite
                    }

                }

                // Artist
                else if (this.focus.type === FocusType.Artist) {

                    // Card Details
                    const response = await fetch(`${Server}/single-artist-focus-card-details/${this.focus.id}`);
                    const data = await response.json();
                    const artist = data[0];

                    this.imgUrl = artist.ImageURL;
                    this.title = artist.Title;
                    this.subtitle = (artist.EventCount > 0)
                        ? artist.EventCount + ' Upcoming Event' + (artist.EventCount === 1 ? '' : 's')
                        : 'No Upcoming Events';
                    this.topLeftString = artist.State + ', ' + artist.Country;

                    // Check if favourite artist for user
                    if (this.user) {
                        const response2 = await fetch(`${Server}/get/artist/is-favourite/${this.user.userId}/${this.focus.id}`);
                        const data2 = await response2.json();

                        this.isSavedOrFavourite = data2[0].isFavourite
                    }

                }

                // Event
                else if (this.focus.type === FocusType.Event) {

                    // Card Details
                    const response = await fetch(`${Server}/single-event-focus-card-details/${this.focus.id}`);
                    const data = await response.json();
                    const event = data[0];

                    this.imgUrl = event.ImageURL;
                    this.title = event.Title;
                    this.subtitle = event.ArtistList;
                    this.topLeftString = event.VenueTitle;
                    this.topRightString = this.formatDate(event.Date);

                    // Check if favourite event for user
                    if (this.user) {
                        const response2 = await fetch(`${Server}/get/event/is-saved/${this.user.userId}/${this.focus.id}`);
                        const data2 = await response2.json();

                        this.isSavedOrFavourite = data2[0].isSaved
                    }

                }

                // Throw error if invalid focus type
                else {
                    throw new Error('Invalid focus type');
                }

                // Preload Image
                try {
                    await this.preloadImage(this.imgUrl);

                } catch (error) {
                    this.onImgError();
                }

            } catch (error) {
                console.warn('Error fetching data:', error);
                this.isError = true;

            } finally {
                this.isLoading = false;
            }
        },

    });
</script>

<style scoped>

    .v-card {
        cursor: pointer;
        min-width: 320px;
        max-width: 500px;
        border-radius: 0;
        flex-shrink: 0;
        border-radius: 8px;
        transition: none;
        background-color: transparent !important;
    }

    .v-card.v-card--hover {
        background-color: transparent !important;
    }

    .img-wrapper {
        width: 100%;
        height: 200px;
        border-radius: 8px;
        overflow: hidden;
        position: relative;
    }

    .v-img {
        min-width: 100%;
        min-height: 100%;
        object-fit: cover;
    }

    .icon {
        position: absolute;
        top: 4px;
        right: 4px;
        z-index: 1;
        color: var(--c-icon);
        background: var(--c-bg-icon);
        scale: 0.66;
    }

    .icon:hover {
        background: var(--c-bg-icon-hover);
    }

    .img-placeholder {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        font-family: 'Poppins-SemiBold', sans-serif;
        font-size: 16px;
        color: white;
    }

    .upper-row {
        font-family: 'Poppins-Light', sans-serif;
        font-size: 12px;
        margin: 8px 0 0;
        padding: 0;
        display: flex;
        justify-content: space-between;

    }

    .title {
        font-family: 'Poppins-SemiBold', sans-serif;
        font-size: 16px;
        margin: 4px 0 0;
        padding: 0;
        white-space: normal;
    }

    .subtitle {
        font-family: 'Poppins-Light', sans-serif;
        font-size: 13px;
        margin: 0;
        padding: 0;
        white-space: normal;
    }

    .title,
    .subtitle {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    @media (max-width: 722px) {

        .card {
            width: 100%;
        }

        .img-wrapper {
            width: 100%;
            height: auto;
            aspect-ratio: 16/9;
        }

    }

</style>