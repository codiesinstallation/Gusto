<template>
    <div v-if="bill && mixins">
        <a
            id="btn"
            class="btn btn-info text-light d-none"
            data-target="#printModal"
            data-toggle="modal"
            ><i class="fas fa-ellipsis-v"></i
        ></a>
        <div
            id="printModal"
            aria-hidden="true"
            aria-labelledby="printModal"
            class="modal fade"
            role="dialog"
            tabindex="-1"
        >
            <div
                class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                role="document"
            >
                <div
                    class="modal-content m-auto"
                    style="height: 750px; direction: rtl"
                >
                    <div class="modal-header">
                        <button
                            aria-label="Close"
                            class="close"
                            data-dismiss="modal"
                            type="button"
                        >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div id="printMe" class="modal-body">
                        <div class="pos-section">
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
                            <div class="pos_title pos">
                                <span> {{ mixins.mixins_name }} </span>
                            </div>
                            <div class="place pos">
                                <span> {{ mixins.mixins_adress }} </span>
                            </div>
                            <div class="contruct_no pos">
                                <span>{{ mixins.contruct_no }} </span>
                            </div>
                            <div class="contruct_no_det pos  d-none">
                            </div>
                            <div class="phone pos">
                                <span>{{ mixins.mixins_mobile }} </span>
                            </div>

                            <div class="hr-container pos">
                                <hr class="hr-line" />
                            </div>

                            <div
                                v-if="bill.customer"
                                class="cust-name pos-info"
                            >
                                <span>{{ bill.customer.cust_name }}</span>
                            </div>

                            <div
                                v-if="bill.customer"
                                class="cust-mobile pos-info"
                            >
                                <span>{{ bill.customer.cust_mobile }}</span>
                            </div>
                            <div
                                v-if="bill.customer"
                                class="cust-balance pos-info"
                            >
                                <span
                                    >رصيد العميل :
                                    {{ bill.customer.cust_balance }}
                                    {{ mixins.currency.currency_name }}</span
                                >
                            </div>
                            <div
                                v-if="bill.customer != null"
                                class="pos-vat-type pos"
                            >
                                <span
                                    v-if="
                                        bill.customer.cust_vat_num &&
                                        mixins.mixins_vat_val > 0
                                    "
                                >
                                    فاتورة ضريبية
                                </span>
                                <span v-else-if="mixins.mixins_vat_val > 0"
                                    >فاتورة ضريبية مبسطة</span
                                >
                            </div>
                            <div v-else class="pos-vat-type pos">
                                <span v-if="mixins.mixins_vat_val > 0">
                                    فاتورة ضريبية مبسطة</span
                                >
                            </div>
                            <div
                                class="paymethod pos-info"
                                v-if="bill.pay_methods != null"
                            >
                                <span
                                    >طريقة الدفع :
                                    {{ bill.pay_methods.pay_method_name }}</span
                                >
                            </div>
                            <div class="user pos-info" v-if="bill.user != null">
                                <span>مستخدم : {{ bill.user.name }}</span>
                            </div>

                            <div class="date pos-info">
                                <span
                                    >تاريخ :
                                    {{
                                        moment(bill.bill_date).format(
                                            "DD-MM-YYYY"
                                        )
                                    }}</span
                                >
                            </div>
                            <div class="bill-no pos-info">
                                <span>رقم الفاتورة: {{ bill.bill_no }} </span>
                            </div>
                            <div
                                style="
                                    top: 56.5mm;
                                    position: absolute;
                                    width: 63mm;
                                "
                            >
                                <hr class="hr-line" />
                            </div>
                            <div
                                style="
                                    top: 62.5mm;
                                    position: absolute;
                                    width: 63mm;
                                "
                            >
                                <hr class="hr-line" />
                            </div>

                            <div class="pos-details">
                                <div class="items">
                                    <div class="item">الصنف</div>
                                    <div class="count">العدد</div>

                                    <div class="price">العملية</div>
                                    <div class="total_price">الاجمالي</div>
                                </div>
                            </div>
                            <div class="items-list">
                                <div
                                    class="items"
                                    v-for="(type, index) in bill.bill_type"
                                    :key="index"
                                >
                                    <div class="item">
                                        {{ type.type.type_name_ar }}
                                    </div>
                                    <div class="count">
                                        {{ type.type_count }}
                                    </div>
                                    <div class="price">
                                        {{ type.units.unit.unit_ar_name }}
                                    </div>

                                    <div class="total_price">
                                        {{ type.type_total_price }}
                                    </div>
                                </div>

                                <div class="items" style="width: 63mm">
                                    <hr class="hr-line" />
                                </div>

                                <div class="sum">
                                    <div class="sum_info items">
                                        <span class="sum_title"
                                            >المجموع :</span
                                        >
                                        <span class="sum_amount">
                                            {{ bill.bill_sum }}</span
                                        >
                                        <span class="ex"></span>
                                    </div>

                                    <div
                                        class="sum_info items"
                                        v-if="bill.bill_extra > 0"
                                    >
                                        <span class="sum_title">اضافي:</span>
                                        <span class="sum_amount">
                                            {{ bill.bill_extra }}</span
                                        >
                                        <span class="ex"></span>
                                    </div>
                                    <div
                                        class="sum_info items"
                                        v-if="bill.bill_discount > 0"
                                    >
                                        <span class="sum_title"
                                            >خصم
                                            {{ bill.bill_discount_percent }}
                                            %:</span
                                        >
                                        <span class="sum_amount">
                                            {{ bill.bill_discount }}</span
                                        >
                                        <span class="ex"></span>
                                    </div>
                                    <div class="sum_info items" v-if="bill.bill_vat_val > 0">
                                        <span class="sum_title"
                                            >ضريبة القيمة المضافة ({{
                                                mixins.mixins_vat_val
                                            }}%):</span
                                        >
                                        <span class="sum_amount">{{
                                            bill.bill_vat_val
                                        }}</span>
                                        <span class="ex"></span>
                                    </div>
                                    <div class="sum_info items">
                                        <span class="sum_title"
                                            >الاجمالي :</span
                                        >
                                        <span class="sum_amount">{{
                                            bill.bill_total
                                        }}</span>
                                        <span class="ex"></span>
                                    </div>

                                    <div
                                        class="sum_info items"
                                        v-if="
                                            bill.bill_paid_val !=
                                            bill.bill_total
                                        "
                                    >
                                        <span class="sum_title">المدفوع</span>
                                        <span class="sum_amount">{{
                                            bill.bill_paid_val
                                        }}</span>
                                        <span class="ex"></span>
                                    </div>
                                    <div
                                        class="sum_info items"
                                        v-if="bill.bill_remain_val != 0"
                                    >
                                        <span class="sum_title">المتبقي</span>
                                        <span class="sum_amount">{{
                                            bill.bill_remain_val
                                        }}</span>
                                        <span class="ex"></span>
                                    </div>

                                    <div class="items" style="width: 63mm">
                                        <hr class="hr-line" />
                                    </div>

                                    <div class="notes">
                                        <div
                                            v-if="
                                                mixins.mixins_name != null &&
                                                !mixins.mixins_name.isEmpty &&
                                                mixins.contruct_no != null
                                            "
                                            class="text-center"
                                        >
                                            <img :src="qr" />
                                        </div>
                                        <div class="note">{{mixins.mixins_note}}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer text-center">
                        <button
                            id="print"
                            class="btn btn-secondary"
                            data-dismiss="modal"
                            type="button"
                        >
                            إغلاق
                        </button>
                        <button
                            id="printer"
                            class="btn btn-success"
                            @click="print()"
                        >
                            طباعة
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { Invoice } from "@axenda/zatca";
import moment from "moment";

export default {
    async created() {
        await this.getMixins();
    },
    props: ["bill", "qr"],
    data() {
        return {
            isDone: false,
            mixins: {},
            moment: moment,
        };
    },
    methods: {
        async getMixins() {
            await axios
                .get("/api/mixins/1")
                .then(({ data }) => {
                    this.mixins = data;
                })
                .catch((error) => console.log(error));
        },
        print() {
            //for (var count = 0; count < 3; count++) {
            this.$htmlToPaper("printMe");

            //}
        },
    },
};
</script>

<style scoped>
.pos-section {
    width: 63mm;
    height: 200mm;
    border: solid gray 1px;
    position: absolute;
    direction: rtl;
}
.pos_title {
    text-align: center;
    align-items: center;
    width: 100%;
    top: 6mm;
    position: absolute;
}
.pos-vat-type {
    top: 36.5mm;
}
span {
    font-size: 10px;
}
.pos {
    position: absolute;
    text-align: center;
    width: 100%;
}
.pos-info {
    position: absolute;
    width: 100%;
}
.place {
    top: 12mm;
}

.contruct_no {
    top: 18mm;
}

.contruct_no_det {
    top: 21.5mm;
}
.pos_title2 {
    top: 24.7mm;
}
.phone {
    top: 27.51mm;
}
.email {
    top: 30.7mm;
}
.hr-container {
    top: 33.514mm;
}
.hr-line {
    position: relative;
    width: 100%;
    border-top: 1px dashed #322f32;
}
.cust-name {
    top: 39.86mm;
    right: 5mm;
}
.cust-mobile {
    top: 43mm;
    right: 5mm;
}
.cust-balance {
    top: 43mm;
    right: 37mm;
}
.paymethod {
    top: 46.5mm;
    right: 5mm;
}
.user {
    top: 46.5mm;
    right: 37mm;
}
.date {
    top: 50mm;
    right: 5mm;
}
.bill-no {
    top: 53.5mm;
    right: 5mm;
}
.pos-details {
    position: absolute;
    top: 60mm;
    font-size: 10px;
    padding: 10px;
}
.items-list {
    position: absolute;
    top: 67mm;
    font-size: 10px;
}
.items {
    height: 3.5mm;

}
.item {
    position: absolute;
    width: 30mm;
        padding-right: 5px;
}
.count {
    position: absolute;
    width: 10mm;
    right: 30mm;
    text-align: center;
}
.price {
    position: absolute;
    right: 43mm;
    text-align: center;
    width: 10mm;
}
.total_price {
    position: absolute;
    right: 54mm;
    width: 8mm;
    text-align: center;
}

.sum {
    position: absolute;
}
.sum_title {
    right: 5mm;
    position: absolute;
    width: 32mm;
}
.sum_amount {
    position: absolute;
    right: 33mm;
    width: 12mm;
    text-align: right;
}
.ex {
    position: absolute;
    right: 50mm;
    width: 12mm;
    text-align: right;
}
.notes {
    position: absolute;
}
.note {
    text-align: center;
    width: 63mm;
    height: 4mm;
}
</style>
