<?php

namespace App\Widgets;

use App\Waste;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;
use Illuminate\Support\Facades\Auth;

class Wastes extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = Waste::all()->count();
        $string = trans_choice('Wastes', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-rum',
            'title'  => "{$count} {$string}",
            'text'   => "You have $count in your Wastes. Click below to view list",
            'button' => [
                'text' => __('Wastes'),
                'link' => route('voyager.wastes.index'),
            ],
            'image' => voyager_asset('images/widget-backgrounds/02.jpg'),
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->can('browse', Voyager::model('User'));
    }
}
