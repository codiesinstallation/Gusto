<template>
    <div>
        <div v-if="!loading" class="row my-3">
            <div class="card-header text-center mb-2 col-12">
                <h5>الصفحة الرئيسية</h5>
            </div>

            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/bill"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/invoices.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("New Bill") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/sales"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/sales.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Sales Types") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/bills"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/bills.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Bills") }}
                    </h5>
                </router-link>
            </div>

            <div  class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/process"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/return.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Manage Exit bill") }}
                    </h5>
                </router-link>
            </div>

            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/mainTypes"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/menu.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Categories") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/units"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/unit.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Units") }}
                    </h5>
                </router-link>
            </div>

            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/types"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/types.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Types") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/tables"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/table.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Tables") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/offers"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/offer.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Offers") }}
                    </h5>
                </router-link>
            </div>

            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/stocks"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/stock.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Manage Stock") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/gusto/stocks"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/manage_stock.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Create Order") }}
                    </h5>
                </router-link>
            </div>

            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/cash"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/cash.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Cash") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4 d-none">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/suppliers"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/suppliers.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Suppliers") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/expenses"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/expenses.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Expenses") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/customers"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/customers.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Customers") }}
                    </h5>
                </router-link>
            </div>

            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/workers"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/worker.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Workers") }}
                    </h5>
                </router-link>
            </div>

            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/users"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/users.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Users") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link
                    class="card text-center p-1 w-100"
                    style="text-decoration: none; text-align: center"
                    to="/report"
                >
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/reports.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Reports") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4" v-show="user.barcode_settings">
                <router-link to="/barcode">
                    <img
                        class="card-img-top w-100"
                        src="backend/img/menu/barcode.png"
                        alt="Card image cap"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Barcode Settings") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link to="/attendance">
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/attendance.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Attendance And Leave") }}
                    </h5>
                </router-link>
            </div>
            <div class="col-md-2 col-sm-4">
                <router-link to="/mixins">
                    <img
                        alt="Card image cap"
                        class="card-img-top w-100"
                        src="backend/img/menu/settings.png"
                    />
                    <h5 class="text-center my-0 card-header">
                        {{ __("Settings") }}
                    </h5>
                </router-link>
            </div>
        </div>
        <Spinner v-else :title="title" />
    </div>
</template>
<script>
import Spinner from "./spinner/mixinsSpinner.vue";
export default {
    components: { Spinner },
    async created() {
        if (!User.loggedIn()) {
            this.$router.push("/");
        }
        await axios
            .get("/api/users/" + localStorage.getItem("user_id"))
            .then(({ data }) => (this.user = data))
            .catch((error) => console.log(error));
        await axios
            .get("/api/mixins/1")
            .then(({ data }) => {
                this.mixins = data;
                this.loading = false;
            })
            .catch((error) => console.log(error));
    },
    data() {
        return {
            user: {},
            mixins: {},
            loading: true,
            title: "Loading",
        };
    },
};
</script>
<style scoped>
a,
h1,
h2,
h3,
h4,
h5,
h6,
span,
p,
input,
.btn,
li,
td,
th,
tr {
    font-family: var(--font-family-monospace) !important;
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
