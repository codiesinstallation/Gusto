<template></template>
<script>
import AppStorage from "../../Helpers/AppStorage";

export default {
    async created() {
        if (!User.loggedIn()) {
            this.$router.push({ name: "/" });
        }

        if (User.hasToken()) {
            await AppStorage.clear();
            // location.reload(true);
            await this.$router.push("/");
        }
    },
};
</script>
