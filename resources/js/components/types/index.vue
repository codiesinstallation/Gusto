<template>
    <div>
        <div v-if="user.types" class="row">
            <!-- Datatables -->
            <div v-show="!loading" class="col-lg-12">
                <div class="card mb-4">
                    <div
                        class="card-header d-flex flex-row align-items-center justify-content-between"
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
                            كل المنتجات
                        </h6>
                        <router-link
                            class="m-0 font-weight-bold text-primary"
                            to="/create/type"
                            >إضافة
                        </router-link>

                        <img
                            onclick="download('xlsx','types');"
                            style="width: 35px; height: 35px; cursor: pointer"
                            class="card-img-top img-circle"
                            src="backend/img/reports/excel.png"
                            alt="Card image cap"
                        />

                        <h6
                            class="m-0 font-weight-bold text-primary float-left"
                        >
                            <div id="search">
                                <input
                                    id="filter"
                                    v-model="searchTerm"
                                    class="form-control-sm"
                                    name="filter"
                                    type="text"
                                />
                            </div>
                        </h6>
                    </div>
                    <div class="w-100 dragscroll table-wrapper">
                        <div id="pagewrap" class="row">
                            <div id="body" class="col-sm-12">
                                <table
                                    v-if="types.length > 0"
                                    id="types"
                                    class="table table-bordered table-striped"
                                >
                                    <thead>
                                        <tr>
                                            <th style="width: 5%">تعديل</th>

                                            <th
                                                class="d-none"
                                                style="width: 10%"
                                            >
                                                كود
                                            </th>

                                            <th style="width: 10%">
                                                اسم الصنف عربي
                                            </th>
                                            <th style="width: 10%">
                                                اسم الصنف انجليزي
                                            </th>
                                            <th style="width: 5%">
                                                صورة الصنف
                                            </th>
                                            <th style="width: 5%">
                                                سعر التكلفة
                                            </th>
                                            <th style="width: 5%">سعر البيع</th>

                                            <th style="width: 5%">
                                                قيمة الخصم
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr
                                            v-for="(
                                                type, index
                                            ) in filterSearch"
                                            :key="index"
                                            class="ErrorRow"
                                        >
                                            <td v-if="!isNewbill">
                                                <router-link
                                                    :to="{
                                                        name: 'edit-type',
                                                        params: {
                                                            id: type.type_id,
                                                        },
                                                    }"
                                                    class="btn btn-sm btn-primary"
                                                    ><i class="fa fa-edit"></i>
                                                </router-link>
                                                <a
                                                    class="btn btn-sm btn-danger"
                                                    @click="
                                                        deleteType(type.type_id)
                                                    "
                                                    ><i class="fa fa-trash"></i
                                                ></a>
                                            </td>
                                            <td v-else>
                                                <button
                                                    type="button"
                                                    class="btn btn-sm btn-primary"
                                                    @click="addToCart(type)"
                                                >
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </td>
                                            <td class="d-none">
                                                {{ type.type_id }}
                                            </td>
                                            <td class="d-none">
                                                {{ type.type_barcode }}
                                            </td>
                                            <td style="overflow: auto">
                                                {{ type.type_name_ar }}
                                            </td>
                                            <td>{{ type.type_name_en }}</td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <button
                                                    v-show="
                                                        type.type_icon !== '' ||
                                                        type.type_icon != null
                                                    "
                                                    :data-target="
                                                        '#exampleModalCenter-' +
                                                        type.type_id
                                                    "
                                                    class="btn btn-sm btn-info text-light"
                                                    data-toggle="modal"
                                                    type="button"
                                                >
                                                    <i class="fa fa-search"></i>
                                                </button>
                                                <div
                                                    :id="
                                                        'exampleModalCenter-' +
                                                        type.type_id
                                                    "
                                                    aria-hidden="true"
                                                    aria-labelledby="exampleModalCenterTitle"
                                                    class="modal fade"
                                                    role="dialog"
                                                    tabindex="-1"
                                                >
                                                    <div
                                                        class="modal-dialog modal-dialog-centered"
                                                        role="document"
                                                    >
                                                        <div
                                                            class="modal-content"
                                                            style="width: 500px"
                                                        >
                                                            <div
                                                                class="modal-body"
                                                                style="
                                                                    width: 500px;
                                                                "
                                                            >
                                                                <img
                                                                    :src="
                                                                        type.type_icon
                                                                    "
                                                                    style="
                                                                        width: 100%;
                                                                        height: 100%;
                                                                    "
                                                                />
                                                            </div>
                                                            <div
                                                                class="modal-footer py-1"
                                                            >
                                                                <button
                                                                    class="btn-sm btn btn-secondary"
                                                                    data-dismiss="modal"
                                                                    type="button"
                                                                >
                                                                    إغلاق
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                {{ type.type_purchases_price }}
                                            </td>
                                            <td>{{ type.type_sill_price }}</td>

                                            <td>
                                                {{ type.type_discount_value }}
                                            </td>
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

            <div v-show="loading" class="text-center" dir="rtl">
                <Spinner :title="title"></Spinner>
            </div>
            <!-- DataTable with Hover -->

            <div v-show="loading" class="text-center" dir="rtl">
                <Spinner :title="title"></Spinner>
            </div>
        </div>
        <Security v-else></Security>
    </div>
</template>

<script>
import Spinner from "../spinner/mixinsSpinner.vue";
import Security from "../spinner/security";
import JsBarcode from "jsbarcode";

export default {
    components: { Security, Spinner },
    props: {
        isNewbill: Boolean,
        addToCart: Function,
    },

    async created() {
        if (!User.loggedIn()) {
            this.$router.push("/");
        }
        await axios
            .get("/api/users/" + localStorage.getItem("user_id"))
            .then(({ data }) => (this.user = data))
            .catch((error) => console.log(error));
        await this.allTypes();
        await axios
            .get("/api/barcodes/" + 1)
            .then(({ data }) => {
                this.barcode = data;
            })
            .catch((error) => console.log(error));
    },
    data() {
        return {
            user: {},
            title: "Types",

            types: [],
            searchTerm: "",
            loading: true,
            total: 1,
            page: 1,
            current_page: "",
            last_page: "",
            typeName: "",
            barcode: {},
        };
    },
    computed: {
        filterSearch() {
            return this.types.filter((type) => {
                return type.type_name_ar.match(this.searchTerm);
            });
        },
    },
    methods: {
        async printBarcode(type) {
            let barcode = type.type_barcode;
            if (
                type.type_barcode == null ||
                type.type_barcode === "" ||
                type.type_barcode.length === 0
            ) {
                barcode = type.type_id;
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
        findTypeByLike() {
            axios
                .get("/api/action/like/" + this.typeName)
                .then(({ data }) => {
                    this.types = data;
                })
                .catch((error) => console.log(error));
        },
        allTypes() {
            axios
                .get("/api/types?page=" + this.page)
                .then(({ data }) => {
                    if (data.length >= 0) {
                        this.loading = false;
                        this.types = data;
                    }
                })
                .catch((error) => console.log(error));
        },

        nextPage(i) {
            this.page = i;
            this.allTypes();
        },
        deleteType(id) {
            if (confirm("هل تريد الحذف؟لايمكن الاستعاده مره اخرى.")) {
                axios
                    .delete("/api/types/" + id)
                    .then((data) => {
                        this.types = this.types.filter((type) => {
                            return type.type_id !== id;
                        });
                        Notification.successMsg("تم الحذف بنجاح");
                    })
                    .catch((error) => {
                        Notification.errorMsg(
                            "لايمكن حذف صنف مرتبط بفواتير او عمليات"
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

table.table-fit thead th,
table.table-fit tfoot th {
    width: auto !important;
}

table.table-fit tbody td,
table.table-fit tfoot td {
    width: auto !important;
}
</style>
