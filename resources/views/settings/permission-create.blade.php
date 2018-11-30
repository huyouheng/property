@extends('layouts.app')
@section('breadcrumb_title', '权限');
@section('content')
    <div class="row">
        <div class="col-md-12" style="padding: 0;">
            <div class="box box-success">
                <form action="{{route('settings.store.permission')}}" method="post" pjax-container>
                    @csrf
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="btn btn-primary btn-xs waves-effect" href="javascript:history.back();">
                                <i class="fa fa-arrow-circle-left"></i>&nbsp;返回
                            </a>
                            <a class="btn btn-info btn-xs">
                                添加权限
                            </a>
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