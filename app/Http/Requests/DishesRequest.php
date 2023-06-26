<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DishesRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|max:150',
            'dishes_categories_id' => 'required',
            'recipes_collections_id' => 'required',
            'description' => 'required',
            'culinary_processings_id' => 'required',
            'yield' => 'required|numeric',
            'dishes_characters' => 'required',
            'techmap_number' => 'required|numeric',
        ];
    }

    public function messages() // меняет вообще весь текст ошибки
    {
        return [
            'name.required' => 'نام زمینه" اجباری است',
            'dishes_categories_id.required' => 'فیلد "دسته غذا" الزامی است',
            'recipes_collections_id.required' => 'فیلد "مجموعه دستورالعمل‌ها" الزامی است',
            'description.required' => 'فیلد "توضیحات" الزامی است',
            'culinary_processings_id.required' => 'فیلد "روش پخت" الزامی است',
            'yield.required' => 'فیلد "خروج" الزامی است',
            'dishes_characters.required' => 'فیلد "ویژگی" الزامی است',
            'techmap_number.required' => 'فیلد "شماره داشبورد" الزامی است',
        ];
    }
}
