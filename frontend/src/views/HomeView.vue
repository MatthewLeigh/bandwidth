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
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam accusamus autem
                        eveniet omnis magnam aliquid natus numquam qui ipsam quibusdam magni, neque
                        architecto, nostrum assumenda impedit excepturi facere, atque ea? Lorem ipsum dolor
                        sit amet consectetur adipisicing elit. Aspernatur voluptatibus ad, iure repudiandae
                        eum ipsa facilis nemo quidem magnam ullam eos impedit dicta cupiditate aliquam
                        perferendis qui est mollitia quibusdam.
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
