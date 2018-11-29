@extends('layouts.app')
@section('breadcrumb_title',$user->name);
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

                </div>
                <div class="panel-body table-responsive">
                    <table class="table">
                        @foreach($values as $value)
                            <tr>
                                <th>{{$value['container']['field_name']}}</th>
                                <td>
                                    @if($value['container']['is_sensitive'] == 1)
                                        <span title="敏感数据">...</span>
                                        @else
                                        @if($value['container']['field_type']== 2)
                                            {!! $metrics->parseFilesList($value['field_value'],$value['id'],'') !!}
                                        @else
                                            {{$value['field_value']}}
                                        @endif

                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </table>
                </div>
            </div>
        </div>
    </div>

@endsection