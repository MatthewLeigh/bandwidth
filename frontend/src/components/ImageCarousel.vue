<template>
    <div class="wrapper">
        <v-container
            class="d-flex justify-center align-center container"
            fluid
            no-gutters
            width="100%"
            style="background-color: var(--c-bg-secondary)"
        >

            <!-- Loading -->
            <v-progress-circular
                v-if="isLoading"
                indeterminate
                color="primary"
                class="my-5 mx-auto"
            />

            <!-- Error -->
            <v-alert
                v-else-if="isError"
                class="mx-5"
                dense
                outlined
                color="error"
                icon="mdi-alert"
                width="100%"
                max-width="600"
            >
                <p><strong>There was an error loading some banners.</strong></p>
                <p>Please try again later.</p>
            </v-alert>

            <!-- Loaded -->
            <v-carousel
                v-else
                width="100%"
                height="100%"
                hide-delimiter-background
                :show-arrows="ImageDetails.length <= 1 ? false : 'hover'"
            >
                <v-carousel-item
                    v-for="(image, index) in ImageDetails"
                    :key="index"
                >
                    <v-sheet
                        class="fill-height d-flex align-center justify-center"
                        style="background-color: var(--c-bg-secondary)"
                    >
                        <div
                            class="blur"
                            :style="{
                                backgroundImage: 'url(' + image.imgUrl + ')',
                                backgroundSize: 'cover',
                                backgroundPosition: 'center center'
                            }">
                        </div>
                        <v-img
                            :src="image.imgUrl"
                            alt="carousel image"
                            elevation="20"
                        ></v-img>
                    </v-sheet>
                </v-carousel-item>
            </v-carousel>

        </v-container>
    </div>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { Focus } from '@/models/Focus';
    import { ImageDetails } from '@/models/ImageDetails';
    import { Server } from '@/config/Server';

    export default defineComponent({
        name: 'ImageCarousel',

        props: {
            focusArray: {
                type: Array as () => Focus[],
                required: true
            }
        },

        data() {
            return {
                ImageDetails: [] as ImageDetails[],
                isLoading: true,
                isError: false
            };
        },

        async mounted() {
            try {

                // Delay until props are loaded
                while (this.$props.focusArray.length === 0) {
                    await new Promise((resolve) => setTimeout(resolve, 10));
                }

                // For each focus, fetch image URLs
                for (const focus of this.$props.focusArray) {

                    try {
                        let response = await fetch(`${Server}/single-${focus.type}-image-urls/${focus.id}`);
                        const data = await response.json();

                        // Validate each image URL
                        for (const url of data.urls) {
                            await this.validateImageUrl(url, focus);
                        }

                    } catch (error) {
                        console.error(`Error fetching images for ${focus.type} with ID ${focus.id}:`, error);
                    }
                }

            } catch (error) {
                console.error('Error fetching data:', error);
                this.isError = true;

            } finally {
                this.isLoading = false;
            }
        },

        methods: {

            // Validate image URL returns an image
            async validateImageUrl(url: string, focus: Focus) {

                return new Promise<void>((resolve) => {

                    // Create image element
                    const img = new Image();
                    img.src = url;

                    // On load, add to ImageDetails
                    img.onload = () => {
                        this.ImageDetails.push(new ImageDetails(url, focus));
                        resolve();
                    };

                    // On error, skip image
                    img.onerror = () => {
                        resolve();
                    };
                });
            }
        }
    });
</script>

<style scoped>

    .wrapper {
        margin-top: 24px;
        padding: 0;
    }

    .container {
        padding: 0;
        height: 60vh;
        max-height: 600px;
    }

    .blur {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        filter: blur(16px);
        z-index: 1;
        scale: 1.1;
    }

    .v-img {
        z-index: 2;
    }

    @media (max-width: 722px) {
        .wrapper {
            margin-top: 0;
        }

    }

</style>
