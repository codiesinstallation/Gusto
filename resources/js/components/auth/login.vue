<template>
    <div>
        <!-- Login Content -->
        <div v-if="!loading" class="container-login">
            <div class="row justify-content-center">
                <div class="col-xl-6 col-lg-12 col-md-9">
                    <div class="card shadow-sm my-5">
                        <div class="card-body p-0">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="logo text-center">
                                        <img src="backend/img/Gusto.jpeg" />
                                    </div>
                                    <div class="login-form text-center">
                                        <form
                                            class="user"
                                            @submit.prevent="login"
                                        >
                                            <div class="form-group">
                                                <input
                                                    required
                                                    type="text"
                                                    class="form-control"
                                                    aria-describedby="emailHelp"
                                                    placeholder="Enter name"
                                                    v-model="form.name"
                                                />
                                                <small
                                                    class="alert alert-danger"
                                                    v-if="errors && errors.name"
                                                    >{{ errors.name[0] }}</small
                                                >
                                            </div>
                                            <div class="form-group">
                                                <input
                                                    required
                                                    type="password"
                                                    class="form-control"
                                                    placeholder="Password"
                                                    v-model="form.password"
                                                />
                                                <small
                                                    class="alert alert-danger"
                                                    v-if="
                                                        errors &&
                                                        errors.password
                                                    "
                                                    >{{
                                                        errors.password[0]
                                                    }}</small
                                                >
                                            </div>

                                            <div class="form-group">
                                                <button
                                                    type="submit"
                                                    class="btn btn-primary btn-block"
                                                >
                                                    {{ __("Login") }}
                                                </button>
                                                <router-link to="reset">
                                                    {{ __("نسيت كلمة السر؟") }}
                                                </router-link>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="text-center">
                                        <h1
                                            class="h6 text--lighten-1 alert alert-danger"
                                        >
                                            <span class="mx-2">
                                                {{ __("Support To ") }}:</span
                                            >
                                            {{
                                                $root.$data.codies
                                                    .end_support_date
                                            }}
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Login Content -->
        <Spinner v-else :title="title"></Spinner>
    </div>
</template>

<script>
import Spinner from "../spinner/mixinsSpinner";

export default {
    components: { Spinner },

    created() {
        if (User.loggedIn()) {
            this.$router.push("home");
        }
    },
    data() {
        return {
            title: "Login",
            form: {
                name: "",
                password: "",
            },
            loading: false,
            errors: {},
        };
    },
    methods: {
        async login() {
            this.loading = true;
            await axios
                .post("api/auth/login", this.form)
                .then(async (response) => {
                    User.responseAfterLogin(response);

                    if (response.data.user.is_admin !== 2) {
                        await this.$router.push({ name: "home" });
                    } else {
                        await this.$router.push({ name: "codies" });
                    }
                    await Notification.successMsg("تم تسجيل الدخول بنجاح");
                })
                .then((log) => {
                    // location.reload();
                    this.loading = false;
                    let token = localStorage.getItem("token");
                    if (token) {
                        $("nav").css("display", "");
                        $("aside").css("display", "");
                        $(".userName").text(localStorage.getItem("user"));
                    }
                })
                .catch((error) => {
                    this.loading = false;

                    this.errors = error.response.data.error;

                    Notification.errorMsg(
                        error.response.data.error ?? error.response.data.message
                    );
                });
        },
    },
};
</script>
