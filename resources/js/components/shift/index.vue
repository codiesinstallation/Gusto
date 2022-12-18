<template>
    <section v-if="user.shift" class="col-12">
        <div
            class="card-header text-center d-flex py-2 justify-content-between"
        >
            <h5 class="font-weight-bold text-primary">
                {{ __("تفاصيل الشيفت") }}
            </h5>
        </div>
        <div class="col-12 text-center">
            <div class="row">
                <div class="col-6 col-auto px-0" v-if="isShift">
                    <div class="card m-2 m">
                        <div class="card-content">
                            <div class="card-body">
                                <span class="float-start">مسئول الشيفت</span>
                                <span class="text-end">{{
                                    shift.current_user.name
                                }}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-auto px-0" v-if="isShift">
                    <div class="card m-2">
                        <div class="card-content">
                            <div class="card-body">
                                <span class="float-start">
                                    تاريخ بداية الشيفت
                                </span>
                                <span class="text-end">{{
                                    shift.starter_date
                                }}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-sm-6 col-12 px-0">
                    <div class="card m-2">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="align-self-center">
                                    <b class="float-start"> نقدي </b>
                                </div>
                                <div class="text-end">
                                    <b>{{ format(shift.cash) }}</b>
                                    <span v-if="mixins.currency">{{
                                        mixins.currency.currency_ar
                                    }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-sm-6 col-12 px-0">
                    <div class="card m-2">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="align-self-center">
                                    <b class="float-start"> بطاقة </b>
                                </div>
                                <div class="text-end">
                                    <b>{{ format(shift.card) }}</b>
                                    <span v-if="mixins.currency">{{
                                        mixins.currency.currency_ar
                                    }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-sm-6 col-12 px-0">
                    <div class="card m-2">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="align-self-center">
                                    <b class="float-start"> آجلة </b>
                                </div>
                                <div class="text-end">
                                    <b>{{ format(shift.later) }}</b>
                                    <span v-if="mixins.currency">{{
                                        mixins.currency.currency_ar
                                    }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div
                class="row"
                style="padding: 0 !important"
                v-if="shift.starter_date != null"
            >
                <div class="col-6 accordion-item px-0">
                    <div class="accordion-header" id="headingTwo">
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                            style="padding: 5px!important"
                        >
                            <button
                                class="collapsed btn btn-secondary font-weight-bold text-light"
                                @click="endShift = !endShift"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo"
                                aria-expanded="false"
                                aria-controls="collapseTwo"
                            >
                                {{ __("إنهاء الشيفت") }}
                                <i
                                    v-if="endShift"
                                    class="fa fa-angle-double-down"
                                ></i>
                                <i v-else class="fa fa-angle-double-up"></i>
                            </button>
                        </div>
                    </div>
                    <div
                        id="collapseTwo"
                        :class="
                            endShift
                                ? 'accordion-collapse collapse show'
                                : 'accordion-collapse collapse'
                        "
                        aria-labelledby="headingTwo"
                        data-bs-parent="#accordionExample"
                    >
                        <div class="accordion-body">
                            <div class="card-body">
                                <form @submit.prevent="saveChanges">
                                    <div class="row justify-content-center">
                                        <div class="col-12 col-auto">
                                            <!-- Form Basic -->
                                            <div class="card mb-4">
                                                <div
                                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                                                >
                                                    <button
                                                        type="submit"
                                                        class="btn btn-primary"
                                                        :disabled="
                                                            this.shift
                                                                .transfer <= 0
                                                        "
                                                    >
                                                        حفظ
                                                    </button>
                                                </div>
                                                <div class="card-body">
                                                    <div class="form-group">
                                                        <label>
                                                            مبيعات الشيفت نقدي
                                                        </label>
                                                        <input
                                                            type="text"
                                                            class="form-control-sm"
                                                            v-model="cash"
                                                        />
                                                    </div>
                                                    <div class="form-group">
                                                        <label
                                                            >المبلغ المحول
                                                            للخزينة</label
                                                        >
                                                        <input
                                                            type="text"
                                                            class="form-control-sm"
                                                            v-model="
                                                                shift.transfer
                                                            "
                                                        />
                                                    </div>
                                                    <div class="form-group">
                                                        <label
                                                            >المبلغ المتبقي
                                                            للوردية
                                                            التالية</label
                                                        >
                                                        <input
                                                            type="text"
                                                            readonly="true"
                                                            disabled
                                                            class="form-control-sm"
                                                            :value="
                                                                cash -
                                                                shift.transfer
                                                            "
                                                        />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>
                                                            الموظف المستلم
                                                        </label>
                                                        <select
                                                            v-model="
                                                                shift.recived_user
                                                            "
                                                            class="form-control-sm"
                                                        >
                                                            <option
                                                                v-for="(
                                                                    user, index
                                                                ) in users"
                                                                :key="index"
                                                                :value="
                                                                    user.name
                                                                "
                                                            >
                                                                {{ user.name }}
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>
                                                            كلمة مرور الموظف
                                                            المستلم
                                                        </label>
                                                        <input
                                                            type="password"
                                                            class="form-control-sm"
                                                            v-model="password"
                                                        />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <Security v-else></Security>
</template>

<script>
import Security from "../spinner/security";
import Spinner from "../spinner/mixinsSpinner";

export default {
    components: { Security, Spinner },

    async created() {
        if (!User.loggedIn()) {
            await this.$router.push("/");
        }
        await axios
            .get("/api/users/" + localStorage.getItem("user_id"))
            .then(({ data }) => (this.user = data))
            .catch((error) => console.log(error));
        await this.getMixins();
        await axios
            .get("/api/shift")
            .then(({ data }) => {
                if (data) {
                    this.isShift = true;
                    this.shift = data;
                }
            })
            .catch((err) => console.log(err));
        await axios
            .get("/api/bill/shift")
            .then(({ data }) => {
                if (data && this.shift.starter_date === null) {
                    this.shift.cash = data ?? 0;
                }
            })
            .catch((err) => console.log(err));
        await axios
            .get("/api/users")
            .then(({ data }) => (this.users = data))
            .catch((err) => console.log(err));
    },
    data() {
        return {
            user: {},
            endShift: false,
            isShift: false,
            shift: {
                current_user: null,
                recived_user: null,
                starter_point: 0,
                cash: 0,
                later: 0,
                card: 0,
                transfer: 0,
                increase: 0,
                remain: 0,
                deficit: 0,
                starter_date: null,
                end_date: null,
                drawerCash: 0,
            },
            cash: 0,
            password: null,
            transfer: 0,
            users: [],
            mixins: {},
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
        format(num) {
            return parseFloat(num).toFixed(this.mixins.digit);
        },
        saveChanges() {
            if (this.cash < this.shift.transfer) {
                Notification.customMsg(
                    "error",
                    "topstart",
                    "المبلغ المحول للخزينة أكبر من مبيعات الشيفت"
                );
                this.shift.transfer = 0;
                this.shift.remain = 0;
                return;
            }

            this.shift.remain = this.cash - this.shift.transfer;
            this.shift.name = this.shift.recived_user;
            this.shift.password = this.password;
            this.shift.drawerCash = this.cash;
            axios
                .patch("/api/shift/" + this.shift.id, this.shift)
                .then(async () => {
                    await this.$router.push({ name: "/" });
                    Notification.success();
                })
                .catch((error) => {
                    Notification.error();
                });
        },
    },
};
</script>
<style scoped>
input {
    min-width: 30%;
    margin: auto;
    text-align: center;
    padding: 10px;
}

input.num {
    min-width: 20%;
}
</style>
