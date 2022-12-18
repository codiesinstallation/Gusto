<template>
    <div>
        <div
            v-if="user.edit_user"
            class="row justify-content-center"
        >
            <div class="col-lg-6">
                <div class="card mb-4">
                    <form @keydown.enter.prevent @submit.prevent="update">
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                        >
                            <a
                                class="btn btn-warning text-light"
                                @click="$router.go(-1)"
                            >
                                <i
                                    :class="
                                        $root.$data.codies.default_lang == 'ar'
                                            ? 'fa fa-arrow-right'
                                            : 'fa fa-arrow-left'
                                    "
                                ></i>
                            </a>
                            <h6 class="m-0 font-weight-bold text-primary">
                                تحديث بيانات المستخدم
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
                                        >اسم المستخدم</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon1"
                                    aria-label="اسم المستخدم"
                                    class="form-control"
                                    v-model="form.name"
                                    placeholder="اسم المستخدم"
                                    type="text"
                                    required
                                />
                            </div>

                            <div class="input-group mb-3" v-if="user.is_admin">
                                <div class="input-group-append">
                                    <span class="input-group-text"
                                        >كلمة المرور
                                    </span>
                                </div>
                                <input
                                    aria-describedby="basic-addon2"
                                    aria-label="كلمة المرور "
                                    class="form-control"
                                    placeholder="كلمة المرور "
                                    v-model="form.newpassword"
                                    type="text"
                                />
                            </div>
                            <div class="input-group mb-3">
                                <div class="custom-control custom-switch">
                                    <input
                                        type="checkbox"
                                        class="custom-control-input"
                                        id="bill_type"
                                        v-model="form.is_admin"
                                    />
                                    <label
                                        class="custom-control-label"
                                        for="bill_type"
                                        >مستخدم مدير</label
                                    >
                                </div>
                            </div>
                             <div class="input-group mb-3 ">
                               <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        الباركود
                                        <button
                                            type="button"
                                            class="btn"
                                            @click="generateBarcode"
                                        >
                                            <i class="fa fa-sync"></i></button
                                    ></span>
                                </div>
                                <input
                                    aria-describedby="basic-addon2"
                                    class="form-control"
                                    v-model="form.pin_code"
                                    type="text"
                                />
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span
                                        id="basic-addon2"
                                        class="input-group-text"
                                        >هاتف المستخدم</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon2"
                                    aria-label="هاتف المستخدم"
                                    class="form-control"
                                    placeholder="هاتف المستخدم"
                                    v-model="form.mobile"
                                    type="text"
                                />
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text"
                                        >راتب المستخدم</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon2"
                                    aria-label="راتب المستخدم"
                                    class="form-control"
                                    placeholder="راتب المستخدم"
                                    v-model="form.salary"
                                    type="text"
                                />
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        الوظيفة
                                    </span>
                                </div>
                                <input
                                    aria-describedby="basic-addon2"
                                    aria-label="الوظيفة "
                                    class="form-control"
                                    placeholder="الوظيفة "
                                    v-model="form.jop_title"
                                    type="text"
                                />
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text"
                                        >عدد ساعات العمل</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon2"
                                    aria-label="عدد ساعات العمل "
                                    class="form-control"
                                    placeholder="عدد ساعات العمل "
                                    v-model="form.work_hour_count"
                                    type="text"
                                />
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        سعر ساعة العمل</span
                                    >
                                </div>
                                <input
                                    aria-describedby="basic-addon2"
                                    aria-label="سعر ساعة العمل "
                                    class="form-control"
                                    placeholder="سعر ساعة العمل "
                                    v-model="form.hour_price"
                                    type="text"
                                />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <Security v-else></Security>
    </div>
</template>

<script type="text/javascript">
import Security from "../spinner/security";
import Spinner from "../spinner/mixinsSpinner";

export default {
    components: { Security, Spinner },

   async  created() {
        if (!User.loggedIn()) {
            Notification.navigationAlert();
            this.$router.push({ name: "/" });
        }
         await axios
            .get("/api/users/" + localStorage.getItem("user_id"))
            .then(({ data }) => (this.user = data))
            .catch((error) => console.log(error));
        let id = this.$route.params.id;
        axios
            .get("/api/users/" + id)
            .then(({ data }) => (this.form = data))
            .catch((err) => console.log(err));
    },

    data() {
        return {
            user:{},
            form: {
                name: "",
                mobile: "",
                work_hour_count: 8,
                newpassword: "",
                hour_price: 0,
                jop_title: "",
                salary: 0,
                email: "",
                is_user: false,
                is_admin:true,
                                pin_code:"",

            },

            errors: {},
        };
    },

    methods: {
         generateBarcode() {
            this.form.pin_code = "";
            var val1 = Math.floor(1000000 + Math.random() * 999);
            this.form.pin_code = 1 + this.form.id + val1;
        },
        update() {
            let id = this.$route.params.id;
            axios
                .patch("/api/users/" + id, this.form)
                .then(() => {
                    this.$router.push({ name: "users" });
                    Notification.success();
                })
                .catch((error) => {
                    this.errors = error.response.data.errors;
                })
                .then((e) => {
                    if (this.errors.name)
                        Notification.customMsg(
                            "error",
                            "topRight",
                            this.errors.name[0]
                        );
                    if (this.errors.email)
                        Notification.customMsg(
                            "error",
                            "topRight",
                            this.errors.email[0]
                        );
                });
        },
    },
};
</script>

<style type="text/css"></style>
