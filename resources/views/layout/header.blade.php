<!DOCTYPE html>
<html lang="{{ App::getLocale() }}" dir="{{ App::getLocale() === 'en' ? 'ltr' : 'rtl' }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gusto System</title>
    @include('layout.css')
</head>

<body class="hold-transition sidebar-mini layout-fixed sidebar-collapse">
    <div id="app" class="wrapper">
        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <div class="loadPage">
            </div>
        </div>
