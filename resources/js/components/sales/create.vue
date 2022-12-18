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
                                ادخال بيانات العامل
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
                                        >نوع المبيعات</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon1"
                                    aria-label="نوع المبيعات"
                                    class="form-control"
                                    v-model="form.sill_type_name"
                                    placeholder="نوع المبيعات"
                                    type="text" required
                                />
                            </div>
<div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span
                                        id="basic-addon1"
                                        class="input-group-text"
                                        >خصم المبيعات</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon1"
                                    aria-label="خصم المبيعات"
                                    class="form-control"
                                    v-model="form.sill_type_discount"
                                    placeholder="خصم المبيعات"
                                    type="text" required
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
    async created() {
        if (!User.loggedIn()) {
            this.$router.push("/");
        }
        await this.generateBarcode();
    },
    data() {
        return {
            form: {
                sill_type_discount: "",
                sill_type_name: "",

            },
            errors: {},
        };
    },

    methods: {

        create() {
            axios
                .post("/api/saleType", this.form)
                .then(() => {
                    this.$router.push({ name: "sales" });
                    Notification.success();
                })
                .catch((error) => (this.errors = error.response.data.errors));
        },
    },
};
</script>
