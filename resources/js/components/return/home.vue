<template>
    <div>
        <returnR v-if="mixins.country == 1"></returnR>

        <processR v-else></processR>
    </div>
</template>

<script>
import returnR from "./index.vue";
import processR from "./process.vue";

export default {
    components: { returnR, processR },

    async created() {
        if (!User.loggedIn()) {
            await this.$router.push("/");
        }
        await this.getMixins();
    },

    data() {
        return {
            mixins: {},
        };
    },
    methods: {
        async getMixins() {
            await axios
                .get("/api/mixins/1")
                .then(({ data }) => {
                    this.mixins = data;
                })
                .catch((error) => console.log(error));
        },
    },
};
</script>
