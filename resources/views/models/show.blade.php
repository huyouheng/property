@extends('layouts.app')
@section('breadcrumb_title',$menu->title);
@section('content')
<div class="row">
	<div class="col-md-12 box">
		<div class="panel panel-default no-padding">
			<div class="panel-heading">
                <a class="btn btn-primary btn-xs waves-effect">
                    <i class="fa fa-plus-square-o"></i>&nbsp;新增
                </a>
                <a class="btn btn-primary btn-xs" href="{{route('model.create.field',['model'=>substr($menu->uri,7)])}}">
                    <i class="fa fa-minus-square-o"></i>&nbsp;添加字段
                </a>
            </div>
            <div class="panel-body">
            	123
            </div>
		</div>
	</div>
</div>
@endsection