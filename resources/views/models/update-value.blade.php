@extends('layouts.app')
@section('breadcrumb_title',$menu->title);
@section('content')
    @inject('metrics', 'App\Utils\MetricsUtil')
    <style>
        .file-icon.has-img img {
            max-width: 100px;
            height: 50px;
            border: 1px solid #f3f3f3;
        }
    </style>
    <div class="row" style="padding: 0;">
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
                    <form action="{{route('model.update',['model'=>$model])}}" enctype="multipart/form-data"
                          method="post" pjax-container>
                        @csrf
                        @method('PUT')

                        <table class="table">
                            <tbody id="container-field-body">
                            @foreach($contents as $key => $item)
                                <tr class="maybe-has-file">
                                    <td>
                                        {{$item['container']['field_name']}}
                                    </td>
                                    <td style="position: relative;">

                                        @if($item['container']['field_type']== 5)
                                            {!! $metrics->parseSingleJsonToSelect($item['container']['extral'],$item['field_value'],$item['id']) !!}
                                        @elseif($item['container']['field_type'] == 4)
                                            <input size="16" type="text" value="{{$item['field_value']}}" name="field_name[{{$item['id']}}]"
                                                   readonly
                                                   class="date-time-picker form-control">
                                        @elseif ($item['container']['field_type'] == 2)
                                            <input type="file" name="field_name[{{$item['id']}}][]" multiple="multiple">
                                            <div style="margin-top: 2px;padding: 1px;background: #fff;">
                                                {!! $metrics->parseFilesList($item['field_value'],$item['id'],$item['container']['field_name']) !!}
                                            </div>
                                        @elseif ($item['container']['field_type'] == 1)
                                            <input type="text"
                                                   @if($item['field_value'] != '*') value="{{$item['field_value']}} @endif"
                                                   name="field_name[{{$item['id']}}]" class="form-control">
                                        @endif
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
    <script>
        $('.date-time-picker').bootstrapMaterialDatePicker({
            setDate: '2018-11-18',
            date: true,
            time: false
        });

        $('.maybe-has-file td').hover(function () {
                $(this).find('.operation').css({'opacity': 1})
            },
            function () {
                $(this).find('.operation').css({'opacity': 0})
            });
        $('.popup-extral-panel').click(function () {
            const json = $(this).data('html');
            const title = $(this).data('title');
            var html = '<table class="table table-hover">';
            json.forEach(function (item, key) {
                html += '<tr id="popup-extral-panel-trash-' + key + '">' +
                    '<td>' + item['name'] + '</td>' +
                    '<td><i class="fa fa-trash waves-effect" onclick="popupExtralPanelTrash(' + item['id'] + ',`' + item['name'] + '`,' + key + ')"></i></td>' +
                    '</tr>';
            });
            html += '</table>';
            swal({
                title: title,
                html: html,
                showCloseButton: false,
                showCancelButton: false,
                showConfirmButton: false,
                focusConfirm: false,

            }).catch(swal.noop);
            html = '';
        });
        //popup删除
        function popupExtralPanelTrash(id, name, key) {
            deleteTip(function () {
                $.ajax({
                    url: '/trash-extral',
                    method: 'post',
                    data: {
                        _token: LA.token,
                        _method: 'DELETE',
                        id: id,
                        name: name
                    },
                    success: function (res) {
                        if (res.status) {
                            $.pjax.reload('#pjax-container');
                            swal(res.message, '', 'success');
                        } else {
                            toastr.error(res.message);
                        }
                    }
                })
            })
        }
    </script>
@endsection