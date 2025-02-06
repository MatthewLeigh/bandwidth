<template>
    <div class="form-wrapper">

        <!-- Form Filler -->
        <div class="form-filler">
            <v-icon aria-hidden="true">mdi-account-circle</v-icon>
            <p id="signup-prompt">Don't have an account yet?</p>
            <v-btn flat @click="toggleCurrentForm" aria-labelledby="signup-prompt">Create Account</v-btn>
        </div>

        <!-- Form -->
        <v-form @submit.prevent="submitForm">

            <div>
                <p class="form-title">Welcome Back!</p>
                <p class="form-description">Please login to access your saved events.</p>
            </div>

            <fieldset>
                <legend class="sr-only" aria-label="Login Form">Login Form</legend>

                <!-- Email -->
                <v-text-field
                    v-model="email"
                    label="Email"
                    type="email"
                    required
                    autocomplete="email"
                    aria-label="Email"
                    aria-required="true"
                />
                <!-- Password -->
                <v-text-field
                    v-model="password"
                    label="Password"
                    type="password"
                    required
                    autocomplete="current-password"
                    aria-label="Password"
                    aria-required="true"
                />

            </fieldset>

            <div class="form-buttons">

                <!-- Clear Button -->
                <v-btn
                    class="clear-button"
                    @click="clearForm"
                    aria-label="Clear Form Button"
                    flat
                >
                    Clear
                </v-btn>

                <!-- Submit Button -->
                <v-btn
                    class="submit-button"
                    @click="submitForm"
                    aria-label="Submit Form Button"
                    flat
                >
                    Sign In
                </v-btn>
            </div>

        </v-form>

    </div>
</template>

<script lang="ts">
    import { defineComponent } from "vue";
    import { Server } from '@/config/Server';
    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';
    import { useNavigation } from '@/composables/useNavigation';
    import { useSnackbarStore } from '@/stores/showSnackbar';


    export default defineComponent({
        name: 'LoginForm',

        setup() {
            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);
            const { goTo } = useNavigation();
            const snackbar = useSnackbarStore();

            return { user, sessionStore, goTo, snackbar };
        },

        data() {
            return {
                email: '',
                password: '',
            };
        },

        methods: {

            // Clear the form
            clearForm() {
                this.email = '';
                this.password = '';
            },

            // Submit the form
            async submitForm() {
                try {
                    const response = await fetch(`${Server}/get/login/${this.email}/${this.password}`);

                    if (response.status === 200) {
                        const data = await response.json();
                        this.sessionStore.login({
                            userId: data[0].UserID
                        });
                        this.snackbar.showSnackbar('Login Successful');
                        this.goTo('home');

                    } else if (response.status === 404) {
                        this.snackbar.showSnackbar('Email or Password is incorrect');

                    } else {
                        this.snackbar.showSnackbar('Login Unsuccessful');
                    }

                } catch (error) {
                    this.snackbar.showSnackbar('Login Unsuccessful');
                }
            },

            // Toggle between login and signup forms
            toggleCurrentForm() {
                this.$emit('toggleCurrentForm');
            }

        }

    });
</script>