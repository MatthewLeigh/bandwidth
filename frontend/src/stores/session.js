import { defineStore } from "pinia";

export const useSessionStore = defineStore("session", {

    state: () => ({
        user: JSON.parse(sessionStorage.getItem("user")) || null,
    }),

    actions: {

        login(user) {
            this.user = user;
            sessionStorage.setItem("user", JSON.stringify(user));
        },

        logout() {
            this.user = null;
            sessionStorage.setItem("user", null);
        }
    },

    getters: {
        isAuthenticated: (state) => !!state.user,
        getUser: (state) => state.user,
    }
});
