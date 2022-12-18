<template>
    <div>
        <div v-if="userRole.users || userRole.is_admin" class="row">
            <!-- Datatables -->
            <div v-show="!loading" class="col-lg-12">
                <div class="card mb-4">
                    <div
                        class="card-header d-flex flex-row align-items-center justify-content-between"
                    >

                        <h6 class="m-0 font-weight-bold text-primary">
                            كل المستخدمين
                        </h6>
                        <router-link
                            v-show="
                                userRole.create_user || userRole.is_admin === 2
                            "
                            class="m-0 font-weight-bold text-primary"
                            to="/create/user"
                            >إضافة</router-link
                        >
                        <img
                            onclick="download('xlsx','users');"
                            style="width: 35px; height: 35px; cursor: pointer"
                            class="card-img-top img-circle"
                            src="backend/img/reports/excel.png"
                            alt="Card image cap"
                        />
                        <input
                            v-model="searchTerm"
                            class="form-control-sm"
                            placeholder="اسم المستخدم"
                            user="text"
                        />
                    </div>
                    <div class="w-100 table-wrapper">
                        <div id="pagewrap" class="row">
                            <div id="body" class="col-sm-12">
                                <table
                                    v-if="users.length > 0"
                                    id="users"
                                    class="text-center table-bordered"
                                >
                                    <thead>
                                        <tr>
                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                إعدادات
                                            </th>

                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                كود
                                            </th>
                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                الاسم
                                            </th>
                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                الهاتف
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr
                                            v-for="(
                                                user, index
                                            ) in filterSearch"
                                            :key="index"
                                            class="ErrorRow selectedR"
                                        >
                                            <td>
                                                <a
                                                    v-show="user.pin_code"
                                                    class="btn btn-success"
                                                    @click="printBarcode(user)"
                                                    ><i class="fa fa-print"></i
                                                ></a>
                                                <router-link
                                                    v-show="userRole.edit_user"
                                                    :to="{
                                                        name: 'edit-user',
                                                        params: { id: user.id },
                                                    }"
                                                    class="btn btn-primary"
                                                    ><i class="fa fa-edit"></i>
                                                </router-link>
                                                <a
                                                    v-show="
                                                        userRole.delete_user
                                                    "
                                                    class="btn btn-danger"
                                                    @click="
                                                        deleteAction(user.id)
                                                    "
                                                    ><i class="fa fa-trash"></i
                                                ></a>

                                                <router-link
                                                    v-show="
                                                        userRole.user_roles ||
                                                        userRole.is_admin
                                                    "
                                                    :to="{
                                                        name: 'add-roles',
                                                        params: { id: user.id },
                                                    }"
                                                    class="btn btn-warning text-light"
                                                    ><i
                                                        class="fas fa-user-shield"
                                                    ></i>
                                                </router-link>
                                            </td>
                                            <td>{{ user.id }}</td>
                                            <td>{{ user.name }}</td>
                                            <td>{{ user.mobile }}</td>
                                        </tr>
                                        <div id="printMe" class="d-none">
                                            <span class="d-block">{{
                                                currentUser.name
                                            }}</span>
                                            <img class="barcode" />
                                        </div>
                                    </tbody>
                                </table>
                                <p v-else class="text-center">
                                    {{ __("No Data Yet") }}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- DataTable with Hover -->

            <Spinner v-show="loading" :title="title" />
        </div>
        <Security v-else></Security>
    </div>
</template>

<script>
import Spinner from "../spinner/mixinsSpinner.vue";
import Security from "../spinner/security";

export default {
    components: { Security, Spinner },

    async created() {
        if (!User.loggedIn()) {
            this.$router.push("/");
        }
        await axios
            .get("/api/users/" + localStorage.getItem("user_id"))
            .then(({ data }) => (this.userRole = data))
            .catch((error) => console.log(error));
        await this.allusers();
        await axios
            .get(
                "/api/user/roles/" + localStorage.getItem("user_id") + "/" + 11
            )
            .then(({ data }) => {
                this.haveRole = data;
            })
            .catch((error) => console.log(error));
        await axios
            .get("/api/barcodes/" + 2)
            .then(({ data }) => {
                this.barcode = data;
            })
            .catch((error) => console.log(error));
    },
    data() {
        return {
            userRole: {},
            title: "Users",
            haveRole: false,
            users: [],
            searchTerm: "",
            loading: true,
            total: 1,
            page: 1,
            current_page: "",
            last_page: "",
            barcode: {},
            currentUser: {},
        };
    },
    computed: {
        filterSearch() {
            return this.users.filter((user) => {
                return user.name.match(this.searchTerm);
            });
        },
    },
    methods: {
        async printBarcode(user) {
            await this.setCurrentUser(user);
            let barcode = user.pin_code;
            if (
                user.pin_code == null ||
                user.pin_code === "" ||
                user.pin_code.length === 0
            ) {
                barcode = user.id;
            }
            JsBarcode(".barcode", barcode, {
                textAlign: this.barcode.textAlign,
                textPosition: this.barcode.textPosition,
                font: this.barcode.font,
                fontOptions: this.barcode.fontOptions,
                textMargin: this.barcode.textMargin,
                format: this.barcode.format,
                displayValue: this.barcode.displayValue,
                height: this.barcode.height,
                width: this.barcode.width,
                fontSize: this.barcode.fontSize,
                background: this.barcode.background,
                lineColor: this.barcode.lineColor,
                margin: this.barcode.margin,
                marginLeft: this.barcode.marginLeft,
                marginTop: this.barcode.marginTop,
                marginBottom: this.barcode.marginBottom,
                marginRight: this.barcode.marginRight,
                flat: this.barcode.flat,
            });
            this.$htmlToPaper("printMe");
        },
        setCurrentUser(user) {
            this.currentUser = user;
        },
        allusers() {
            axios
                .get("/api/users")
                .then(({ data }) => {
                    if (data.length >= 0) {
                        this.loading = false;
                        this.users = data;
                    }
                })
                .catch((error) => console.log(error));
        },
        print(id) {
            this.$htmlToPaper(id);
        },
        deleteAction(id) {
            if (confirm("هل تريد الحذف؟لايمكن الاستعاده مره اخرى.")) {
                axios
                    .delete("/api/users/" + id)
                    .then(() => {
                        this.users = this.users.filter((user) => {
                            return user.id != id;
                        });
                        Notification.successMsg("تم الحذف بنجاح ");
                    })
                    .catch(() => {
                        Notification.errorMsg("لايمكن حذف مستخدم له معاملات ");
                    });
            }
        },
    },
};
</script>
<style>
a,
a:hover {
    text-decoration: none;
    font-weight: bolder;
}

.bg-info {
    width: 100%;
    height: 100%;
    position: absolute;
    overflow: hidden;
}

.spinner-border {
    margin: 50vh auto !important;
}

table.table-fit {
    width: auto !important;
    table-layout: auto !important;
}

table.table-fit thead th,
table.table-fit tfoot th {
    width: auto !important;
}

table.table-fit tbody td,
table.table-fit tfoot td {
    width: auto !important;
}
</style>
