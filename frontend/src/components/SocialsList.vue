<template>
    <div
        v-if="socials.length > 0 && !isError"
        class="wrapper"
    >
        <!-- Divider Bar -->
        <DividerBar text="Socials"/>

        <!-- Socials -->
        <v-row class="mt-4">

            <!-- Card Wrapper-->
            <v-col
                v-for="(social, index) in socials"
                :key="index"
                class="card-wrapper"
                cols="12"
                md="6"
            >

                <!-- Card -->
                <v-card
                    class="card"
                    flat
                    :href="social.url"
                    target="_blank"
                >

                    <!-- Icon -->
                    <v-img
                        :src="platformIcons[social.platform]"
                        :alt="social.platform"
                        class="icon"
                    />

                    <!-- Text -->
                    <v-card-text>
                        <v-card-title>{{ social.handle }}</v-card-title>
                    </v-card-text>

                </v-card>
            </v-col>

        </v-row>
    </div>
</template>

<script lang="ts">
    import { defineComponent } from "vue";
    import { Focus } from "@/models/Focus";
    import { Server } from "@/config/Server";
    import { SocialsDetail, SocialPlatform, platformIcons } from "@/models/SocialsDetail";

    import DividerBar from "./DividerBar.vue";

    export default defineComponent({
        name: "SocialsList",

        components: {
            DividerBar,
        },

        props: {
            focus: {
                type: Object as () => Focus,
                required: true,
            },
        },

        data() {
            return {
                socials: [] as SocialsDetail[],
                platformIcons,
                isLoading: true,
                isError: false,
            };
        },

        async mounted() {
            try {
                const response = await fetch(`${Server}/${this.focus.type}-socials/${this.focus.id}`);
                const data = await response.json();

                this.socials = data.map(
                    (item: { Platform: string; Handle: string; URL: string }) => {
                        const platform = SocialPlatform[item.Platform as keyof typeof SocialPlatform];
                        return new SocialsDetail(platform, item.Handle, item.URL);
                    }
                );

            } catch (error) {
                console.error("Error fetching socials:", error);
                this.isError = true;

            } finally {
                this.isLoading = false;
            }

        }
    });
</script>

<style scoped>

    .wrapper {
        margin-top: 60px;
    }

    .card-wrapper {
        padding: 0;
        margin: 0;
    }

    .card {
        margin: 0;
        padding: 0 8px;
        border-radius: 8px;
    }

    .icon {
        display: inline-block;
        width: 24px;
        aspect-ratio: 1;
    }

    .v-card-text {
        display: inline-block;
        flex: 1;
    }

    .v-card-title {
        font-size: 14px;
        padding: 0;
        margin: 0;
    }

</style>
