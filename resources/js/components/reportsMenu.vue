<template>
    <div>
        <div class="row my-3">
            <div
                class="card-header col-12 py-3 d-flex flex-row align-items-center justify-content-between"
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
                <h5>{{ __("Reports") }}</h5>
            </div>
            <div class="col-2">
                <router-link
                    class="card text-center p-1 w-100"
                    :to="{ name: 'report', params: { period: 'daily' } }"
                    style="text-decoration: none; text-align: center"
                >
                    <img
                        class="card-img-top w-100"
                        src="backend/img/reports/bill.png"
                        alt="Card image cap"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Today Report") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-2">
                <router-link
                    class="card text-center p-1 w-100"
                    :to="{ name: 'report', params: { period: 'monthly' } }"
                    style="text-decoration: none; text-align: center"
                >
                    <img
                        class="card-img-top w-100"
                        src="backend/img/reports/bills.png"
                        alt="Card image cap"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Monthly Report") }}
                    </h5>
                </router-link>
            </div>

            <div class="col-2">
                <router-link
                    class="card text-center p-1 w-100"
                    to="/bills/report"
                    style="text-decoration: none; text-align: center"
                >
                    <img
                        class="card-img-top w-100"
                        src="backend/img/reports/report.png"
                        alt="Card image cap"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Period Report") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-2 ">
                <a
                    class="card text-center p-1 w-100"
                    href="/Fbills"
                    style="text-decoration: none; text-align: center"
                >
                    <img
                        class="card-img-top w-100"
                        src="backend/img/reports/invoices.png"
                        alt="Card image cap"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Bills Report") }}
                    </h5>
                </a>
            </div>
            <div class="col-2 ">
                <a
                    class="card text-center p-1 w-100"
                    href="/RTypes"
                    style="text-decoration: none; text-align: center"
                >
                    <img
                        class="card-img-top w-100"
                        src="backend/img/menu/types.png"
                        alt="Card image cap"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Types Report") }}
                    </h5>
                </a>
            </div>
            <div class="col-2 d-none">
                <router-link
                    class="card text-center p-1 w-100"
                    to="/PurachasesReport"
                    style="text-decoration: none; text-align: center"
                >
                    <img
                        class="card-img-top w-100"
                        src="backend/img/reports/receipt.png"
                        alt="Card image cap"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Purchase Bills Report") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-2 d-none">
                <router-link
                    class="card text-center p-1 w-100"
                    to="/ProcessReport"
                    style="text-decoration: none; text-align: center"
                >
                    <img
                        class="card-img-top w-100"
                        src="backend/img/reports/invoice.png"
                        alt="Card image cap"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Process Bills Report") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-2">
                <router-link
                    class="card text-center p-1 w-100"
                    to="/customers/report"
                    style="text-decoration: none; text-align: center"
                >
                    <img
                        class="card-img-top w-100"
                        src="backend/img/reports/customer-reposrt.png"
                        alt="Card image cap"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Customers Report") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-2">
                <router-link
                    class="card text-center p-1 w-100"
                    to="/search"
                    style="text-decoration: none; text-align: center"
                >
                    <img
                        class="card-img-top w-100"
                        src="backend/img/reports/search.png"
                        alt="Card image cap"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Search Report") }}
                    </h5>
                </router-link>
            </div>

            <div class="col-2">
                <router-link
                    to="/shiftReport"
                    class="card text-center p-1 w-100"
                >
                    <i class="fa fa-dollar-sign w-100 card-img-top"></i>

                    <h5 class="text-center my-0 card-header">
                        {{ __("Shift Report") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link
                    to="/attendance/report"
                    class="card text-center p-1 w-100"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/attendance.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Attendance And Leave report") }}
                    </h5>
                </router-link>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    async created() {
        if (!User.loggedIn()) {
            await this.$router.push("/");
        }
    },
};
</script>
<style scoped>
.fa-dollar-sign::before {
    font-size: 221px;
    margin: 0px 42px;
}
:root {
    --secondary: linear-gradient(221deg, #8743ff, #4136f1 60%);
    --body: #eaf2ff;
    --card: #fff;
    --text: #000;
    --price: #4136f1;
}
a:hover {
    color: #222;
}
.card {
    background: var(--body);
    border-radius: 20px;
    padding: 10px;
    font-family: sans-serif;
    display: flex;
    color: var(--text);
    transition: transform 0.3s, background 0.3s;
    margin-bottom: 15px;
}
.fa-dollar-sign[data-v-6f5217c3]::before {
    font-size: 284px;
    margin: 0px 42px;
}
.card:hover {
    transform: scale(1.09);
}
.card img {
    width: 160px;
    min-height: 160px;
    border-radius: 14px;
    object-fit: cover;
}
h5.card-header {
    background: darkmagenta;
    color: #fff;
    font-weight: bolder;
    border-radius: 0;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
}
</style>
