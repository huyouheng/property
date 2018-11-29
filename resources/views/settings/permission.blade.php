@extends('layouts.app')
@section('breadcrumb_title', '权限');
@section('content')
    <div class="row">
        <div class="col-md-6" style="padding: 0;">
            <div class="box">
                <div class="panel" style="padding: 0;margin: 0;">
                    <div class="panel-heading">
                        已有权限
                    </div>
                    <div class="panel-body dd" id="menu-nested-list">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>标识</th>
                                <th>名称</th>
                                <th>描述</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($permissions as $permission)
                                <tr>
                                    <td>{{$permission->name}}</td>
                                    <td>{{$permission->display_name}}</td>
                                    <td>{{$permission->description}}</td>
                                    <td></td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="box box-success">
                <form action="{{route('settings.store.permission')}}" method="post" pjax-container>
                    @csrf
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span style="font-size: 18px;">新增</span>
                        </div>
                        <div class="panel-body">
                            <div style="display: flex;margin:10px 0">
                                <label for="" class="menu-label">标识</label>
                                <input type="text" name="name" onblur="parsePath(this.value)" required
                                       class="form-control" style="flex: 1;">
                            </div>
                            <div style="display: flex;margin:10px 0">
                                <label for="" class="menu-label">名称</label>
                                <input type="text" name="display_name" placeholder="可选" class="form-control"
                                       style="flex: 1;">
                            </div>
                            <div style="display: flex;margin:10px 0">
                                <label for="" class="menu-label">描述</label>
                                <input type="text" name="description" placeholder="可选" class="form-control"
                                       style="flex: 1;">
                            </div>
                        </div>
                        <div class="panel-footer text-center">
                            <button type="reset" class="btn btn-info btn-sm waves-effect">撤销</button>
                            <button type="submit" class="btn btn-warning btn-sm waves-effect"
                                    style="margin-right: 20px;">添加
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>

    </script>
@endsection