require("./bootstrap");
require("lang.js");

import Vue from "vue";
import VueRouter from "vue-router";
import VueHtmlToPaper from "vue-html-to-paper";
import sidebar from "./components/layout/sidebar.vue";
import topbar from "./components/layout/topbar.vue";
import types from "./components/types/index.vue";

import { routes } from "./routes";
//Multi lang
import { Lang } from "laravel-vue-lang";
import Cookie from "./Helpers/Cookie";
window.Cookie = Cookie;

Vue.use(Lang, {
    locale: localStorage.getItem("lang"),
    fallback: "ar",
});
import VueQuagga from "vue-quaggajs";

// register component 'v-quagga'
Vue.use(VueQuagga);

Vue.use(VueRouter);
let bootstrap =
    window.location.origin + "/backend/vendor/bootstrap/css/bootstrap.rtl.css";
let style = window.location.origin + "/css/print.css";
Vue.use(VueRouter);
const options = {
    name: "_blank",
    specs: ["fullscreen=yes", "titlebar=yes", "scrollbars=yes"],
    styles: [bootstrap, style],
};
Vue.use(VueHtmlToPaper, options);

// Import User Class
import User from "./Helpers/User";

window.User = User;
//Notification
import Notification from "./Helpers/Notification";
import JsPrintApp from "./Helpers/JsPrint";
window.JsPrintApp = JsPrintApp;

window.Notification = Notification;

//end sweet alert
const router = new VueRouter({
    routes,
    mode: "history", // short for `routes: routes`
});
window.Reload = new Vue();

const app = new Vue({
    components: {
        sidebar,
        topbar,
        types,
    },
    async created() {
        await this.getCodies();
        if (localStorage.getItem("jsPrint") === null) {
            localStorage.setItem("jsPrint", "1");
        }
        await axios
            .get("/api/users/" + localStorage.getItem("user_id"))
            .then(({ data }) => (this.user = data))
            .catch((error) => console.log(error));
        localStorage.setItem("lang", this.mixins.default_lang);
    },
    data() {
        return {
            userRoles: [],
            roles: [],
            mixins: {},
            codies: {},
            user: {},
        };
    },
    methods: {
        async getCodies() {
            await axios
                .get("/api/mixins/1")
                .then(({ data }) => {
                    this.mixins = data;
                    this.codies = data;
                })
                .catch((error) => console.log(error));
        },
    },
    el: "#app",
    router,
});