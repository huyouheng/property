<!-- Left Sidebar -->
<aside id="leftsidebar" class="sidebar">
    <!-- User Info -->
    <div class="user-info">
        <div class="image">
            <img src="/images/user.png" width="48" height="48" alt="User"/>
        </div>
        <div class="info-container">
            <div class="name" data-toggle="dropdown" aria-haspopup="true"
                 aria-expanded="false">@auth {{Auth::user()->name }}@endauth</div>
            <div class="email">@auth {{Auth::user()->email }}@endauth</div>
            <div class="btn-group user-helper-dropdown">
                <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                <ul class="dropdown-menu pull-right">
                    <li><a href="{{route('home')}}"><i class="material-icons">person</i>个人中心</a></li>
                    <li role="seperator" class="divider"></li>
                    <li><a href="javascript:void(0);"><i class="material-icons">group</i>Followers</a></li>
                    <li><a href="javascript:void(0);"><i class="material-icons">shopping_cart</i>Sales</a></li>
                    <li><a href="javascript:void(0);"><i class="material-icons">favorite</i>Likes</a></li>
                    <li role="seperator" class="divider"></li>
                    <li>
                        <a class="dropdown-item" href="{{ route('logout') }}"
                           onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                            <i class="material-icons">input</i>退出
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            @csrf
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- #User Info -->
    <!-- Menu -->
    <div class="menu">
        <ul class="list sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li>
                <a href="/home">
                    <i class="fa fa-home"></i>
                    <span>Home</span>
                </a>
            </li>
            {!! $leftMenus !!}
            <li>
                <a href="javascript:void(0);" class="menu-toggle">
                    <i class="fa fa-tasks"></i>
                    <span>后台设置</span>
                </a>
                <ul class="ml-menu">
                    <li>
                        <a href="{{route('settings',['tag'=>'menu'])}}" class=" waves-effect waves-block">后台菜单</a>
                    </li>
                    <li>
                        <a href="{{route('settings',['tag'=>'role'])}}" class=" waves-effect waves-block">角色管理</a>
                    </li>
                    <li>
                        <a href="{{route('settings',['tag'=>'permission'])}}" class=" waves-effect waves-block">权限管理</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- #Menu -->
    <!-- Footer -->
    <div class="legal">
        <div class="copyright">
            &copy; 2016 - 2017 <a href="javascript:void(0);">ADMIN - MATERIAL DESIGN</a>.
        </div>
        <div class="version">
            <b>Version: </b> 1.0.5
        </div>
    </div>
    <!-- #Footer -->
</aside>
<!-- #END# Left Sidebar -->
