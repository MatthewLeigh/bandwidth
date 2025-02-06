<template>
    <div>

        <!-- Banner Carousel -->
        <BannerCarousel v-if="!$isMobile.value" />

        <v-container>

            <!-- Page Title -->
            <div class="page-title">
                <div class="hero-image-wrapper" @click="goTo('event')">
                    <div class="hero-image-text">
                        <h1>Bandwidth</h1>
                        <h2>Explore gigs now!</h2>
                    </div>
                    <img
                        class="hero-image"
                        :src="require('../assets/home-hero.png')"
                        alt="Events Hero"
                    >
                </div>
                <div class="hero-subtext">
                    <p>
                        Welcome to Bandwidth – Melbourne’s ultimate gig guide, where music lovers
                        can explore the city’s electrifying live scene with ease. Whether you're
                        hunting for a last-minute gig, planning your weekend, or discovering your
                        next favorite artist, Bandwidth keeps you in tune with everything happening
                        across Melbourne’s best venues. From intimate acoustic sets in hidden
                        laneways to pulsating sold-out shows at iconic clubs, our guide connects you
                        to the heartbeat of the city’s diverse music culture.
                    </p>
                    <p>
                        With constant updates, featured events, and an easy-to-navigate interface,
                        Bandwidth makes it effortless to find gigs, follow artists, and never miss a
                        beat. Whether you’re a die-hard fan, a casual listener, or a musician
                        looking to promote your next show, Bandwidth is your go-to platform for all
                        things live music in Melbourne. Let’s turn up the volume and explore the
                        city’s thriving soundscape—one gig at a time.
                    </p>
                </div>
            </div>

            <!-- Events -->
            <div class="row-wrapper">
                <DividerBar :text="'Events'" :route="'event'" />
                <FocusCardRow :focusList="featuredEvents" />
            </div>

            <!-- Artists -->
            <div class="row-wrapper">
                <DividerBar :text="'Artists'" :route="'artist'" />
                <FocusCardRow :focusList="featuredArtists" />
            </div>

            <!-- Venues -->
            <div class="row-wrapper">
                <DividerBar :text="'Venues'" :route="'venue'" />
                <FocusCardRow :focusList="featuredVenues" />
            </div>

            <!-- Random Banner -->
            <RandomBanner />

        </v-container>
    </div>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { Focus } from '@/models/Focus';
    import { FocusType } from '@/models/FocusType';
    import { Server } from '@/config/Server';
    import BannerCarousel from '@/components/BannerCarousel.vue';
    import FocusCardRow from '@/components/FocusCardRow.vue';
    import DividerBar from '@/components/DividerBar.vue';
    import RandomBanner from '@/components/RandomBanner.vue';
    import { useNavigation } from '@/composables/useNavigation';


    export default defineComponent({
        name: 'HelloView',

        setup() {
            const { goTo } = useNavigation();
            return { goTo };
        },

        components: {
            BannerCarousel,
            FocusCardRow,
            DividerBar,
            RandomBanner
        },

        data() {
            return {
                featuredEvents: [] as Focus[],
                featuredArtists: [] as Focus[],
                featuredVenues: [] as Focus[],
            };
        },

        async mounted() {
            try {
                // Fetch and map Featured Events
                const eventResponse = await fetch(`${Server}/featured-event-ids`);
                const eventData = await eventResponse.json();
                this.featuredEvents = eventData.ids.map((id: number) => new Focus(id, FocusType.Event));

                // Fetch and map Featured Artists
                const artistResponse = await fetch(`${Server}/featured-artist-ids`);
                const artistData = await artistResponse.json();
                this.featuredArtists = artistData.ids.map((id: number) => new Focus(id, FocusType.Artist));

                // Fetch and map Featured Venues
                const venueResponse = await fetch(`${Server}/featured-venue-ids`);
                const venueData = await venueResponse.json();
                this.featuredVenues = venueData.ids.map((id: number) => new Focus(id, FocusType.Venue));
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        },
    });
</script>

<style scoped>

    .row-wrapper {
        margin-top: 64px;
    }

    .hero-image-wrapper {
        cursor: pointer;
    }

    .hero-image-wrapper:hover .hero-image-text h2 {
        animation: wiggle 0.5s infinite;
    }

    @keyframes wiggle {
        0% {
            transform: rotate(0deg);
        }
        25% {
            transform: rotate(2deg);
        }
        50% {
            transform: rotate(-2deg);
        }
        75% {
            transform: rotate(1deg);
        }
        100% {
            transform: rotate(0deg);
        }
    }

</style>
