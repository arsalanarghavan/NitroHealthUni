<template>
    <div style="width:90%; margin: 0 auto;">
        <FlashMessage :position="'right top'"></FlashMessage>
        <h1 class="text-center">فهرست منو</h1>
        <b-button v-b-modal.modal-1 class="mb-4 main-button-green">ایجاد یک منوی جدید</b-button>
        <b-modal id="modal-1" class="mb-4 " 
            size="lg" 
            title="منوی جدید"
            hide-footer="true">
            <addMenu/>
        </b-modal>

        <div class="row mt-4 mb-4">
            <div class="header-block row">
                <div class="search-form col-8">
                    <div class="form">
                        <form action="" method="post">
                            <div class="form-group row">
                                <div class="col-4">
                                    <input autocomplete="off" type="text" name="id" placeholder="شماره منو"
                                           class="form-control" v-model.integer="filter_form.id">
                                </div>
                                <div class="col-4">
                                    <input autocomplete="off" type="text" name="name" placeholder="نام منو"
                                           class="form-control" v-model="filter_form.name">
                                </div>
                                <div class="col-4">
                                    <input autocomplete="off" type="text" name="date" placeholder="تاریخ ایجاد"
                                           class="form-control" v-model="filter_form.date">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <table class="fl-table">
            <thead>
            <tr>
                <th scope="col">ترتیب</th>
                <th scope="col">نام</th>
                <th scope="col">وعده‌های غذایی</th>
                <th scope="col">روزها</th>
                <th scope="col">تاریخ ایجاد</th>
                <th scope="col">کنترل</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(myMenu, index) in filteredMenus" :key="index">
                <td>{{myMenu.id}}</td>
                <td>{{myMenu.name}}</td>
                <td>{{myMenu.nutritions | nutrition_separator }}</td>
                <td>{{myMenu.days | day_separator }}</td>
                <td>{{myMenu | dateCreated }}</td>
                <td class="text-center">
                    <b-button variant="danger" @click="removeMenus(myMenu.id)">
                        <font-awesome-icon icon="trash"/>
                    </b-button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import addMenu from './AddMenu'
import {mapGetters, mapActions} from 'vuex'
import {VueSuggestion} from 'vue-suggestion'
import 'vue-suggestion/dist/vue-suggestion.css'
import moment from 'moment'

export default{
    components:{addMenu},
    data:function(){
        return {
            filter_form:{
                id: null,
                name: '',
                date: '',
            }
        }
    },
    computed: {
       ...mapGetters(['allMenus']),
        filteredMenus: function () {
            return this.allMenus.filter((menu) => {
                return menu.name.toLowerCase().match(this.filter_form.name)
            })/*.filter((menu) => {
                return menu.id.match(this.filter_form.id)
            })*//*.filter((dictionary) => {
                    return dictionary.archive.match(this.filter_form.archive);
                })*/;
        },
    },

    methods:{
        ...mapActions(['getMenus', 'deleteMenu']),
        removeMenus(id){
            this.deleteMenu(id)
                .then(response => {
                    this.flashMessage.success({
                        message: 'منو با موفقیت حذف شد',
                        time: 3000,
                    });
                });
        },
        
    },
    filters: {
        nutrition_separator: function (nutritions) {
            let result = '';
            nutritions.forEach(function(nutrition, i, nutritions) {
                if(nutritions.length > i+1){
                    result += nutrition.name + ', ';
                }else{
                    result += nutrition.name;
                }
            });
            return result;
        },
        day_separator: function (days) {
            let result = '';
            days.forEach(function(day, i, days) {
                if(days.length > i+1){
                    result += day.name + ', ';
                }else{
                    result += day.name;
                }

            });
            return result;
        },
        dateCreated: function (menu) {
            return moment(menu.created_at).format('DD.MM.YYYY HH:II');
        },
    },

    async created(){
        this.getMenus()
    },
}

</script>
