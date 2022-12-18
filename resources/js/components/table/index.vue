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
                            كل الطاولاتے
                        </h6>
                        <router-link
                            class="m-0 font-weight-bold text-primary"
                            to="/create/table"
                            >إضافة</router-link
                        >



                    </div>
                    <div class="card-body">
                        <div class="row text-center">
                            <div
                                class="col-2"
                                v-for="(table, index) in tables"
                                :key="index"
                            >
                                <div
                                    :class="
                                        table.is_resrved
                                            ? 'card bg-danger'
                                            : 'card'
                                    "
                                    style="width: 100%"
                                >
                                    <div class="card-body">
                                        <p class="card-text">
                                            <span>رقم الطاولة:</span>
                                            {{ table.table_no }}
                                        </p>
                                        <p v-if="table.room" class="card-text">
                                            <span> رسم فتح الغرفة:</span>

                                            {{ table.mini_charge }}
                                        </p>
                                        <p v-if="table.room" class="card-text">
                                            <span>رقم الغرفة:</span>

                                            {{ table.room }}
                                        </p>
                                    </div>

                                    <div class="card-footer bg-light">
                                        <router-link
                                            :to="{
                                                name: 'edit-table',
                                                params: {
                                                    id: table.id,
                                                },
                                            }"
                                            class="btn btn btn-primary "
                                            ><i class="fa fa-edit text-light"></i>
                                        </router-link>
                                        <a
                                            class="btn btn btn-danger"
                                            @click="deleteAction(table.id)"
                                            ><i class="fa fa-trash"></i
                                        ></a>
                                    </div>
                                </div>
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
    async created() {
        if (!User.loggedIn()) {
            await this.$router.push("/");
        }
        this.allTables();
    },
    data() {
        return {
            title: "Tables",
            tables: [],
            searchTerm: "",
            loading: true,
        };
    },
    computed: {
        filterSearch() {
            return this.tables.filter((table) => {
                return table.table_no.match(this.searchTerm);
            });
        },
    },
    methods: {
        allTables() {
            axios
                .get("/api/table")
                .then(({ data }) => {
                    if (data.length >= 0) {
                        this.loading = false;
                        this.tables = data;
                    }
                })
                .catch((error) => console.log(error));
        },

        deleteAction(id) {
            if (confirm("هل تريد الحذف؟لايمكن الاستعاده مره اخرى.")) {
                axios
                    .delete("/api/table/" + id)
                    .then(() => {
                        this.tables = this.tables.filter((table) => {
                            return table.id != id;
                        });
                        Notification.successMsg("تم الحذف بنجاح ");
                    })
                    .catch(() => {
                        Notification.errorMsg("لايمكن الحذف");
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
