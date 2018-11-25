@extends('layouts.app')
@section('content')
    <div class="row">
        <div class="col-md-6">
            <div class="box">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a class="btn btn-primary btn-xs" data-action="expand">
                            <i class="fa fa-plus-square-o"></i>&nbsp;展开
                        </a>
                        <a class="btn btn-primary btn-xs" data-action="collapse">
                            <i class="fa fa-minus-square-o"></i>&nbsp;收起
                        </a>
                    </div>
                    <div class="panel-body">
                        <ul class="list-group">
                            {!! $menusLists !!}
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="box box-success">
                <form action="{{route('model.store')}}" method="post" pjax-container>
                    @csrf
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span style="font-size: 18px;">新增</span>
                        </div>
                        <div class="panel-body">
                            <div style="display: flex;margin:10px 0">
                                <label for="parent" class="menu-label">父级菜单</label>
                                <div style="flex:1;">
                                    <select name="parent_id" id="parent" class="form-control">
                                        <option value="0">root</option>
                                        {!! $menuOptions !!}
                                    </select>
                                </div>
                            </div>
                            <div style="display: flex;margin:10px 0">
                                <label for="" class="menu-label">标题</label>
                                <input type="text" name="menuName" onblur="parsePath(this.value)" required
                                       class="form-control" style="flex: 1;">
                            </div>
                            <div style="display: flex;margin:10px 0">
                                <label for="" class="menu-label">路径</label>
                                <input type="text" name="menuPath" id="menuPath" required class="form-control"
                                       style="flex: 1;">
                            </div>
                            <div style="display: flex;margin:10px 0">
                                <label for="" class="menu-label">图标</label>
                                <input type="text" name="menuIcon" id="menuIcon" required class="form-control" style="flex: 1;">
                                <span class="input-group-addon" style="background: #fff;border: 0;"></span>
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
        function parsePath(value) {
            if (value) {
                $.ajax({
                    url: '/pinyin/' + value,
                    method: 'get',
                    success: function (result) {
                        $('#menuPath').val(result)
                    }

                })
            }
        }
    </script>
@endsection
