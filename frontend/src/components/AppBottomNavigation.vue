<template>
    <v-bottom-navigation app grow class="bottom-navigation" height="80px">

        <!-- Static Routes (Home, Events, Artists & Venues) -->
        <v-btn
            v-for="(route, index) in routes"
            :key="index"
            @click="goTo(route.name)"
            :value="route.name"
            :class="{ 'active': isActivePath(route.name) }"
        >
            <v-icon>{{ route.icon }}</v-icon>
            <span>{{ route.label }}</span>
        </v-btn>

        <!-- Profile (User or Login)-->
        <v-btn
            @click="goTo((user) ? 'user' : 'login')"
            value="User"
            :class="{ 'active': isActivePath('user') }"
        >
            <v-icon>mdi-account-circle</v-icon>
            <span>Profile</span>
        </v-btn>

    </v-bottom-navigation>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';
    import { useNavigation } from '../composables/useNavigation';

    export default defineComponent({
        name: 'AppBottomNavigation',

        setup() {

            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);

            const { goTo } = useNavigation();
            const routes = [
                { name: 'home', label: 'Home', icon: 'mdi-home' },
                { name: 'event', label: 'Events', icon: 'mdi-calendar' },
                { name: 'artist', label: 'Artists', icon: 'mdi-account-music' },
                { name: 'venue', label: 'Venues', icon: 'mdi-map-marker' }
            ];

            return { sessionStore, user, goTo, routes };
        },

        methods: {

            isActivePath(path: string): boolean {

                switch (path) {
                    case 'home':
                        return this.$route.path === '/';
                    case 'event':
                        return this.$route.path.includes('event');
                    case 'artist':
                        return this.$route.path.includes('artist');
                    case 'venue':
                        return this.$route.path.includes('venue');
                    case 'user':
                        return (
                            this.$route.path.includes('user') ||
                            this.$route.path.includes('login')
                    );
                    default:
                        return false;
                }
            }
        }

    });
</script>

<style scoped>

    .bottom-navigation {
        height: 80px;
        z-index: 1000;
    }

    .active {
        color: var(--c-text-featured);
    }

</style>