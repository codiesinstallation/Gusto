<template>
    <div class="col-12">
        <div v-if="user.settings">
            <form @keydown.enter.prevent enctype="multipart/form-data" @submit.prevent="saveChanges">
                <div class="card">
                    <div
                        class="card-header"
                    >
                        <h6 class="font-weight-bold text-primary float-right d-inline">
                            الاعدادات الأساسية
                        </h6>
                        <button type="submit" class="btn btn-primary float-left">
                            حفظ
                        </button>
                    </div>

                    <div class="row">
                        <div class="col-lg-4">
                            <!-- Form Basic -->
                            <div class="card mb-4">
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                                >
                                    <h6
                                        class="m-0 font-weight-bold text-primary"
                                    >
                                        بيانات النظام
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>اسم المؤسسة </label>
                                        <input
                                            type="text"
                                            class="form-control-sm"
                                            v-model="mixins.mixins_name"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <label>عنوان المؤسسة</label>
                                        <input
                                            type="text"
                                            class="form-control-sm"
                                            v-model="mixins.mixins_adress"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <label> الاسم انجليزي</label>
                                        <input
                                            type="text"
                                            class="form-control-sm"
                                            v-model="mixins.mixins_name_en"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <label>العنوان انجليزي</label>
                                        <input
                                            type="text"
                                            class="form-control-sm"
                                            v-model="mixins.mixins_adress_en"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="custom-file mt-5">
                                                    <input
                                                        type="file"
                                                        class="custom-file-input"
                                                        @change="onFileSelected"
                                                    />
                                                    <label
                                                        class="custom-file-label"
                                                        >شعار المؤسسة</label
                                                    >
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <img
                                                    v-if="mixins_new_logo"
                                                    :src="
                                                        mixins.mixins_new_logo
                                                    "
                                                    style="
                                                        height: 170px;
                                                        width: 170px;
                                                    "
                                                />
                                                <img
                                                    v-else
                                                    :src="mixins.mixins_logo"
                                                    style="
                                                        height: 170px;
                                                        width: 170px;
                                                    "
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>هاتف المؤسسة </label>
                                        <input
                                            type="text"
                                            class="form-control-sm"
                                            v-model="mixins.mixins_mobile"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <label> عرض الشعار </label>
                                        <input
                                            type="number"
                                            class="form-control-sm"
                                            v-model="mixins.logo_width"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <label> طول الشعار </label>
                                        <input
                                            type="number"
                                            class="form-control-sm"
                                            v-model="mixins.logo_height"
                                        />
                                    </div>

                                    <div class="form-group">
                                        <label>العملة</label>
                                        <select
                                            v-model="mixins.currency"
                                            class="form-select"
                                        >
                                            <option
                                                v-for="(
                                                    currency, index
                                                ) in currencies"
                                                :key="index"
                                                :value="currency"
                                            >
                                                {{ currency.currency_ar }}
                                            </option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>وقت الاغلاق اليومي </label>
                                        <select
                                            v-model="mixins.closure_hour"
                                            class="form-select"
                                        >
                                            <option
                                                v-for="(h, index) in 23"
                                                :key="index"
                                                :value="h"
                                            >
                                                {{
                                                    h < 12
                                                        ? h + " AM"
                                                        : (h - 12 == 0
                                                              ? "12"
                                                              : h - 12) + " PM"
                                                }}
                                            </option>
                                            <option value="00">12 AM</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>ملاحظات </label>
                                        <textarea
                                            class="form-control"
                                            v-model="mixins.mixins_note"
                                            rows="3"
                                        ></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                                >
                                    <h6
                                        class="m-0 font-weight-bold text-primary"
                                    >
                                        بيانات الضريبة
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="form-group d-none">
                                        <div
                                            class="custom-control custom-switch"
                                        >
                                            <input
                                                type="checkbox"
                                                class="custom-control-input"
                                                id="processBills"
                                                v-model="mixins.process_bills"
                                            />
                                            <label
                                                class="custom-control-label"
                                                for="processBills"
                                                >معالجة الفواتير</label
                                            >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div
                                            class="custom-control custom-switch"
                                        >
                                            <input
                                                type="checkbox"
                                                class="custom-control-input"
                                                id="fixed_vat"
                                                v-model="mixins.fixed_vat"
                                            />
                                            <label
                                                class="custom-control-label"
                                                for="fixed_vat"
                                                >ضريبة ثابتة على كل
                                                الاصناف</label
                                            >
                                        </div>
                                    </div>
                                    <div
                                        v-show="mixins.fixed_vat"
                                        class="form-group"
                                    >
                                        <div
                                            class="custom-control custom-switch"
                                        >
                                            <input
                                                type="checkbox"
                                                class="custom-control-input"
                                                id="mixins_price_include_vat"
                                                v-model="
                                                    mixins.mixins_price_include_vat
                                                "
                                            />
                                            <label
                                                class="custom-control-label"
                                                for="mixins_price_include_vat"
                                                >الاسعار شاملة الضريبة</label
                                            >
                                        </div>
                                    </div>
                                    <div
                                        v-show="mixins.fixed_vat"
                                        class="form-group"
                                    >
                                        <label>نسبة الضريبة </label>
                                        <input
                                            type="text"
                                            class="form-control-sm"
                                            v-model="mixins.mixins_vat_val"
                                        />
                                    </div>

                                    <div class="form-group">
                                        <label>الرقم الضريبي </label>
                                        <input
                                            type="text"
                                            class="form-control-sm"
                                            v-model="mixins.contruct_no"
                                        />
                                    </div>
                                </div>
                            </div>
                            <!-- Input Group -->

                            <div class="card mb-3">
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                                >
                                    <h6
                                        class="m-0 font-weight-bold text-primary"
                                    >
                                        اعدات البرنامج
                                    </h6>
                                </div>

                                <div class="card-body">

                                    <div class="form-group">
                                        <div class="form-group">
                                            <label> تعدد(jsPrint)</label>
                                            <select
                                                class="form-select"
                                                v-model="jsPrint"
                                            >
                                                <option value="1">
                                                    JsSetup
                                                </option>
                                                <option value="2">
                                                    JSPrintManager
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>الدولة</label>
                                        <select
                                            class="form-select"
                                            v-model="mixins.country"
                                        >
                                            <option value="1">مصر</option>
                                            <option value="2">السعودية</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-4">
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                                >
                                    <h6
                                        class="m-0 font-weight-bold text-primary"
                                    >
                                        بيانات الايميل
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="form-group d-none">
                                        <div class="form-group">
                                            <label> الايميل المرسل منه</label>
                                            <input
                                                type="email"
                                                class="form-control-sm"
                                                v-model="mixins.email_from"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label> الايميل المرسل له</label>
                                        <input
                                            type="email"
                                            class="form-control-sm"
                                            v-model="mixins.email_to"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <label>وقت ارسال التقرير</label>
                                        <input
                                            type="time"
                                            class="form-control-sm"
                                            v-model="mixins.send_time"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                                >
                                    <h6
                                        class="m-0 font-weight-bold text-primary"
                                    >
                                        شاشة الفاتورة
                                    </h6>
                                </div>

                                <div class="card-body">
                                    <div
                                        class="form-group"
                                    >
                                        <div
                                            class="custom-control custom-switch"
                                        >
                                            <input
                                                type="checkbox"
                                                class="custom-control-input"
                                                id="bill_with_main_type"
                                                v-model="
                                                    mixins.bill_with_main_type
                                                "
                                            />
                                            <label
                                                class="custom-control-label"
                                                for="bill_with_main_type"
                                                >أصناف رئيسية</label
                                            >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>عدد نسخ الفاتورة</label>
                                        <select
                                            v-model="mixins.printer_count"
                                            class="form-select"
                                            @change="setCopy()"
                                        >
                                            <option value="0">0</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                    <div
                                        class="form-group"
                                    >
                                        <div
                                            class="custom-control custom-switch"
                                        >
                                            <input
                                                type="checkbox"
                                                class="custom-control-input"
                                                id="use_type_uints"
                                                v-model="mixins.use_type_uints"
                                            />
                                            <label
                                                class="custom-control-label"
                                                for="use_type_uints"
                                                >تفعيل الوحدات
                                            </label>
                                        </div>
                                    </div>
                                    <div
                                        class="form-group"
                                    >
                                        <label> نوع الطابعة </label>
                                        <select
                                            class="form-select"
                                            v-model="mixins.printer_type"
                                        >
                                            <option value="1">حرارية</option>
                                            <option value="2">A4</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <div
                                            class="custom-control custom-switch"
                                        >
                                            <input
                                                type="checkbox"
                                                class="custom-control-input"
                                                id="show_side_menu"
                                                v-model="mixins.show_side_menu"
                                            />
                                            <label
                                                class="custom-control-label"
                                                for="show_side_menu"
                                                >عرض القائمة الجانبية</label
                                            >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div
                                            class="custom-control custom-switch"
                                        >
                                            <input
                                                type="checkbox"
                                                class="custom-control-input"
                                                id="pretty"
                                                v-model="mixins.pretty"
                                            />
                                            <label
                                                class="custom-control-label"
                                                for="pretty"
                                                >عرض الاصناف الرئيسية كقائمة</label
                                            >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div
                                            class="custom-control custom-switch"
                                        >
                                            <input
                                                type="checkbox"
                                                class="custom-control-input"
                                                id="as_card"
                                                v-model="mixins.as_card"
                                            />
                                            <label
                                                class="custom-control-label"
                                                for="as_card"
                                                >عرض أصناف الفاتورة كبطاقة
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>
                                            عدد أصناف فاتورة البيع في الصف
                                            الواحد
                                        </label>
                                        <select
                                            v-model="mixins.count_in_row_bill"
                                            class="form-select"
                                        >
                                            <option value="col-12">1</option>
                                            <option value="col-6">2</option>
                                            <option value="col-4">3</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>
                                            عدد أصناف الصنف الرئيسي في الصف
                                            الواحد
                                        </label>
                                        <select
                                            v-model="mixins.count_in_row_main"
                                            class="form-select"
                                        >
                                            <option value="col-12">1</option>
                                            <option value="col-6">2</option>
                                            <option value="col-4">3</option>
                                            <option value="col-3">4</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-3">
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                                >
                                    <h6
                                        class="m-0 font-weight-bold text-primary"
                                    >
                                        العروض
                                    </h6>
                                </div>

                                <div class="card-body">
                                    <div class="form-group">
                                        <div
                                            class="custom-control custom-switch"
                                        >
                                            <input
                                                type="checkbox"
                                                class="custom-control-input"
                                                id="active_type_offer"
                                                v-model="
                                                    mixins.active_type_offer
                                                "
                                            />
                                            <label
                                                class="custom-control-label"
                                                for="active_type_offer"
                                            >
                                                تفعيل عرض على صنف</label
                                            >
                                        </div>
                                    </div>
                                    <h6
                                        class="mr-auto text-center font-weight-bold text-primary"
                                    >
                                        عروض لفترة محددة
                                    </h6>

                                    <div class="form-group">
                                        <div
                                            class="custom-control custom-switch"
                                        >
                                            <input
                                                type="checkbox"
                                                class="custom-control-input"
                                                id="active_offer"
                                                v-model="mixins.active_offer"
                                            />
                                            <label
                                                class="custom-control-label"
                                                for="active_offer"
                                            >
                                                تفعيل العروض</label
                                            >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>تاريخ بداية العرض</label>
                                        <input
                                            type="date"
                                            class="form-control-sm"
                                            v-model="mixins.offer_start_date"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <label>تاريخ نهاية العرض</label>
                                        <input
                                            type="date"
                                            class="form-control-sm"
                                            v-model="mixins.offer_end_date"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <label>قيمة العرض</label>
                                        <input
                                            type="number"
                                            min="0"
                                            :readonly="
                                                mixins.offer_percenet > 0
                                            "
                                            class="form-control-sm d-none"
                                            v-model="mixins.offer_value"
                                        />
                                    </div>
                                    <div class="form-group">
                                        <label>نسبة العرض</label>
                                        <input
                                            type="number"
                                            min="0"
                                            :readonly="mixins.offer_value > 0"
                                            class="form-control-sm"
                                            v-model="mixins.offer_percenet"
                                        />
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </form>
        </div>
        <Security v-else></Security>
    </div>
</template>

<script>
import Security from "../spinner/security";
import Spinner from "../spinner/mixinsSpinner";
import Cookie from "../../Helpers/Cookie";

export default {
    components: { Security, Spinner },

    async created() {
        if (!User.loggedIn()) {
            await this.$router.push("/");
        }
        this.jsPrint = localStorage.getItem("jsPrint");

        await axios
            .get("/api/users/" + localStorage.getItem("user_id"))
            .then(({ data }) => (this.user = data))
            .catch((error) => console.log(error));

        let id = this.$route.params.id;
        axios
            .get("/api/mixins/" + 1)
            .then(({ data }) => (this.mixins = data))
            .catch((err) => console.log(err));
        axios
            .get("/api/currency")
            .then(({ data }) => (this.currencies = data))
            .catch((err) => console.log(err));
        this.copy = Cookie.getCookie("copy");
    },
    data() {
        return {
            user: {},
            jsPrint: "",
            isShow: "",
            copy: Cookie.getCookie("copy"),
            mixins: {},
            mixins_new_logo: "",
            currencies: [],
        };
    },
    methods: {

        onFileSelected(event) {
            let file = event.target.files[0];
            if (file.size > 1048770) {
                Notification.image_validation();
            } else {
                let reader = new FileReader();
                reader.onload = (event) => {
                    this.mixins.mixins_new_logo = event.target.result;
                    this.mixins_new_logo = event.target.result;
                    console.log(event.target.result);
                };
                reader.readAsDataURL(file);
            }
        },
        saveChanges() {
            localStorage.setItem("jsPrint", this.jsPrint);

            let id = 1;
            axios
                .patch("/api/mixins/" + id, this.mixins)
                .then(async () => {
                    //   await this.$router.push({ name: "/" });
                    await location.reload(true);
                    Notification.success();
                })
                .catch((error) => (this.errors = error.response.data.errors));
        },
        showDropDown() {
            this.isShow = !this.isShow;
        },
        changeLang() {
            localStorage.setItem("lang", this.mixins.default_lang);
            Cookie.setCookie("locale", this.mixins.default_lang, 30);
        },
        setCopy() {
            localStorage.setItem("copy", this.copy);
            Cookie.setCookie("copy", this.copy, 30);
        },
    },
};
</script>
<style scoped>
input {
    min-width: 100%;
}
</style>
