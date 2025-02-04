import { defineStore } from 'pinia';
import { ref } from 'vue';

export const useSnackbarStore = defineStore('snackbar', () => {
    const visible = ref(false);
    const message = ref('');
    const timeout = ref(0);
    let timeoutId: number | null = null;

    function showSnackbar(msg: string, duration = 3000) {
        if (timeoutId) {
            clearTimeout(timeoutId);
        }

        message.value = msg;
        visible.value = true;
        timeout.value = duration;

        timeoutId = setTimeout(() => {
            visible.value = false;
            timeoutId = null;
        }, timeout.value);
    }

    return { visible, message, showSnackbar };
});
