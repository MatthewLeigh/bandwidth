import { defineStore } from "pinia";

export const useSelectedDatesStore = defineStore("selectedDatesStore", {

    state: () => ({
        selectedDates: JSON.parse(localStorage.getItem("selectedDates") || "[]") as string[],
    }),

    actions: {

        selectDate(date: string) {
            if (!this.selectedDates.includes(date)) {
                this.selectedDates.push(date);
                this.sortDates();
                this.saveDates();
            }
        },

        unselectDate(date: string) {
            this.selectedDates = this.selectedDates.filter((d) => d !== date);
            this.sortDates();
            this.saveDates();
        },

        clearDates() {
            this.selectedDates = [];
            this.saveDates();
        },

        saveDates() {
            localStorage.setItem("selectedDates", JSON.stringify(this.selectedDates));
        },

        sortDates() {
            this.selectedDates.sort();
        },

    },

});
