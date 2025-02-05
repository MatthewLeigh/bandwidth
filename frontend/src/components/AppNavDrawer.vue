<template>
    <v-navigation-drawer
        app
        v-model="drawer"
        temporary
        location="left"
        :width="350"
    >
        <!-- User Profile -->
        <v-card
            v-if="user"
            class="user-profile"
            @click="goTo('user', undefined); drawer = false"
            flat
        >
            <v-avatar size="48" class="mx-auto">
                <v-img :src="userImg" :alt="userFirstName + ' Profile'" />
            </v-avatar>
            <v-card-text>
                <v-list-item-title>{{ userFirstName }} {{ userLastName }}</v-list-item-title>
                <v-list-item-subtitle>{{ userState }}, {{ userCountry }}</v-list-item-subtitle>
            </v-card-text>
        </v-card>

        <!-- Upper List -->
        <v-list class="upper-list">
            <v-list-item
                v-for="(route, index) in routes"
                :key="index"
                @click="goTo(route.name, undefined); drawer = false"
                :value="route.label"
            >
                <template v-slot:prepend>
                    <v-icon :icon="route.icon"></v-icon>
                </template>
                <v-list-item-title>{{ route.label }}</v-list-item-title>
            </v-list-item>
        </v-list>

        <!-- Divider -->
        <hr>

        <!-- Middle List -->
        <v-list class="middle-list">
            <v-list-item v-if="user" @click="goTo('user', undefined); drawer = false" :value="user.name">
                <template v-slot:prepend>
                    <v-icon icon="mdi-account-circle"></v-icon>
                </template>
                <v-list-item-title>Profile</v-list-item-title>
            </v-list-item>

            <!-- Log In -->
            <v-list-item v-if="!user" @click="goTo('login', undefined); drawer = false" value="Login">
                <template v-slot:prepend>
                    <v-icon icon="mdi-login"></v-icon>
                </template>
                <v-list-item-title>Login / Signup</v-list-item-title>
            </v-list-item>

            <!-- Toggle Theme -->
            <v-list-item>
                <template v-slot:prepend>
                    <v-icon icon="mdi-theme-light-dark"></v-icon>
                </template>
                <v-list-item-title>Dark Mode</v-list-item-title>
                <template v-slot:append>
                    <v-switch v-model="isDark" @change="toggleTheme"></v-switch>
                </template>
            </v-list-item>
        </v-list>

        <!-- Divider -->
        <hr v-if="user">

        <!-- Lower List -->
        <template v-if="user" v-slot:append>
            <hr>
            <v-list class="lower-list">
                <v-list-item @click="handleLogout(); drawer = false" value="Sign Out">
                    <template v-slot:prepend>
                        <v-icon icon="mdi-logout"></v-icon>
                    </template>
                    <v-list-item-title>Sign Out</v-list-item-title>
                </v-list-item>
            </v-list>
        </template>

    </v-navigation-drawer>
</template>

<script lang="ts">
import { defineComponent, computed, ref, onMounted } from 'vue';
import { useNavigation } from '../composables/useNavigation';
import { storeToRefs } from 'pinia';
import { useSessionStore } from '@/stores/session';
import { useSnackbarStore } from '@/stores/showSnackbar';
import { Server } from '@/config/Server';
import { useTheme } from 'vuetify';

export default defineComponent({
    name: 'AppNavDrawer',

    props: {
        isDrawerActive: Boolean,
    },

    emits: ['update:isDrawerActive'],

    setup(props, { emit }) {
        const { goTo } = useNavigation();
        const sessionStore = useSessionStore();
        const { getUser: user } = storeToRefs(sessionStore);
        const snackbar = useSnackbarStore();

        const drawer = computed({
            get: () => props.isDrawerActive,
            set: (value) => emit('update:isDrawerActive', value),
        });

        const routes = [
            { name: 'home', label: 'Home', icon: 'mdi-home' },
            { name: 'event', label: 'Events', icon: 'mdi-calendar' },
            { name: 'artist', label: 'Artists', icon: 'mdi-account-music' },
            { name: 'venue', label: 'Venues', icon: 'mdi-map-marker' },
            { name: 'about', label: 'About', icon: 'mdi-information' }
        ];

        // Theme Toggle Logic
        const theme = useTheme();
        const isDark = ref(localStorage.getItem('theme') === 'dark');

        const toggleTheme = () => {
            isDark.value = !isDark.value;
            theme.global.name.value = isDark.value ? 'dark' : 'light';
            localStorage.setItem('theme', isDark.value ? 'dark' : 'light');
        };

        onMounted(() => {
            theme.global.name.value = isDark.value ? 'dark' : 'light';
        });

        return { goTo, sessionStore, user, snackbar, drawer, routes, isDark, toggleTheme };
    },

    data() {
        return {
            userImg: '',
            userFirstName: '',
            userLastName: '',
            userCountry: '',
            userState: ''
        };
    },

    methods: {
        handleLogout() {
            this.sessionStore.logout();
            this.snackbar.showSnackbar('Sign Out Successful.');
        },

        clearUserDetails() {
            this.userImg = '';
            this.userFirstName = '';
            this.userLastName = '';
            this.userCountry = '';
            this.userState = '';
        },

        async fetchUserDetails() {
            try {
                const userImgResponse = await fetch(`${Server}/user-details/${this.user.userId}`);
                const userImgData = await userImgResponse.json();

                this.userImg = userImgData[0].ImageURL;
                this.userFirstName = userImgData[0].FirstName;
                this.userLastName = userImgData[0].LastName;
                this.userCountry = userImgData[0].Country;
                this.userState = userImgData[0].State;
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

    .v-navigation-drawer {
        height: 100%;
    }

    .v-list {
        padding: 24px 12px;
    }

    .v-list-item {
        cursor: pointer;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: left;
    }

    hr {
        border: 0;
        border-top: 1px solid var(--c-border-secondary);
        margin: 0 24px;
    }

    .user-profile {
        display: flex;
        flex-direction: row;
        align-items: center;
        padding: 24px;
        background-color: var(--c-bg-secondary);
        border-bottom: 1px solid var(--c-border);
        border-radius: 0;
    }

</style>
