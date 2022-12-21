@extends('layout.app')

@section('content')
<div class="row">
    <div class="col-6">
        <a href="{{ route('trash.bills') }}">

        <div class="card">
            <div class="card-header">{{ __('lang.Deleted Bills') }}</div>
            <div class="card-bod">
                <img src="{{ asset('backend/img/menu/bills.png') }}" alt="">
            </div>
        </div>
                </a>

    </div>
    <div class="col-6">
                <a href="{{ route('trash.types') }}">

        <div class="card">
            <div class="card-header">{{ __('lang.Deleted Types') }}</div>
            <div class="card-bod">
                <img src="{{ asset('backend/img/menu/types.png') }}" alt="">
            </div>
        </div>
                        </a>

    </div>
</div>
@endsection
