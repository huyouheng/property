@extends('layouts.app')
@section('breadcrumb_title', '文件');
@section('content')
    <style>
        .files > li {
            float: left;
            width: 150px;
            border: 1px solid #eee;
            margin-bottom: 10px;
            margin-right: 10px;
            position: relative;
        }

        .files > li > .file-select {
            position: absolute;
            top: -4px;
            left: -1px;
        }

        .file-icon {
            text-align: center;
            font-size: 65px;
            color: #666;
            display: block;
            height: 100px;
        }

        .file-info {
            text-align: center;
            padding: 10px;
            background: #f4f4f4;
        }

        .file-name {
            font-weight: bold;
            color: #666;
            display: block;
            overflow: hidden !important;
            white-space: nowrap !important;
            text-overflow: ellipsis !important;
        }

        .file-size {
            color: #999;
            font-size: 12px;
            display: block;
        }

        .files {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .file-icon.has-img {
            padding: 0;
        }

        .file-icon.has-img > img {
            max-width: 100%;
            height: auto;
            max-height: 92px;
        }

        .operation {
            width: 25px;
            height: 23px;
            position: absolute;
            right: 0px;
            bottom: 0px;
            opacity: 0;
        }

        .dropdown-menu li {
            text-align: center;
        }
    </style>
    <div class="row">
        <div class="col-md-12 box" style="padding: 0;">
            <div class="panel panel-default" style="padding: 0;margin: 0;">
                <div class="panel-heading">
                    <span>
                        <label class="btn btn-default btn-sm waves-effect">
                            <i class="fa fa-upload"></i>&nbsp;&nbsp;上传
                            <form action="{{ $url['upload'] }}" method="post" class="file-upload-form"
                                  enctype="multipart/form-data" pjax-container style="display: none;">
                                <input type="file" name="files[]" class="hidden file-upload" multiple>
                                <input type="hidden" name="dir" value="{{ $url['path'] }}"/>
                                {{ csrf_field() }}
                            </form>
                        </label>
                    </span>
                    <span>
                        <a class="btn btn-default waves-effect" data-toggle="modal" data-target="#newFolderModal">
                            <i class="fa fa-folder"></i>&nbsp;&nbsp;新建文件夹
                        </a>
                    </span>
                    <div class="clearfix">
                        <ol class="breadcrumb" style="margin-bottom: -10px;">

                            <li><a href="{{ route('media-index') }}"><i class="fa fa-th-large"></i> </a></li>

                            @foreach($nav as $key => $item)
                                @if($key)
                                    <li><a href="{{ $item['url'] }}"> {{ $item['name'] }}</a></li>
                                @endif
                            @endforeach
                        </ol>
                    </div>
                </div>
                <div class="panel-body">
                    <ul class="list-unstyled files">
                        @foreach($paginate as $key => $item)
                            <li id="template-user-file-{{$key}}">
                                {!! $item['preview'] !!}
                                <div class="file-info">
                                    @if($item['isDir'])
                                        <a href="{{ $item['link'] }}" class="file-name" title="{{ $item['name'] }}">
                                            {{ $item['icon'] }} {{ basename($item['name']) }}
                                        </a>
                                    @else
                                        <a href="javascript:void(0)" class="file-name" title="{{ $item['name'] }}">
                                            {{ $item['icon'] }} {{ basename($item['name']) }}
                                        </a>
                                    @endif
                                    <small>{{$item['time']}}</small>
                                    <span class="file-size">{{ $item['size'] }}&nbsp;</span>
                                </div>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="newFolderModal" tabindex="-1" role="dialog" aria-labelledby="newFolderModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="newFolderModalLabel">{{trans('admin.new_folder')}}</h4>
                </div>
                <form id="new-folder">
                    <div class="modal-body">
                        <div class="">
                            <input type="text" class="form-control" name="name" placeholder="文件夹名"/>
                        </div>
                        <input type="hidden" name="dir" value="{{ $url['path'] }}"/>
                        {{ csrf_field() }}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-sm"
                                data-dismiss="modal">{{trans('admin.close')}}</button>
                        <button type="submit" class="btn btn-primary btn-sm">{{trans('admin.submit')}}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        //文件上传
        $('.file-upload').on('change', function () {
            $('.file-upload-form').submit();
        });
        //新建文件夹
        $('#new-folder').on('submit', function (event) {
            event.preventDefault();
            var formData = new FormData(this);
            $.ajax({
                method: 'POST',
                url: '{{ $url['new-folder'] }}',
                data: formData,
                async: false,
                success: function (data) {
                    $.pjax.reload('#pjax-container');

                    if (typeof data === 'object') {
                        if (data.status) {
                            toastr.success(data.message);
                        } else {
                            toastr.error(data.message);
                        }
                    }
                },
                cache: false,
                contentType: false,
                processData: false
            });

            closeModal();
        });

        function closeModal() {
            $("#moveModal").modal('toggle');
            $('body').removeClass('modal-open');
            $('.modal-backdrop').remove();
        }
    </script>
@endsection