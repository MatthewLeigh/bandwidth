<template>
    <div class="wrapper">
        <iframe
            class="iframe"
            loading="lazy"
            :src="embedUrl"
        ></iframe>
    </div>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';

    export default defineComponent({
        name: 'MapEmbed',

        props: {
            embedUrl: {
                type: String,
                default: 'https://www.google.com/maps/d/u/0/embed?mid=1XnFb-G5D2UeK2wSUFVqxgBii8aeZ_lQ&ehbc=2E312F'
            }
        }
    });
</script>

<style scoped>

    .wrapper {
        margin-top: 24px;
        border-radius: 8px;
        overflow: hidden;
        width: 100%;
    }

    .iframe {
        width: 100%;
        height: 40vh;
        border: none;
    }

</style>












