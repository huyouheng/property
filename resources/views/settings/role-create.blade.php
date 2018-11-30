@extends('layouts.app')
@section('breadcrumb_title', '角色');
@section('content')
    <div class="row">
        <div class="col-md-12" style="padding: 0;">
            <div class="box box-success">
                <form action="{{route('settings.store.role')}}" method="post" onsubmit="return getAllOpt()"
                      pjax-container>
                    @csrf
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="btn btn-primary btn-xs waves-effect" href="javascript:history.back();">
                                <i class="fa fa-arrow-circle-left"></i>&nbsp;返回
                            </a>
                            <a class="btn btn-info btn-xs">
                                添加角色
                            </a>
                        </div>
                        <div class="panel-body">
                            <div style="display: flex;margin:10px 0">
                                <label for="" class="menu-label">名称</label>
                                <input type="text" name="display_name" onblur="parsePath(this.value)" required
                                       class="form-control"
                                       style="flex: 1;">
                            </div>
                            <div style="display: flex;margin:10px 0">
                                <label for="" class="menu-label">标识</label>
                                <input type="text" name="name" id="roleNamePath" required placeholder="名称输入后自动填写"
                                       class="form-control" style="flex: 1;">
                            </div>
                            <div style="display: flex;margin:10px 0">
                                <label for="" class="menu-label">描述</label>
                                <input type="text" name="description" placeholder="可选" class="form-control"
                                       style="flex: 1;">
                            </div>
                            <div style="display: flex;margin:10px 0">
                                <label for="" class="menu-label">权限</label>
                                <table class="table table-bordered">
                                    <tr>
                                        <th class="text-center">所有权限</th>
                                        <th></th>
                                        <th class="text-center">已有权限</th>
                                    </tr>
                                    <tr>
                                        <td class="text-center">
                                            <button class="btn btn-xs waves-effect" style="width: 100%;" id="add_all"
                                                    type="button">
                                                <span class="glyphicon glyphicon-arrow-right"></span>
                                                <span class="glyphicon glyphicon-arrow-right"></span>
                                            </button>
                                        </td>
                                        <td></td>
                                        <td class="text-center">
                                            <button class="btn btn-xs waves-effect" style="width: 100%;" id="remove_all"
                                                    type="button">
                                                <span class="glyphicon glyphicon-arrow-left"></span>
                                                <span class="glyphicon glyphicon-arrow-left"></span>
                                            </button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="text-center">
                                            <select multiple="multiple" id="select1"
                                                    style="width: 200px;height:200px;max-height: 600px;  border:1px #A0A0A4 outset; padding:4px;text-align: center;">
                                                @foreach($permissions as $permission)
                                                    <option style="cursor: pointer;"
                                                            value="{{$permission->id}}">{{$permission->display_name}}</option>
                                                @endforeach
                                            </select>
                                        </td>

                                        <td class="" style="vertical-align: middle;">
                                            <button class="btn btn-sm btn-info" style="width: 100%;" id="add"
                                                    type="button">
                                                <span class="glyphicon glyphicon-arrow-right"></span>
                                            </button>
                                            <br>
                                            <br>
                                            <button class="btn btn-sm btn-dark" style="width: 100%;" id="remove"
                                                    type="button">
                                                <span class="glyphicon glyphicon-arrow-left"></span>
                                            </button>
                                        </td>

                                        <td class="text-center">
                                            <select name="permissions[]" multiple="multiple" id="select2"
                                                    style="width:200px;min-height:200px; max-height: 600px; border:1px #A0A0A4 outset; padding:4px; text-align: center;">

                                            </select>
                                        </td>
                                    </tr>
                                </table>
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
        //移到右边
        $('#add').click(function () {
            addToRight();
        });
        //移到左边
        $('#remove').click(function () {
            removeItem();
        });
        //全部移到右边
        $('#add_all').click(function () {
            var select = document.getElementById('select1');
            for (var i = 0; i < select.options.length; i++) {
                select.options[i].selected = true;
            }
            addToRight();
        });
        //全部移到左边
        $('#remove_all').click(function () {
            var obj = document.getElementById('select2');
            obj.options.length = 0;
        });
        //双击选项
        $('#select1').dblclick(function () { //绑定双击事件
            addToRight();
        });
        //双击选项
        $('#select2').dblclick(function () {
            removeItem();
        });

        function addToRight() {
            var select = document.getElementById('select1');
            for (var i = 0; i < select.options.length; i++) {
                if (select[i].selected == true) {
                    if (!isExistsSelect(select[i].text, select[i].value)) {
                        var op = new Option(select[i].text, select[i].value);
                        document.getElementById('select2').options.add(op);
                    }
                }
            }
        }

        function isExistsSelect(text, value) {
            var isExit = false;
            var select = document.getElementById('select2');
            for (var i = 0; i < select.length; i++) {
                if (select[i].value == value && select[i].text == text) {
                    isExit = true;
                    break;
                }
            }
            return isExit;
        }

        function removeItem() {
            var select = document.getElementById('select2');
            for (var i = 0; i < select.options.length; i++) {
                if (select[i].selected == true) {
                    // select.options.remove(i);
                    select.options.remove(i);
                    removeItem();
                }
            }
        }

        function parsePath(value) {
            if (value) {
                $.ajax({
                    url: '/pinyin/' + value,
                    method: 'get',
                    success: function (result) {
                        $('#roleNamePath').val(result.substr(7))
                    }

                })
            }
        }

        function getAllOpt() {
            var options = document.querySelectorAll('#select2 option');
            Array.prototype.forEach.call(options, function (option) {
                option.selected = true;
            })
        }
    </script>
@endsection