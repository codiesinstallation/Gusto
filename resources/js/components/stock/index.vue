<template>
    <div>
        <div class="row">
            <!-- Datatables -->
            <div v-if="!loading" class="col-lg-12">
                <div class="card mb-4">
                    <div
                        class="card-header d-flex flex-row align-items-center justify-content-between"
                    >
                        <h6 class="m-0 font-weight-bold text-primary">
                            كل المخزون
                        </h6>
                        <router-link
                            class="m-0 font-weight-bold text-primary"
                            to="/create/stock"
                            >إضافة</router-link
                        >
                        <button
                            class="btn btn-primary"
                            onclick="download('xlsx');"
                            type="submit"
                        >
                            <i class="fa fa-file-excel"></i>
                        </button>

                        <h6
                            class="m-0 font-weight-bold text-primary float-left"
                        >
                            <div id="search">
                                <input
                                    id="filter"
                                    class="form-control-sm"
                                    name="filter"
                                    type="text"
                                    value=""
                                />
                            </div>
                        </h6>
                    </div>
                    <div class="w-100 dragscroll table-wrapper">
                        <div id="pagewrap" class="row">
                            <div id="body" class="col-sm-12">
                                <table
                                    v-if="stocks.length > 0"
                                    id="resultTable"
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
                                                الاسم
                                            </th>
                                            <th
                                                class="col-header"
                                                style="width: 15%"
                                            >
                                                المخزون
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr
                                            v-for="(stock, index) in stocks"
                                            :key="index"
                                            class="ErrorRow"
                                        >
                                            <td>
                                                <router-link
                                                    :to="{
                                                        name: 'edit-stock',
                                                        params: {
                                                            id: stock.id,
                                                        },
                                                    }"
                                                    class="btn btn-sm btn-primary"
                                                    ><i class="fa fa-edit"></i>
                                                </router-link>
                                                <a
                                                    class="btn btn-sm btn-danger"
                                                    @click="
                                                        deleteAction(stock.id)
                                                    "
                                                    ><i class="fa fa-trash"></i
                                                ></a>
                                            </td>
                                            <td>{{ stock.title }}</td>
                                            <td>{{ stock.stock }}</td>
                                        </tr>
                                    </tbody>
                                    <tfoot></tfoot>
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

            <Spinner v-else :title="title"> </Spinner>
        </div>
    </div>
</template>

<script>
import Spinner from "../spinner/mixinsSpinner.vue";

export default {
    components: { Spinner },

    created() {
        if (!User.loggedIn()) {
            this.$router.push("/");
        }
        this.allStocks();
    },
    data() {
        return {
            title: "Stocks",
            stocks: [],
            searchTerm: "",
            loading: true,
        };
    },
    computed: {
        filterSearch() {
            return this.stocks.filter((stock) => {
                return stock.title.match(this.searchTerm);
            });
        },
    },
    methods: {
        allStocks() {
            axios
                .get("/api/stocks")
                .then(({ data }) => {
                    if (data.length >= 0) {
                        this.loading = false;
                        this.stocks = data;
                    }
                })
                .catch((error) => console.log(error));
        },

        deleteAction(id) {
            if (confirm("هل تريد الحذف؟لايمكن الاستعاده مره اخرى.")) {
                axios
                    .delete("/api/stocks/" + id)
                    .then(() => {
                        this.stocks = this.stocks.filter((stock) => {
                            return stock.id != id;
                        });
                        Notification.successMsg("تم الحذف بنجاح");
                    })
                    .catch((err) => {
                        Notification.errorMsg("لايمكن الحذف!");
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
