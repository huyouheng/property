@extends('layouts.app')
@section('breadcrumb_title',$menu->title);
@section('content')
    <div class="row">
        <div class="col-md-12 box box-info" style="padding: 0;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a class="btn btn-primary btn-xs waves-effect" href="javascript:history.back();">
                        <i class="fa fa-arrow-circle-left"></i>&nbsp;返回
                    </a>
                    <a class="btn btn-info btn-xs">
                        添加字段
                    </a>
                </div>
                <div class="panel-body">
                    <form action="{{route('model.store.fieldname',['model'=>$model])}}" method="post" pjax-container>
                        @csrf

                        <table class="table">
                            <thead>
                            <tr>
                                <th>字段名</th>
                                <th>类型</th>
                                <th>敏感数据</th>
                            </tr>
                            </thead>
                            <tbody id="container-field-body">
                            <tr data-id="0">
                                <td>
                                    <input type="text" name="field_name[]" class="form-control">
                                </td>
                                <td>
                                    <select name="field_type[]" id="0" class="form-control"
                                            onchange="selectChange(this.value,this.id)">
                                        <option value="1">文本框</option>
                                        <option value="2">多文件</option>
                                        <option value="3">关联模型</option>
                                        <option value="4">时间选择</option>
                                        <option value="5">单选</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="is_sensitive[]" class="form-control">
                                        <option value="0">否</option>
                                        <option value="1">是</option>
                                    </select>
                                </td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="4" class="text-center">
                                    <button type="button" onclick="addField()" class="btn btn-xs btn-info">+</button>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                        <div class="text-center">
                            <button type="submit" class="btn btn-sm btn-success waves-effect">添加</button>
                        </div>
                    </form>
                </div>
                <div class="panel-footer">
                    <tr>
                        <td>已有字段:</td>
                        <td>@foreach($menu->container as $item) <label>{{$item->field_name}}</label> @endforeach</td>
                    </tr>
                </div>
            </div>
        </div>
        <script>
            var _id = 0;
            function selectChange(id,trId) {
                if (id == 5) {
                    inputTip(function(res){
                        res = res.replace(/\n/g,'@^@');
                        var _input = '<input type="text" name="sigleSelect['+_id+']" value="'+res+'" style="display: none;">';
                        $('#container-field-body').append(_input);
                    });
                }
            }

            function addField() {
                _id ++;
                var str = '<tr data-id="'+_id+'"><td><input type=text name="field_name[]" class=form-control><td><select name="field_type[]" id="'+_id+'" class=form-control onchange="selectChange(this.value,this.id)"><option value=1>文本框<option value=2>多文件<option value=3>关联模型<option value=4>时间选择<option value=5>单选</select><td><select name="is_sensitive[]" class=form-control><option value=0>否<option value=1>是</select>';
                $('#container-field-body').append(str);
            }
        </script>
    </div>
@endsection