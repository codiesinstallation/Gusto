<template>
    <tfoot v-if="calc&&calc.total" class="details">
        <tr>
            <th :colspan="colspan" style="width: 10%">
                {{ __("All Bills Total") }}
            </th>
            <th style="width: 10%">
                {{ format(calc.total) }}
            </th>
            <th :colspan="colspan" class="hideMeInPrint" style="width: 10%">{{ __("Vat") }}</th>
            <th style="width: 10%" class="hideMeInPrint">
                {{ format(calc.Vat) }}
            </th>
            <th :colspan="colspan" class="hideMeInPrint"  style="width: 10%">
                {{ __("Bills Count") }}
            </th>
            <th style="width: 10%" class="hideMeInPrint">
                {{ calc.Count }}
            </th>
        </tr>
        <tr>
            <th :colspan="colspan" style="width: 10%">
                {{ __("All Cash Bills Total") }}
            </th>
            <th style="width: 10%">
                {{ format(calc.Cash) }}
            </th>
            <th :colspan="colspan" class="hideMeInPrint"  style="width: 10%">{{ __("Vat") }}</th>
            <th style="width: 10%" class="hideMeInPrint" >
                {{ format(calc.CashVat) }}
            </th>
            <th :colspan="colspan" class="hideMeInPrint"  style="width: 10%">
                {{ __("Bills Count") }}
            </th>
            <th style="width: 10%" class="hideMeInPrint" >
                {{ calc.CashCount }}
            </th>
        </tr>
        <tr>
            <th :colspan="colspan" style="width: 10%">
                {{ __("All Card Bills Total") }}
            </th>
            <th style="width: 10%">
                {{ format(calc.Card) }}
            </th>
            <th :colspan="colspan" class="hideMeInPrint"  style="width: 10%">{{ __("Vat") }}</th>
            <th style="width: 10%" class="hideMeInPrint" >
                {{ format(calc.CardVat) }}
            </th>
            <th :colspan="colspan" class="hideMeInPrint"  style="width: 10%">
                {{ __("Bills Count") }}
            </th>
            <th style="width: 10%" class="hideMeInPrint" >
                {{ calc.CardCount }}
            </th>
        </tr>
        <tr>
            <th :colspan="colspan" style="width: 10%">
                {{ __("All Later Bills Total") }}
            </th>
            <th style="width: 10%">
                {{ format(calc.Later) }}
            </th>
            <th :colspan="colspan" class="hideMeInPrint"  style="width: 10%">{{ __("Vat") }}</th>
            <th style="width: 10%" class="hideMeInPrint" >
                {{ format(calc.LaterVat) }}
            </th>
            <th :colspan="colspan" class="hideMeInPrint"  style="width: 10%">
                {{ __("Bills Count") }}
            </th>
            <th style="width: 10%" class="hideMeInPrint" >
                {{ calc.LaterCount }}
            </th>
        </tr>
    </tfoot>
    <tfoot v-else class="text-center w-100 p-5" style="position: absolute">
        لاتوجد بيانات
    </tfoot>
</template>

<script>
export default {
    name: "Calculation",
    props: ["calc", "colspan"],

    data() {
        return {};
    },
    methods: {
        format(num) {
            return parseFloat(num).toFixed(this.$root.$data.codies.digit);
        },
    },
};
</script>
