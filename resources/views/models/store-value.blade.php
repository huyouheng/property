@extends('layouts.app')
@section('breadcrumb_title',$menu->title);
@section('content')
<div class="row">
	<div class="col-md-12 box">
		<div class="panel panel-default no-padding">
			<div class="panel-heading">
                <a class="btn btn-info btn-xs">
                    <i class="fa fa-plus-square-o"></i>&nbsp;添加字段
                </a>
            </div>
            <div class="panel-body">
            	<form action="{{route('model.store.fieldvalue',['model'=>$model])}}" method="post" pjax-container>
            		@csrf
            	
            	<table class="table">
            		<tbody id="container-field-body">
            			@foreach($menu->container as $item)
            			<tr>
            				<td>
            					{{$item->field_name}}
            				</td>
            				<td>
            					<input type="text" name="field_name[]" class="form-control">
            				</td>
            			</tr>
            			@endforeach
            		</tbody>
            	</table>
            	<div class="text-center">
            		<button type="submit" class="btn btn-sm btn-success waves-effect">添加</button>
            	</div>
            	</form>
            </div>
		</div>
	</div>
	<script>
		
	</script>
</div>
@endsection