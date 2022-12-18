<template>
    <div>
        <div class="card mb-4" id="allReport">
            <div
                class="card-header d-flex flex-row align-items-center justify-content-between hideMeInPrint"
            >
                <a class="btn btn-warning text-light" @click="$router.go(-1)">
                    <i
                        :class="
                            $root.$data.codies.default_lang == 'ar'
                                ? 'fa fa-arrow-right'
                                : 'fa fa-arrow-left'
                        "
                    ></i>
                </a>
                <h1 class="text-center my-0 btn-sm d-block">تقرير الشيفت</h1>
                <i
                    class="fas fa-file-excel fa-2x text-success"
                    style="cursor: pointer"
                    onclick="download('xlsx','shifts');"
                ></i>

                <button
                    class="b tn btn-success btn-sm"
                    onclick="window.print()"
                    type="submit"
                >
                    {{ __("Print") }}
                </button>

                <form
                    class="needs-validation mt-2 hideMeInPrint"
                    @submit.prevent="veiwReport"
                >
                    <div class="form-row">
                        <div class="col-md-5">
                            <div class="input-group">
                                <div class="input-group-prepend input-sm">
                                    <span
                                        class="input-group-text"
                                        id="validationTooltipUsernamePrepend"
                                        >{{ __("From") }}</span
                                    >
                                </div>
                                <date-picker
                                    v-model="form"
                                    id="from"
                                    :wrap="true"
                                    :config="configs.wrap"
                                    required
                                    :placeholder="__('From')"
                                >
                                </date-picker>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="input-group">
                                <div
                                    class="input-group-prepend float-right input-sm"
                                >
                                    <span class="input-group-text" for="to">{{
                                        __("To")
                                    }}</span>
                                </div>
                                <date-picker
                                    v-model="to"
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
                                {{ __("View") }}
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <table
                id="shifts"
                class="table align-items-center sortTable text-center"
            >
                <thead>
                    <tr>
                        <th style="width: 10%">تاريخ بداية الشيفت</th>
                        <th style="width: 10%">مسئول الشيفت</th>
                        <th style="width: 10%">المبلغ المحول</th>
                        <th style="width: 10%">نقدي</th>
                        <th style="width: 10%">اجل</th>
                        <th style="width: 10%">بطاقة</th>
                        <th style="width: 10%">عجز</th>
                        <th style="width: 10%">زيادة</th>
                        <th style="width: 10%">متبقي</th>
                        <th style="width: 10%">تاريخ نهاية الشفت</th>
                        <th style="width: 10%">الموظف المستلم</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(shift, index) in shifts" :key="index">
                        <td>{{ shift.end_date }}</td>
                        <td>{{ shift.current_user.name }}</td>
                        <td>{{ format(shift.transfer) }}</td>
                        <td>{{ format(shift.cash) }}</td>
                        <td>{{ format(shift.later) }}</td>
                        <td>{{ format(shift.card) }}</td>
                        <td
                            :class="
                                shift.deficit > 0 ? 'bg-warning text-light' : ''
                            "
                        >
                            {{ format(shift.deficit) }}
                        </td>
                        <td
                            :class="
                                shift.increase > 0 ? 'bg-danger text-light' : ''
                            "
                        >
                            {{ format(shift.increase) }}
                        </td>
                        <td>{{ format(shift.remain) }}</td>
                        <td>{{ shift.end_date }}</td>
                        <td>{{ shift.recived_user.name }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
import datePicker from "../date/index";
import "pc-bootstrap4-datetimepicker/build/css/bootstrap-datetimepicker.css";

export default {
    components: { datePicker },

    async created() {
        if (!User.loggedIn()) {
            await this.$router.push("/");
        }
        await this.veiwReport();
    },
    data() {
        return {
            shifts: "",
            to: null,
            form: null,
            configs: {
                wrap: {
                    allowInputToggle: true,
                },
            },
        };
    },
    methods: {
        format(num) {
            return parseFloat(num).toFixed(this.$root.$data.codies.digit);
        },
        veiwReport() {
            axios
                .get("/api/shift/report/" + this.form + "/" + this.to)
                .then(({ data }) => {
                    if (data.length >= 0) {
                        this.loading = false;
                        this.shifts = data;
                    }
                })
                .catch((error) => console.log(error));
        },
    },
};
</script>

<style scoped></style>
