<template>

    <!-- Valid URL -->
    <div
        v-if="isValidUrl"
        class="wrapper"
    >
        <v-img
            :src="banner.imgUrl"
            @click="goTo(banner.focus.type, banner.focus.id, $event)"
        />
    </div>

</template>

<script lang="ts">
    import { defineComponent } from 'vue'
    import { useNavigation } from '@/composables/useNavigation';
    import { ImageDetails } from '@/models/ImageDetails';
    import { Focus } from '@/models/Focus';
    import { Server } from '@/config/Server';

    export default defineComponent({
        name: 'RandomBanner',

        setup() {
            const { goTo } = useNavigation();
            return { goTo };
        },

        data() {
            return {
                banner: {} as ImageDetails,
                isValidUrl: true
            }
        },

        methods: {

             // Validate image URL returns an image
             async validateImageUrl(url: string) {

                return new Promise<void>((resolve) => {

                    // Create image element
                    const img = new Image();
                    img.src = url;

                    // On load, add to ImageDetails
                    img.onload = () => {
                        this.isValidUrl = true;
                        resolve();
                    };

                    // On error, skip image
                    img.onerror = () => {
                        this.isValidUrl = false;
                        resolve();
                    };
                });
             }
        },

        async mounted() {
            try {
                const response = await fetch(`${Server}/random-banner-details`);
                const data = await response.json();
                const flatData = data[0];

                this.banner.imgUrl = flatData.ImgUrl;
                this.banner.focus = new Focus(flatData.FocusId, flatData.FocusType);

                // Validate image URL
                await this.validateImageUrl(this.banner.imgUrl);

            } catch (error) {
                console.warn(error);

            }
        }

    });
</script>

<style scoped>

    .wrapper {
        width: 100%;
        margin: 120px 0;
        cursor: pointer;
    }

    @media (max-width: 1200px) {
        .wrapper {
            margin: 60px 0;
        }
    }

    @media (max-width: 722px) {
        .wrapper {
            display: none;
        }
    }

</style>