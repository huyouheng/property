@extends('layouts.app')
@section('breadcrumb_title', '权限');
@section('content')
    <div class="row">
        <div class="col-md-12" style="padding: 0;">
            <div class="box">
                <div class="panel panel-default" style="padding: 0;margin: 0;">
                    <div class="panel-heading">
                        <a class="btn btn-primary btn-xs waves-effect"
                           href="{{route('settings.create.permission')}}">
                            <i class="fa fa-plus-square-o"></i>&nbsp;新增
                        </a>
                    </div>
                    <div class="panel-body dd" id="menu-nested-list">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>标识</th>
                                <th>名称</th>
                                <th>描述</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($permissions as $permission)
                                <tr>
                                    <td>{{$permission->name}}</td>
                                    <td>{{$permission->display_name}}</td>
                                    <td>{{$permission->description}}</td>
                                    <td>
                                        <a href=""
                                           class="waves-effect">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a href="javascript:void(0);" data-id="{{$permission->id}}"
                                           class="waves-effect trash-permission-row">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>

    </script>
@endsection