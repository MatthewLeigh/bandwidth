<template>
    <div class="form-wrapper">

        <!-- Form -->
        <v-form
            ref="form"
            validate-on="submit"
            @submit.prevent="submit"
        >

            <div>
                <p class="form-title">Welcome!</p>
                <p class="form-description">Sign up to unlock the guides full potential.</p>
            </div>

            <fieldset>

                <!-- First Name -->
                <v-text-field
                    v-model="firstName"
                    label="First Name"
                    type="text"
                    :rules="firstNameRules"
                    required
                />

                <!-- Last Name -->
                <v-text-field
                    v-model="lastName"
                    label="Last Name"
                    type="text"
                    :rules="lastNameRules"
                    required
                />

                <!-- Country (Searchable) -->
                <v-select
                    v-model="selectedCountry"
                    :items="countries"
                    label="Country"
                    clearable
                    required
                    :rules="countryRules"
                    @update:modelValue="fetchStates(selectedCountry)"
                />

                <!-- State (Depends on Selected Country) -->
                <v-select
                    v-model="selectedState"
                    :items="states"
                    label="State"
                    clearable
                    required
                    :rules="stateRules"
                    :disabled="!selectedCountry"
                />

                <!-- Email -->
                <v-text-field
                    v-model="email"
                    label="Email"
                    type="email"
                    :rules="emailRules"
                    required
                />

                <!-- Password -->
                <v-text-field
                    v-model="password"
                    label="Password"
                    type="password"
                    :rules="passwordRules"
                    required
                />

                <!-- Confirm Password -->
                <v-text-field
                    v-model="confirmPassword"
                    label="Confirm Password"
                    type="password"
                    :rules="confirmPasswordRules"
                    required
                />

            </fieldset>

            <div class="form-buttons">
                <!-- Clear Button -->
                <v-btn class="clear-button" @click="clear" flat>Clear</v-btn>
                <!-- Submit Button -->
                <v-btn class="submit-button" @click="submit" flat>Sign Up</v-btn>
            </div>

        </v-form>
        <!-- Form Filler -->
        <div class="form-filler">
            <v-icon>mdi-account-circle</v-icon>
            <p>Already have an account?</p>
            <v-btn flat @click="toggleCurrentForm">Log In</v-btn>
        </div>

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
        name: 'SignUpForm',

        setup() {
            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);
            const { goTo } = useNavigation();
            const snackbar = useSnackbarStore();

            return { user, sessionStore, goTo, snackbar };
        },

        data() {
            return {
                countries: [] as string[],
                states: [] as string[],
                selectedCountry: 'Australia',
                selectedState: '',
                firstName: '',
                lastName: '',
                email: '',
                password: '',
                confirmPassword: '',

                firstNameRules: [
                    (value: string) => {
                        return (value && value.trim().length > 0) || "First name is required";
                    },
                    (value: string) => {
                        return (value && value.trim().length <= 50) || "First name must be 50 characters or less";
                    },
                    (value: string) => {
                        return /^[a-zA-Z\s]*$/.test(value) || "First name must contain only letters and spaces";
                    }
                ],

                lastNameRules: [
                    (value: string) => {
                        return (value && value.trim().length > 0) || "Last name is required";
                    },
                    (value: string) => {
                        return (value && value.trim().length <= 50) || "Last name must be 50 characters or less";
                    },
                    (value: string) => {
                        return /^[a-zA-Z\s]*$/.test(value) || "Last name must contain only letters and spaces";
                    },
                ],

                countryRules: [
                    (value: string) => {
                        return (value && value.trim().length > 0) || "Country is required";
                    }
                ],

                stateRules: [
                    (value: string) => {
                        return (value && value.trim().length > 0) || "State is required";
                    }
                ],

                emailRules: [
                    (value: string) => {
                        return (value && value.trim().length > 0) || "Email is required";
                    },
                    (value: string) => {
                        return /.+@.+\..+/.test(value) || "Email must be valid";
                    }
                ],

                passwordRules: [
                    (value: string) => {
                        return (value && value.trim().length > 0) || "Password is required";
                    },
                    (value: string) => {
                        return (value && value.trim().length >= 8) || "Password must be at least 8 characters";
                    }
                ],

                confirmPasswordRules: [
                    (value: string) => {
                        return (value && value.trim().length > 0) || "Confirm password is required";
                    },
                    () => {
                        return (this.doesConfirmPasswordMatch()) || "Passwords do not match";
                    }
                ]


            };
        },

        methods: {

            // Toggle between login and signup forms
            toggleCurrentForm() {
                this.$emit('toggleCurrentForm');
            },

            // Fetch all countries on mount
            async fetchCountries() {
                try {
                    const response = await fetch("https://restcountries.com/v3.1/all?fields=name");
                    const data = await response.json();

                    if (response.ok) {
                        this.countries = data.map((country: any) => country.name.common).sort();
                    } else {
                        throw new Error("Failed to fetch countries");
                    }

                } catch (error) {
                    console.error("Error fetching countries:", error);
                }
            },

            // Fetch states for a specific country
            async fetchStates(country: string) {

                // Set data to empty while loading states.
                this.states = [];
                if (country != 'Australia') this.selectedState = '';

                // If no country is selected, return.
                if (!country) return;

                try {
                    const response = await fetch("https://countriesnow.space/api/v0.1/countries/states", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({ "country": country })
                    });

                    const data = await response.json();

                    if (response.ok) {
                        this.states = data.data.states.map((state: any) => state.name).sort();
                        if (country === 'Australia') this.selectedState = 'Victoria';
                    } else {
                        throw new Error("Failed to fetch states");
                    }

                } catch (error) {
                    console.error(`Error fetching states for ${country}:`, error);
                    this.states = [];
                }
            },

            // Clear the form
            clear() {
                this.firstName = '';
                this.lastName = '';
                this.selectedCountry = '',
                this.selectedState = '',
                this.email = '';
                this.password = '';
                this.confirmPassword = '';
            },

            // Submit the form
            async submit(event: Event): Promise<void> {
                event.preventDefault();

                const { valid } = await (this.$refs.form as any).validate();

                if (!valid) {
                    return;
                }

                const apiUrl = `${Server}/post/signup`;
                const payload = {
                    firstName: this.firstName,
                    lastName: this.lastName,
                    email: this.email,
                    password: this.password,
                    country: this.selectedCountry,
                    state: this.selectedState
                };

                try {
                    const response = await fetch(apiUrl, {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify(payload),
                    });

                    if (response.status === 200) {
                        const data = await response.json();
                        this.sessionStore.login({
                            userId: data.userId
                        });
                        this.snackbar.showSnackbar('Account created successfully!');
                        this.goTo('home');

                    } else {
                        this.snackbar.showSnackbar('Failed to create account');
                    }

                } catch (error) {
                    this.snackbar.showSnackbar('Failed to create account')
                }
            },

            doesConfirmPasswordMatch(): boolean {
                return this.password === this.confirmPassword;
            }
        },

        // Fetch countries when the component is mounted
        mounted() {
            this.fetchCountries();
            this.fetchStates(this.selectedCountry);
            this.selectedState = 'Victoria';
        }
    });
</script>

<style scoped>
</style>
