@extends('layouts.app')
@section('breadcrumb_title',$menu->title);
@section('content')
    <style>
        .pagination {
            margin: 0px;
        }

        .file-icon {
            margin-right: 5px;
            border: 1px solid #efe7e7;
            display: inline-block;
        }

        .file-icon img {
            width: 50px;
            height: 40px;
        }
    </style>
    @inject('metrics', 'App\Utils\MetricsUtil')
    <div class="row">
        <div class="col-md-12 box" style="padding: 0;">
            <div class="panel panel-default" style="padding: 0;margin: 0;">
                <div class="panel-heading">
                    <a class="btn btn-primary btn-xs waves-effect"
                       href="{{route('model.create.fieldvalue',['model'=>substr($menu->uri,7)])}}">
                        <i class="fa fa-plus-square-o"></i>&nbsp;新增
                    </a>
                    <a class="btn btn-success btn-xs waves-effect"
                       href="{{route('model.create.field',['model'=>substr($menu->uri,7)])}}">
                        <i class="fa fa-minus-square-o"></i>&nbsp;添加字段
                    </a>
                    <a class="btn btn-warning btn-xs waves-effect"
                       href="{{route('model.sort.field',['model'=>substr($menu->uri,7)])}}">
                        <i class="fa fa-indent"></i>&nbsp;字段顺序
                    </a>

                </div>
                <div class="panel-body table-responsive">
                    <div class="table table-hover table-bordered">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr class="files">
                                @foreach($datas as $item)
                                    <th style="position: relative;" class="show-btn-menu">{{$item->field_name}}
                                        <div class="btn-group operation">
                                            <i class="material-icons waves-effect" data-toggle="dropdown"
                                               aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                                            <ul class="dropdown-menu">
                                                <li><a href="{{route('sensitive.field',['id'=>$item->id])}}"
                                                       class="file-rename">敏感数据</a></li>

                                                <li>
                                                    <a href="javascript:void(0);" class="deleteModelField"
                                                       data-id="{{$item->id}}" data-path="users">
                                                        删除
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </th>
                                @endforeach
                                @if(count($datas) == 0)
                                    <th class="text-center">该模块没有字段</th>
                                @else
                                    <th>操作</th>
                                @endif
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($paginate as $key => $value)
                                <tr class="etrics">
                                    @foreach($value['data'] as $key => $item)
                                        @if(is_string($item) && $item != '*')
                                            @if ($value['field_type'][$loop->index] == 2)
                                                <td style="position: relative;">
                                                    &nbsp;{!! $metrics->parseFilesList($item,$value['ids'][$loop->index],$key) !!}</td>
                                                {{--@elseif($value['field_type'][$loop->index] == 1 || $value['field_type'][$loop->index] == 5)--}}
                                            @else
                                                <td>{{$item}}</td>
                                            @endif
                                        @else
                                            <td>&nbsp;</td>
                                        @endif
                                    @endforeach
                                    <td>
                                        <a href="{{route('model.edit',['model'=>$model,'ids'=>json_encode($value['ids'])])}}"
                                           class="waves-effect">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a href="javascript:void(0);" data-id="{{json_encode($value['ids'])}}"
                                           class="delete-model-content-row waves-effect">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="panel-footer" style="display: flex;background: #fff;">
                    <div style="width: 200px;line-height: 30px">
                        从 <b>{{($paginate->currentPage()-1) * $paginate->perPage() +1}}</b> 到
                        <b>{{$paginate->perPage()}}</b>，总共 <b>{{$paginate->total()}}</b> 条
                    </div>
                    <div style="flex: 1;height: 30px;text-align: right;">
                        {{$paginate->links()}}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('.files th').hover(function () {
                $(this).find('.operation').css({'opacity': 1})
            },
            function () {
                $(this).find('.operation').css({'opacity': 0})
            });
        $('.etrics td').hover(function () {
                $(this).find('.operation').css({'opacity': 1})
            },
            function () {
                $(this).find('.operation').css({'opacity': 0})
            });

        $('.delete-model-content-row').click(function () {
            const id = $(this).data('id');
            deleteTip(function () {
                $.ajax({
                    url: '/deleteContents',
                    method: 'post',
                    data: {
                        _method: 'delete',
                        _token: LA.token,
                        ids: id
                    },
                    success: function (response) {
                        $.pjax.reload('#pjax-container');
                        swal(response.message, '', 'success');
                    },
                    error: function (error) {
                        toastr.error(error.responseJSON.message);
                        swal.close();
                    }

                });
            });
        });
        $('.deleteModelField').click(function () {
            const id = $(this).data('id');
            deleteTip(function () {
                $.ajax({
                    url: '/del-field/' + id,
                    method: 'get',
                    success: function (response) {
                        $.pjax.reload('#pjax-container');
                        swal(response.message, '', 'success');
                    },
                    error: function (error) {
                        toastr.error(error.responseJSON.message);
                        swal.close();
                    }

                });
            });
        });

        $('.popup-extral-panel').click(function () {
            const json = $(this).data('html');
            const title = $(this).data('title');
            var html = '<table class="table table-hover">';
            json.forEach(function (item, key) {
                html += '<tr id="popup-extral-panel-trash-' + key + '">' +
                    '<td>' + item['name'] + '</td>' +
                    '<td><i class="fa fa-trash waves-effect" onclick="popupExtralPanelTrash(' + item['id'] + ',`' + item['name'] + '`,' + key + ')"></i></td>' +
                    '<td><i class="fa fa-download"></i></td>' +
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