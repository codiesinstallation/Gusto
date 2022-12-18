<template>
    <div>
        <nav
            v-if="!loading"
            :class="mixins.default_lang"
            id="navbar"
            v-show="$route.path === '/' ? false : true"
            style="display: none"
        >
            <ul
                class="navbar-nav sidebar sidebar-light accordion toggled hideMeInPrint"
                id="accordionSidebar"
            >
                <li class="reload nav-item active mt-5">
                    <router-link class="nav-link" to="/home">
                        <i class="fa fa-user"> </i>

                        <span class="my-0 fa userName"></span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/home'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/home">
                        <i class="fa fa-home" title="الرئيسية-Home"></i>

                        <span>{{ __("Home") }}</span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/shift'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/shift">
                        <i class="fa fa-dollar-sign" title="الوردية-Shift"></i>
                        <span>{{ __("ar.Shift") }}</span>
                    </router-link>
                </li>
                <li
                    v-if="mixins.codies_type"
                    :class="
                        $route.path === '/cashier'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/cashier">
                        <i
                            class="fas fa-file-invoice-dollar"
                            title="الفواتير - Bills"
                        ></i>
                        <span>{{ __("New Bill") }}</span>
                    </router-link>
                </li>
                <li
                    v-else
                    :class="
                        $route.path === '/bill'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/bill">
                        <i
                            class="fas fa-file-invoice-dollar"
                            title="الفواتير - Bills"
                        ></i>
                        <span>{{ __("New Bill") }}</span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/bills'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/bills">
                        <i class="fa fa-wallet" title="الفواتير-Bills"></i>
                        <span>{{ __("Bills") }}</span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/users'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/users">
                        <i class="fa fa-users" title="المستخدمون-Users"></i>
                        <span>{{ __("Users") }}</span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/customers'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                    v-show="$root.$data.roles.includes(10)"
                >
                    <router-link class="nav-link" to="/customers">
                        <i
                            class="fa fa-users-cog"
                            title="العملاء-Customers"
                        ></i>
                        <span>{{ __("Customers") }}</span>
                    </router-link>
                </li>

                <li
                    :class="
                        $route.path === '/purchase-bills'
                            ? 'reload nav-item  active d-none'
                            : 'reload nav-item d-none'
                    "
                >
                    <router-link class="nav-link" to="/purchase-bills">
                        <i
                            class="fa fa-receipt"
                            title="فاتورة شراء-Purchase Bill"
                        ></i>
                        <span>{{ __("Purchase Bill") }}</span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/allPurchaseBills'
                            ? 'reload nav-item  active d-none'
                            : 'reload nav-item d-none'
                    "
                >
                    <router-link class="nav-link" to="/allPurchaseBills">
                        <i
                            class="fa fa-landmark"
                            title="فواتير الشراء-Purchase Bills"
                        ></i>
                        <span>{{ __("Purchase Bills") }}</span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/suppliers'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/suppliers">
                        <i class="fa fa-truck" title="الموردون-Suppliers"></i>
                        <span>{{ __("Suppliers") }}</span>
                    </router-link>
                </li>
                <li
                    v-if="mixins.codies_type"
                    :class="
                        $route.path === '/items'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/items">
                        <i class="fa fa-list" title="الأصناف-Types"></i>
                        <span>{{ __("Types") }}</span>
                    </router-link>
                </li>
                <li
                    v-else
                    :class="
                        $route.path === '/types'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/types">
                        <i class="fa fa-list" title="الأصناف-Types"></i>
                        <span>{{ __("Types") }}</span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/workers'
                            ? 'reload nav-item  active d-none'
                            : 'reload nav-item d-none'
                    "
                >
                    <router-link class="nav-link" to="/workers">
                        <i
                            class="fa fa-user-circle"
                            title="الموظفون-Workers"
                        ></i>
                        <span>{{ __("Workers") }}</span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/mainTypes'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/mainTypes">
                        <i class="fa fa-th" title="التصنيفات-Categories"></i>
                        <span>{{ __("Categories") }}</span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/report'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/report">
                        <i
                            class="fa fa-chart-line"
                            title="التقارير-Reports"
                        ></i>
                        <span>{{ __("Reports") }}</span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/mixins'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/mixins">
                        <i class="fa fa-cog" title="الاعدادات-Settings"></i>
                        <span>{{ __("Settings") }}</span>
                    </router-link>
                </li>
                <li
                    :class="
                        $route.path === '/logout'
                            ? 'reload nav-item  active'
                            : 'reload nav-item '
                    "
                >
                    <router-link class="nav-link" to="/logout">
                        <i class="fas fa-sign-out-alt" title="خروج-Exit"></i>
                        <span> {{ __("Exit") }}</span>
                    </router-link>
                </li>
                <li class="reload nav-item active">
                    <a
                        href="?lang=en"
                        v-if="lang === 'ar'"
                        class="nav-link pointer"
                    >
                        En
                    </a>

                    <a v-else href="?lang=ar" class="nav-link pointer"> Ar </a>
                </li>
            </ul>
        </nav>
        <Spinner v-else :title="title" />
    </div>
</template>

<script>
import Spinner from "../spinner/mixinsSpinner.vue";
export default {
    components: { Spinner },
    name: "sidebar",
    async created() {
        await this.getCodies();
        this.lang = this.mixins.default_lang;
    },
    data() {
        return {
            mixins: {},
            lang: "",
            loading: true,
            title: "Loading",
        };
    },
    methods: {
        async getCodies() {
            await axios
                .get("/api/mixins/1")
                .then(({ data }) => {
                    this.mixins = data;
                    this.loading = false;
                })
                .catch((error) => console.log(error));
        },

    },
};
</script>
