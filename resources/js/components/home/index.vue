<template>
    <div>
        <Spinner v-show="loading" :title="title"></Spinner>
        <div v-if="open_table" class="card text-center">
            <div class="card-header">
                <button
                    class="btn btn-secondary"
                    type="button"
                    @click="open_table = !open_table"
                >
                    {{ __("Cancel") }}
                </button>
            </div>
            <div class="row text-center">
                <div
                    class="col-2 pointer"
                    v-for="(item, index) in tables"
                    :key="index"
                >
                    <div
                        :class="item.is_resrved ? 'card bg-danger' : 'card'"
                        style="width: 100%"
                    >
                        <div class="card-body" @click="onChangeTable(item)">
                            <div class="card-text">
                                <div>
                                    <span>رقم الطاولة:</span>
                                    {{ item.table_no }}
                                </div>
                                <div v-if="item.total > 0">
                                    <span> مجموع الفاتورة:</span>
                                    {{ item.total }}
                                </div>
                            </div>
                            <p v-if="item.mini_charge > 0" class="card-text">
                                <span> رسم فتح الغرفة:</span>

                                {{ item.mini_charge }}
                            </p>
                            <p v-if="item.room" class="card-text">
                                <span>رقم الغرفة:</span>

                                {{ item.room }}
                            </p>
                        </div>

                        <div class="card-footer bg-light">
                            <button
                                id="save"
                                :disabled="!item.is_resrved"
                                class="btn btn-outline-success font-weight-bold text-dark"
                                type="button"
                                @click="endTable(item)"
                            >
                                {{ __("Save") }}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div v-else v-show="!loading && mixins">
            <!--        Search -->
            <div
                :class="
                    showSearchTypeModal
                        ? 'modal fade show d-block modaldrg'
                        : 'modal fade modaldrg'
                "
                aria-hidden="true"
                aria-labelledby="exampleModalLabel"
                role="dialog"
                tabindex="-1"
            >
                <div
                    class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                    role="document"
                >
                    <div class="modal-content m-auto" style="min-width: 850px">
                        <div class="modal-header">
                            <h5 class="modal-title">{{ bill.bill_total }}</h5>
                            <button
                                aria-label="Close"
                                class="close"
                                data-dismiss="modal"
                                type="button"
                            >
                                <span
                                    aria-hidden="true"
                                    @click="
                                        searchTypes = [];
                                        typeName = '';
                                        showSearchTypeModal = false;
                                    "
                                    >&times;</span
                                >
                            </button>
                        </div>
                        <div
                            class="modal-body min-h-50"
                            style="min-height: 500px; overflow: auto"
                        >
                            <input
                                v-model="typeName"
                                class="form-control"
                                placeholder="اسم الصنــــــف "
                                type="search"
                            />
                            <button
                                class="btn btn-sm btn-primary"
                                @click="findTypeByLike()"
                            >
                                <i
                                    class="fa fa-search font-weight-bold text-light"
                                ></i>
                            </button>
                            <table
                                class="text-center"
                                style="position: absolute; z-index: 999"
                            >
                                <thead>
                                    <tr>
                                        <th style="width: 10%">كود الصنف</th>
                                        <th style="width: 50%">
                                            {{ __("Type Name") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Price") }}
                                        </th>
                                        <th style="width: 10%">اضافة</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(
                                            searchType, index
                                        ) in searchTypes"
                                        :key="index"
                                    >
                                        <td>{{ searchType.type_id }}</td>
                                        <td>{{ searchType.type_name_ar }}</td>
                                        <td>
                                            {{ searchType.sell_unit.price }}
                                        </td>
                                        <td>
                                            <i
                                                class="fa fa-plus btn-sm btn-success font-weight-bold text-light"
                                                @click="addToCart(searchType)"
                                            ></i>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button
                                class="btn btn-secondary"
                                data-dismiss="modal"
                                type="button"
                                @click="
                                    searchTypes = [];
                                    typeName = '';
                                    showSearchTypeModal = false;
                                "
                            >
                                إغلاق
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!--   END     Search -->
            <!--Start Calculation-->

            <div class="card-header" style="overflow-x: auto">
                <form class="w-100" @submit.prevent="saveBill">
                    <table
                        class="table-bordered text-lighten-1 text-center font-weight-bold"
                    >
                        <tbody>
                            <tr>
                                <td style="width: 10%">
                                    {{ __("Customer Code") }}
                                </td>
                                <td style="width: 10%">
                                    <input
                                        v-model="search"
                                        class="form-control"
                                        type="text"
                                        @keyup="findCustomer()"
                                    />
                                </td>
                                <td style="width: 10%">
                                    {{ __("Customer Name") }}
                                </td>
                                <td style="width: 10%">
                                    <input
                                        :value="customer.cust_name"
                                        class="form-control"
                                        type="text"
                                        readonly
                                    />
                                </td>
                                <td style="width: 10%">
                                    <a
                                        :title="customer.cust_balance"
                                        class="btn btn-info btn-sm text-light"
                                        data-target="#exampleModal"
                                        data-toggle="modal"
                                        ><i
                                            class="fas fa-search font-weight-bold text-light"
                                        ></i
                                    ></a>
                                </td>
                                <td style="width: 10%">
                                    {{ __("Pay Methods") }}
                                </td>
                                <td style="width: 10%">
                                    <select
                                        id="inputState"
                                        v-model="form.pay"
                                        class="form-control text-center w-100"
                                        @change="calcTotal()"
                                    >
                                        <option
                                            v-for="(pay, index) in payMethods"
                                            :key="index"
                                            :value="pay.id"
                                        >
                                            {{ pay.pay_method_name }}
                                        </option>
                                    </select>
                                </td>
                                <td style="width: 10%">{{ __("Paid") }}</td>

                                <td style="width: 10%">
                                    <input
                                        onClick="this.select();"
                                        type="number"
                                        min="0"
                                        step="0.01"
                                        v-model="form.paid"
                                        class="form-control form-control text-center"
                                        @change="calcRemain()"
                                    />
                                </td>
                                <td>{{ __("Remain") }}</td>

                                <td style="width: 10%">
                                    <input
                                        onClick="this.select();"
                                        type="number"
                                        min="0"
                                        step="0.01"
                                        v-model="form.remain"
                                        class="form-control form-control float-left text-center"
                                        readonly
                                    />
                                </td>
                                <td style="width: 10%">
                                    <i
                                        v-if="disable"
                                        class="btn btn-outline-success font-weight-bold text-dark fa fa-spinner"
                                    ></i>

                                    <button
                                        v-else
                                        id="save"
                                        :disabled="cart.length <= 0 || disable"
                                        class="btn btn-outline-success font-weight-bold text-dark"
                                        type="submit"
                                    >
                                        {{ __("Save") }}
                                        <small class="d-block">CTRL+S</small>
                                    </button>
                                    <a
                                        id="reset"
                                        class="btn font-weight-bold btn-outline-warning text-dark"
                                        @click="clearAll()"
                                        >{{ __("Reset") }}</a
                                    >
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 10%">{{ __("Sum") }}</td>
                                <td style="width: 10%">
                                    <input
                                        onClick="this.select();"
                                        type="number"
                                        min="0"
                                        step="0.01"
                                        v-model="form.sum"
                                        class="form-control form-control float-left text-center"
                                        readonly
                                    />
                                </td>
                                <td
                                    v-show="user.bill_discount"
                                    style="width: 10%"
                                >
                                    <label for="discount">
                                        {{ __("Discount") }}
                                        {{ form.isPercentDiscount ? "%" : "" }}
                                    </label>
                                    <input
                                        disabled
                                        class="form-check-input d-none"
                                        type="checkbox"
                                        v-model="form.isPercentDiscount"
                                        id="discount"
                                        @change="calcSum()"
                                    />
                                </td>

                                <td
                                    v-show="user.bill_discount"
                                    style="width: 10%"
                                >
                                    <input
                                        onClick="this.select();"
                                        type="number"
                                        min="0"
                                        step="0.01"
                                        v-model="form.discount"
                                        class="form-control form-control float-left text-center"
                                        @change="calcSum()"
                                    />
                                </td>
                                <td v-show="user.bill_extra">
                                    {{ __("Extra") }}
                                </td>

                                <td v-show="user.bill_extra" style="width: 10%">
                                    <input
                                        onClick="this.select();"
                                        type="number"
                                        min="0"
                                        step="0.01"
                                        v-model="form.extra"
                                        class="form-control form-control float-left text-center"
                                        @change="calcSum()"
                                    />
                                </td>
                                <td v-show="mixins.mixins_vat_val > 0">
                                    {{ __("Vat") }}
                                </td>

                                <td
                                    style="width: 10%"
                                    v-show="mixins.mixins_vat_val > 0"
                                >
                                    <input
                                        onClick="this.select();"
                                        type="number"
                                        min="0"
                                        step="0.01"
                                        v-model="form.vat"
                                        class="form-control form-control float-left text-center"
                                        readonly
                                    />
                                </td>
                                <td>{{ __("Total") }}</td>

                                <td style="width: 10%">
                                    <input
                                        onClick="this.select();"
                                        type="number"
                                        min="0"
                                        step="0.01"
                                        v-model="form.total"
                                        class="form-control form-control float-left text-center"
                                        readonly
                                    />
                                </td>

                                <td>
                                    <input
                                        type="text"
                                        style="width: 100px"
                                        v-model="form.note"
                                        class="form-control"
                                        :placeholder="__('Notes')"
                                    />
                                </td>
                                <td>
                                    <a
                                        :disabled="disable"
                                        v-show="form.table"
                                        class="btn font-weight-bold btn-outline-warning text-dark"
                                        @click="saveToTable()"
                                        >{{ __("PrintOnly") }}</a
                                    >
                                    <a
                                        v-show="
                                            tables.length > 0 &&
                                            form.table != null &&
                                            form.table &&
                                            form.table.is_resrved
                                        "
                                        class="btn font-weight-bold btn-outline-warning text-dark"
                                        @click="emptyTable(form.table)"
                                    >
                                        {{ __("Cancel") }}
                                    </a>
                                    <a
                                        class="btn font-weight-bold btn-outline-warning text-dark"
                                        @click="open_table = !open_table"
                                    >
                                        {{
                                            open_table
                                                ? __("Cancel")
                                                : __("Open Table")
                                        }}
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td v-show="tables.length > 0">
                                    {{ __("Table Number") }}
                                    <span class="mx-2" v-if="form.table">
                                        {{ form.table.mini_charge }}
                                    </span>
                                </td>
                                <td v-show="tables.length > 0">
                                    <select
                                        v-model="form.table"
                                        class="form-control text-center w-100"
                                        @change="onChangeTable(form.table)"
                                    >
                                        <option selected value="">
                                            {{ __("Choose Table") }}
                                        </option>
                                        <option
                                            v-for="(table, index) in tables"
                                            :key="index"
                                            :value="table"
                                            :class="
                                                table.is_resrved
                                                    ? 'bg-warning border-bottom'
                                                    : 'border-bottom'
                                            "
                                        >
                                            {{ table.table_no }}/
                                            {{ table.room }}
                                        </option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <!--Start Calculation-->
            <div class="row mb-3 newBill card-body">
                <div class="col-lg-6 col-md-12">
                    <!--Start Selected Items-->
                    <div class="selected" style="border: 1px solid #ddd">
                        <div class="card-header inbill text-center">
                            <p class="h6">{{ __("Bill Types") }}</p>
                        </div>
                        <div class="card-body" style="overflow-x: auto">
                            <div v-if="mixins.as_card" class="row text-center">
                                <div
                                    v-for="(product, index) in cart"
                                    :key="product.id"
                                    :class="
                                        product.has_Offer
                                            ? mixins.count_in_row_bill +
                                              ' bg-secondary text-light'
                                            : mixins.count_in_row_bill
                                    "
                                >
                                    <div class="card" style="width: 100%">
                                        <img
                                            loading="lazy"
                                            :alt="product.type_name_ar"
                                            :src="
                                                product.type_icon != null &&
                                                product.type_icon != ''
                                                    ? product.type_icon
                                                    : 'backend/products/product.png'
                                            "
                                            class="card-img-top w-100 pointer"
                                            @click="
                                                removeFromCart(product, index)
                                            "
                                        />
                                        <div
                                            class="card-body w-100 p-0 text-center"
                                        >
                                            <p>
                                                {{ product.type_name_ar }}
                                            </p>
                                            <p class="w-100">
                                                <input
                                                    v-model="product.type_note"
                                                    style="
                                                        width: 100%;
                                                        padding: 0;
                                                        border: 0;
                                                        box-shadow: none;
                                                        text-align: center;
                                                    "
                                                    :placeholder="__('Notes')"
                                                />
                                            </p>
                                        </div>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item p-0">
                                                <select
                                                    v-if="product.sell_unit"
                                                    v-model="product.sell_unit"
                                                    class="form-control w-100"
                                                    @change="
                                                        calcTotalTypeCost(
                                                            product
                                                        )
                                                    "
                                                >
                                                    <option
                                                        v-for="(
                                                            unit, index
                                                        ) in product.units"
                                                        v-if="unit.unit"
                                                        :key="index"
                                                        :selected="
                                                            unit ===
                                                            product.sell_unit
                                                                .unit
                                                        "
                                                        :value="unit"
                                                    >
                                                        {{
                                                            unit.unit
                                                                .unit_ar_name
                                                        }}
                                                    </option>
                                                </select>
                                                <span v-else>-</span>
                                            </li>

                                            <li class="list-group-item p-0">
                                                <table
                                                    class="text-center font-weight-bold w-100"
                                                >
                                                    <thead>
                                                        <tr>
                                                            <th
                                                                class="w-25"
                                                                v-show="
                                                                    form.table
                                                                "
                                                            >
                                                                {{
                                                                    __(
                                                                        "In Kitchen"
                                                                    )
                                                                }}
                                                            </th>

                                                            <th class="w-25">
                                                                {{
                                                                    __("Price")
                                                                }}
                                                            </th>

                                                            <th class="w-25">
                                                                {{
                                                                    __(
                                                                        "Discount"
                                                                    )
                                                                }}
                                                            </th>
                                                            <th class="w-25">
                                                                {{
                                                                    __("Total")
                                                                }}
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td
                                                                v-show="
                                                                    form.table
                                                                "
                                                                class="font-weight-bold w-25"
                                                            >
                                                                <label
                                                                    :for="
                                                                        'for-' +
                                                                        index
                                                                    "
                                                                >
                                                                    تــــــــــــم
                                                                </label>
                                                                <input
                                                                    class="form-check-input"
                                                                    type="checkbox"
                                                                    v-model="
                                                                        product.is_print
                                                                    "
                                                                    :id="
                                                                        'for-' +
                                                                        index
                                                                    "
                                                                />
                                                            </td>

                                                            <td>
                                                                <input
                                                                    onClick="this.select();"
                                                                    type="number"
                                                                    min="0"
                                                                    step="0.01"
                                                                    v-model="
                                                                        product
                                                                            .sell_unit
                                                                            .price
                                                                    "
                                                                    :readonly="
                                                                        !user.change_price ||
                                                                        product.has_Offer
                                                                    "
                                                                    class="btn w-100"
                                                                    @keyup="
                                                                        calcSum()
                                                                    "
                                                                />
                                                            </td>
                                                            <td>
                                                                <input
                                                                    v-model="
                                                                        product.type_discount_value
                                                                    "
                                                                    onClick="this.select();"
                                                                    type="number"
                                                                    min="0"
                                                                    step="0.01"
                                                                    class="btn text-bold"
                                                                    style="
                                                                        width: 80px;
                                                                    "
                                                                    @change="
                                                                        onChangeTypeCost(
                                                                            product
                                                                        )
                                                                    "
                                                                />
                                                            </td>
                                                            <td
                                                                class="text-center"
                                                            >
                                                                {{
                                                                    format(
                                                                        product.total_type_cost
                                                                    )
                                                                }}
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </li>
                                        </ul>
                                        <div class="card-body w-100 px-0">
                                            <a
                                                v-if="product.type_count <= 1"
                                                class="btn mx-2 btn-danger"
                                                @click="
                                                    removeFromCart(
                                                        product,
                                                        index
                                                    )
                                                "
                                                ><i
                                                    class="fa fa-trash text-light"
                                                ></i>
                                            </a>
                                            <button
                                                v-else
                                                :disabled="product.has_Offer"
                                                class="btn mx-2 btn-warning"
                                                @click="decrement(product)"
                                            >
                                                -
                                            </button>
                                            <input
                                                v-model="product.type_count"
                                                :readonly="product.has_Offer"
                                                min="0"
                                                step="0.01"
                                                onClick="this.select();"
                                                type="number"
                                                class="btn"
                                                style="width: 80px"
                                                @keyup="
                                                    calcTotalTypeCost(product)
                                                "
                                            />

                                            <button
                                                :disabled="product.has_Offer"
                                                class="btn mx-2 btn-success"
                                                @click="increment(product)"
                                            >
                                                +
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <table
                                v-else
                                class="text-center font-weight-bold"
                                style="overflow-x: auto"
                            >
                                <thead>
                                    <tr>
                                        <th
                                            style="width: 20%"
                                            v-show="form.table"
                                        >
                                            {{ __("In Kitchen") }}
                                        </th>
                                        <th style="width: 40%">
                                            {{ __("Type Name") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Operation") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Count") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Price") }}
                                        </th>

                                        <th style="width: 10%">
                                            {{ __("Discount Value") }}
                                        </th>
                                        <th style="width: 10%">
                                            {{ __("Total") }}
                                        </th>
                                    </tr>
                                </thead>

                                <tbody v-if="cart.length > 0">
                                    <tr
                                        v-for="(product, index) in cart"
                                        :key="product.id"
                                        :class="
                                            product.has_Offer
                                                ? 'bg-secondary text-light'
                                                : ''
                                        "
                                    >
                                        <td
                                            v-show="form.table"
                                            class="font-weight-bold"
                                        >
                                            <label :for="'for-' + index">
                                                تــــــــــــم
                                            </label>
                                            <input
                                                class="form-check-input"
                                                type="checkbox"
                                                v-model="product.is_print"
                                                :id="'for-' + index"
                                            />
                                        </td>
                                        <td class="font-weight-bold">
                                            {{ product.type_name_ar }}
                                            <br />
                                            <input
                                                v-model="product.type_note"
                                                style="
                                                    width: 100%;
                                                    padding: 0;
                                                    border: 0;
                                                    box-shadow: none;
                                                    text-align: center;
                                                "
                                                :placeholder="__('Notes')"
                                            />
                                        </td>
                                        <td>
                                            <select
                                                v-if="product.sell_unit"
                                                v-model="product.sell_unit"
                                                class="form-control w-100"
                                                @change="
                                                    calcTotalTypeCost(product)
                                                "
                                            >
                                                <option
                                                    v-for="(
                                                        unit, index
                                                    ) in product.units"
                                                    v-if="unit.unit"
                                                    :key="index"
                                                    :selected="
                                                        unit ===
                                                        product.sell_unit.unit
                                                    "
                                                    :value="unit"
                                                >
                                                    {{ unit.unit.unit_ar_name }}
                                                </option>
                                            </select>
                                            <span v-else>-</span>
                                        </td>
                                        <td>
                                            <a
                                                v-if="product.type_count <= 1"
                                                class="btn mx-2 btn-danger"
                                                @click="
                                                    removeFromCart(
                                                        product,
                                                        index
                                                    )
                                                "
                                                ><i
                                                    class="fa fa-trash text-light"
                                                ></i>
                                            </a>
                                            <button
                                                v-else
                                                :disabled="product.has_Offer"
                                                class="btn mx-2 btn-warning"
                                                @click="decrement(product)"
                                            >
                                                -
                                            </button>
                                            <input
                                                v-model="product.type_count"
                                                :readonly="product.has_Offer"
                                                min="0"
                                                step="0.01"
                                                onClick="this.select();"
                                                type="number"
                                                class="btn"
                                                style="width: 80px"
                                                @keyup="
                                                    calcTotalTypeCost(product)
                                                "
                                            />

                                            <button
                                                :disabled="product.has_Offer"
                                                class="btn mx-2 btn-success"
                                                @click="increment(product)"
                                            >
                                                +
                                            </button>
                                        </td>
                                        <td>
                                            <input
                                                onClick="this.select();"
                                                type="number"
                                                min="0"
                                                step="0.01"
                                                v-model="
                                                    product.sell_unit.price
                                                "
                                                :readonly="
                                                    !user.change_price ||
                                                    product.has_Offer
                                                "
                                                class="btn"
                                                style="width: 100px"
                                                @keyup="calcSum()"
                                            />
                                        </td>
                                        <td>
                                            <input
                                                v-model="
                                                    product.type_discount_value
                                                "
                                                onClick="this.select();"
                                                type="number"
                                                min="0"
                                                step="0.01"
                                                class="btn text-bold"
                                                style="width: 80px"
                                                @change="
                                                    onChangeTypeCost(product)
                                                "
                                            />
                                        </td>

                                        <td class="text-center">
                                            {{
                                                format(product.total_type_cost)
                                            }}
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody v-else>
                                    <tr class="w-100">
                                        <td
                                            class="m-auto font-weight-light"
                                            colspan="8"
                                        >
                                            لا توجد أصناف
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- End Selected Items-->
                </div>

                <!--Start  All Products -->
                <div class="col-lg-6 col-md-12">
                    <div class="row">
                        <div v-if="!mixins.pretty" class="col-12">
                            <ul
                                id="pills-tab"
                                class="nav nav-pills w-100 p-0"
                                role="tablist"
                            >
                                <li
                                    v-for="(
                                        cat, index
                                    ) in filterSearchInCategory"
                                    :id="'cat-' + index"
                                    :key="index"
                                    class="cat-0 nav-item my-1 mx-1 mb-1"
                                    role="presentation"
                                    style="border: 1px solid #ddd"
                                >
                                    <a
                                        :id="
                                            'pills-' + cat.main_type_id + '-tab'
                                        "
                                        :aria-controls="
                                            'pills-' + category.main_type_id
                                        "
                                        :class="
                                            cat === category
                                                ? 'nav-link active'
                                                : 'nav-link'
                                        "
                                        :data-bs-target="
                                            '#pills-' + cat.main_type_id
                                        "
                                        aria-selected="true"
                                        class="btn btn-outline-primary font-weight-bold text-dark"
                                        data-bs-toggle="pill"
                                        role="tab"
                                        type="button"
                                        @click="
                                            category = cat;
                                            catName = '';
                                        "
                                    >
                                        {{ cat.main_type_title_ar }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div
                            :class="
                                mixins.pretty
                                    ? 'col-md-9 col-sm-8'
                                    : 'col-md-12 col-sm-12'
                            "
                            style="border: 1px solid #ddd"
                        >
                            <div class="card-header inbill">
                                <p
                                    class="h6 text-center float-right"
                                    v-if="category"
                                >
                                    <i
                                        v-if="mixins.pretty"
                                        class="fa fa-columns mx-2"
                                        @click="changeView()"
                                    ></i>
                                    <i
                                        v-else
                                        class="fa fa-table mx-2"
                                        @click="changeView()"
                                    ></i>
                                    {{ __("Items") }}
                                    {{ category.main_type_title_ar }}
                                </p>
                                <input
                                    v-model="searchTerm"
                                    class="form-control w-50 float-left"
                                    :placeholder="__('Name ar')"
                                    type="text"
                                />
                            </div>
                            <div
                                v-if="category"
                                :id="'pills-' + category.main_type_id"
                                :aria-labelledby="
                                    'pills-' + category.main_type_id + '-tab'
                                "
                                class="tab-pane fade show"
                                role="tabpanel"
                            >
                                <div id="pills-tabContent" class="tab-content">
                                    <div class="row">
                                        <div
                                            v-for="product in filterSearchInCatType"
                                            :key="product.type_id"
                                            :class="mixins.count_in_row_main"
                                            @click="addToCart(product)"
                                        >
                                            <div class="card text-center mb-2">
                                                <span class="d-none"
                                                    >{{
                                                        product.type_id
                                                    }}></span
                                                >
                                                <img
                                                    loading="lazy"
                                                    :alt="product.type_name_ar"
                                                    :src="
                                                        product.type_icon !=
                                                            null &&
                                                        product.type_icon != ''
                                                            ? product.type_icon
                                                            : 'backend/products/product.png'
                                                    "
                                                    class="w-100"
                                                />
                                                <div
                                                    class="card__shop card-header py-0"
                                                >
                                                    <b
                                                        class="card__shop__price mt-1 font-weight-bold text-light badge badge-info"
                                                        >{{
                                                            Number(
                                                                product.sell_unit
                                                                    ? product
                                                                          .sell_unit
                                                                          .price
                                                                    : product.type_sill_price
                                                            ).toFixed(
                                                                mixins.digit
                                                            )
                                                        }}</b
                                                    >
                                                    <h2
                                                        class="card__title w-100 font-weight-bold"
                                                    >
                                                        {{
                                                            product.type_name_ar
                                                        }}
                                                    </h2>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div
                            v-if="mixins.pretty"
                            class="col-md-3 col-sm-4"
                            style="border: 1px solid #ddd"
                        >
                            <div class="card-header inbill">
                                <p class="h6 text-center">
                                    {{ __("Categories") }}
                                </p>
                            </div>
                            <input
                                v-model="catName"
                                class="form-control"
                                :placeholder="__('Name ar')"
                                type="text"
                            />
                            <ul
                                id="pills-tab"
                                class="nav nav-pills w-100 p-0"
                                role="tablist"
                            >
                                <li
                                    v-for="(
                                        cat, index
                                    ) in filterSearchInCategory"
                                    :id="'cat-' + index"
                                    :key="index"
                                    class="cat-0 nav-item my-1 w-100"
                                    role="presentation"
                                    style="border: 1px solid #ddd"
                                >
                                    <a
                                        :id="
                                            'pills-' + cat.main_type_id + '-tab'
                                        "
                                        :aria-controls="
                                            'pills-' + category.main_type_id
                                        "
                                        :class="
                                            cat === category
                                                ? 'nav-link active'
                                                : 'nav-link'
                                        "
                                        :data-bs-target="
                                            '#pills-' + cat.main_type_id
                                        "
                                        aria-selected="true"
                                        class="btn btn-outline-primary font-weight-bold text-dark"
                                        data-bs-toggle="pill"
                                        role="tab"
                                        type="button"
                                        @click="
                                            category = cat;
                                            catName = '';
                                        "
                                    >
                                        {{ cat.main_type_title_ar }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--  End All Products -->
            </div>

            <div
                id="exampleModal"
                aria-hidden="true"
                aria-labelledby="exampleModalLabel"
                class="modal fade"
                role="dialog"
                tabindex="-1"
            >
                <div
                    class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                    role="document"
                >
                    <div class="modal-content m-auto" style="min-width: 600px">
                        <div class="modal-header">
                            <h5 id="exampleModalLabel" class="modal-title">
                                {{ bill.bill_total }}
                            </h5>
                            <button
                                aria-label="Close"
                                class="close"
                                data-dismiss="modal"
                                type="button"
                            >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="col-lg-12 mb-4">
                                <div class="table-responsive">
                                    <label
                                        ><input
                                            v-model="customer_name"
                                            :placeholder="__('Customer Name')"
                                            aria-controls="dataTable"
                                            class="form-control form-control"
                                            type="search"
                                    /></label>
                                    <table class="table align-items-center">
                                        <thead>
                                            <tr>
                                                <th class="col-header">
                                                    {{ __("Customer Code") }}
                                                </th>
                                                <th class="col-header">
                                                    {{ __("Customer Name") }}
                                                </th>
                                                <th class="col-header">
                                                    {{ __("mobile") }}
                                                </th>
                                                <th class="col-header">
                                                    {{ __("Balance") }}
                                                </th>
                                                <th class="col-header">
                                                    {{ __("Select") }}
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr
                                                v-for="(
                                                    customer, index
                                                ) in filterSearch"
                                                :key="index"
                                            >
                                                <td>{{ customer.cust_id }}</td>
                                                <td>
                                                    {{ customer.cust_name }}
                                                </td>
                                                <td>
                                                    {{ customer.cust_mobile }}
                                                </td>
                                                <td>
                                                    {{ customer.cust_balance }}
                                                </td>
                                                <td>
                                                    <button
                                                        class="btn btn-success btn-sm"
                                                        data-dismiss="modal"
                                                        @click="
                                                            selectCustomer(
                                                                customer
                                                            )
                                                        "
                                                    >
                                                        <i
                                                            class="fa fa-plus font-weight-bold text-light"
                                                        ></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button
                                class="btn btn-secondary"
                                data-dismiss="modal"
                                type="button"
                            >
                                Close
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <Printer
                    :bill="bill"
                    :qr="qr"
                    v-if="mixins.printer_type == 1"
                />
                <A4Printer :bill="bill" :qr="qr" v-else />
                <kitchen :bill="tableprint" />
            </div>
        </div>
    </div>
</template>

<script>
import Printer from "../printer";
import kitchen from "../kitchen";
import A4Printer from "../A4Printer";

import Spinner from "../spinner/mixinsSpinner.vue";
import { Invoice } from "@axenda/zatca";
import moment from "moment";
import Tafgeet from "tafgeetjs";
export default {
    components: { Printer, Spinner, kitchen, A4Printer },
    async created() {
        if (!User.loggedIn()) {
            this.$router.push("/");
        }
        await axios
            .get("/api/users/" + localStorage.getItem("user_id"))
            .then(({ data }) => (this.user = data))
            .catch((error) => console.log(error));
        await this.getMixins();
        await this.allMainType();
        await this.allPayMethods();
        await this.allTables();
        await this.allCustomers();
    },

    computed: {
        filterSearchInCategory() {
            return this.categories.filter((cat) => {
                return cat.main_type_title_ar.match(this.catName);
            });
        },
        filterSearchInCatType() {
            if (this.category.products) {
                return this.category.products.filter((type) => {
                    return type.type_name_ar.match(this.searchTerm);
                });
            }
        },
        filterSearch() {
            return this.customers.filter((customer) => {
                return customer.cust_name.match(this.customer_name);
            });
        },
    },

    data() {
        return {
            open_table: false,
            user: {},
            disable: false,
            tableprint: {},
            title: "New Bill",
            searchTypes: [],
            showSearchTypeModal: false,
            output: null,
            qr: "",
            isNewbill: true,
            isPrint: false,
            loading: true,
            mixins: {},
            products: [],
            payMethods: [],
            categories: [],
            category: {},
            customers: [],
            customer: {},
            search: "",
            barcode: "",
            id: "",
            customer_name: "",
            typeName: "",
            isPercentDiscount: true,
            bill_id: 0,
            bill: {},
            cart: [],
            type: {},
            product: {},
            form: {
                is_included: false,
                current_vat: 0,
                sumAfterDiscount: 0.0,
                user_id: null,
                note: "",
                sum: 0.0,
                discount: 0.0,
                total: 0.0,
                extra: 0.0,
                vat: 0.0,
                cart: [],
                paid: 0.0,
                remain: 0.0,
                customer: {},
                pay: 1,
                isPercentDiscount: true,
                pendingBill: null,
                offerDiscount: 0.0,
                billDiscountPercent: 0.0,
                table: null,
                discountValue: 0.0,
            },
            errors: {},
            pending: [],
            selected: "",
            typeUnit: null,
            tables: [],
            catName: "",
            searchTerm: "",
        };
    },

    methods: {
        async endTable(currentTable) {
            this.form.table = currentTable;
            let table = this.form.table;
            await axios
                .get("api/bills/tables/" + table.id)
                .then(({ data }) => {
                    if (data && data.table_type && data.table_type.length > 0) {
                        parseFloat(this.form.vat);
                        this.form.table = table;
                        data.table_type.forEach(async (product) => {
                            this.product = {};

                            this.product.units = [];
                            if (product.units != null) {
                                this.product.units.push(product.units);

                                this.product.sell_unit = product.sell_unit
                                    ? product.sell_unit
                                    : "";
                            }
                            this.product.is_print = true;
                            this.product.type_name_ar =
                                product.type.type_name_ar;
                            this.product.sell_unit.price = product.type_price;
                            this.product.type_count = product.type_count;
                            this.product.type_id = product.type_id;
                            this.product.total_type_cost =
                                product.type_total_price;
                            this.product.type_note = product.type_note;
                            this.product.type_vat_percent =
                                product.type_vat_percent;
                            this.product.type_discount_value =
                                product.type_discount;
                            this.product.type_vat_percent = product.type_vat;
                            this.cart.push(this.product);
                        });
                    }
                    this.open_table = false;
                })
                .catch((err) => console.log(err));
            await this.calcSum();
            await this.saveBill();
            this.open_table = false;
        },
        changeView() {
            this.mixins.pretty = !this.mixins.pretty;
        },
        emptyTable(table) {
            if (confirm("هل تريد الحذف؟لايمكن الاستعاده مره اخرى.")) {
                axios
                    .delete("api/bills/tables/" + table.id)
                    .then(() => {
                        this.allTables();
                        this.clearAll();
                        Notification.successMsg("تم الحذف بنجاح");
                    })
                    .catch(() => {
                        Notification.error();
                    });
            }
        },

        async allMainType() {
            await axios
                .get("/api/AllCategories")
                .then(async ({ data }) => {
                    this.categories = data;
                    this.loading = false;
                    this.category = this.categories[0];
                })
                .then(() => {})
                .catch((error) => console.log(error));
        },

        async allProducts() {
            await axios
                .get("/api/types")
                .then(({ data }) => {
                    this.products = data;
                })
                .catch((error) => console.log(error));
        },
        async allPayMethods() {
            await axios
                .get("/api/payMethods")
                .then(({ data }) => (this.payMethods = data))
                .catch((error) => console.log(error));
        },
        async allTables() {
            await axios
                .get("/api/table")
                .then(({ data }) => (this.tables = data))
                .catch((error) => console.log(error));
        },
        async allCustomers() {
            await axios
                .get("/api/action/all/customers")
                .then(({ data }) => (this.customers = data))
                .catch((error) => console.log(error));
        },
        async findCustomer() {
            this.form.discount = 0;
            await axios
                .get("/api/customers/" + this.search)
                .then(async ({ data }) => {
                    this.customer = data;
                    await this.calcSum();
                })
                .catch((error) => console.log(error));
        },
        async findType() {
            await axios
                .get("/api/findTypeByBarcode/" + this.barcode)
                .then(async ({ data }) => {
                    this.type = data;
                    if (this.type.type_id != null) {
                        await this.addToCart(this.type);
                        this.barcode = "";
                    } else {
                        Notification.customMsg(
                            "warning",
                            "topRight",
                            "لايوجد صنف بهذا الاسم"
                        );
                    }
                })
                .catch((error) => console.log(error));
        },
        async findTypeByCodeOrId() {
            await axios
                .get("/api/action/find/" + this.id)
                .then(({ data }) => {
                    this.type = data;
                    if (data.type_id != null) {
                        this.addToCart(data);
                        this.id = "";
                    } else {
                        Notification.customMsg(
                            "warning",
                            "topRight",
                            "لايوجد صنف بهذا الاسم"
                        );
                    }
                })
                .catch((error) => console.log(error));
        },

        async checkIfTypeHasOffer(product) {
            if (product.offers.length > 0) {
                product.offers.map((type) => {
                    if (type.main_type_count === product.type_count) {
                        let offer = type.offer_type;
                        offer.sell_unit.price =
                            offer.sell_unit.price -
                            (offer.sell_unit.price *
                                type.offer_discount_percent) /
                                100.0;

                        offer.type_count = 1;
                        offer.has_Offer = true;
                        this.cart.push(offer);
                        this.calcTotalTypeCost(offer);
                    }
                });
            }
        },

        async findTypeByLike() {
            if (this.typeName != "" && this.typeName != null) {
                await axios
                    .get("/api/action/like/" + this.typeName)
                    .then(({ data }) => {
                        this.searchTypes = data;
                    })
                    .catch((error) => console.log(error));
            }
        },
        async selectCustomer(customer) {
            this.customer = customer;
            this.search = customer.cust_id;
            await this.calcSum();
        },

        async print(id) {
            await axios
                .get("api/bills/" + id)
                .then(async ({ data }) => {
                    this.bill = data;
                    this.bill.billTotal = 0;
                    if (this.bill.bill_total > 0) {
                        this.bill.billTotal = new Tafgeet(
                            this.bill.bill_total,
                            this.mixins.country == 1 ? "EGP" : "SAR"
                        ).parse();
                    }
                    if (this.bill != null) {
                        const invoice = new Invoice({
                            sellerName: this.mixins.mixins_name,
                            vatRegistrationNumber: this.mixins.contruct_no,
                            invoiceTimestamp: this.bill.bill_date,
                            invoiceTotal: this.bill.bill_total,
                            invoiceVatTotal: this.bill.bill_vat_val,
                        });
                        this.qr = await invoice.render();
                    }
                })
                .then(() => {
                    $("#printer").click();
                    $("#btn").click();
                })
                .catch((err) => console.log(err));
        },
        async getMixins() {
            await axios
                .get("/api/mixins/1")
                .then(({ data }) => {
                    this.mixins = data;
                })
                .catch((error) => console.log(error));
        },
        async calcIfCustomerHasDiscount() {
            if (
                this.cart.length >= 0 &&
                this.customer &&
                this.form.discount <= 0
            ) {
                if (this.customer.cust_discount_percent > 0) {
                    this.form.discount = 0;

                    this.form.discount = this.customer.cust_discount_percent;
                }
            }
        },
        checkOfferDate() {
            const current = new Date();
            if (
                moment(this.mixins.offer_start_date).isBefore(current) &&
                moment(this.mixins.offer_end_date).isAfter(current)
            ) {
                if (this.mixins.offer_percenet > 0) {
                    this.form.discount = 0;
                    this.form.discount = this.mixins.offer_percenet;
                    this.form.offerDiscount = this.mixins.offer_percenet;
                    return;
                }
            }
        },
        async addToCart(product) {
            // if (this.cart.includes(product)) {
            //     product.type_count++;
            // } else {
            let cloneProduct = await JSON.parse(JSON.stringify(product));
            cloneProduct.type_count = 1;
            await this.cart.push(cloneProduct);
            // this.cart.push(product);
            // }
            await this.calcTotalTypeCost(cloneProduct);

            if (this.mixins.active_type_offer) {
                await this.checkIfTypeHasOffer(cloneProduct);
            }
            this.searchTerm = "";
        },

        async removeFromCart(product, index) {
            product.type_count = 1;
            product.total_type_cost =
                product.type_count * parseFloat(product.sell_unit.price);
            this.$delete(this.cart, index);
            await this.calcSum();
        },
        async increment(product) {
            product.type_count++;
            await this.calcTotalTypeCost(product);
        },
        async decrement(product) {
            if (product.type_count <= 1) {
                product.type_count = 1;
            } else {
                product.type_count--;
            }
            await this.calcTotalTypeCost(product);
        },
        async onChangeCount(product) {
            if (product.type_count <= 1) {
                product.type_count = 1;
            }
            await this.calcTotalTypeCost(product);
        },
        async onChangeTypeCost(product) {
            // if (product.type_sill_price < product.minimum_sill_price) {
            //     product.type_sill_price = product.minimum_sill_price;
            // }
            await this.calcTotalTypeCost(product);
        },

        async calcTotalTypeCost(product) {
            await this.calcSum();
        },
        async calcSum() {
            this.form.sum = 0;
            this.form.vat = 0;
            this.form.total = 0;
            this.cart.filter((product) => {
                if (!product.has_Offer) {
                    product.type_sill_price = product.sell_unit.price ?? 0.0;
                    product.total_type_cost =
                        product.type_count *
                        parseFloat(product.sell_unit.price);
                    product.total_type_cost =
                        product.total_type_cost - product.type_discount_value;

                    this.form.sum =
                        parseFloat(this.form.sum) +
                        parseFloat(product.total_type_cost);
                }
            });

            if (this.mixins.mixins_price_include_vat && this.mixins.fixed_vat) {
                let vatVal = this.mixins.mixins_vat_val;
                this.form.sum = this.form.sum / (1 + vatVal / 100.0);
            }

            await this.calcTotal();
        },
        async calcTotal() {
            if (
                this.cart.length === 0 &&
                this.form.discount > this.form.total
            ) {
                Notification.customMsg(
                    "error",
                    "topRight",
                    "لايمكن ان يكون الخصم اكبر من الاجمالي",
                    5000
                );
                this.form.discount = 0;
            }
            this.form.total = 0;

            await this.calcIfCustomerHasDiscount();
            if (this.mixins.active_offer) {
                await this.checkOfferDate();
            }

            this.form.total =
                parseFloat(this.form.sum) + parseFloat(this.form.extra);
            if (
                this.form.table != null &&
                this.form.table.mini_charge > 0 &&
                this.form.sum < this.form.table.mini_charge
            ) {
                this.form.total =
                    Number(this.form.total) +
                    Number(this.form.table.mini_charge);
            }
            this.form.offerDiscount =
                (parseFloat(this.form.total) *
                    parseFloat(this.form.offerDiscount)) /
                100.0;
            this.form.billDiscountPercent =
                (parseFloat(this.form.total) * parseFloat(this.form.discount)) /
                100.0;
            this.form.total =
                parseFloat(this.form.total) -
                parseFloat(this.form.billDiscountPercent);

            this.form.sumAfterDiscount = this.form.total;

            await this.calcVat(this.form.total);
            this.form.total =
                parseFloat(this.form.total) + parseFloat(this.form.vat);

            this.form.vat = this.format(this.form.vat);
            this.form.sum = this.format(this.form.sum);
            this.form.total = this.format(this.form.total);
            this.form.discount = this.format(this.form.discount);
            if (this.form.pay !== 3) {
                this.form.paid = this.form.total;
                this.form.remain = 0;
            } else {
                this.form.remain = this.form.total;
                this.form.paid = 0;
            }
        },
        async calcVat(total) {
            this.form.vat = 0;
            if (!this.mixins.fixed_vat) {
                this.cart.filter((product) => {
                    this.form.vat =
                        parseFloat(this.form.vat) +
                        (product.total_type_cost * product.type_vat_percent) /
                            100.0;
                });
                return;
            }
            if (this.mixins.mixins_vat_val > 0 && this.mixins.fixed_vat) {
                let vatVal = this.mixins.mixins_vat_val;
                this.form.vat = (total * vatVal) / 100.0;
                return;
            }
        },
        calcRemain() {
            this.form.remain = this.form.total - this.form.paid;
            this.form.remain = parseFloat(this.form.remain);
        },
        format(num) {
            return parseFloat(num).toFixed(this.mixins.digit);
        },
        async saveBill() {
            // await this.calcSum();
            let isValid = true;
            if (this.cart.length <= 0) {
                isValid = false;
                Notification.customMsg(
                    "error",
                    "topRight",
                    "لايمكن حفظ فاتورة بدون أصناف"
                );
                return;
            }
            if (this.form.total <= 0 && this.form.discount <= 0) {
                isValid = false;
                Notification.customMsg(
                    "error",
                    "topRight",
                    "لايمكن حفظ فاتورة قيمتها صفر"
                );
                return;
            }
            if (
                (this.form.pay == 1 || this.form.pay == 2) &&
                this.form.paid < this.form.total
            ) {
                isValid = false;

                Notification.customMsg(
                    "error",
                    "topRight",
                    "لايمكن دفع مبلغ أقل من الاجمالي، يجب دفع قيمة مساوبة للاجمالي أو أكبر منها أو إختيار طريقة دفع أجل مع تحديد عميل",
                    5000
                );
                return;
            }
            if (this.form.pay == 3 && this.customer.cust_id == null) {
                isValid = false;
                Notification.customMsg(
                    "error",
                    "topRight",
                    "الفاتورة آجل! يجب اختيار عميل",
                    5000
                );
                return;
            }
            if (isValid) await this.saveValidBill();
        },
        async saveValidBill() {
            this.disable = true;
            this.form.user_id = localStorage.getItem("user_id");
            this.form.cart = this.cart;
            this.form.customer = this.customer;
            this.form.is_included = this.mixins.mixins_price_include_vat;
            this.form.current_vat = this.mixins.mixins_vat_val;

            if (this.form.cart.length > 0) {
                await axios
                    .post("api/bills", this.form)
                    .then((data) => {
                        Notification.success();
                        this.print(data.data);
                        setTimeout(() => $("#btn").click(), 200);
                        this.isPrint = true;
                        this.clearAll();
                        this.allTables();
                        this.disable = false;
                    })
                    .catch((error) => {
                        this.disable = false;
                    });
            } else {
                Notification.error();
                this.disable = false;
            }
        },
        async saveToTable() {
            if (this.form.table == null) {
                Notification.customMsg("error", "topRight", "يجب اختيار طاولة");
                return;
            }
            this.disable = true;
            this.form.user_id = this.user.id;
            this.form.cart = this.cart;
            this.form.customer = this.customer;
            if (this.form.cart.length > 0) {
                await axios.post("api/bills/tables", this.form);
                await axios
                    .get("api/showIntable/" + this.form.table.id)
                    .then(async ({ data }) => {
                        this.tableprint = data;
                        this.disable = false;
                    });
                await $("#distribute")[0].click();
                setTimeout(() => $("#kitchenBtn").click(), 500);
                await this.allTables();
                this.clearAll();
            }
        },

        async onChangeTable(currentTable) {
            this.form.table = currentTable;
            let table = this.form.table;

            await axios
                .get("api/bills/tables/" + table.id)
                .then(({ data }) => {
                    if (data && data.table_type && data.table_type.length > 0) {
                        if (
                            this.cart.length > 0 &&
                            !confirm("هل تريد نقل الطاولة؟")
                        ) {
                            this.clearAll();
                            this.cart = [];
                        }
                        parseFloat(this.form.vat);
                        this.form.table = table;
                        data.table_type.forEach(async (product) => {
                            this.product = {};
                            this.product.units = [];
                            console.log(product);
                            if (product.units != null) {
                                this.product.units.push(product.units);
                                this.product.sell_unit = product.sell_unit
                                    ? product.sell_unit
                                    : "";
                            } else {
                                this.product.sell_unit = null;
                            }
                            this.product.is_print = true;
                            this.product.type_name_ar =
                                product.type.type_name_ar;
                            this.product.sell_unit.price = product.type_price;
                            this.product.type_purchases_price =
                                product.type_purchases_price;

                            this.product.type_count = product.type_count;
                            this.product.type_id = product.type_id;
                            this.product.total_type_cost =
                                product.type_total_price;
                            this.product.type_note = product.type_note;
                            this.product.type_vat_percent =
                                product.type_vat_percent;
                            this.product.type_discount_value =
                                product.type_discount;
                            this.product.type_vat_percent = product.type_vat;
                            this.cart.push(this.product);
                        });
                    }
                    this.open_table = false;
                })
                .catch((err) => console.log(err));
            await this.calcSum();
        },
        clearAll() {
            this.form.vat = 0.0;

            this.customer = {};
            this.search = "";
            this.bill = {};
            this.isPrint = false;
            this.cart = [];
            this.form = {
                sumAfterDiscount: 0.0,
                user_id: null,
                note: "",
                sum: 0.0,
                discount: 0.0,
                total: 0.0,
                extra: 0.0,
                vat: 0.0,
                cart: [],
                paid: 0.0,
                remain: 0.0,
                customer: {},
                pay: 1,
                isPercentDiscount: true,
                offerDiscount: 0.0,
                billDiscountPercent: 0.0,
            };
            this.barcode = "";
        },
    },
};
</script>
<style scoped>
.card__shop__price {
    position: absolute;
    bottom: 100%;
    right: 0;
}
.card__shop.card-header {
    padding: 0 0 !important;
}
b.btn {
    float: right;
}

.fa {
    cursor: pointer;
}

body {
    /*background: var(--secondary);*/
    transition: background 0.3s;
    gap: 20px;
    font-family: "Poppins", sans-serif;
}

.newBill .card {
    background: var(--card);
    border-radius: 20px;
    font-family: "Poppins", sans-serif;
    display: flex;
    color: var(--text);
    flex-direction: column;
    align-items: flex-start;
    transition: transform 0.3s, background 0.3s;
}
.tab-content .card {
    cursor: pointer;
}
option {
    border-bottom: 1px solid #ddd;
}
option:hover {
    color: #000;
    background: #fff;
}
.newBill .card-header {
    border-radius: 0;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
    font-weight: bolder;
}

.tab-content .card:hover,
.selected .card .card:hover {
    transform: scale(1.09);
}

.newBill .card img {
    width: 160px;
    object-fit: cover;
}

.newBill .card__title {
    margin-top: 5px;
    font-size: 15px;
    font-weight: 400;
    transition: color 0.3s;
}

.newBill .card__shop {
    width: 100%;
    margin-top: auto;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.newBill .card__shop__action span {
    color: #fff;
    font-size: 26px;
}
.frame {
    border: 1px solid #ccc;
    box-shadow: 0 0 3px 2x rgba(0, 0, 0, 0.3);
    margin: 20px auto;
    height: 200px;
    width: 95%;
}
</style>
