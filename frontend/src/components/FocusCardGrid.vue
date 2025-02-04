<template>
    <div class="card-grid-wrapper">
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
        name: 'FocusCardGrid',

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

    .card-grid-wrapper {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
        gap: 40px 20px;
        margin: 24px auto 0;
        width: 100%;
        max-width: 100%;
    }

    @media (max-width: 722px) {
        .card-grid-wrapper {
            display: flex;
            flex-direction: column;
        }
    }

</style>