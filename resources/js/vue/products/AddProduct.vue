<template>
  <div>
    <form @submit.prevent="saveProduct()">
        <div class="blocks">
            <div class="block">
                <label for="name"><b>نام محصول</b></label>
                <input autocomplete="off" id="name" class="form-control" type="text" v-model="form.name"
                       :class="{invalid: ($v.form.name.$dirty && !$v.form.name.required)}">
                <small class="helper-text invalid" v-if="$v.form.name.$dirty && !$v.form.name.required">
                    فیلد نمی‌تواند خالی باشد!
                </small>
            </div>
            <div class="block">
                <label for="recipes_collection_id"><b>دسته‌بندی محصولات</b></label>
                <select id="recipes_collection_id" class="form-control"
                        v-model="form.products_categories_id">
                    <option v-for="(category, index) in productsCategory"
                            :key="index"
                            :value="category.id"
                    >
                        {{category.name}}
                    </option>
                </select>
                <small class="helper-text invalid" v-if="$v.form.products_categories_id.$dirty && !$v.form.products_categories_id.required">
                    فیلد نمی‌تواند خالی باشد!
                </small>
            </div>
        </div>

        <div class="blocks mt-3">
            <div class="block">
                <label for="water"><b>آب</b></label>
                <input autocomplete="off" id="water" class="form-control" type="text" v-model="form.water"
                       :class="{invalid: ($v.form.water.$dirty && (!$v.form.water.required || !$v.form.water.decimal))}">
                <small class="helper-text invalid" v-if="$v.form.water.$dirty && !$v.form.water.required">
                    فیلد نمی‌تواند خالی باشد!
                </small>
                <small class="helper-text invalid" v-if="$v.form.water.$dirty && !$v.form.water.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
            <div class="block">
                <label for="protein"><b>پروتئین</b></label>
                <input autocomplete="off" id="protein" class="form-control" type="text" v-model="form.protein"
                       :class="{invalid: ($v.form.protein.$dirty && (!$v.form.protein.required || !$v.form.protein.decimal))}">
                <small class="helper-text invalid" v-if="$v.form.protein.$dirty && !$v.form.protein.required">
                    فیلد نمی‌تواند خالی باشد!
                </small>
                <small class="helper-text invalid" v-if="$v.form.protein.$dirty && !$v.form.protein.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
            <div class="block">
                <label for="fat"><b>چربی</b></label>
                <input autocomplete="off" id="fat" class="form-control" type="text" v-model="form.fat"
                       :class="{invalid: ($v.form.fat.$dirty && (!$v.form.fat.required || !$v.form.fat.decimal))}">
                <small class="helper-text invalid" v-if="$v.form.fat.$dirty && !$v.form.fat.required">
                    فیلد نمی‌تواند خالی باشد!
                </small>
                <small class="helper-text invalid" v-if="$v.form.fat.$dirty && !$v.form.fat.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
            <div class="block">
                <label for="carbohydrates_total"><b>کربوهیدرات، گرم</b></label>
                <input autocomplete="off" id="carbohydrates_total" class="form-control" type="text" v-model="form.carbohydrates_total"
                       :class="{invalid: ($v.form.carbohydrates_total.$dirty && (!$v.form.carbohydrates_total.required || !$v.form.carbohydrates_total.decimal))}">
                <small class="helper-text invalid" v-if="$v.form.carbohydrates_total.$dirty && !$v.form.carbohydrates_total.required">
                    فیلد نمی‌تواند خالی باشد!
                </small>
                <small class="helper-text invalid" v-if="$v.form.carbohydrates_total.$dirty && !$v.form.carbohydrates_total.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
        </div>

        <p class="mt-3"><b>ریز عناصر</b></p>
        <div class="blocks">
            <div class="block">
                <label for="na"><b>سدیم، میلی گرم</b></label>
                <input autocomplete="off" id="na" class="form-control" type="text" v-model="form.na"
                       :class="{invalid: ($v.form.na.$dirty && !$v.form.na.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.na.$dirty && !$v.form.na.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
            <div class="block">
                <label for="k"><b>پتاسیم، میلی گرم</b></label>
                <input autocomplete="off" id="k" class="form-control" type="text" v-model="form.k"
                       :class="{invalid: ($v.form.k.$dirty && !$v.form.k.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.k.$dirty && !$v.form.k.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
            <div class="block">
                <label for="ca"><b>کلسیم، میلی گرم</b></label>
                <input autocomplete="off" id="ca" class="form-control" type="text" v-model="form.ca"
                       :class="{invalid: ($v.form.ca.$dirty && !$v.form.ca.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.ca.$dirty && !$v.form.ca.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
        </div>
        <div class="blocks">
            <div class="block">
                <label for="mg"><b>منیزیم، میلی گرم</b></label>
                <input autocomplete="off" id="mg" class="form-control" type="text" v-model="form.mg"
                       :class="{invalid: ($v.form.mg.$dirty && !$v.form.mg.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.mg.$dirty && !$v.form.mg.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
            <div class="block">
                <label for="p"><b>فسفر، میلی گرم</b></label>
                <input autocomplete="off" id="p" class="form-control" type="text" v-model="form.p"
                       :class="{invalid: ($v.form.p.$dirty && !$v.form.p.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.p.$dirty && !$v.form.p.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
            <div class="block">
                <label for="fe"><b>آهن، میلی گرم</b></label>
                <input autocomplete="off" id="fe" class="form-control" type="text" v-model="form.fe"
                       :class="{invalid: ($v.form.fe.$dirty && !$v.form.fe.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.fe.$dirty && !$v.form.fe.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
        </div>
        <div class="blocks">
            <div class="block">
                <label for="i"><b>ید، میلی گرم</b></label>
                <input autocomplete="off" id="i" class="form-control" type="text" v-model="form.i"
                       :class="{invalid: ($v.form.i.$dirty && !$v.form.i.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.i.$dirty && !$v.form.i.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
            <div class="block">
                <label for="se"><b>سلنیوم، میلی گرم</b></label>
                <input autocomplete="off" id="se" class="form-control" type="text" v-model="form.se"
                       :class="{invalid: ($v.form.se.$dirty && !$v.form.se.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.se.$dirty && !$v.form.se.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
        </div>

        <p class="mt-3"><b>ویتامین‌ها</b></p>
        <div class="blocks">
            <div class="block">
                <label for="vitamin_a"><b>ویتامین A، میلی گرم</b></label>
                <input autocomplete="off" id="vitamin_a" class="form-control" type="text" v-model="form.vitamin_a"
                       :class="{invalid: ($v.form.vitamin_a.$dirty && !$v.form.vitamin_a.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.vitamin_a.$dirty && !$v.form.vitamin_a.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
            <div class="block">
                <label for="vitamin_b1"><b>ویتامین B1، میلی گرم</b></label>
                <input autocomplete="off" id="vitamin_b1" class="form-control" type="text" v-model="form.vitamin_b1"
                       :class="{invalid: ($v.form.vitamin_b1.$dirty && !$v.form.vitamin_b1.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.vitamin_b1.$dirty && !$v.form.vitamin_b1.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
            <div class="block">
                <label for="vitamin_b2"><b>ویتامین B2، میلی گرم</b></label>
                <input autocomplete="off" id="vitamin_b2" class="form-control" type="text" v-model="form.vitamin_b2"
                       :class="{invalid: ($v.form.vitamin_b2.$dirty && !$v.form.vitamin_b2.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.vitamin_b2.$dirty && !$v.form.vitamin_b2.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
        </div>
        <div class="blocks">
            <div class="block">
                <label for="vitamin_c"><b>ویتامین C، میلی گرم</b></label>
                <input autocomplete="off" id="vitamin_c" class="form-control" type="text" v-model="form.vitamin_c"
                       :class="{invalid: ($v.form.vitamin_c.$dirty && !$v.form.vitamin_c.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.vitamin_c.$dirty && !$v.form.vitamin_c.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
            <div class="block">
                <label for="vitamin_d"><b>ویتامین D، میلی گرم</b></label>
                <input autocomplete="off" id="vitamin_d" class="form-control" type="text" v-model="form.vitamin_d"
                       :class="{invalid: ($v.form.vitamin_d.$dirty && !$v.form.vitamin_d.decimal)}">
                <small class="helper-text invalid" v-if="$v.form.vitamin_d.$dirty && !$v.form.vitamin_d.decimal">
                    مقدار فیلد باید عددی یا کسری باشد!
                </small>
            </div>
        </div>

        <div class="blocks mt-3 text-center">
            <button class="btn main-button-green" style="width:100%">ذخیره محصول</button>
        </div>
    </form>
  </div>
</template>

<script>
import {mapGetters, mapActions} from 'vuex'
import {email, minLength, required, decimal} from "vuelidate/lib/validators";
export default{
    data: function(){
        return {
            products_category:'',
            form:{
                name:'',
                products_categories_id:'',
                water:'',
                protein:'',
                fat:'',
                carbohydrates_total:'',
                na:'',
                k:'',
                ca:'',
                mg:'',
                p:'',
                fe:'',
                i:'',
                se:'',
                vitamin_a:'',
                vitamin_b1:'',
                vitamin_b2:'',
                vitamin_c:'',
                vitamin_d:'',
            },
        }
    },
    computed: mapGetters(['productsCategory', 'newProduct']),
    methods:{
        ...mapActions(['getNewProduct', 'getProductsCategory']),
        saveProduct(){
            this.$v.form.$touch();
            if(this.$v.form.$error){
                console.log('Form submitted')
            }else{
                this.getNewProduct({
                    form: this.form
                })
                .then(response => {
                    this.flashMessage.success({
                        title: 'Данные сохранены',
                        message: 'Продукт добавлен в список',
                        time: 3000,
                    });
                });
                this.$bvModal.hide('modal-1')

            }
        },
    },
    validations: {
        form:{
            name: {required},
            products_categories_id: {required},
            water: {required, decimal},
            protein: {required, decimal},
            fat: {required, decimal},
            carbohydrates_total: {required, decimal},
            na: {decimal},
            k: {decimal},
            ca: {decimal},
            mg: {decimal},
            p: {decimal},
            fe: {decimal},
            i: {decimal},
            se: {decimal},
            vitamin_a: {decimal},
            vitamin_b1: {decimal},
            vitamin_b2: {decimal},
            vitamin_c: {decimal},
            vitamin_d: {decimal},
        }

    },
    async created(){
        this.getProductsCategory();
    },

}
</script>
<style scoped>
    .invalid {
        border-color: red;
        color: red;
    }
    small .invalid {
        color: red;
    }
    .blocks{
        display: flex;
    }
    .block:not(:last-child) {
        margin-right: 20px;
    }
</style>
