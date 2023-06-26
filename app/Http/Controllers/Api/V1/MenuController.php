<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Requests\MenuRequest;
use App\Http\Resources\MenuResource;
use App\Models\Menu;
use App\Models\MenuDays;
use App\Models\MenuNutrition;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Services\MenuService;


class MenuController extends Controller
{
    
    public $service;

    public function __construct(MenuService $service)
    {
        $this->service = $service;
    }


    public function index()
    {
        $menus = MenuResource::collection(Menu::with('nutritions', 'days')->get());
        return $menus;
    }

    public function firstMenu()
    {
        $menus = MenuResource::collection(Menu::first());
        return $menus;
    }
    
    public function store(MenuRequest $request)
    {
        $new_menu = $this->service->store($request->validated());
        
        return new MenuResource($new_menu);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function show(Menu $menu)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function edit(Menu $menu)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Menu $menu)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $existing_item = Menu::find($id);
        $existing_item->delete();
        return response(null, Response::HTTP_NO_CONTENT);
            
    }

    public function menuCharacters($id)
    {
        /*-$days = [1 => 'Monday', 2 => 'Tuesday', 3 => 'Wednesday', 4 => 'Thursday', 5 => 'Friday', 6 => 'Saturday', 7 => 'Sunday'];
         $nutritions = [1 => 'Breakfast', 2 => 'Second breakfast', 3 => 'Lunch', 4 => 'Snack', 5 => 'Dinner', 6 => 'Second dinner'];
         $menus_days = MenuDays::where('menu_id', $id)->get();
         $menus_nutritions = MenuNutrition::where('menu_id', $id)->get();
         foreach ($menus_days as $m_day){
             $characters['days'][$m_day->days_id] = $days[$m_day->days_id];
         }
         foreach ($menus_nutritions as $m_nutrition){
             $characters['nutritions'][$m_nutrition->nutrition_id] = $nutritions[$m_nutrition->nutrition_id];
         }*/

        return 123;
    }
}
