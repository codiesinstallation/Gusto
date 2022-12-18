<template>
    <div>
        <div v-if="user.bills" class="row">
            <!-- Datatables -->
            <div class="col-lg-12">
                <div class="card mb-4">
                    <div
                        class="card-header hideMeInPrint d-flex flex-row align-items-center justify-content-between hideMeInPrint"
                    >

                        <h1 class="text-center my-0 btn-sm d-block">
                            الفواتير
                        </h1>

                        <h6
                            class="m-0 font-weight-bold text-primary float-left"
                        >
                            <input
                                class="form-control"
                                placeholder="رقم الفاتورة"
                                type="text"
                                v-model="bill_id"
                                @keyup="findBill()"
                            />
                        </h6>
                        <h6
                            class="m-0 font-weight-bold text-primary float-left"
                        >
                            <input
                                autofocus
                                class="form-control"
                                placeholder="باركود الصنف"
                                type="text"
                                v-model="barcode"
                                @keyup="findBillByTypeId()"
                            />
                        </h6>
                        <select
                            v-model="perPage"
                            class="form-control-sm text-center"
                        >
                            <option value="25">25</option>

                            <option value="100">100</option>
                            <option value="200">200</option>
                            <option value="500">500</option>
                            <option value="1000">1000</option>
                            <option value="2000">2000</option>
                            <option value="3000">3000</option>
                            <option value="4000">4000</option>
                            <option value="5000">5000</option>
                        </select>
                        <form
                            v-show="!period"
                            class="needs-validation mt-2 hideMeInPrint"
                            @submit.prevent="allBills"
                        >
                            <div class="form-row">
                                <div class="col-md-5">
                                    <div class="input-group">
                                        <div
                                            class="input-group-prepend input-sm"
                                        >
                                            <span class="input-group-text"
                                                >من</span
                                            >
                                        </div>
                                        <date-picker
                                            v-model="reportPeriod.from"
                                            id="from"
                                            :wrap="true"
                                            :config="configs.wrap"
                                            required
                                            :placeholder="__('To')"
                                        >
                                        </date-picker>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="input-group">
                                        <div
                                            class="input-group-prepend float-right input-sm"
                                        >
                                            <span
                                                class="input-group-text"
                                                for="to"
                                                >الى</span
                                            >
                                        </div>
                                        <date-picker
                                            v-model="reportPeriod.to"
                                            id="to"
                                            :wrap="true"
                                            :config="configs.wrap"
                                            required
                                            :placeholder="__('To')"
                                        >
                                        </date-picker>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button
                                        class="btn btn-success btn-sm"
                                        type="submit"
                                    >
                                        عرض
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="card-body">
                        <div
                            class="table-responsive"
                            id="printMeReport"
                            style="height: 50vh"
                        >
                            <table
                                v-if="bills.length > 0"
                                id="bills"
                                class="text-center sortTable"
                                style="
                                    cellpadding: 20px;
                                    cellspacing: 0px;
                                    width: 100%;
                                "
                            >
                                <thead>
                                    <tr>
                                        <th style="width: 5%">
                                            {{ __("Bill Number") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Sum") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Vat") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Total") }}
                                        </th>
                                        <th style="width: 5%">
                                            {{ __("Discount") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Paid") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Remain") }}
                                        </th>
                                        <th style="width: 20%">
                                            {{ __("Bill Date") }}
                                        </th>
                                        <th style="width: 5%">
                                            {{ __("Pay Methods") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Customer Name") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("User Name") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Notes") }}
                                        </th>
                                        <th
                                            v-show="user.reprint_bill"
                                            class="hideMeInPrint"
                                            style="width: 10%"
                                        >
                                            {{ __("Print") }}
                                        </th>
                                        <th
                                            class="d-none"
                                            style="width: 10%"
                                            v-show="user.pay_bill"
                                        >
                                            {{ __("Pay") }}
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="bill in bills"
                                        :key="bill.bill_no"
                                        @click="
                                            showBillDetails(bill.bill_type);
                                            selected = bill.bill_no;
                                        "
                                    >
                                        <td
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                            {{ bill.bill_no }}
                                        </td>
                                        <td
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                            {{ bill.bill_sum }}
                                        </td>
                                        <td
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                           ({{ bill.vat }}) {{ bill.bill_vat_val }}
                                        </td>
                                        <td
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                            {{ bill.bill_total }}
                                        </td>
                                        <td
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                            {{ bill.bill_discount }}
                                            <span
                                                v-if="
                                                    bill.bill_discount_percent
                                                "
                                                >%</span
                                            >
                                        </td>
                                        <td
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                            {{ bill.bill_paid_val }}
                                        </td>
                                        <td
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                            {{ bill.bill_remain_val }}
                                        </td>
                                        <td
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                            {{ bill.bill_date }}
                                        </td>
                                        <td
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                            {{
                                                bill.pay_methods
                                                    ? bill.pay_methods
                                                          .pay_method_name
                                                    : ""
                                            }}
                                        </td>

                                        <td
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                            {{
                                                bill.customer
                                                    ? bill.customer.cust_name
                                                    : ""
                                            }}
                                        </td>
                                        <td
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                            {{
                                                bill.user ? bill.user.name : ""
                                            }}
                                        </td>

                                        <td :title="bill.bill_notes " style="max-width: 100px"
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'selected'
                                                    : ''
                                            "
                                        >
                                            {{ bill.bill_notes }}
                                        </td>
                                        <td
                                            v-show="user.reprint_bill"
                                            :class="
                                                selected === bill.bill_no
                                                    ? 'hideMeInPrint selected'
                                                    : 'hideMeInPrint'
                                            "
                                        >
                                            <a
                                                class="btn btn-sm btn-success"
                                                @click="preparePrint(bill)"
                                            >
                                                <i
                                                    class="fa fa-print text-light"
                                                ></i>
                                            </a>
                                        </td>
                                        <td v-show="user.pay_bill">
                                            <button
                                                v-show="
                                                    bill.pay_methods.id === 3
                                                "
                                                type="button"
                                                class="btn btn-primary d-none"
                                                data-toggle="modal"
                                                data-target="#payModal"
                                            >
                                                {{ __("Pay") }}
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <p v-else class="text-center">
                                {{ __("No Data Yet") }}
                            </p>

                            <div
                                v-show="bills.length > 0"
                                class="row text-center"
                            >
                                <ul class="pagination justify-content-center">
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
                                            @click="nextPage(current_page - 1)"
                                            ><i class="fa fa-arrow-right"></i
                                        ></a>
                                    </li>
                                    <li
                                        class="page-item d-none"
                                        v-for="(i, index) in total"
                                        @click="nextPage(i)"
                                        :key="index"
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
                                            @click="nextPage(current_page + 1)"
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
                        <div
                            class="table-responsive"
                            style="height: 50vh"
                            v-show="user.bill_details"
                        >
                            <div class="row text-center">
                                <th class="col-1">{{ __("Code") }}</th>
                                <th class="col-2">{{ __("Type Name") }}</th>
                                <th class="col-1">{{ __("Count") }}</th>
                                <th class="col-1">{{ __("Sill Price") }}</th>
                                <th class="col-1">{{ __("Unit") }}</th>
                                <th class="col-1">{{ __("Total") }}</th>
                                <th class="col-5">{{ __("Notes") }}</th>
                            </div>
                            <div
                                v-for="type in billTypes"
                                :key="type.bill_type_id"
                                class="text-center row"
                            >
                                <td class="col-1">{{ type.type_id }}</td>
                                <td class="col-2">
                                    {{ type.type.type_name_ar }}
                                </td>
                                <td class="col-1">{{ type.type_count }}</td>
                                <td class="col-1">{{ type.type_price }}</td>
                                <td class="col-1">{{ type.units?type.units.unit.unit_ar_name:'-' }}</td>
                                <td class="col-1">
                                    {{ type.type_total_price }}
                                </td>
                                <td class="col-5">{{ type.type_note }}</td>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Pay Bill Dialog -->
                <div
                    v-if="bill != null"
                    class="modal fade"
                    id="payModal"
                    tabindex="-1"
                    role="dialog"
                    aria-labelledby="payModalLabel"
                    aria-hidden="true"
                >
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header text-center d-block">
                                <h5 class="modal-title" id="payModalLabel">
                                    {{ __("Pay bill") }} {{ bill.bill_no }}
                                </h5>
                            </div>
                            <div class="modal-body">
                                <form method="POST">
                                    <div id="invoice-POS" class="pos-section">
                                        <div
                                            id="top"
                                            style="text-align: center"
                                        >
                                            <div class="logo text-center">
                                                <img
                                                    :src="mixins.mixins_logo"
                                                    style="
                                                        width: 50px;
                                                        height: 50px;
                                                        border-radius: 50%;
                                                    "
                                                />
                                            </div>
                                            <div class="info">
                                                <span class="m-0">
                                                    {{ mixins.mixins_name }}
                                                </span>
                                            </div>
                                            <div class="info">
                                                <span class="m-0">
                                                    {{ mixins.contruct_no }}
                                                </span>
                                            </div>
                                            <div class="info">
                                                <span class="m-0">
                                                    {{ mixins.mixins_adress }}
                                                </span>
                                            </div>
                                            <div class="info">
                                                <span class="m-0">
                                                    {{ mixins.mixins_mobile }}
                                                </span>
                                            </div>
                                            <!--End Info-->
                                            <div
                                                v-if="bill.customer != null"
                                                class="text-center"
                                            >
                                                <small
                                                    v-if="
                                                        bill.customer
                                                            .cust_vat_num &&
                                                        mixins.mixins_vat_val >
                                                            0
                                                    "
                                                >
                                                    فاتورة ضريبية
                                                </small>
                                                <small
                                                    v-else-if="
                                                        mixins.mixins_vat_val >
                                                        0
                                                    "
                                                    >فاتورة ضريبية مبسطة</small
                                                >
                                            </div>
                                            <div v-else class="text-center">
                                                <small
                                                    v-if="
                                                        mixins.mixins_vat_val >
                                                            0 &&
                                                        mixins.contruct_no
                                                    "
                                                >
                                                    فاتورة ضريبية مبسطة</small
                                                >
                                            </div>
                                        </div>
                                    </div>
                                    <!--End InvoiceTop-->
                                    <table
                                        id="resultTable"
                                        class="text-center w-100"
                                    >
                                        <tr>
                                            <td colspan="1" class="no-border">
                                                رقم الفاتورة
                                            </td>
                                            <td colspan="3" class="no-border">
                                                {{ bill.bill_no }}
                                            </td>
                                        </tr>

                                        <tr>
                                            <td
                                                colspan="1"
                                                class="no-border"
                                                v-if="bill.user != null"
                                            >
                                                مستخدم النظام
                                            </td>
                                            <td
                                                colspan="3"
                                                class="no-border"
                                                v-if="bill.user != null"
                                            >
                                                {{ bill.user.name }}
                                            </td>
                                        </tr>

                                        <td colspan="4">
                                            <hr class="hr-line" />
                                        </td>
                                        <tr v-if="bill.customer">
                                            <td colspan="1" class="no-border">
                                                اسم العميل
                                            </td>
                                            <td colspan="3" class="no-border">
                                                {{ bill.customer.cust_name }}
                                            </td>
                                        </tr>
                                        <tr v-if="bill.customer">
                                            <td colspan="1" class="no-border">
                                                هاتف العميل
                                            </td>
                                            <td colspan="3" class="no-border">
                                                {{ bill.customer.cust_mobile }}
                                            </td>
                                        </tr>

                                        <tr
                                            v-if="
                                                bill.customer &&
                                                bill.customer.cust_address
                                            "
                                        >
                                            <td colspan="1" class="no-border">
                                                عنوان العميل
                                            </td>

                                            <td colspan="3" class="no-border">
                                                {{ bill.customer.cust_address }}
                                            </td>
                                        </tr>
                                        <tr
                                            v-if="
                                                bill.customer &&
                                                bill.customer.cust_vat_num
                                            "
                                        >
                                            <td colspan="1" class="no-border">
                                                الرقم الضريبي للعميل
                                            </td>
                                            <td colspan="3" class="no-border">
                                                {{ bill.customer.cust_vat_num }}
                                            </td>
                                        </tr>
                                        <tr v-if="bill.customer">
                                            <td colspan="1" class="no-border">
                                                رصيد العميل
                                            </td>

                                            <td colspan="3" class="no-border">
                                                {{ bill.customer.cust_balance }}
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="width: 10%">
                                                {{ __("Pay Methods") }}
                                            </td>
                                            <td style="width: 10%">
                                                <select
                                                    id="inputState"
                                                    v-model="pay"
                                                    class="form-control-sm text-center"
                                                >
                                                    <option selected>
                                                        {{
                                                            __(
                                                                "Choose Payment Type"
                                                            )
                                                        }}
                                                    </option>
                                                    <option
                                                        v-show="pay.id != 3"
                                                        v-for="(
                                                            pay, index
                                                        ) in payMethods"
                                                        :key="index"
                                                        :value="pay.id"
                                                    >
                                                        {{
                                                            pay.pay_method_name
                                                        }}
                                                    </option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button
                                    type="button"
                                    class="btn btn-secondary"
                                    data-dismiss="modal"
                                >
                                    Close
                                </button>
                                <button
                                    data-dismiss="modal"
                                    type="button"
                                    class="btn btn-primary d-none"
                                    @click="payBill()"
                                >
                                    {{ __("Pay") }}
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <Printer
                :bill="bill"
                :qr="qr"
                v-if="$root.$data.codies.printer_type === 1"
            />
            <A4Printer :bill="bill" :qr="qr" v-else />
        </div>
        <Security v-else></Security>
    </div>
</template>

<script>

import Printer from "../printer";
import Spinner from "../spinner/mixinsSpinner";
import Security from "../spinner/security";
import { Invoice } from "@axenda/zatca";
import A4Printer from "../A4Printer.vue";
import datePicker from "../date/index";
import "pc-bootstrap4-datetimepicker/build/css/bootstrap-datetimepicker.css";
import moment from "moment";

export default {
    components: { Printer, Spinner, Security, A4Printer, datePicker },

    async created() {
        if (!User.loggedIn()) {
            await this.$router.push("/");
        }
        await axios
            .get("/api/users/" + localStorage.getItem("user_id"))
            .then(({ data }) => (this.user = data))
            .catch((error) => console.log(error));
        this.reportPeriod.from = moment().add(-5, "days").format("yyyy-MM-DD");
        this.reportPeriod.to = moment().add(0, "days").format("yyyy-MM-DD");
        await this.allBills();
        await this.allPayMethods();
        this.reportPeriod.from = moment().add(-5, "days");
        this.reportPeriod.to = moment().add(0, "days");
    },
    data() {
        return {
            configs: {
                wrap: {
                    allowInputToggle: true,
                },
            },
            user: {},
            title: "Bills",
            payMethods: [],
            pay: "",
            bill_id: "",
            barcode: "",
            mixins: {},
            bill: null,
            bills: [],
            selected: "",
            searchTerm: "",
            period: false,
            qr: "",
            reportName: "",
            hideMe: false,
            total: 1,
            page: 1,
            isPrint: false,
            last_page: "",
            current_page: "",
            reportPeriod: {
                to: null,
                from: null,
            },
            billTypes: [],
            perPage: 25,
        };
    },

    methods: {
        async allPayMethods() {
            await axios
                .get("/api/payMethods")
                .then(({ data }) => (this.payMethods = data))
                .catch((error) => console.log(error));
        },
        async findBill() {
            await axios
                .get("api/action/findBillById/" + this.bill_id)
                .then(async ({ data }) => {
                    if (data.length >= 0) {
                        this.bills = data;
                    } else {
                        Notification.customMsg(
                            "warning",
                            "topRight",
                            "لا يوجد فاتورة بهذا الرقم"
                        );
                    }
                })
                .catch((err) => console.log(err));
        },
        async findBillByTypeId() {
            await axios
                .get("api/action/findBillWithTypeId/" + this.barcode)
                .then(async ({ data }) => {
                    this.bills = [];
                    data.bill_type.map((bill) => {
                        this.bills.push(bill.bill);
                    });
                })
                .catch((err) => console.log(err));
        },

        async print(bill) {
            this.bill = bill;
            if (this.bill != null) {
                const invoice = new Invoice({
                    sellerName: this.$root.$data.codies.mixins_name,
                    vatRegistrationNumber: this.$root.$data.codies.contruct_no,
                    invoiceTimestamp: this.bill.bill_date,
                    invoiceTotal: this.bill.bill_total,
                    invoiceVatTotal: this.bill.bill_vat_val,
                });
                this.qr = await invoice.render();
            }
        },
        async preparePrint(bill) {
            await this.print(bill);
            $("#btn").click();
        },
        nextPage(i) {
            this.page = i;
            this.allBills();
        },
        printMe() {
            this.$htmlToPaper("printMeReport");
        },
        payBill() {
            axios
                .get(
                    "/api/action/paybill/" + this.bill.bill_no + "/" + this.pay
                )
                .then(() => {
                    this.bill_id = this.bill.bill_no;
                    this.findBill();
                    Notification.success();
                })
                .catch((error) => (this.errors = error.response.data.errors));
        },
        allBills() {
            axios
                .get(
                    "/api/bill/report/" +
                        this.period +
                        "/" +
                        this.reportPeriod.from +
                        "/" +
                        this.reportPeriod.to +
                        "/" +
                        this.perPage +
                        "?page=" +
                        this.page
                )
                .then(({ data }) => {
                    if (data.data.length >= 0) {
                        this.loading = false;
                        this.total = parseInt(data.total / data.per_page);
                        this.current_page = data.current_page;
                        this.last_page = data.last_page;
                        this.bills = data.data;
                    }
                })
                .catch((error) => console.log(error));
        },
        showBillDetails(bill) {
            this.billTypes = bill;
        },
    },
};
</script>
<style>
@media print {
    .hideMeInPrint {
        display: none;
    }
}
</style>
