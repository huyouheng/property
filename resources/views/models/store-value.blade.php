@extends('layouts.app')
@section('breadcrumb_title',$menu->title);
@section('content')
    @inject('metrics', 'App\Utils\MetricsUtil')
    <div class="row">
        <div class="col-md-12 box" style="padding: 0;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a class="btn btn-primary btn-xs waves-effect" href="javascript:history.back();">
                        <i class="fa fa-arrow-circle-left"></i>&nbsp;返回
                    </a>
                    <a class="btn btn-info btn-xs">
                        新增
                    </a>
                </div>
                <div class="panel-body">
                    <form action="{{route('model.store.fieldvalue',['model'=>$model])}}" method="post"
                          onsubmit="return submitResult()" enctype="multipart/form-data" pjax-container>
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
                                            <input type="file" id="uploadFileInput" name="field_name[{{$item->id}}][]"
                                                   multiple="multiple" class="form-control">
                                            <input type="text" id="uploadFileInputBak" style="display: none;"
                                                   disabled="disabled" name="field_name[{{$item->id}}]">
                                        @elseif($item->field_type == 4)
                                            <input size="16" type="text" value=""  name="field_name[{{$item->id}}]" readonly
                                                   class="date-time-picker form-control">
                                            @elseif($item->field_type == 5)
                                            {!! $metrics->parseSingleSelect($item->id) !!}
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
        <script>
            $('.date-time-picker').val(moment().format('YYYY-MM-DD'));
            $('.date-time-picker').bootstrapMaterialDatePicker({
                setDate: '2018-11-18',
                date: true,
                time: false
            });

            function submitResult() {
                if ($('#uploadFileInput').val() === '') {
                    $('#uploadFileInputBak').removeAttr('disabled');
                }
            }
        </script>
    </div>
@endsection