@extends('layouts.app')
@section('breadcrumb_title',$menu->title);
@section('content')
<div class="row">
	<div class="col-md-12 box">
		<div class="panel panel-default no-padding">
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
            			<tr>
            				<td>
            					<input type="text" name="field_name[]" class="form-control">
            				</td>
							<td>
								<select name="field_type[]" id="" class="form-control">
									<option value="1">文本框</option>
									<option value="2">多文件</option>
									<option value="3">关联模型</option>
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
		function addField(){
			$str = '<tr><td><input type=text name="field_name[]" class=form-control><td><select name="field_type[]" id="" class=form-control><option value=1>文本框<option value=2>多文件<option value=3>关联模型</select><td><select name="is_sensitive[]" class=form-control><option value=0>否<option value=1>是</select>';
			$('#container-field-body').append($str);
		}
	</script>
</div>
@endsection