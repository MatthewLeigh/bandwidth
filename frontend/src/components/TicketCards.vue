<template>
    <div class="wrapper">

        <!-- Error or No Data-->
        <p v-if="isError || !isLoading && ticketPrices.length === 0">
            Ticket price unknown.
        </p>

        <!-- Loaded -->
        <p v-else class="card-wrapper">
            <span
                v-for="(ticketPrice, index) in ticketPrices"
                :key="index"
            >
                <span class="spacer" v-if="index !== 0">|</span>
                <a
                    class="card clickable"
                    :href="ticketSaleUrl"
                    target="_blank"
                >
                    <span class="type">{{ ticketPrice.ticketType }}</span>
                    <span class="colon">: </span>
                    <span class="price">{{ formatPrice(ticketPrice.price) }}</span>
                </a>
            </span>
        </p>

    </div>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { Server } from '@/config/Server';
    import { TicketPrice } from '@/models/TicketPrice';

    export default defineComponent({
        name: 'TicketCards',

        data: () => ({
            ticketPrices: [] as TicketPrice[],
            isLoading: true,
            isError: false
        }),

        props: {
            eventId: {
                type: Number,
                required: true
            },
            ticketSaleUrl: {
                type: String,
                required: true
            }
        },

        methods: {
            formatPrice(price: number) {
                return (price === 0) ? 'Free' : `$${price}`;
            }
        },

        async mounted() {
            try {
                const response = await fetch(`${Server}/ticket-prices-for-event/${this.eventId}`);
                const data = await response.json();
                this.ticketPrices = data.map(
                    (item: { TicketType: string; Price: string }) => ({
                        ticketType: item.TicketType,
                        price: parseFloat(item.Price)
                }));

            } catch (error) {
                console.error('Error fetching ticket prices:', error);
                this.isError = true;

            } finally {
                this.isLoading = false;
            }
        }
    });
</script>

<style scoped>

    .spacer {
        margin: 0 32px;
        color: var(--c-text-muted);
    }

    @media (max-width: 722px) {

        .spacer {
            display: none;
        }

        .card-wrapper {
            display: flex;
            flex-direction: column;
        }
    }

</style>