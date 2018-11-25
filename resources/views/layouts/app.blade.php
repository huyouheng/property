<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Google Fonts -->
    <link href="{{asset('/css/fonts.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('/css/fonts-icon.css')}}" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="/css/waves.css" rel="stylesheet"/>

    <!-- Animation Css -->
    <link href="/css/animate.css" rel="stylesheet"/>

    <!-- Custom Css -->
    <link href="/css/style.css" rel="stylesheet">


    <link href="/css/all-themes.css" rel="stylesheet"/>
    <link href="/css/bootstrap-select.css" rel="stylesheet"/>
    <!-- toast -->
    <link rel="stylesheet" href="{{ asset("/vendor/toastr/build/toastr.min.css") }}">
    <link rel="stylesheet" href="{{ asset("/vendor/nprogress/nprogress.css") }}">
    <link rel="stylesheet" href="{{ asset("/vendor/fontawesome-iconpicker/dist/css/fontawesome-iconpicker.min.css") }}">
    <link rel="stylesheet" href="{{ asset("/vendor/font-awesome/css/font-awesome.min.css") }}">
    <!-- header js -->
    <!-- Jquery Core Js -->
    <script src="/js/jquery.min.js"></script>
    <!-- Bootstrap Core Js -->
    <script src="/js/bootstrap.js"></script>
    <!-- Slimscroll Plugin Js -->
    <script src="/js/jquery.slimscroll.js"></script>
    <script src="{{ asset('/vendor/jquery-pjax/jquery.pjax.js' )}}"></script>
    <script src="{{ asset ("/vendor/nprogress/nprogress.js") }}"></script>
    <script src="{{ asset ("/vendor/toastr/build/toastr.min.js") }}"></script>
    <style>
        .navbar-header {
            padding: 0px 0px 0px 7px;
        }

        .navbar-header .bars:before, .navbar-header .bars:after {
            margin-top: -5px;
        }

        .navbar-brand {
            margin-top: 5px;
        }

        section.content {
            margin: 56px 15px 0 240px;
        }

        .sidebar {
            width: 230px;
            top: 55px;
            height: calc(100vh - 55px);
        }

        .navbar-right {
            margin-top: -5px;
        }

        .right-sidebar {
            top: 56px;
        }

        .navbar-nav > li > .dropdown-menu {
            margin-top: 0px !important;
            margin-right: -50px;
        }

        .panel .datepicker-popup {
            position: relative !important;
        }

        .content-header {
            position: relative;
            padding: 15px 15px 0 15px;
        }

        .content-header h1 {
            font-size: 24px;
            font-weight: 100;
            margin: 0 0 0 -10px;
        }

        .box {
            position: relative;
            border-radius: 3px;
            background: #ffffff;
            border-top: 3px solid #d2d6de;
            margin-bottom: 20px;
            width: 100%;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        }

        .box.box-success {
            border-top-color: #00a65a;
        }

        .menu-label {
            width: 80px;
            line-height: 35px;
        }
        .menu-header-icon{
            font-size: 20px;
            margin-top: 1px;
            margin-right: 10px; 
            margin-left: 2px;
        }
    </style>
</head>
<body class="theme-red">
<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="preloader">
            <div class="spinner-layer pl-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
        <p>Please wait...</p>
    </div>
</div>
<!-- #END# Page Loader -->
<!-- Overlay For Sidebars -->
<div class="overlay"></div>
<!-- Search Bar -->
<div class="search-bar">
    <div class="search-icon">
        <i class="material-icons">search</i>
    </div>
    <input type="text" placeholder="START TYPING...">
    <div class="close-search">
        <i class="material-icons">close</i>
    </div>
</div>
<!-- #END# Search Bar -->
@include('components/top-navbar')
<!-- #Top Bar -->
<section>
    @include('components/left-aside-bar')
    @include('components/right-aside-bar')
</section>
<section class="content">
    <div class="container-fluid" id="pjax-container" style="margin: 0;padding: 0;">
        <section class="content-header">
            <h1>
                @yield('breadcrumb_title')
                <small>列表</small>
            </h1>

            <!-- breadcrumb start -->
            <!-- breadcrumb end -->

        </section>
        <section style="padding: 15px;margin-top: 5px;">
            @yield('content')
            @include('components.toastr')
        </section>
    </div>
</section>

<!-- Waves Effect Plugin Js -->
<script src="/js/waves.js"></script>

<!-- Custom Js -->
<script src="/js/admin.js"></script>

<!-- Demo Js -->
<script src="/js/demo.js"></script>
<script src="/js/bootstrap-select.js"></script>
<script src="/vendor/fontawesome-iconpicker/dist/js/fontawesome-iconpicker.min.js"></script>
<script src="/js/initPjax.js"></script>
@yield('script')
</body>
</html>
