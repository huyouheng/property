@extends('layouts.app')
@section('breadcrumb_title',$menu->title);
@section('content')
    <div class="row" style="padding: 0;margin: 0;">
        <div class="col-md-12 box" style="padding: 0;margin: 0;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a class="btn btn-primary btn-xs waves-effect" href="javascript:history.back();">
                        <i class="fa fa-arrow-circle-left"></i>&nbsp;返回
                    </a>
                    <a class="btn btn-info btn-xs">
                        编辑
                    </a>
                </div>
                <div class="panel-body">
                    <form action="{{route('model.update',['model'=>$model])}}" method="post" pjax-container>
                        @csrf
                        @method('PUT')

                        <table class="table">
                            <tbody id="container-field-body">
                            @foreach($contents as $item)
                                <tr>
                                    <td>
                                        {{$item->container->field_name}}
                                    </td>
                                    <td>
                                        <input type="text"
                                               @if($item->field_value != '*') value="{{$item->field_value}} @endif"
                                               name="field_name[{{$item->id}}]" class="form-control">
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <div class="text-center">
                            <button type="submit" class="btn btn-sm btn-success waves-effect">更新</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection