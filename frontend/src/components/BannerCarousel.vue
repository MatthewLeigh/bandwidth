<template>
    <div class="wrapper">

        <!-- Loading -->
        <v-container
            v-if="isLoading"
            class="d-flex justify-center align-center"
            fluid
            width="100%"
            :style="{
                aspectRatio: aspectRatio,
                maxHeight: maxHeight,
                backgroundColor: backgroundColor
            }"
        >
            <v-progress-circular
                indeterminate
                color="primary"
                class="my-5 mx-auto"
            />
        </v-container>

        <!-- Error -->
        <v-container
            v-else-if="isError"
            class="d-flex justify-center align-center"
            fluid
            width="100%"
            :style="{
                aspectRatio: aspectRatio,
                maxHeight: maxHeight,
                backgroundColor: backgroundColor
            }"
        >
            <v-alert
                class="mx-5"
                dense
                outlined
                color="error"
                icon="mdi-alert"
                width="100%"
                max-width="600"
            >
                <p><strong>There was an error loading the banners.</strong></p>
                <p>Please try again later.</p>
            </v-alert>
        </v-container>

        <!-- Loaded -->
        <v-carousel
            v-else
            class="carousel"
            hide-delimiters
            show-arrows="hover"
            width="100%"
            height="auto"
            cycle
            :interval="10000"
            :style="{
                        aspectRatio: aspectRatio,
                        maxHeight: maxHeight
                    }"
        >
            <v-carousel-item
                v-for="(banner, index) in banners"
                :key="index"
                @click="goTo(banner.focus.type, banner.focus.id, $event)"
            >
                <div
                    class="img-wrapper"
                    :style="{
                        aspectRatio: aspectRatio,
                        maxHeight: maxHeight
                    }"
                >
                    <img
                        :src="banner.imgUrl"
                        :alt="'Things to do in Melbourne' + banner.focus.type"
                    />
                </div>
            </v-carousel-item>
        </v-carousel>

    </div>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { useNavigation } from '@/composables/useNavigation';
    import { ImageDetails } from '@/models/ImageDetails';
    import { Focus } from '@/models/Focus';
    import { Server } from '@/config/Server';

    export default defineComponent({
        name: 'BannerCarousel',

        setup() {
            const { goTo } = useNavigation();
            return { goTo };
        },

        data() {
            return {
                banners: [] as ImageDetails[],
                aspectRatio: '21 / 7',
                maxHeight: '60vh',
                backgroundColor: 'rgba(0, 0, 0, 0.1)',

                isLoading: true,
                isError: false
            };
        },

        async mounted() {

            try {
                const response = await fetch(`${Server}/all-banner-details`);
                const data = await response.json();

                this.banners = data.map((item: any) => new ImageDetails(
                    item.ImageURL,
                    new Focus(item.FocusId, item.FocusType)
                ));

            } catch (error) {
                console.error('Error fetching data:', error);
                this.isError = true;

            } finally {
                this.isLoading = false;
            }

        },
    });
</script>

<style scoped>

    .img-wrapper {
        width: 100%;
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    img {
        min-width: 100%;
        min-height: 100%;
        cursor: pointer;
    }

</style>