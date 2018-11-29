<!DOCTYPE html>
<html lang="zh-CN">
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
    <link rel="stylesheet" href="{{ asset("/vendor/sweetalert/dist/sweetalert.css") }}">
    <link rel="stylesheet" href="{{ asset("/vendor/nestable/nestable.css") }}">
    <link rel="stylesheet"
          href="{{ asset("/vendor/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css") }}">
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
    <script src="{{ asset('/vendor/fontawesome-iconpicker/dist/js/fontawesome-iconpicker.min.js') }}"></script>
    <script src="{{ asset("/vendor/nestable/jquery.nestable.js") }}"></script>
    <script src="{{ asset ("/vendor/moment/min/moment-with-locales.js") }}"></script>
    <script src="{{ asset("/vendor/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js") }}"></script>

    <style>
        .navbar-header {
            padding: 0 0 0 7px;
        }

        .navbar-header .bars:before, .navbar-header .bars:after {
            margin-top: -5px;
        }

        .navbar-brand {
            margin-top: 5px;
        }

        section.content {
            /*margin: 36px 15px 0 240px;*/
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

        .menu-header-icon {
            /*font-size: 20px;*/
            /*margin-top: 1px;*/
            /*margin-right: 10px; */
            /*margin-left: 2px;*/
        }

        .operation {
            width: 25px;
            height: 23px;
            /*position: absolute;*/
            right: 0;
            bottom: 0;
            opacity: 0;
        }

        .sidebar-menu li a {

        }

        .sidebar .menu .list i.material-icons {
            margin-top: 6px;
        }

        .sidebar-menu li a i {
            width: 20px;
            margin-top: 10px;
        }

        .sidebar-menu li a span {
            flex: 1;
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
    <div class="container-fluid" id="pjax-container" style="padding: 0;">
        <section class="content-header">
            <h1>
                @yield('breadcrumb_title')
                <small>列表</small>
            </h1>

            <!-- breadcrumb start -->
            <!-- breadcrumb end -->

        </section>
        <section style="padding: 15px;">
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
<script src="/js/initPjax.js"></script>
<script src="{{ asset ("/vendor/sweetalert/dist/sweetalert2.all.min.js") }}"></script>


<script>
    // $('.sidebar-menu li:not(.treeview) > a').on('click', function () {
    //     var $parent = $(this).parent().addClass('active');
    //     $parent.siblings('.treeview.active').find('> a').trigger('click');
    //     $parent.siblings().removeClass('active').find('li').removeClass('active');
    // });

    $('.sidebar-menu li').on('click', function () {
        var $parent = $(this).addClass('active');
        $('.sidebar-menu li').not($(this)).removeClass('active');

    });

    function LA() {
    }

    LA.token = "{{ csrf_token() }}";

    function deleteTip(obj) {
        swal({
            title: "确认删除?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确认",
            cancelButtonText: "取消",
        }).then(obj).catch(swal.noop);
    }

    function inputTip(obj)
    {
        swal({
            title: '输入单选值',
            input: 'textarea',
            inputPlaceholder: '一行一个选项',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: "确认",
            cancelButtonText: "取消",
            allowEnterKey: false,
            focusConfirm: false,
        }).then(obj).catch(swal.noop)
    }

</script>
@yield('script')
</body>
</html>
