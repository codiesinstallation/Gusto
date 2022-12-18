let login = require("./components/auth/login.vue").default;
let register = require("./components/auth/register.vue").default;
let home = require("./components/menu.vue").default;
let barcode = require("./components/barcode/index.vue").default;
let reset = require("./components/auth/reset.vue").default;
let change = require("./components/auth/change.vue").default;

let logout = require("./components/auth/logout.vue").default;
//supplier
let suppliers = require("./components/supplier/index.vue").default;
let editSupplier = require("./components/supplier/edit.vue").default;
let createSupplier = require("./components/supplier/create.vue").default;
let attendance = require("./components/attendance/index.vue").default;
let attendanceReport = require("./components/reports/attendance.vue").default;

//bills
let bills = require("./components/bills/index.vue").default;
let NotFound = require("./components/spinner/404.vue").default;

//purchaseBills
let purchaseBills = require("./components/purchase/purchase.vue").default;
let allPurchaseBills = require("./components/purchase/index.vue").default;

//Mixins
let mixins = require("./components/settings/index.vue").default;
let codies = require("./components/settings/codies.vue").default;

//worker
let createWorker = require("./components/workers/create.vue").default;
let workers = require("./components/workers/index.vue").default;
let editWorker = require("./components/workers/edit.vue").default;
//Sales
let createSale = require("./components/sales/create.vue").default;
let sales = require("./components/sales/index.vue").default;
let editSale = require("./components/sales/edit.vue").default;

//Customers
let createCustomer = require("./components/customers/create.vue").default;
let customers = require("./components/customers/index.vue").default;
let editCustomer = require("./components/customers/edit.vue").default;
//Users
let createUser = require("./components/users/create.vue").default;
let users = require("./components/users/index.vue").default;
let editUser = require("./components/users/edit.vue").default;
let addRoles = require("./components/users/roles.vue").default;

//Types
let createType = require("./components/types/create.vue").default;
let types = require("./components/types/index.vue").default;
let editType = require("./components/types/edit.vue").default;

//mainTypes
let editMainType = require("./components/category/edit.vue").default;
let mainTypes = require("./components/category/index.vue").default;
let createMainType = require("./components/category/create.vue").default;

//Reports
let reportsMenu = require("./components/reportsMenu.vue").default;
let report = require("./components/reports/report.vue").default;
let customerReport = require("./components/reports/customer.vue").default;
let searchReport = require("./components/reports/search.vue").default;
let shiftReport = require("./components/reports/shift.vue").default;
let ProcessReport =
    require("./components/reports/ProcessReport.vue").default;

let requests = require("./components/request/index.vue").default;
let cash = require("./components/cash/index.vue").default;
//Offers
let editOffer = require("./components/offers/edit.vue").default;
let offers = require("./components/offers/index.vue").default;
let createOffer = require("./components/offers/create.vue").default;
//Return Bills

let process = require("./components/return/home.vue").default;

//BillsHome
let bill = require("./components/home/index.vue").default;

//Expenses
let expenses = require("./components/expenses/index.vue").default;
let editExpenses = require("./components/expenses/edit.vue").default;
let createExpenses = require("./components/expenses/create.vue").default;
//Units
let units = require("./components/units/index.vue").default;
let editUnit = require("./components/units/edit.vue").default;
let createUnit = require("./components/units/create.vue").default;

//Stock
let stocks = require("./components/stock/index.vue").default;
let editStock = require("./components/stock/edit.vue").default;
let createStock = require("./components/stock/create.vue").default;
//GustoStocks
let gustoStocks = require("./components/typesStock/index.vue").default;
let editGustoStocks = require("./components/typesStock/edit.vue").default;
let createGustoStocks = require("./components/typesStock/create.vue").default;
//shift
let shift = require("./components/shift/index.vue").default;
//Tables
let tables = require("./components/table/index.vue").default;
let editTable = require("./components/table/edit.vue").default;
let createTable = require("./components/table/create.vue").default;
export const routes = [
    { path: "/reset", component: reset, name: "reset" },
    { path: "/change-password", component: change, name: "change" },

    //Tables
    { path: "/create/table", component: createTable, name: "create-table" },
    { path: "/tables", component: tables, name: "tables" },
    { path: "/edit/stock/:id", component: editTable, name: "edit-table" },
    //shift
    { path: "/shift", component: shift, name: "shift" },
    { path: "/attendance", component: attendance, name: "attendance" },
    {
        path: "/attendance/report",
        component: attendanceReport,
        name: "attendanceReport",
    },

    //GustoStocks
    {
        path: "/create/gusto/Stock",
        component: createGustoStocks,
        name: "create-gusto-stock",
    },
    { path: "/gusto/stocks", component: gustoStocks, name: "gustoStocks" },
    {
        path: "/edit/gusto/stock/:id",
        component: editGustoStocks,
        name: "edit-gusto-stock",
    },

    //Stocks
    { path: "/create/stock", component: createStock, name: "create-stock" },
    { path: "/stocks", component: stocks, name: "stocks" },
    { path: "/edit/stock/:id", component: editStock, name: "edit-stock" },

    //Units
    { path: "/create/unit", component: createUnit, name: "create-unit" },
    { path: "/units", component: units, name: "units" },
    { path: "/edit/unit/:id", component: editUnit, name: "edit-unit" },
    { path: "/barcode", component: barcode, name: "barcode" },

    //Expenses
    {
        path: "/create/expense",
        component: createExpenses,
        name: "create-expense",
    },
    { path: "/expenses", component: expenses, name: "expenses" },
    {
        path: "/edit/expense/:id",
        component: editExpenses,
        name: "edit-expense",
    },

    //BillsHome
    // { path: "/bill", component: bill, name: "bill" }, ,
    // { path: "/cashier", component: cashier, name: "cashier" },

    //Return Bills

    { path: "/process", component: process, name: "process" },


    //Offers
    { path: "/create/offer", component: createOffer, name: "create-offer" },
    { path: "/offers", component: offers, name: "offers" },
    { path: "/edit/offer/:id", component: editOffer, name: "edit-offer" },

    { path: "/cash", component: cash, name: "cash" },

    { path: "/", component: login, name: "/" },
    { path: "/home", component: home, name: "home" },
    { path: "/bill", component: bill, name: "bill" },

    { path: "/mixins", component: mixins, name: "mixins" },
    { path: "/codies", component: codies, name: "codies" },

    { path: "/register", component: register, name: "register" },
    { path: "/logout", component: logout, name: "logout" },
    //bills
    { path: "/bills", component: bills, name: "bills" },
    //purchaseBills
    {
        path: "/purchase-bills",
        component: purchaseBills,
        name: "purchaseBills",
    },
    //purchaseBills
    {
        path: "/allPurchaseBills",
        component: allPurchaseBills,
        name: "allPurchaseBills",
    },
    //Workers
    { path: "/create/worker", component: createWorker, name: "create-worker" },
    { path: "/workers", component: workers, name: "workers" },
    { path: "/edit/worker/:id", component: editWorker, name: "edit-worker" },
    //Sales
    { path: "/create/sale", component: createSale, name: "create-sale" },
    { path: "/sales", component: sales, name: "sales" },
    { path: "/edit/sale/:id", component: editSale, name: "edit-sale" },
    //Suplliers
    {
        path: "/create/supplier",
        component: createSupplier,
        name: "create-supplier",
    },
    { path: "/suppliers", component: suppliers, name: "suppliers" },
    {
        path: "/edit/supplier/:id",
        component: editSupplier,
        name: "edit-supplier",
    },
    //Customers
    {
        path: "/create/customer",
        component: createCustomer,
        name: "create-customer",
    },
    { path: "/customers", component: customers, name: "customers" },
    {
        path: "/edit/customer/:id",
        component: editCustomer,
        name: "edit-customer",
    },
    //Users
    { path: "/create/user", component: createUser, name: "create-user" },
    { path: "/users", component: users, name: "users" },
    { path: "/add/roles/:id", component: addRoles, name: "add-roles" },
    { path: "/edit/user/:id", component: editUser, name: "edit-user" },

    //Types
    { path: "/create/type", component: createType, name: "create-type" },
    { path: "/types", component: types, name: "types" },
    { path: "/edit/type/:id", component: editType, name: "edit-type" },
    //mainTypes
    {
        path: "/create/mainType",
        component: createMainType,
        name: "create-mainType",
    },
    { path: "/mainTypes", component: mainTypes, name: "mainTypes" },
    {
        path: "/edit/mainType/:id",
        component: editMainType,
        name: "edit-mainType",
    },

    //    Reports
    { path: "/report", component: reportsMenu, name: "reportsMenu" },
    { path: "/bills/report/:period", component: report, name: "report" },
    { path: "/bills/report", component: report, name: "bills-report" },
    { path: "/requests", component: requests, name: "requests" },
    {
        path: "/ProcessReport",
        component: ProcessReport,
        name: "ProcessReport",
    },
    {
        path: "/customers/report",
        component: customerReport,
        name: "customers-report",
    },

    { path: "/search", component: searchReport, name: "search-report" },
    { path: "/shiftReport", component: shiftReport, name: "shift-report" },
    { path: "*", component: NotFound },
];