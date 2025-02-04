<template>

    <!-- Snackbar -->
    <v-snackbar
        class="snackbar"
        v-model="snackbar.visible"
        :bottom="true"
        :multi-line="true"
    >
        <!-- Message -->
        {{ snackbar.message }}

        <!-- Close Button -->
        <template v-slot:actions>
            <v-btn
                icon="mdi-close-circle-outline"
                @click="snackbar.visible = false"
            />
        </template>

    </v-snackbar>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { useSnackbarStore } from '../stores/showSnackbar';
    import { VSnackbar, VBtn } from 'vuetify/components';

    export default defineComponent({
        name: 'ReusableSnackbar',

        components: {
            VSnackbar,
            VBtn,
        },

        setup() {
            const snackbar = useSnackbarStore();
            return { snackbar };
        },
    });
</script>