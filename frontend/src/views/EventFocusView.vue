<template>
    <v-container>

        <!-- Images -->
        <div class="carousel-wrapper">
            <ImageCarousel :focusArray="focusArray" />

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
                    :style="isSaved ? 'color: var(--c-icon-favourite)' : ''"
                    :icon="iconType"
                    @click="iconMethod"
                />

            </div>
        </div>

        <!-- Title -->
        <div class="title-wrapper">
            <p v-if="isFeatured" class="featured">| Featured Event</p>
            <p v-else class="muted">| Event</p>
            <h1 class="title">{{ eventTitle }}</h1>
        </div>

        <!-- Table -->
        <table>
            <tbody>

                <!-- Date -->
                <tr>
                    <td><strong>Date</strong></td>
                    <td>
                        <span class="date">{{ eventDate }}</span>
                        <span class="startTime muted"> | {{ eventStartTime }}</span>
                    </td>
                </tr>

                <!-- Location -->
                <tr>
                    <td><strong>Location</strong></td>
                    <td>
                        <span
                            @click="goTo('venue', venueFocusId)"
                            class="clickable"
                        >
                            {{ venueTitle }}
                        </span>
                        <span v-if="stageTitle" class="stage muted">
                             | {{ stageTitle }}
                        </span>
                    </td>
                </tr>

                <!-- Price / Tickets -->
                <tr>
                    <td><strong>Price</strong></td>
                    <td>
                        <TicketCards :eventId="focusId" :ticketSaleUrl="ticketSaleUrl" />
                    </td>
                </tr>

            </tbody>
        </table>

        <!-- Description -->
        <div v-if="eventDescription" class="description row">
            <p>{{ eventDescription }}</p>
        </div>

        <!-- Avatars -->
        <div class="avatars row">
            <h2 class="mobile-only set-times">Set Times</h2>
            <EventAvatarCards :eventId="focusId" />
        </div>

        <!-- Links -->
        <div class="links row mobile-columns">
            <a :href="ticketSaleUrl" class="button">Get Tickets</a>
            <div class="spacer"></div>
            <div class="disclaimer">
                <p class="asterisk muted">*</p>
                <p class="muted">
                    This event may be 18+. Information presented on this page may be false or
                    outdated. Always check with the
                    <a :href="originalPostUrl" target="_blank" class="clickable">official listing</a>
                    before purchasing tickets for any event.
                </p>
            </div>
        </div>

        <!-- Comments -->
        <CommentsSection :focus="focus" />

        <!-- Random Banner -->
        <RandomBanner />

    </v-container>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { Focus } from '@/models/Focus';
    import { FocusType } from '@/models/FocusType';
    import ImageCarousel from '@/components/ImageCarousel.vue';
    import TicketCards from '@/components/TicketCards.vue';
    import EventAvatarCards from '@/components/EventAvatarCards.vue';
    import RandomBanner from '@/components/RandomBanner.vue';
    import CommentsSection from '@/components/CommentsSection.vue';
    import { Server } from '@/config/Server';
    import { useNavigation } from '@/composables/useNavigation';

    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';
    import { useSnackbarStore } from '@/stores/showSnackbar';


    export default defineComponent({
        name: 'EventFocusView',

        setup() {
            const { goTo } = useNavigation();
            const sessionStore = useSessionStore();
            const snackbar = useSnackbarStore();
            const { getUser: user } = storeToRefs(sessionStore);
            return { goTo, sessionStore, snackbar, user };
        },

        components: {
            ImageCarousel,
            TicketCards,
            EventAvatarCards,
            RandomBanner,
            CommentsSection
        },

        data() {
            return {
                focusId: Number(this.$route.params.id),
                focus: new Focus(Number(this.$route.params.id), FocusType.Event),
                focusArray: [] as Focus[],
                eventTitle: '',
                eventDescription: '',
                isFeatured: false,
                eventDate: '',
                eventStartTime: '',
                venueFocusId: 0,
                venueTitle: '',
                stageTitle: '',
                originalPostUrl: '',
                ticketSaleUrl: '',
                isSaved: false
            };
        },

        methods: {
            formatDate(date: string) {
                return new Date(date).toLocaleDateString('en-AU', {
                    weekday: 'short',
                    year: 'numeric',
                    month: 'short',
                    day: 'numeric',
                });
            },
            formatTime(time: string) {
                const hour24 = time.substring(0, 2);
                const hour12 = (parseInt(hour24) % 12) || 12;
                const minute = time.substring(3, 5);
                const ampm = parseInt(hour24) >= 12 ? 'pm' : 'am';
                return `${hour12}:${minute}${ampm}`;
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

                    this.snackbar.showSnackbar('Event added to saved events!');


                    this.isSaved = !this.isSaved;
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

                    this.snackbar.showSnackbar('Event removed from saved events.');


                    this.isSaved = !this.isSaved;
                } catch (error) {
                    console.error("Error deleting event from favorites:", error);
                }
            },

            iconMethod() {
                (this.isSaved) ? this.deleteIsSavedEvent() : this.postIsSavedEvent();
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
                return (this.isSaved) ? 'mdi-bookmark' : 'mdi-bookmark-outline';
            }
        },

        async mounted() {
            try {
                // Focus Array
                const response = await fetch(`${Server}/event-image-ids/${this.focusId}`);
                const data = await response.json();
                const { VenueID, ArtistIDs } = data[0];

                this.focusArray = [
                    new Focus(this.focusId, FocusType.Event),
                    ...ArtistIDs.split(',').map((id: number) => new Focus(id, FocusType.Artist)),
                    new Focus(VenueID, FocusType.Venue),
                ];

                // Is Favourite Venue
                if (this.user) {
                    const response2 = await fetch(`${Server}/get/event/is-saved/${this.user.userId}/${this.focusId}`);
                    const data2 = await response2.json();

                    this.isSaved = data2[0].isSaved;
                }

                // Event Details
                const response2 = await fetch(`${Server}/focus-event-details/${this.focusId}`);
                const data2 = await response2.json();
                const flatData = data2[0];

                this.eventTitle = flatData.Title;
                this.eventDescription = flatData.Description;
                this.isFeatured = flatData.Featured;
                this.eventDate = this.formatDate(flatData.Date);
                this.eventStartTime = this.formatTime(flatData.StartTime);
                this.venueFocusId = flatData.VenueID;
                this.venueTitle = flatData.VenueTitle;
                this.stageTitle = flatData.StageTitle;
                this.originalPostUrl = flatData.OriginalPostURL;
                this.ticketSaleUrl = flatData.TicketSaleURL;

                // Add to Recently Viewed Event
                if (this.user) {
                    const response3 = await fetch(
                        `${Server}/post/user-recently-viewed-event/${this.user.userId}/${this.focusId}`,
                        {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json",
                            },
                        }
                    );

                    if (!response3.ok) {
                        throw new Error("Failed to update recently viewed events.");
                    }
                }

            } catch (error) {
                console.error('Error fetching data:', error);
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
        margin: 0 72px;
        width: 1px;
        height: 52px;
        background-color: rgb(219, 219, 219);
    }

    .disclaimer {
        display: flex;
        flex-direction: row;
        align-items: flex-start;
        gap: 8px;
        text-align: justify;
    }

    .disclaimer a {
        color: #4a4a4a;
        text-decoration: none;
    }

    .asterisk {
        font-size: 1.25rem;
    }

    .mobile-only {
        display: none;
    }

    .set-times {
        margin-bottom: 32px;
        font-family: 'Poppins-SemiBold';
        font-size: 1.5rem;
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

        .mobile-only {
            display: block;
        }

        .mobile-columns {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .spacer {
            display: none;
        }

        .disclaimer {
            font-size: 0.8rem;
            margin: 0 24px;
        }

    }


</style>