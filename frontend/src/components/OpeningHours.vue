<template>
    <div class="wrapper">
        <p class="day" v-for="(day, index) in days" :key="index">
            <span class="name">{{ day.name }}</span>
            <span class="ellipses"></span>
            <span class="hours">{{ day.hours }}</span>
        </p>
    </div>
</template>

<script lang="ts">
    import { defineComponent } from 'vue'
    import { Server } from '@/config/Server';

    export default defineComponent({
        name: 'OpeningHours',

        props: {
            focusId: {
                type: Number,
                required: true
            }
        },

        data() {
            return {
                days: [
                    { name: 'Monday', hours: 'unknown' },
                    { name: 'Tuesday', hours: 'unknown' },
                    { name: 'Wednesday', hours: 'unknown' },
                    { name: 'Thursday', hours: 'unknown' },
                    { name: 'Friday', hours: 'unknown' },
                    { name: 'Saturday', hours: 'unknown' },
                    { name: 'Sunday', hours: 'unknown' }
                ]
            };
        },

        methods: {

            // Time string format is 'HH:MM:SS' (24-hour clock).
            // If the opening time is 00:00:00, the venue is closed that day.
            // If the closing time is 23:59:59, the venue is open 'late' (unspecified closing time).

            formatDay(opening: string, closing: string): string {
                if (opening === '00:00:00') return 'closed';
                return `${this.formatTime(opening)} - ${this.formatTime(closing)}`;
            },

            formatTime(time: string): string {
                const [hour, minute, second] = time.split(':').map(Number);
                const hour12 = (hour % 12) || 12;
                const ampm = hour < 12 ? 'am' : 'pm';
                return second === 59 ? 'late' : `${hour12}:${minute.toString().padStart(2, '0')}${ampm}`;
            }

        },

        async mounted() {
            try {
                    const response = await fetch(`${Server}/venue-opening-hours/${this.focusId}`);
                    const data = await response.json();
                    const flatData = data[0];

                    const dayKeys = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];

                    this.days.forEach((day, index) => {
                        const openKey = `${dayKeys[index]}Open`;
                        const closeKey = `${dayKeys[index]}Close`;
                        day.hours = this.formatDay(flatData[openKey], flatData[closeKey]);
                    });

            } catch (error) {
                console.error('Error fetching data:', error);
            }
        }
    });
</script>

<style scoped>

    .wrapper {
        width: 100%;
    }

    .day {
        display: flex;
        justify-content: space-between;
        gap: 8px;
        margin: 0;
        padding: 0;
    }

    .ellipses {
        flex: 1;
        overflow: hidden;
        position: relative;
    }

    .ellipses::before {
        content: '........................................................................................................................................';
        position: absolute;
        left: 0;
    }

</style>
