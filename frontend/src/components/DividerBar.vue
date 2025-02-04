<template>
    <div id="wrapper">

        <!-- Route and Text provided -->
        <h3
            v-if="route && text"
            @click="goTo(route, undefined, $event)"
            style="cursor: pointer"
        >
            <span>{{ text }}</span>
            <span class="arrow">&nbsp;></span>
        </h3>

        <!-- Text Provided -->
        <h3 v-else-if="text">{{ text }}</h3>

        <!-- No Text Provided -->
        <div class="bar"></div>
    </div>
</template>

<script>
export default {
    name: 'DividerBar',
    props: {
        text: {
            type: String,
            required: false,
            default: null
        },
        route: {
            type: String,
            required: false,
            default: null
        },
    },
    methods: {
        goTo(route) {
            this.$router.push({ name: route });
            window.scrollTo({
                top: 0,
                behavior: 'smooth',
            });
        }
    }
};
</script>

<style scoped>
    #wrapper {
        display: flex;
        justify-content: space-between;
        align-items: center;
        justify-content: center;
        width: 100%;
    }

    h3 {
        font-family: 'Poppins', sans-serif;
        font-size: 16px;
        font-weight: 500;
        margin: 0 24px 0 0;
    }

    .arrow {
        transition: all 0.2s ease-in-out;
        display: inline-block
    }

    h3:hover .arrow {
        transform: translateX(6px);
    }

    .bar {
        flex-grow: 1;
        height: 1px;
        background-color: var(--c-border);
    }

    a {
        color: #000;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
