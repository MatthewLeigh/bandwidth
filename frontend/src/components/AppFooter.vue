<template>
    <footer class="wrapper">
        <v-container>

            <!-- Upper section -->
            <v-row>

                <!-- Development Credits -->
                <v-col class="development" cols="12" sm="9" md="3" order-md="3">
                    <div @click="goTo('home')">
                        <h2 class="footer-app-title"> Bandwidth</h2>
                        <h3 class="footer-app-subtitle">Melbourne Gig Guide</h3>
                    </div>
                    <p class="developers">
                        <strong>Designed and Developed By</strong>
                        <br>Matthew Cross
                    </p>
                    <div class="icons-wrapper upper-icons" v-if="!mdAndUp">
                        <v-icon
                        v-for="(icon, index) in icons"
                        :key="index"
                        :icon="icon.icon"
                        @click="openUrl(icon.url)"
                    />
                    </div>

                    <div class="small-text">
                        <p>
                            Website developed as a student project to demonstrate responsive web
                            development design and technologies.
                        </p>
                        <p>
                            Work completed at Swinburne University of Technology, Online, for unit
                            COS30043 Interface Design and Development.
                        </p>
                    </div>
                </v-col>

                <!-- Site Map -->
                <v-col class="links" cols="12" sm="3" md="2">
                    <h4 class="footer-title">Site Map</h4>

                    <!-- Main Cards -->
                    <v-card
                        v-for="route in routes"
                        :key="route.name"
                        @click="goTo(route.name)"
                        class="link"
                        flat
                    >
                        {{ route.label }}
                    </v-card>

                    <!-- Profile -->
                    <v-card
                        v-if="user"
                        @click="goTo('user')"
                        class="link"
                        flat
                    >
                        Profile
                    </v-card>

                    <!-- Login and Sign Up -->
                    <v-card
                        v-else
                        @click="goTo('login')"
                        class="link"
                        flat
                    >
                        Login / Sign Up
                    </v-card>
                </v-col>

                <!-- FAQs -->
                <v-col class="faqs pr-md-10" cols="12" md="7" >
                    <h4 class="footer-title">FAQs</h4>
                    <v-expansion-panels variant="accordion" density="compact">
                        <v-expansion-panel
                            v-for="(faq, index) in faqs"
                            :key="index"
                            :title="faq.title"
                            :text="faq.text"
                            elevation="0"
                            class="small-text"
                        ></v-expansion-panel>
                    </v-expansion-panels>
                </v-col>

            </v-row>

            <!-- Lower section with copyright -->
            <div class="bottom-row">

                <div class="copyright">
                    <p>&copy; {{ getCurrentYear() }} Matthew Cross. All rights reserved.</p>
                </div>

                <div class="icons-wrapper" v-if="mdAndUp">
                    <v-icon
                        v-for="(icon, index) in icons"
                        :key="index"
                        :icon="icon.icon"
                        @click="openUrl(icon.url)"
                    />
                </div>

            </div>

        </v-container>
    </footer>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { useNavigation } from '@/composables/useNavigation';
    import { useDisplay } from 'vuetify';
    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';

    export default defineComponent({
        name: 'AppFooter',

        setup() {
            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);

            const { goTo } = useNavigation();
            const routes = [
                { name: 'home', label: 'Home'},
                { name: 'event', label: 'Events' },
                { name: 'artist', label: 'Artists' },
                { name: 'venue', label: 'Venues' },
                { name: 'about', label: 'About' }
            ];
            const { mdAndUp } = useDisplay();

            return { sessionStore, user, goTo, routes, mdAndUp };
        },

        data() {
            return {
                icons: [
                    { icon: 'mdi-github', url: 'https://www.google.com/' }, // TODO: Make repo public
                    { icon: 'mdi-linkedin', url: 'https://www.google.com/' },
                    { icon: 'mdi-google-plus', url: 'https://www.google.com/' }
                ],
                faqs: [
                    { title: 'What is Bandwidth?', text: 'Bandwidth is a Melbourne Gig Guide website.' },
                    { title: 'How do I use Bandwidth?', text: 'You can use Bandwidth to find events, artists, and venues in Melbourne.' },
                    { title: 'How do you decide which Artists to include?', text: 'Artists are added to our database when they are first identified as performing a gig at a venue in Melbourne. If your favourite artist isn\'t on the site, tell them to get their butts to Melbourne asap!' }
                ]
            }
        },


        methods: {
            getCurrentYear() : number {
                return new Date().getFullYear();
            },

            openUrl(url: string) {
                window.open(url, '_blank');
            }
        }


    });
</script>

<style scoped>

    * {
        font-family: 'Poppins-Thin', sans-serif;
        background-color: transparent;
        color: white;
    }

    .footer-app-title {
        font-family: 'Poppins-Bold', sans-serif;
        font-size: 2rem;
        margin-top: 32px;
        cursor: pointer;
    }

    .footer-app-subtitle {
        font-size: .8rem;
        margin-bottom: 24px;
        transform: translateY(-10px) translateX(1px);
        font-weight: 300;
        cursor: pointer;
    }

    .footer-title {
        font-family: 'Poppins-ExtraLight', sans-serif;
        margin: 32px 0;
    }

    .clickable {
        color: white;
    }

    .clickable::after {
        background-color: white;
    }

    .wrapper {
        width: 100%;
        background-color: var(--c-bg-footer);
        color: white;
    }

    .links {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        text-align: left;
    }

    .link {
        padding: 8px 16px;
        width: 100%;
        transform: translateX(-16px) translateY(-8px);
    }

    .small-text {
        margin-top: 32px;
        font-size: .8rem;
        display: flex;
        flex-direction: column;
        gap: .4rem;

    }

    .v-expansion-panel {
        transform: translateY(-12px);
    }

    :deep(.v-expansion-panel) {
        margin: 0 !important;
    }

    :deep(.v-expansion-panel-title) {
        min-height: 40px !important;
        height: 40px !important;
        align-items: center !important;
        border-radius: 4px !important;
        background-color: transparent !important;
        position: relative;
        overflow: hidden;
    }

    :deep(.v-expansion-panel-title)::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 4px;
        right: 4px;
        height: 1px;
        background-color: lightgray;
    }


    :deep(.v-expansion-panel-title__overlay) {
        min-height: 40px !important;
        height: 40px !important;

    }

    :deep(.v-expansion-panel) {
        padding: 0 !important;
        margin: 0 !important;
    }

    .v-icon {
        cursor: pointer;
    }

    .bottom-row {
        border-top: 1px solid gray;
        text-align: center;
        padding: 32px 0 16px 0;
        margin-top: 48px;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }

    .bottom-row > :only-child {
        margin-left: auto;
        margin-right: auto;
    }

    .icons-wrapper {
        display: flex;
        flex-direction: row;
        gap: 8px;
    }

    .upper-icons {
        margin-top: 24px;
    }


    @media (max-width: 722px) {

        .wrapper {
            margin-top: 60px;
        }
        .bottom-row {
            margin-top: 12px;
            padding-bottom: 100px;
        }
    }

</style>
