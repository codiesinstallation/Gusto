<template>
    <div>
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card mb-4">
                    <form @keydown.enter.prevent @submit.prevent="create">
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                        >
                            <h6 class="m-0 font-weight-bold text-primary">
                                ادخال بيانات المخزون
                            </h6>
                            <button class="btn btn-primary" type="submit">
                                حفظ
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span
                                        id="basic-addon1"
                                        class="input-group-text"
                                        >الاسم</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon1"
                                    aria-label="الاسم"
                                    class="form-control"
                                    v-model="form.title"
                                    placeholder="الاسم"
                                    type="text"
                                    required
                                />
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span
                                        id="basic-addon2"
                                        class="input-group-text"
                                        >المخزون</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon2"
                                    aria-label="المخزون"
                                    class="form-control"
                                    placeholder="المخزون"
                                    v-model="form.stock"
                                    type="text"
                                    required
                                />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    created() {
        if (!User.loggedIn()) {
            this.$router.push("/");
        }
    },
    data() {
        return {
            form: {
                title: null,
                stock: null,
            },
            errors: {},
        };
    },

    methods: {
        create() {
            axios
                .post("/api/stocks", this.form)
                .then(() => {
                    this.$router.push({ name: "stocks" });
                    Notification.success();
                })
                .catch((error) => (this.errors = error.response.data.errors))
                .catch((error) => {
                    this.errors = error.response.data.errors;
                })
                .then((e) => {
                    if (this.errors.title)
                        Notification.customMsg(
                            "error",
                            "topRight",
                            this.errors.title[0]
                        );
                    if (this.errors.stock)
                        Notification.customMsg(
                            "error",
                            "topRight",
                            this.errors.stock[0]
                        );
                });
        },
    },
};
</script>
