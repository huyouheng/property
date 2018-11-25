<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Utils\PHPTree;

class AppServiceProvider extends ServiceProvider
{
    protected static $isInit = false;
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        list($a,$b,$leftMenus) = PHPTree::getMenuTree();
        view()->share('leftMenus',$leftMenus);
        
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
