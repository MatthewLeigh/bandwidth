<template>
        <v-card
        class="card"
        elevation="0"
    >
        <div class="img-wrapper">

            <!-- Skeleton loader has a height of 200px which is hard to change.
                 Stacking two loaders and hiding the overflow is easier.  -->

            <v-skeleton-loader type="image" class="img" />
            <v-skeleton-loader type="image" class="img" />
        </div>
        <div class="text-wrapper">
            <div class="upper-row-wrapper">
                <v-skeleton-loader type="text" class="upper-row-left" />
                <v-skeleton-loader type="text" class="upper-row-right" />
            </div>
            <v-skeleton-loader type="text" class="title" />
            <v-skeleton-loader type="text" class="subtitle" />
        </div>
    </v-card>
</template>

<script>
export default {
    name: 'FocusCardSkeleton',
}
</script>

<style scoped>

.card {
    cursor: pointer;
    padding: 0;
    width: 100%;
    min-width: 320px;
    border-radius: 0;
    height: 273px;
    overflow: hidden;
}

.img-wrapper {
    border-radius: 8px;
    overflow: hidden;
    height: 200px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    z-index: 2;
}

.v-skeleton-loader {
    width: 100%;
    height: 100%;
    display: block;
    margin: 0;
    padding: 0;
}

.img {
    border-radius: 0;
    z-index: 1;
}

.text-wrapper {
    overflow: hidden;
    transform: scale(1.1);
    padding: 0 2px;
}

.upper-row-wrapper {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    margin-top: -2px;
}

.upper-row-right {
    width: 25%;
    transform-origin: right center;

}

.upper-row-left {
    width: 50%;
    transform-origin: left center;

}

.title {
    width: 60%;
    transform: scale(1.4) translateY(-14px) translateX(-4px);
    transform-origin: left center;

}

.subtitle {
    transform: scale(0.8) translateY(-38px) translateX(6px);
    width: 60%;
    transform-origin: left center;

}

</style>