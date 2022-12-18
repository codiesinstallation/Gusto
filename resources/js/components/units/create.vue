<template>
    <div>
        <div
            v-if="$root.$data.user.create_unit"
            class="row justify-content-center"
        >
            <div class="col-lg-6">
                <div class="card mb-4">
                    <form @keydown.enter.prevent
                        @submit.prevent="create"
                        enctype="multipart/form-data"
                    >
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                        >

                            <h6 class="m-0 font-weight-bold text-primary">
                                {{ __("Insert Expense Information") }}
                            </h6>
                            <button class="btn btn-primary" type="submit">
                                {{ __("Save") }}
                            </button>
                        </div>
                        <div class="card-body text-center">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span
                                        id="basic-addon1"
                                        class="input-group-text"
                                        >{{ __("Unit Name Ar") }}</span
                                    >
                                </div>
                                <input required
                                    aria-describedby="basic-addon1"
                                    class="form-control"
                                    v-model="form.unit_ar_name"
                                    type="text"
                                />
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">{{
                                        __("Unit Name En")
                                    }}</span>
                                </div>
                                <input
                                    aria-describedby="basic-addon1"
                                    class="form-control"
                                    v-model="form.unit_en_name"
                                    type="text"
                                />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <Spinner v-else :title="title" />
    </div>
</template>

<script>
import Spinner from "../spinner/mixinsSpinner";

export default {
    components: { Spinner },

    created() {
        if (!User.loggedIn()) {
            this.$router.push("/");
        }
    },
    data() {
        return {
            title: "Create Unit",
            form: {
                unit_ar_name: null,
                unit_en_name: null,
            },
            errors: {},
        };
    },

    methods: {
        onFileSelected(event) {
            let file = event.target.files[0];
            if (file.size > 1048770) {
                Notification.image_validation();
            } else {
                let reader = new FileReader();
                reader.onload = (event) => {
                    this.form.expense_icon = event.target.result;
                    console.log(event.target.result);
                };
                reader.readAsDataURL(file);
            }
        },
        create() {
            axios
                .post("/api/mainunits", this.form)
                .then(() => {
                    this.$router.push({ name: "units" });
                    Notification.success();
                })
                .catch((error) => (this.errors = error.response.data.errors));
        },
    },
};
</script>
