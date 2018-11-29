@extends('layouts.app')
@section('breadcrumb_title', '菜单');
@section('content')
    <div class="row">
        <div class="col-md-12" style="padding: 0;">
            <div class="box box-success">
                <form action="{{route('model.menu.update',['id'=>$menu->id])}}" method="post" pjax-container>
                    @csrf
                    @method('PUT')
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="btn btn-primary btn-xs waves-effect" href="javascript:history.back();">
                                <i class="fa fa-arrow-circle-left"></i>&nbsp;返回
                            </a>
                            <a class="btn btn-info btn-xs">
                                编辑
                            </a>
                        </div>
                        <div class="panel-body text-center">
                            <div class="col-md-6">
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
                                    <input type="text" name="menuName" value="{{$menu->title}}" onblur="parsePath(this.value)" required
                                           class="form-control" style="flex: 1;">
                                </div>
                                <div style="display: flex;margin:10px 0">
                                    <label for="" class="menu-label">路径</label>
                                    <input type="text" name="menuPath" value="{{$menu->uri}}"  id="menuPath" required class="form-control"
                                           style="flex: 1;">
                                </div>
                                <div style="display: flex;margin:10px 0">
                                    <label for="" class="menu-label">图标</label>
                                    <input type="text" name="menuIcon" id="menuIcon" value="fa-bars" class="form-control"
                                           style="flex: 1;">
                                    <span class="input-group-addon" style="background: #fff;border: 0;"></span>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer text-center">
                            <button type="reset" class="btn btn-info btn-sm waves-effect">撤销</button>
                            <button type="submit" class="btn btn-warning btn-sm waves-effect"
                                    style="margin-right: 20px;">更新
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        $('#menu-nested-list').nestable([]);
        $('.dd').on('change', function () {

        });
        $('#menuIcon').iconpicker({
            emptyIcon: true,
            hasSearch: true,
            placement: 'bottomLeft'
        });

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
        $('.tree-5bfcf184db9e1-tree-tools').on('click', function(e){
            var target = $(e.target),
                action = target.data('action');
            if (action === 'expand') {
                $('.dd').nestable('expandAll');
            }
            if (action === 'collapse') {
                $('.dd').nestable('collapseAll');
            }
        });

        $('.tree-5bfcf184db9e1-refresh').click(function () {
            $.pjax.reload('#pjax-container');
            toastr.success('刷新成功 !');
        });

        $('.tree-5bfcf5cdc2075-save').click(function () {
            var serialize = $('#menu-nested-list').nestable('serialize');
            $.ajax({
                url: '/update-menu-tree',
                method: 'post',
                data: {
                    _token: LA.token,
                    _order: JSON.stringify(serialize)
                },
                success: function(res){
                    $.pjax.reload('#pjax-container');
                    toastr.success('保存成功 !');
                }
            })
        });

    </script>
@endsection