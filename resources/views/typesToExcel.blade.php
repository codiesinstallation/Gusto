@extends('layout.app')

@section('content')
    <div class="card col-12" style="overflow-x: scroll">
        <div class="card-header">

        </div>

        <div class="body">

            {!! $dataTable->table() !!}

        </div>

    </div>
@endsection
@section('datatable-script')
    {!! $dataTable->scripts() !!}
@endsection
