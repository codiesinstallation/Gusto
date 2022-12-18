<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="{{ asset('backend/vendor/jquery/jquery.js') }}"></script>
    {{-- Print --}}
    <script src="{{ asset('js/JSPrintManager.js') }}"></script>
    <script src="{{ asset('js/html2canvas.min.js') }}"></script>
    <script src="{{ asset('js/printing.js') }}"></script>

    <script src="{{ asset('js/cashier.js') }}"></script>
    <Style>
        td,
        th {
            text-align: center;
            border: 1px solid #222 !important;
            padding: 5px
        }

        .pos-section {
            width: 72mm;
            direction: rtl;
            min-height: 250px
        }

        @media print {
            * {
                font-size: 16px;
                font-weight: normal;
                direction: rtl;
            }

            td,
            th {
                text-align: center;
                border: 1px solid #222 !important;
                padding: 5px
            }

            .pos-section {
                width: 72mm;
                direction: rtl;
                min-height: 250px;
                height: 250px
            }
        }
    </Style>
</head>

<body class="pos-section" id="card">
    <table style="text-align: center;
margin:auto;width:100%;">
        <tr>
            <td colspan="1" class="no-border">
                مستخدم النظام
            </td>
            <td colspan="4" class="no-border">
                {{ $bills->user->name }}
            </td>
        </tr>

        <tr v-if="$bills->table_id != null">
            <td colspan="1" class="no-border">
                رقم الطاولة
            </td>
            <td colspan="4" class="no-border">
                {{ $bills->table->table_no }}
            </td>
        </tr>
        <tr>
            <td colspan="2" class="no-border">
                تاريخ الفاتورة
            </td>
            <td colspan="3" class="no-border">
                {{ $bills->bill_date }}
            </td>
        </tr>
        @if ($bills->customer)
            <tr>
                <td colspan="1" class="no-border">
                    رصيد العميل
                </td>

                <td colspan="4" class="no-border">
                    {{ $bills->customer->cust_balance }}
                </td>
            </tr>
        @endif
    </table>
    <table id="kitchenTable" style="text-align: center;
margin:auto;width:100%;"
        class="table table-striped table-bordered dt-responsive nowrap"
        style="border-collapse: collapse; border-spacing: 0; width: 100%;">

        <thead>
            <tr>
                <th style="width: 40%">
                    اسم الصنف
                </th>
                <th style="width: 20%">العدد</th>
                <th style="width: 20%">العملية</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($bills->tableType as $bill)
                @if (!$bill->is_print)
                    <tr id="{{ 'type' . $bill->type->type_id }}">
                        <td style="display: none">
                            {{ $bill->type->mainType->main_type_id }}
                        </td>
                        <td>
                            {{ $bill->type->type_name_ar }}
                            <small>{{ $bill->type_note }}</small>
                        </td>
                        <td class="text-center">
                            {{ $bill->type_count }}
                        </td>
                        <td class="text-center">
                            {{ $bill->units ? $bill->units->unit->unit_ar_name : '' }}
                        </td>

                    </tr>
                @endif
            @endforeach


        </tbody>
    </table>
    <script>
        $(document).ready(function() {
            var bills = {!! json_encode($bills->tableType) !!};
            var printersArr = new Array();
            bills.map((type) => {
                if (!type.is_print) {
                    var link = type.type.main_type;
                    printersArr.push(link);
                }
            });
            if (printersArr.length > 0) {
                distributePrintingTimeoutMain(printersArr);
            }
        });
    </script>
</body>

</html>
