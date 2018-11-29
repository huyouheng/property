@extends('layouts.app')
@section('breadcrumb_title',$menu->title);
@section('content')
    <div class="row">
        <div class="col-md-12 box" style="padding: 0;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a class="btn btn-primary btn-xs waves-effect" href="/model/{{$model}}">
                        <i class="fa fa-arrow-circle-left"></i>&nbsp;返回
                    </a>
                    <a class="btn btn-info btn-xs">
                        字段排序
                    </a>
                </div>
                <div class="panel-body">
                    <div class="dd" id="model-field-sort">
                        <ol class="dd-list">
                            @foreach($menu->container as $key => $item)
                                <li class="dd-item" data-id="{{$item->id}}">
                                    <div class="dd-handle">
                                        {{$item->field_name}}
                                    </div>
                                </li>
                            @endforeach
                        </ol>
                    </div>

                    <div class="text-center">
                        @if(count($menu->container) == 0)
                            <label>该模块没有字段</label>
                        @else
                            <button type="button" id="save-field-sort-7ds8" data-id="{{$model}}"
                                    class="btn btn-sm btn-success waves-effect">保存
                            </button>
                        @endif
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('#model-field-sort').nestable({
                maxDepth: 1
            });
            $('#save-field-sort-7ds8').click(function () {
                const model = $(this).data('id');
                const serialize = $('#model-field-sort').nestable('serialize');
                $.ajax({
                    url: '/store-sort-field/' + model,
                    method: 'post',
                    data: {
                        _token: LA.token,
                        _order: JSON.stringify(serialize)
                    },
                    success: function (res) {
                        if (res.status) {
                            toastr.success(res.message);
                            $.pjax.reload('#pjax-container');
                        } else {
                            toastr.error(res.message);
                        }
                    }
                });
            });
        </script>
    </div>
@endsection