@extends('layout.app')

@section('content')
    <div class="card col-12" style="overflow-x: scroll">
        <div class="card-header">
            <div class="alert alert-danger " style="display: none">يجب تحديد فتره (من-الى) </div>

            <form name="form" class="needs-validation mt-2 hideMeInPrint" method="GET" action="Fbills">
                <div class="form-row justify-content-center">

                    <div class="col-md-2">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label"
                                for="from">{{ __(App::getLocale() . '.From') }}</label>
                            <div class="col-sm-10">
                                <input class="form-control " type="date" name="from" id="from"
                                    placeholder="{{ __(App::getLocale() . '.From') }}" value="{{ request('from') }}">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-2">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label" for="to">{{ __(App::getLocale() . '.To') }}</label>
                            <div class="col-sm-10">
                                <input class="form-control " type="date" name="to" id="to"
                                    placeholder="{{ __(App::getLocale() . '.To') }}" value="{{ request('to') }}">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group">
                            <select class="form-control-sm " name="cust_id">
                                <option value="">{{ __(App::getLocale() . '.All Customers') }}</option>
                                @foreach ($customers as $customer)
                                    <option value="{{ $customer->cust_id }}"
                                        @if (request('cust_id') == $customer->cust_id) selected="selected" @endif>
                                        {{ $customer->cust_name }}</option>
                                @endforeach
                            </select>

                        </div>
                    </div>
                    <div class="col-md-1">
                        <div class="input-group">
                            <select class="form-control " name="period">
                                <option value="daily"@if (request('period') == 'daily') selected="selected" @endif>
                                    {{ __(App::getLocale() . '.Daily') }} </option>
                                <option value="monthly" @if (request('period') == 'monthly') selected="selected" @endif>
                                    {{ __(App::getLocale() . '.Monthly') }}</option>
                                <option value="period" @if (request('period') == 'period') selected="selected" @endif>
                                    {{ __(App::getLocale() . '.Period') }}</option>
                            </select>

                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group">
                            <select class="form-control-sm " name="user_id">
                                <option value="">{{ __(App::getLocale() . '.All Users') }}</option>
                                @foreach ($users as $user)
                                    <option value="{{ $user->id }}"
                                        @if (request('user_id') == $user->id) selected="selected" @endif>
                                        {{ $user->name }}</option>
                                @endforeach
                            </select>

                        </div>
                    </div>

                    <div class="col-md-1">
                        <div class="input-group">
                            <select class="form-control-sm " name="pay">
                                <option value="">{{ __(App::getLocale() . '.All Bills') }}</option>
                                @foreach ($pays as $pay)
                                    <option value="{{ $pay->id }}"
                                        @if (request('pay') == $pay->id) selected="selected" @endif>
                                        {{ $pay->pay_method_name }}</option>
                                @endforeach
                            </select>

                        </div>
                    </div>

                    <div class="col-md-1">
                        <button class="btn btn-success" type="submit">
                            {{ __(App::getLocale() . '.View') }}
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div class="body">

            {!! $dataTable->table() !!}

        </div>

    </div>
@endsection
@section('datatable-script')
    {!! $dataTable->scripts() !!}
@endsection
@section('scripts')
    <script>
        $(function() {
            $.fn.dataTable.ext.errMode = 'none';

            function getUrlParameter(name) {
                name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                    results = regex.exec(location.search);
                return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
            }
            if (getUrlParameter('period') == 'period' && getUrlParameter('to') === '' &&
                getUrlParameter(
                    'from') === '') {
                $('.alert-danger').css('display', 'block');

            }
            $('select').on('change', function(e) {
                $('.alert-danger').fadeOut();
                document.forms['form'].submit();

            });
            $('.reload').click(function() {
                alert('ss')
                location.reload(true)
            })
        })
    </script>
    @isset($sum)
        <script>
            $(function() {
                var table = document.getElementById("bills-table");
                var footer = table.createTFoot();
                footer.classList.add('text-center');
                var row = footer.insertRow(0);
                footer.innerHTML =
                    `<tr> <th <th colspan='4'> {{ __(App::getLocale() . '.Total Of Bills Without Vat') }}</th> <th colspan='4'> ` +
                    {!! json_encode(round($sum ?? '', 2)) !!} +
                    ` </th> </tr><tr> <th <th colspan='4'> {{ __(App::getLocale() . '.Total Of Vat') }}</th> <th <th colspan='4'>` +
                    {!! json_encode(round($vat ?? '', 2)) !!} +
                    ` </tr><tr></th> <th <th colspan='4'> {{ __(App::getLocale() . '.Total Of Bills With Vat') }}</th> <th <th colspan='4'>` +
                    {!! json_encode(round($bill_total ?? '', 2)) !!} +
                    ` </th> </tr>`;

            })
        </script>
    @endisset
@endsection
