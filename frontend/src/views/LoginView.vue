<template>
    <v-container>

        <LoginForm
            v-if="currentForm === 'login'"
            @toggleCurrentForm="toggleCurrentForm"
        />

        <SignUpForm
            v-else
            @toggleCurrentForm="toggleCurrentForm"
        />

    </v-container>
  </template>

  <script lang="ts">
    import { defineComponent } from "vue";
    import LoginForm from "@/components/LoginForm.vue";
    import SignUpForm from "@/components/SignUpForm.vue";

    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';

    export default defineComponent({
        name: "LoginView",

        setup() {
            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);

            return { user, sessionStore };
        },

        components: {
            LoginForm,
            SignUpForm
        },

        data() {
            return {
                currentForm: "login"
            }
        },

        methods: {

            handleLogin() {
                this.sessionStore.login({
                    userId: "1"
                });
            },

            handleLogout() {
                this.sessionStore.logout();
            },

            toggleCurrentForm() {
                this.currentForm = this.currentForm === "login" ? "signup" : "login";
            }
        },

    });
  </script>
