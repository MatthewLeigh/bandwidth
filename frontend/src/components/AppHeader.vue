<template>
    <v-app-bar app>

        <!-- Menu Icon -->
        <v-btn icon @click="$emit('toggle-drawer')" class="menu-icon">
            <v-icon>mdi-menu</v-icon>
        </v-btn>

        <!-- Title -->
        <v-toolbar-title
            @click="goTo('home', undefined, $event)"
            class="d-flex flex-column cursor-pointer title-container"
        >
            <h1 :class="['title', { 'active': isHomePath() }]">Bandwidth</h1>
            <h2 class="subtitle">Melbourne Gig Guide</h2>
        </v-toolbar-title>

        <template v-if="!$isTablet.value">

            <!-- Main Routes -->
            <v-btn-group>
                <v-btn
                    v-for="(route, index) in routes"
                    :key="index"
                    :class="{ 'active': isActivePath(route.name) }"
                    @click="goTo(route.name, undefined, $event)"
                >
                    {{ route.label }}
                </v-btn>
            </v-btn-group>

            <!-- Profile Icon -->
            <v-btn icon @click="goTo(user ? 'user' : 'login', undefined, $event)">
                <v-avatar v-if="user">
                    <v-img :src="userImg" />
                </v-avatar>
                <v-icon v-else>mdi-account-circle</v-icon>
            </v-btn>

        </template>

    </v-app-bar>
</template>

<script lang="ts">
    import { defineComponent, ref } from 'vue';
    import { useNavigation } from '../composables/useNavigation';
    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';
    import { Server } from '@/config/Server';

    export default defineComponent({
        name: 'AppHeader',

        setup() {
            const { goTo } = useNavigation();
            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);

            const routes = [
                { name: 'event', label: 'Events' },
                { name: 'artist', label: 'Artists' },
                { name: 'venue', label: 'Venues' },
                { name: 'about', label: 'About' }
            ];

            const isDrawerActive = ref(false);

            return { goTo, user, routes, isDrawerActive };
        },

        data() {
            return {
                userImg: '',
            }
        },

        methods: {

            isActivePath(path: string): boolean {
                return this.$route.path.includes(path);
            },

            isHomePath(): boolean {
                return this.$route.path === '/';
            },

            clearUserDetails() {
                this.userImg = '';
            },

            async fetchUserDetails() {
                try {
                    const userImgResponse = await fetch(`${Server}/user-details/${this.user.userId}`);
                    const userImgData = await userImgResponse.json();

                    this.userImg = userImgData[0].ImageURL;

                } catch (error) {
                    console.error(error);
                    this.clearUserDetails();

                }
            }
        },

        mounted() {
            if (this.user) {
                this.fetchUserDetails();
            }
        },

        watch: {
            user() {
                this.fetchUserDetails();
            }
        }

    });

</script>

<style scoped>

    .v-app-bar {
        background-color: var(--c-bg-header);
    }

    .v-btn {
        font-family: 'Poppins-SemiBold', sans-serif;
        border-radius: 4px;
        background-color: transparent;
    }

    .title {
        font-family: 'Poppins-SemiBold', sans-serif;
        font-size: 24px;
        transform: translateY(8px);
    }

    .subtitle {
        font-family: 'Poppins-ExtraLight', sans-serif;
        font-size: 10px;
        margin-left: 1px;
        transform: translateY(-2px);
    }

    .active {
        color: var(--c-text-featured);
    }

    .v-avatar {
        scale: .66;
    }

    @media (max-width: 1200px) {

        .v-toolbar-title {
            margin-right: 72px;
            text-align: center;
        }

    }

</style>
