<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{{config('admin.title')}} | {{ trans('admin.login') }}</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="{{ asset("/vendor/AdminLTE/bootstrap/css/bootstrap.min.css") }}">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset("/vendor/font-awesome/css/font-awesome.min.css") }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset("/vendor/AdminLTE/dist/css/AdminLTE.min.css") }}">
</head>
<body class="hold-transition login-page"
      style="background-image: url('/images/login-bg.png');background-repeat: no-repeat;background-size: cover;">
<div class="login-box">
    <div class="login-logo">
        <a href="{{ base_path('/') }}"><b>{{config('app.name')}}</b></a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body" style="background: transparent;">
        <p class="login-box-msg">{{ trans('admin.login') }}</p>

        <form action="{{ route('login') }}" method="post">
            @csrf
            <div class="form-group has-feedback {!! !$errors->has('username') ?: 'has-error' !!}">

                <input type="input" class="form-control" placeholder="{{ trans('admin.username') }}" name="email"
                       value="{{ old('username') }}" autofocus>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            @if ($errors->has('email'))
                    <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                @endif

            </div>
            <div class="form-group has-feedback {!! !$errors->has('password') ?: 'has-error' !!}">
                <input type="password" class="form-control" placeholder="{{ trans('admin.password') }}" name="password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                @if ($errors->has('password'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('password') }}</strong>
                    </span>
                @endif
            </div>
            <div class="row">

                <!-- /.col -->
                <div class="col-xs-4 col-md-offset-4">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">{{ trans('admin.login') }}</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.1.4 -->
<script src="{{ asset("/vendor/AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js")}}"></script>
<!-- Bootstrap 3.3.5 -->
<script src="{{ asset("/vendor/AdminLTE/bootstrap/js/bootstrap.min.js")}}"></script>
</body>
</html>