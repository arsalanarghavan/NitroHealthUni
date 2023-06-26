<?php

namespace App\Interfaces;

interface MenusDishesInterFace{
    public static function get_products_bju($products_id, $dishes_id, $field);// calculation of proteins, fats, carbohydrates for one product
    public static function get_bju_dish($menus_dishes_id, $field);// calculation of proteins, fats, carbohydrates per dish
    public static function get_kkal($products_id, $menus_dishes_id);// calculation of calories per product
    public static function get_kkal_dish($menus_dishes_id);// calculating calories per meal
    public function CalculateMenuInfo($id);// calculation of the final report, layout of the object
    public static function get_vitamin($menus_dishes_id, $yield, $field);//calculation of all vitamins for one dish
}
?>