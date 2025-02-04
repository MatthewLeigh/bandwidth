<template>
    <div class="wrapper">

        <div
            v-for="(card, index) in avatarCardDetails"
            :key="index"
            class="card-wrapper"
        >
            <div class="spacer" v-if="index !== 0"></div>
            <v-card
                class="card"
                flat
                @click="goTo(card.focus.type, card.focus.id, $event)"
            >
                <v-img
                    v-if="!card.hasImgError"
                    :src="card.imgUrl"
                    :alt="card.title"
                    cover
                    height="40"
                    width="40"
                    style="border-radius: 50%;"
                    @error="onImageError(index)"
                />
                <div
                    v-else
                    class="img-placeholder"
                >
                    <span>{{ card.title.substring(0, 1)}}</span>
                </div>
                <v-card-text>
                    <v-card-title>{{ card.title }}</v-card-title>
                    <v-card-subtitle>
                        <span>{{ getDescriptor(card.setListPosition) }}</span>
                        <span>{{ formatStartTime(card.startTime, card.setListPosition) }}</span>
                    </v-card-subtitle>
                </v-card-text>
            </v-card>
        </div>

    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import { AvatarCardDetails } from '@/models/AvatarCardDetails';
import { Server } from '@/config/Server';
import { Focus } from '@/models/Focus';
import { FocusType } from '@/models/FocusType';
import { useNavigation } from '@/composables/useNavigation';

export default defineComponent({
    name: 'EventAvatarCards',

    setup() {
        const { goTo } = useNavigation();
        return { goTo };
    },

    props: {
        eventId: {
            type: Number,
            required: true
        },
    },

    data() {
        return {
            avatarCardDetails: [] as AvatarCardDetails[],

            isLoading: true,
            isError: false
        };
    },

    methods: {
        getDescriptor(setListPosition: number) {
            const headlinerPosition = this.avatarCardDetails.length - 1;
            switch(setListPosition) {
                case headlinerPosition:
                    return 'Headliner';
                case -1:
                    return 'Venue';
                default:
                    return 'Support';
            }
        },
        formatStartTime(startTime: string, setListPosition: number) {
            if (!startTime) return '';
            const hour24 = startTime.substring(0, 2);
            const hour12 = (parseInt(hour24) % 12) || 12;
            const minute = startTime.substring(3, 5);
            const ampm = parseInt(hour24) >= 12 ? 'pm' : 'am';
            const preface = setListPosition === -1 ? 'Doors at ' : '';
            return ` | ${preface}${hour12}:${minute}${ampm}`;
        },
        onImageError(index: number) {
            this.avatarCardDetails[index].hasImgError = true;
        },
    },

    async mounted() {
        try {
            // Artist Details
            const response = await fetch(`${Server}/event-avatar-card-artist-details/${this.eventId}`);
            const data = await response.json();
            const artistDetails = data.map((item: {
                URL: string;
                ArtistID: number;
                Title: string;
                PerformanceStartTime: string;
                SetListPosition: number;
            }) => {
                return {
                    imgUrl: item.URL,
                    title: item.Title,
                    startTime: item.PerformanceStartTime,
                    setListPosition: item.SetListPosition,
                    focus: new Focus(item.ArtistID, FocusType.Artist),
                };
            });

            // Venue Details
            const response2 = await fetch(`${Server}/event-avatar-card-venue-details/${this.eventId}`);
            const data2 = await response2.json();
            const venueDetails = data2.map((item: {
                URL: string;
                VenueID: number;
                Title: string;
                StartTime: string;
            }) => {
                return {
                    imgUrl: item.URL,
                    title: item.Title,
                    startTime: item.StartTime,
                    setListPosition: -1, /* -1 signifies Venue */
                    focus: new Focus(item.VenueID, FocusType.Venue),
                };
            });

            artistDetails.sort((a: AvatarCardDetails, b: AvatarCardDetails) => b.setListPosition - a.setListPosition);

            this.avatarCardDetails = [...artistDetails, ...venueDetails];

        } catch (error) {
            console.error('Error fetching event avatar card details:', error);
            this.isError = true;
        } finally {
            this.isLoading = false;
        }
    },


});
</script>

<style scoped>

    .wrapper {
        display: flex;
        justify-content: flex-start;
        align-items: flex-start;
        overflow-x: auto;
    }

    .wrapper::-webkit-scrollbar {
        height: 8px;
    }

    .wrapper:hover::-webkit-scrollbar {
        display: block;
    }

    .wrapper::-webkit-scrollbar-thumb {
        background-color: #bbb;
        border-radius: 4px;
    }

    .wrapper::-webkit-scrollbar-track {
        background-color: #f0f0f0;
        border-radius: 4px;
    }

    .wrapper:hover::-webkit-scrollbar-thumb {
        background-color: #888;
    }

    .card-wrapper {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: flex-start;
    }

    .spacer {
        width: 1px;
        height: 40px;
        background-color: rgb(219, 219, 219);
        margin: 0 28px;
    }

    .card {
        cursor: pointer;
        margin: 0;
        padding: 8px;
        border-radius: 8px;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: flex-start;
    }

    .v-card-text {
        padding: 0;
        margin: 0 0 0 16px;
    }

    .v-card-title {
        font-family: 'Poppins-SemiBold', sans-serif;
        font-size: 14px;
        padding: 0;
        margin: 0;
    }

    .v-card-subtitle {
        font-size: 12px;
        padding: 0;
        margin: 0;
    }

    .v-img {
        max-height: 40px;
        max-width: 40px;
    }

    .img-placeholder {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 40px;
        height: 40px;
        font-family: 'Poppins-SemiBold', sans-serif;
        font-size: 16px;
        color: white;
        background-color: #4a4a4a;
        border-radius: 50%;
    }

    @media (max-width: 820px) {
        .wrapper {
            flex-direction: column;
        }

        .card-wrapper {
            flex-direction: column;
            margin-bottom: 16px;
            width: 100%;
            justify-content: flex-start;
            align-items: flex-start;
        }

        .card {
            width: 100%;
        }

        .spacer {
            display: none;
        }
    }

</style>