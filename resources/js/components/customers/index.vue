<template>
    <div>
        <div v-if="user.customers" class="row">
            <!-- Datatables -->
            <div v-show="!loading" class="col-lg-12">
                <div class="card mb-4">
                    <div
                        class="card-header d-flex flex-row align-items-center justify-content-between"
                    >

                        <h6 class="m-0 font-weight-bold text-primary">
                            {{ __("Customers") }}
                        </h6>
                        <router-link
                            v-show="user.create_customer"
                            class="m-0 font-weight-bold text-primary"
                            to="/create/customer"
                            >{{ __("Create") }}</router-link
                        >

                        <input
                            v-model="searchTerm"
                            class="form-control-sm"
                            :placeholder="__('Customer Name')"
                            type="text"
                        />
                    </div>
                    <div class="w-100 table-wrapper">
                        <div id="pagewrap" class="row">
                            <div id="body" class="col-sm-12">
                                <table
                                    v-if="customers.length > 0"
                                    id="customers"
                                    class="text-center table-bordered"
                                >
                                    <thead>
                                        <tr>
                                            <th
                                                v-show="
                                                    user.edit_customer ||
                                                    user.delete_customer
                                                "
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                إعدادات
                                            </th>
                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                {{ __("Code") }}
                                            </th>
                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                {{ __("Name") }}
                                            </th>
                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                {{ __("Mobile") }}
                                            </th>
                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                {{ __("Address") }}
                                            </th>
                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                {{ __("Customer Vat Number") }}
                                            </th>

                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                {{ __("Balance") }}
                                            </th>
                                            <th
                                                class="col-header d-none"
                                                style="width: 15%"
                                            >
                                                {{ __("Discount Value") }}
                                            </th>
                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                {{ __("Discount Percent") }}
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr
                                            v-for="customer in filterSearch"
                                            class="ErrorRow"
                                        >
                                            <td>
                                                <router-link
                                                    v-show="user.edit_customer"
                                                    :to="{
                                                        name: 'edit-customer',
                                                        params: {
                                                            id: customer.cust_id,
                                                        },
                                                    }"
                                                    class="btn btn-sm btn-primary"
                                                    ><i class="fa fa-edit"></i>
                                                </router-link>
                                                <a
                                                    v-show="
                                                        user.delete_customer
                                                    "
                                                    class="btn btn-sm btn-danger"
                                                    @click="
                                                        deleteAction(
                                                            customer.cust_id
                                                        )
                                                    "
                                                    ><i class="fa fa-trash"></i
                                                ></a>
                                            </td>
                                            <td>{{ customer.cust_id }}</td>
                                            <td>{{ customer.cust_name }}</td>
                                            <td>{{ customer.cust_mobile }}</td>
                                            <td>{{ customer.cust_address }}</td>
                                            <td>{{ customer.cust_vat_num }}</td>

                                            <td>{{ customer.cust_balance }}</td>
                                            <td class="d-none">
                                                {{ customer.cust_discount_val }}
                                            </td>
                                            <td>
                                                {{
                                                    customer.cust_discount_percent
                                                }}
                                            </td>

                                            <div
                                                class="modal fade"
                                                :id="'pay-' + customer.cust_id"
                                                tabindex="-1"
                                                role="dialog"
                                                aria-labelledby="exampleModalLabel"
                                                aria-hidden="true"
                                            >
                                                <div
                                                    class="modal-dialog"
                                                    role="document"
                                                >
                                                    <div class="modal-content">
                                                        <div
                                                            class="modal-header"
                                                        >
                                                            <h5
                                                                class="modal-title"
                                                                id="exampleModalLabel"
                                                            >
                                                                Modal title
                                                            </h5>
                                                            <button
                                                                type="button"
                                                                class="close"
                                                                data-dismiss="modal"
                                                                aria-label="Close"
                                                            >
                                                                <span
                                                                    aria-hidden="true"
                                                                    >&times;</span
                                                                >
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            ...
                                                        </div>
                                                        <div
                                                            class="modal-footer"
                                                        >
                                                            <button
                                                                type="button"
                                                                class="btn btn-secondary"
                                                                data-dismiss="modal"
                                                            >
                                                                Close
                                                            </button>
                                                            <button
                                                                type="button"
                                                                class="btn btn-primary"
                                                            >
                                                                Save changes
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </tr>
                                    </tbody>
                                    <tfoot></tfoot>
                                </table>
                                <p v-else class="text-center">
                                    {{ __("No Data Yet") }}
                                </p>
                                <div
                                    v-show="customers.length > 0"
                                    class="row text-center"
                                >
                                    <ul
                                        class="pagination justify-content-center"
                                    >
                                        <li
                                            :class="
                                                page == 1
                                                    ? 'page-item disabled'
                                                    : 'page-item'
                                            "
                                        >
                                            <a
                                                class="page-link"
                                                href="#"
                                                @click="nextPage(1)"
                                                >{{ __("First") }}</a
                                            >
                                        </li>
                                        <li
                                            :class="
                                                page == 1
                                                    ? 'page-item disabled'
                                                    : 'page-item'
                                            "
                                        >
                                            <a
                                                class="page-link"
                                                href="#"
                                                @click="
                                                    nextPage(current_page - 1)
                                                "
                                                ><i
                                                    class="fa fa-arrow-right"
                                                ></i
                                            ></a>
                                        </li>
                                        <li
                                            class="page-item d-none"
                                            v-for="(i, index) in total"
                                            @click="nextPage(i)"
                                        >
                                            <a class="page-link" href="#">{{
                                                i
                                            }}</a>
                                        </li>
                                        <li
                                            :class="
                                                page == last_page
                                                    ? 'page-item disabled'
                                                    : 'page-item'
                                            "
                                        >
                                            <a
                                                class="page-link"
                                                href="#"
                                                @click="
                                                    nextPage(current_page + 1)
                                                "
                                                ><i class="fa fa-arrow-left"></i
                                            ></a>
                                        </li>
                                        <li
                                            :class="
                                                page == last_page
                                                    ? 'page-item disabled'
                                                    : 'page-item'
                                            "
                                        >
                                            <a
                                                class="page-link"
                                                href="#"
                                                @click="nextPage(total + 1)"
                                                >{{ __("Last") }}</a
                                            >
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- DataTable with Hover -->
        </div>
        <Security v-else></Security>
        <Spinner v-show="loading" :title="title"></Spinner>
    </div>
</template>

<script>
import Spinner from "../spinner/mixinsSpinner";
import Security from "../spinner/security";

export default {
    components: { Spinner, Security },

    async created() {
        if (!User.loggedIn()) {
            this.$router.push("/");
        }
        await axios
            .get("/api/users/" + localStorage.getItem("user_id"))
            .then(({ data }) => (this.user = data))
            .catch((error) => console.log(error));
        this.allCustomers();
    },
    data() {
        return {
            user: {},
            title: "Customers",
            customer: {},
            searchTerm: "",
            loading: true,
            total: 1,
            page: 1,
            current_page: "",
            last_page: "",
            customers: [],
        };
    },
    computed: {
        filterSearch() {
            return this.customers.length > 0
                ? this.customers.filter((customer) => {
                      return customer.cust_name.match(this.searchTerm);
                  })
                : "";
        },
    },
    methods: {
        allCustomers() {
            axios
                .get("/api/customers?page=" + this.page)
                .then(({ data }) => {
                    if (data.data.length >= 0) {
                        this.loading = false;
                        this.total = parseInt(data.total / data.per_page);
                        this.customers = data.data;
                        this.current_page = data.current_page;
                        this.last_page = data.last_page;
                    }
                })
                .catch((error) => console.log(error));
        },

        nextPage(i) {
            this.page = i;
            this.allcustomer();
        },

        deleteAction(id) {
            if (confirm("هل تريد الحذف؟لايمكن الاستعاده مره اخرى.")) {
                axios
                    .delete("/api/customers/" + id)
                    .then(() => {
                        this.customers = this.customers.filter((customer) => {
                            return customer.cust_id != id;
                        });
                        Notification.successMsg("تم الحذف بنجاح");
                    })
                    .catch(() => {
                        Notification.errorMsg(
                            "لايمكن حذف عميل له فواتير او معاملات اخرى!"
                        );
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
