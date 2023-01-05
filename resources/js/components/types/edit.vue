<template>
    <div>
        <div v-if="user.edit_type" class="row justify-content-center">
            <div v-if="haveRole" class="row justify-content-center">
                <div class="col-md-9">
                    <div class="card shadow-sm">
                        <div class="card-body p-0">
                            <form @keydown.enter.prevent
                                class="types"
                                dir="rtl"
                                enctype="multipart/form-data"
                                @submit.prevent="update"
                            >
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                                >
                                    <a
                                        class="btn btn-warning text-light"
                                        @click="$router.go(-1)"
                                    >
                                        <i
                                            :class="
                                                $root.$data.codies
                                                    .default_lang == 'ar'
                                                    ? 'fa fa-arrow-right'
                                                    : 'fa fa-arrow-left'
                                            "
                                        ></i>
                                    </a>
                                    <h6
                                        class="m-0 font-weight-bold text-primary"
                                    >
                                        ادخال بيانات الصنف
                                    </h6>
                                    <button
                                        class="btn btn-primary"
                                        type="submit"
                                    >
                                        حفظ
                                    </button>
                                </div>
                                <div class="card-body">
                                    <div class="input-group mb-3">
                                        <div class="file-input img_file">
                                            <input
                                                type="file"
                                                name="file-input"
                                                id="file-input"
                                                class="file-input__input"
                                                @change="onFileSelected"
                                            />
                                            <label
                                                class="file-input__label"
                                                for="file-input"
                                            >
                                                <i class="fa fa-upload"></i>
                                                <span>Upload file</span></label
                                            >
                                        </div>

                                        <img
                                            v-if="newphoto"
                                            :src="newphoto"
                                            class="card-img-top w-25 h-25 m-auto"
                                        />
                                        <img
                                            v-else
                                            :src="'/' + type.type_icon"
                                            class="card-img-top w-25 h-25 m-auto"
                                        />
                                    </div>

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"
                                                >اسم الصنف عربي</span
                                            >
                                        </div>
                                        <input
                                            onClick="this.select();"
                                            v-model="type.type_name_ar"
                                            aria-describedby="basic-addon1"
                                            aria-label="اسم الصنف عربي"
                                            class="form-control"
                                            placeholder="اسم الصنف عربي"
                                            type="text"
                                            required
                                        />
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"
                                                >اسم الصنف انجليزي</span
                                            >
                                        </div>
                                        <input
                                            onClick="this.select();"
                                            v-model="type.type_name_en"
                                            aria-describedby="basic-addon1"
                                            aria-label="اسم الصنف انجليزي"
                                            class="form-control"
                                            placeholder="اسم الصنف انجليزي"
                                            type="text"
                                        />
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    سعر التكلفة</span
                                                >
                                            </div>
                                            <input
                                                onClick="this.select();"
                                                v-model="
                                                    type.type_purchases_price
                                                "
                                                aria-describedby="basic-addon1"
                                                aria-label="سعر التكلفة"
                                                class="form-control"
                                                placeholder="سعر التكلفة"
                                                type="number"
                                            />
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"
                                                    >سعر البيع</span
                                                >
                                            </div>
                                            <input
                                                onClick="this.select();"
                                                v-model="type.type_sill_price"
                                                aria-describedby="basic-addon1"
                                                aria-label="سعر البيع"
                                                class="form-control"
                                                placeholder="سعر البيع"
                                                type="number"
                                                min="0"
                                                step="0.1"
                                                required
                                            />
                                            <div
                                                class="input-group-prepend d-none"
                                            >
                                                <span class="input-group-text">
                                                    أقل سعر البيع</span
                                                >
                                            </div>
                                            <input
                                                onClick="this.select();"
                                                v-model="
                                                    type.minimum_sill_price
                                                "
                                                aria-describedby="basic-addon1"
                                                aria-label="أقل سعر البيع "
                                                class="form-control d-none"
                                                placeholder="أقل سعر البيع"
                                                type="number"
                                                min="0"
                                                step="0.1"
                                            />
                                        </div>
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                التصنيف</span
                                            >
                                        </div>
                                        <select
                                            v-model="type.main_type"
                                            class="form-control-sm w-25"
                                        >
                                            <option
                                                v-for="(cat, i) in categories"
                                                :value="cat.main_type_id"
                                                :key="i"
                                            >
                                                {{ cat.main_type_title_ar }}
                                            </option>
                                        </select>
                                    </div>

                                    <div class="input-group mb-3 d-none">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                الباركود الدولي</span
                                            >
                                        </div>
                                        <input
                                            onClick="this.select();"
                                            v-model="type.type_barcode"
                                            aria-describedby="basic-addon1"
                                            aria-label="  الباركود الدولي"
                                            class="form-control"
                                            placeholder="  الباركود الدولي"
                                            type="text"
                                        />
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"
                                                >كود مختصر</span
                                            >
                                        </div>
                                        <input
                                            onClick="this.select();"
                                            v-model="type.type_code"
                                            aria-describedby="basic-addon1"
                                            aria-label="كود مختصر"
                                            class="form-control"
                                            placeholder=" كود مختصر"
                                            type="text"
                                        />
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"
                                                >قيمة الخصم</span
                                            >
                                        </div>
                                        <input
                                            onClick="this.select();"
                                            v-model="type.type_discount_value"
                                            aria-describedby="basic-addon1"
                                            aria-label="قيمة الخصم"
                                            class="form-control"
                                            placeholder=" قيمة الخصم"
                                            type="number"
                                            min="0"
                                            step="0.1"
                                        />

                                        <div
                                            :class="
                                                $root.$data.codies.fixed_vat
                                                    ? 'd-none'
                                                    : 'input-group-prepend'
                                            "
                                        >
                                            <span class="input-group-text"
                                                >نسبة الضريبة</span
                                            >
                                        </div>
                                        <input
                                            onClick="this.select();"
                                            v-model="type.type_vat_percent"
                                            aria-describedby="basic-addon1"
                                            aria-label="نسبة الضريبة "
                                            :class="
                                                $root.$data.codies.fixed_vat
                                                    ? 'd-none'
                                                    : 'form-control'
                                            "
                                            placeholder="نسبة الضريبة"
                                            type="number"
                                            min="0"
                                            step="0.1"
                                        />
                                    </div>
                                    <div class="card">
                                        <div
                                            class="card-header d-flex flex-row align-items-center justify-content-between"
                                        >
                                            <table
                                                class="table-bordered text-center w-50"
                                            >
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%">
                                                            العملية
                                                        </th>
                                                        <th style="width: 10%">
                                                            السعر
                                                        </th>
                                                            <th>اعدادات</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr
                                                        class="text-center"
                                                        v-for="(
                                                            selected, index
                                                        ) in type.units"
                                                        :key="index"
                                                    >
                                                        <td>
                                                            {{
                                                                selected.unit
                                                                    .unit_ar_name
                                                            }}
                                                        </td>
                                                        <td>
                                                            <input
                                                                class="form-control"
                                                                    type="text"
                                                                    name=""
                                                                    v-model="
                                                                        selected.price
                                                                    "
                                                                    id=""
                                                                />
                                                            </td>
                                                        <td style="width: 5%">
                                                             <i
                                                                    @click="
                                                                        deleteUnit(
                                                                            selected.type_unit_id
                                                                        )
                                                                    "
                                                                    class="pointer btn-sm btn-danger fa fa-times"
                                                                ></i>

                                                                <i
                                                                    @click="
                                                                        UpdateUnit(
                                                                            selected
                                                                        )
                                                                    "
                                                                    class="pointer btn-sm btn-success fa fa-save"
                                                                ></i>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                            <div class="input-group-prepend">
                                                <a
                                                    class="btn btn-sm btn-success"
                                                    @click="addUnit()"
                                                >
                                                    اضافة عملية الصنف
                                                    <i class="fa fa-plus"></i>
                                                </a>
                                            </div>
                                            <div class="input-group-prepend">
                                                <span
                                                    class="input-group-text btn btn-sm"
                                                    for="selectUnit"
                                                >
                                                    العملية الافتراضية</span
                                                >
                                                <select
                                                    id="selectUnit"
                                                    style="width: 150px"
                                                    v-model="type.sell_unit"
                                                >
                                                    <option
                                                        :key="index"
                                                        v-for="(
                                                            selected, index
                                                        ) in type.units"
                                                        :value="selected"
                                                        :selcted="
                                                            type.sell_unit ===
                                                            selected
                                                        "
                                                    >
                                                        {{
                                                            selected.unit
                                                                .unit_ar_name
                                                        }}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="card-body">
                                            <table
                                                class="table-bordered text-center"
                                                v-show="
                                                    selected_units.length > 0
                                                "
                                            >
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%">
                                                            العملية
                                                        </th>
                                                        <th style="width: 10%">
                                                            السعر
                                                        </th>
                                                        <th>X</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr
                                                        class="text-center"
                                                        v-for="(
                                                            selected, index
                                                        ) in selected_units"
                                                        :key="index"
                                                    >
                                                        <td>
                                                            <select
                                                                class="form-control-sm"
                                                                v-model="
                                                                    selected.unit_id
                                                                "
                                                                @change="
                                                                    onChangeCountCalcPrice(
                                                                        selected
                                                                    )
                                                                "
                                                            >
                                                                <option
                                                                    v-for="(
                                                                        unit, i
                                                                    ) in units"
                                                                    :value="
                                                                        unit
                                                                    "
                                                                    :key="i"
                                                                >
                                                                    {{
                                                                        unit.unit_ar_name
                                                                    }}
                                                                </option>
                                                            </select>
                                                        </td>

                                                        <td>
                                                            <input
                                                                onClick="this.select();"
                                                                class="form-control-sm"
                                                                v-model="
                                                                    selected.price
                                                                "
                                                                type="number"
                                                                min="0"
                                                                step="0.1"
                                                            />
                                                        </td>

                                                        <td
                                                            @click="
                                                                removeUnit(
                                                                    selected,
                                                                    index
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="pointer btn-sm btn-danger fa fa-times"
                                                            ></i>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend d-none">
                                            <span class="input-group-text"
                                                >مكان الصنف</span
                                            >
                                        </div>
                                        <input
                                            onClick="this.select();"
                                            v-model="type.type_location"
                                            aria-describedby="basic-addon1"
                                            aria-label="مكان الصنف"
                                            class="form-control d-none"
                                            placeholder="مكان الصنف"
                                            type="text"
                                        />
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"
                                                >ملاحظــــات الصنف</span
                                            >
                                        </div>
                                        <input
                                            onClick="this.select();"
                                            v-model="type.type_note"
                                            aria-describedby="basic-addon1"
                                            aria-label="ملاحظــــات الصنف"
                                            class="form-control"
                                            placeholder="ملاحظــــات الصنف"
                                            type="text"
                                        />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div v-else><Security></Security></div>
    </div>
</template>

<script type="text/javascript">
import Security from "../spinner/security";
export default {
    components: { Security },
    async created() {
        if (!User.loggedIn()) {
            await this.$router.push("/");
        }
        await axios
            .get("/api/users/" + localStorage.getItem("user_id"))
            .then(({ data }) => (this.user = data))
            .catch((error) => console.log(error));
        let id = this.$route.params.id;
        await axios
            .get("/api/types/" + id)
            .then(({ data }) => {
                this.type = data;
            })
            .catch((error) => console.log(error));
        await this.allMainType();
        await this.allUnits();
        await axios
            .get("/api/user/roles/" + localStorage.getItem("user_id") + "/" + 1)
            .then(({ data }) => {
                this.haveRole = data;
            })
            .catch((error) => console.log(error));
    },
    data() {
        return {
            user: {},
            title: "Edit Type",
            haveRole: false,
            categories: [],
            type: {},
            newphoto: null,
            type_units: {
                unit_id: "",
                no_of_unit: 1,
                deff_price: 0.0,
                price: 0.0,
                barcode: "",
            },
            selected_units: [],
            units: [],
            errors: {},
        };
    },
    methods: {
        generateBarcode() {
            this.type.type_barcode = "";
            if (this.type.type_barcode > 10000) {
                var val1 = Math.floor(
                    this.type.type_barcode + Math.random() * 99
                );
                this.type.type_barcode = val1;
            } else {
                var val1 = Math.floor(100 + Math.random() * 99);
                this.type.type_barcode = this.type.type_barcode + 1 + "" + val1;
            }
        },
        onFileSelected(event) {
            let file = event.target.files[0];
            if (file.size > 1048770) {
                Notification.image_validation();
            } else {
                let reader = new FileReader();
                reader.onload = (event) => {
                    this.type.newphoto = event.target.result;
                    this.newphoto = event.target.result;
                };
                reader.readAsDataURL(file);
            }
        },
        allMainType() {
            axios
                .get("/api/mainTypes")
                .then(({ data }) => {
                    this.categories = data;
                })
                .catch((error) => console.log(error));
        },
        allUnits() {
            axios
                .get("/api/units")
                .then(({ data }) => {
                    this.units = data;
                })
                .catch((error) => console.log(error));
        },
        calcVatVal() {
            this.type.type_discount_value = 0.0;
            if (
                this.type.type_sill_price > 0 &&
                this.type.type_vat_percent > 0
            ) {
                if (this.type.type_has_vat) {
                    let price =
                        this.type.type_sill_price /
                        (1 + this.type.type_vat_percent / 100.0);
                    this.type.type_vat_value =
                        ((price - this.type.type_discount_value) *
                            this.type.type_vat_percent) /
                        100.0;
                } else {
                    this.type.type_vat_value =
                        ((this.type.type_sill_price -
                            this.type.type_discount_value) *
                            this.type.type_vat_percent) /
                        100.0;
                }
            }
        },
        calcVatPercent() {
            this.type.type_vat_percent = 0;
            if (this.type.type_sill_price > 0 && this.type.type_vat_value > 0) {
                if (this.type.type_has_vat) {
                    let price =
                        this.type.type_sill_price /
                        (1 + this.type.type_vat_percent / 100.0);
                    this.type.type_vat_percent =
                        (this.type.type_vat_value /
                            (price - this.type.type_discount_value)) *
                        100.0;
                } else {
                    this.type.type_vat_percent =
                        (this.type.type_vat_value /
                            (this.type.type_sill_price -
                                this.type.type_discount_value)) *
                        100.0;
                }
            }
        },
        calcDiscountVal() {
            this.type.type_discount_value = 0;
            if (
                this.type.type_sill_price > 0 &&
                this.type.type_discount_percent > 0
            ) {
                this.type.type_discount_value =
                    (this.type.type_sill_price *
                        this.type.type_discount_percent) /
                    100.0;
            }
        },
        calcDiscountPercent() {
            this.type.type_discount_percent = 0;
            if (
                this.type.type_sill_price > 0 &&
                this.type.type_discount_value > 0
            ) {
                this.type.type_discount_percent =
                    (this.type.type_discount_value /
                        this.type.type_sill_price) *
                    100.0;
            }
        },
        addUnit() {
            let TypeUnits = JSON.parse(JSON.stringify(this.type_units));
            this.selected_units.push(TypeUnits);
        },
        removeUnit(selected, index) {
            selected.no_of_unit = 1;
            selected.price = 0;
            this.$delete(this.selected_units, index);
        },
        onChangeCountCalcPrice(selected) {
            selected.price = 0;
            selected.price =
                this.type.type_sill_price / selected.no_of_unit +
                Number(selected.deff_price);
        },
        update() {
            if (this.selected_units.length > 0) {
                this.type.type_unit = this.selected_units;
            }
            let id = this.$route.params.id;
            axios
                .patch("/api/types/" + id, this.type)
                .then(() => {
                    axios.get("/api/types/" + id).then(({ data }) => {
                        this.type = data;
                    });
                    this.type.type_unit = [];
                    this.selected_units = [];
                    Notification.success();
                })
                .catch((error) => {
                    this.errors = error.response.data.errors;
                })
                .then((e) => {
                    if (this.errors.type_name_ar)
                        Notification.customMsg(
                            "error",
                            "topRight",
                            this.errors.type_name_ar[0]
                        );
                    if (this.errors.type_sill_price)
                        Notification.customMsg(
                            "error",
                            "topRight",
                            this.errors.type_sill_price[0]
                        );
                    if (this.errors.type_barcode)
                        Notification.customMsg(
                            "error",
                            "topRight",
                            this.errors.type_barcode[0]
                        );
                    if (this.errors.sell_unit)
                        Notification.customMsg(
                            "error",
                            "topRight",
                            this.errors.sell_unit[0]
                        );
                });
        },
         UpdateUnit(unit) {
            axios
                .patch("/api/units/" + unit.type_unit_id, unit)
                .then(() => Notification.success());
        },
        deleteUnit(id) {
            if (confirm("هل تريد الحذف؟لايمكن الاستعاده مره اخرى.")) {
                if (this.type.units.length > 1) {
                    if (this.type.sell_unit.type_unit_id != id) {
                        axios
                            .delete("/api/units/" + id)
                            .then(() => {
                                this.type.units = this.type.units.filter(
                                    (type) => {
                                        return type.type_unit_id != id;
                                    }
                                );
                                Notification.successMsg("تم الحذف بنجاح");
                            })
                            .catch(() => {
                                Notification.errorMsg("لايمكن حذف العملية");
                            });
                    } else {
                        Notification.errorMsg(
                            "لايمكن حذف العملية الإفتراضية للصنف يجب تغير العملية أولا"
                        );
                    }
                } else {
                    Notification.errorMsg(
                        "يجب أن يكون هناك عملية واحده على الأقل"
                    );
                }
            }
        },
    },
};
</script>
