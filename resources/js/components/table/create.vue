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
                                ادخال بيانات الطاولة
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
                                        >رقم الطاولة</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon1"
                                    aria-label="رقم الطاولة"
                                    class="form-control"
                                    v-model="form.table_no"
                                    placeholder="رقم الطاولة"
                                    type="text"
                                    required
                                />
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span
                                        id="basic-addon2"
                                        class="input-group-text"
                                        >الغرفة</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon2"
                                    aria-label="الغرفة"
                                    class="form-control"
                                    placeholder="الغرفة"
                                    v-model="form.room"
                                    type="text"
                                />
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span
                                        id="basic-addon2"
                                        class="input-group-text"
                                        >قيمة حجز الطاولة</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon2"
                                    aria-label="قيمة حجز الطاولة"
                                    class="form-control"
                                    placeholder="قيمة حجز الطاولة"
                                    v-model="form.mini_charge"
                                    type="text"
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
                table_no: null,
                room: null,
                mini_charge: 0.0,
            },
            errors: {},
        };
    },

    methods: {
        create() {
            axios
                .post("/api/table", this.form)
                .then(() => {
                    this.$router.push({ name: "tables" });
                    Notification.success();
                })
                .catch((error) => (this.errors = error.response.data.errors));
        },
    },
};
</script>
