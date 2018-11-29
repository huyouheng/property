@extends('layouts.app')
@section('breadcrumb_title', '菜单');
@section('content')
    <div class="row">
        <div class="col-md-6" style="padding: 0;">
            <div class="box">
                <div class="panel" style="padding: 0;margin: 0;">
                    <div class="panel-heading">
                        <div class="btn-group">
                            <a class="btn btn-primary btn-xs tree-5bfcf184db9e1-tree-tools waves-effect"
                               data-action="expand">
                                <i class="fa fa-plus-square-o"></i>&nbsp;展开
                            </a>
                            <a class="btn btn-primary btn-xs tree-5bfcf184db9e1-tree-tools waves-effect"
                               data-action="collapse">
                                <i class="fa fa-minus-square-o"></i>&nbsp;收起
                            </a>
                        </div>
                        <div class="btn-group">
                            <a class="btn btn-info btn-xs waves-effect  tree-5bfcf5cdc2075-save"><i
                                        class="fa fa-save"></i>&nbsp;保存</a>
                        </div>
                        <div class="btn-group">
                            <a class="btn btn-warning btn-xs waves-effect tree-5bfcf184db9e1-refresh"><i
                                        class="fa fa-refresh"></i>&nbsp;刷新</a>
                        </div>
                    </div>
                    <div class="panel-body dd" id="menu-nested-list">
                        <ol class="dd-list">
                            {!! $menusLists !!}
                        </ol>
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
                                <input type="text" name="menuIcon" id="menuIcon" value="fa-bars" class="form-control"
                                       style="flex: 1;">
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

        $('.tree-5bfcf184db9e1-tree-tools').on('click', function (e) {
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
                success: function (res) {
                    $.pjax.reload('#pjax-container');
                    toastr.success('保存成功 !');
                }
            })
        });

        $('.tree_branch_delete').click(function () {

            const id = $(this).data('id');
            deleteTip(function () {
                $.ajax({
                    url: '/settings/menu/' + id,
                    method: 'post',
                    data: {
                        _method: 'delete',
                        _token: LA.token
                    },
                    success: function (res) {
                        if (res.status) {
                            swal(res.message, '', 'success');
                            $.pjax.reload('#pjax-container');
                        } else {
                            toastr.error(res.message);
                            swal.close();
                        }

                    }
                })
            })
        });

    </script>
@endsection