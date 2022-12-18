<template>
    <!-- <div class="loadPage">
        <p>{{ __("Loading") }} {{ __(title) }}</p>
    </div> -->
</template>

<script>
export default {
    props: ["title"],
    name: "Spinner",
};
</script>

<style scoped>
body {
    background: darkmagenta !important;
}
p {
    position: absolute;
    top: calc(50% - 26px);
    left: 50%;
    transform: translateX(-50%);
    font-family: arial, sans-serif;
}
</style>
