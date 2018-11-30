@extends('layouts.app')
@section('breadcrumb_title', '角色');
@section('content')
    <div class="row">
        <div class="col-md-12" style="padding: 0;">
            <div class="box">
                <div class="panel panel-default" style="padding: 0;margin: 0;">
                    <div class="panel-heading">
                        <a class="btn btn-primary btn-xs waves-effect"
                           href="{{route('settings.create.role')}}">
                            <i class="fa fa-plus-square-o"></i>&nbsp;新增
                        </a>
                    </div>
                    <div class="panel-body dd">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>标识</th>
                                <th>名称</th>
                                <th>描述</th>
                                <th>权限</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($roles as $role)
                                <tr>
                                    <td>{{$role->name}}</td>
                                    <td>{{$role->display_name}}</td>
                                    <td>{{$role->description}}</td>
                                    <td>
                                        @foreach($role->permissions as $permission)
                                            <span class="label label-info">{{$permission->display_name}}</span>
                                        @endforeach
                                    </td>
                                    <td>
                                        <a href=""
                                           class="waves-effect">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a href="javascript:void(0);" data-id="{{$role->id}}"
                                           class="waves-effect trash-role-row">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('.trash-role-row').click(function(){
           var id = $(this).data('id');
           deleteTip(function(){
               $.ajax({
                   url: '/delete-role/'+id,
                   method: 'post',
                   data: {
                       _token: LA.token,
                       _method: 'DELETE'
                   },
                   success: function(res){
                       if (res.status) {
                           $.pjax.reload('#pjax-container');
                           swal(res.message, '', 'success');
                       } else {
                           toastr.error(res.message);
                       }
                   }
               })
           })
        });
    </script>
@endsection