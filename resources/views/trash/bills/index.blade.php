@extends('layout.app')

@section('content')
    <div class="card">
        <table class="table table-bordered text-center">
            <thead>
                <tr>
                    <th>{{ __('lang.Code') }}</th>
                    <th>{{ __('lang.Sum') }}</th>
                    <th>{{ __('lang.Vat') }}</th>
                    <th>{{ __('lang.Total') }}</th>
                    <th>{{ __('lang.Deleted Date') }}</th>
                    <th>{{ __('lang.Reset') }}</th>

                </tr>

            <tbody>
                @foreach ($bills as $bill)
                    <tr>
                        <td>{{ $bill->bill_no }}</td>
                        <td>{{ $bill->bill_sum }}</td>
                        <td>{{ $bill->bill_vat_val }}</td>
                        <td>{{ $bill->bill_total }}</td>
                        <td>{{ $bill->delete_date }}</td>
                        <td>
                            <a class="btn btn-danger" href="{{ route('restore.bill') }}"
                                onclick="event.preventDefault();
                                                     document.getElementById('restore-form').submit();">
                                {{ __('lang.Reset') }}
                            </a>

                            <form id="restore-form" action="{{ route('restore.bill') }}" method="POST" class="d-none">
                                <input bill="hidden" name="bill_no" value="{{ $bill->bill_no }}" />
                                @csrf
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
            </thead>

        </table>
    </div>
@endsection
