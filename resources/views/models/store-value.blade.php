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
                        新增
                    </a>
                </div>
                <div class="panel-body">
                    <form action="{{route('model.store.fieldvalue',['model'=>$model])}}" method="post" enctype="multipart/form-data" pjax-container>
                        @csrf
                        <table class="table">
                            <tbody id="container-field-body">
                            @foreach($menu->container as $item)
                                <tr>
                                    <td>
                                        {{$item->field_name}}
                                    </td>
                                    <td>
                                        @if($item->field_type == 1)
                                            <input type="text" name="field_name[{{$item->id}}]" class="form-control">
                                            @elseif($item->field_type == 2)
                                            <input type="file" name="field_name[{{$item->id}}][]" multiple="multiple" class="form-control">
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <div class="text-center">
                            @if(count($menu->container) == 0)
                                <label>该模块没有字段</label>
                            @else
                                <button type="submit" class="btn btn-sm btn-success waves-effect">添加</button>
                            @endif
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection