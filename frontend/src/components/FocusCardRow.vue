<template>
    <div class="card-row-wrapper">
        <template v-for="focus in focusList" :key="focus.id">
            <FocusCard :focus="focus" />
        </template>
    </div>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { Focus } from '@/models/Focus';
    import FocusCard from '@/components/FocusCard.vue';

    export default defineComponent({
        name: 'FocusCardRow',

        components: {
            FocusCard
        },

        props: {
            focusList: {
                type: Array as () => Focus[],
                required: true
            }
        }

    })
</script>

<style scoped>
    .card-row-wrapper {
        display: flex;
        justify-content: flex-start;
        align-items: flex-start;
        gap: 20px;
        margin-top: 24px;
        padding-bottom: 10px;
        overflow-y: hidden;
        overflow-x: auto;
        scroll-snap-type: x mandatory;

    }

    .card-row-wrapper::-webkit-scrollbar {
        height: 12px;
    }

    .card-row-wrapper::-webkit-scrollbar-thumb {
        background-color: #bbb;
        border-radius: 16px;
    }

    .card-row-wrapper::-webkit-scrollbar-track {
        background-color: #f0f0f0;
        border-radius: 16px;
    }

    .card-row-wrapper:hover::-webkit-scrollbar-thumb {
        background-color: #888;
    }

    @media (max-width: 722px) {

        .card-row-wrapper > * {
            flex: 1 0 100%;
            scroll-snap-align: start;
        }

    }
</style>