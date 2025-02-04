<template>
    <v-app>
        <AppHeader @toggle-drawer="isDrawerActive = !isDrawerActive"/>
        <AppNavDrawer :isDrawerActive="isDrawerActive" @update:isDrawerActive="isDrawerActive = $event" />
        <v-main>
            <router-view />
        </v-main>
        <AppFooter />
        <ReusableSnackbar />
        <AppBottomNavigation v-if="$isMobile.value"/>
    </v-app>
</template>

<script lang="ts">
    import { defineComponent, ref } from 'vue';
    import AppHeader from './components/AppHeader.vue';
    import AppFooter from './components/AppFooter.vue';
    import AppNavDrawer from './components/AppNavDrawer.vue';
    import ReusableSnackbar from './components/ReusableSnackbar.vue';
    import AppBottomNavigation from './components/AppBottomNavigation.vue';

    export default defineComponent({
        name: 'App',

        components: {
            AppHeader,
            AppNavDrawer,
            AppFooter,
            ReusableSnackbar,
            AppBottomNavigation
        },

        setup() {
            const isDrawerActive = ref(false);
            return { isDrawerActive };
        },

        watch: {
            $route(to) {
                document.title = to.meta.title || 'Bandwidth';
            },
        },
    });
</script>
