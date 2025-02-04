<template>

    <div
        v-if="!isError && !isLoading && embeds.length > 0"
        class="wrapper"
    >

        <!-- Divider Bar -->
        <DividerBar text="Check them out"/>

        <!-- Embeds Wrapper -->
        <v-row>

            <!-- Embed -->
            <v-col v-for="(embed, index) in embeds" :key="index" cols="12" lg="6" class="mt-4">
                <iframe
                    class="iframe"
                    :src="embed"
                    frameborder="0"
                    allow="accelerometer; clipboard-write; encrypted-media; picture-in-picture; gyroscope; web-share"
                    referrerpolicy="strict-origin-when-cross-origin"
                    loading="lazy"
                ></iframe>
            </v-col>

        </v-row>
    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { Server } from '@/config/Server';
import DividerBar from './DividerBar.vue';

export default defineComponent({
    name: 'ArtistEmbeds',

    components: {
        DividerBar
    },

    props: {
        focusId: {
            type: Number,
            required: true
        }
    },

    data() {
        return {
            embeds: [] as string[],

            isLoading: true,
            isError: false
        }
    },

    async mounted() {
        try {
            const response = await fetch(`${Server}/artist-embeds/${this.focusId}`);
            const data = await response.json();

            this.embeds = [
                data[0].SpotifyEmbed,
                data[0].YouTubeEmbed
            ];

        } catch (error) {
            console.error(error);
            this.isError = true;

        } finally {
            this.isLoading = false;
        }
    }
});
</script>

<style scoped>
    .wrapper {
        width: 100%;
        margin-top: 60px;
    }

    .iframe {
        width: 100%;
        aspect-ratio: 3 / 2;
        border: none;
        border-radius: 8px;
    }

    @media (max-width: 722px) {

        .iframe {
            height: 40vh;
            aspect-ratio: none;
        }

    }
</style>
