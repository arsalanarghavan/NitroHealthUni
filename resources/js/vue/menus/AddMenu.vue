<template>
  <div>
    <form @submit.prevent="saveMenu()">
    <label for="name"><b>نام منو:</b></label>
    <input id="name" class="form-control" type="text" v-model="form.name"
        :class="{invalid: ($v.form.name.$dirty && !$v.form.name.required)}">
        <small class="helper-text invalid" v-if="$v.form.name.$dirty && !$v.form.name.required">
            نام منو را وارد کنید
        </small>


    <div class="border-block" id="day-indicator">
        <p style="font-size: 18px;"><b>روزهای منو <small>(گزینه‌های مورد نیاز را علامت بزنید)</small></b></p>
        <div class="day-container">
            <p><input type="checkbox" name="days1" v-model="form.days1">شنبه</p>
            <p><input type="checkbox" name="days2" v-model="form.days2">یک‌شنبه</p>
            <p><input type="checkbox" name="days3" v-model="form.days3">دوشنبه</p>
            <p><input type="checkbox" name="days4" v-model="form.days4">سه‌شنبه</p>
            <p><input type="checkbox" name="days5" v-model="form.days5">چهارشنبه</p>
            <p><input type="checkbox" name="days6" v-model="form.days6">پنج‌شنبه</p>
            <p><input type="checkbox" name="days7" v-model="form.days7">جمعه</p>
        </div>
    </div>

    <div class="border-block">
        <p style="font-size: 18px;"><b>وعده‌های غذایی <small>(گزینه‌های مورد نیاز را علامت بزنید)</small></b></p>
        <div class="nutrition-container">
            <p><input type="checkbox" name="nutrition1" v-model="form.nutrition1">صبحانه</p>
            <p><input type="checkbox" name="nutrition2" v-model="form.nutrition2">میان وعده صبحانه</p>
            <p><input type="checkbox" name="nutrition3" v-model="form.nutrition3">نهار</p>
            <p><input type="checkbox" name="nutrition4" v-model="form.nutrition4">میان وعده نهار</p>
            <p><input type="checkbox" name="nutrition5" v-model="form.nutrition5">شام</p>
            <p><input type="checkbox" name="nutrition6" v-model="form.nutrition6">میان وعده شام</p>
        </div>
    </div>

<!-- <button class="btn btn-success mt-4" style="margin:0 auto;">Save Menu</button> -->
    <div class="modal-footer">
        <button type="button" class="btn main-button-dark" @click="closeModal">لغو</button>
        <button id="add" type="submit" class="btn main-button-green">ذخیره منو</button>
    </div>
    </form>
  </div>
</template>

<style>
    .day-container{
        display:flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }
    .nutrition-container{
        display:flex;
        flex-wrap: wrap;
        justify-content: space-around;
        padding: 5px;
    }
    .border-block{
        border:1px solid #ced4da;
        border-radius: 10px;
        margin-top: 25px;
        padding: 5px;
    }
</style>

<script>
import {mapGetters, mapActions} from 'vuex'
import {required} from "vuelidate/lib/validators";
export default{
    data: function(){
        return {
            form:{
                name:'',
                days1:'',
                days2:'',
                days3:'',
                days4:'',
                days5:'',
                days6:'',
                days7:'',
                nutrition1:'',
                nutrition2:'',
                nutrition3:'',
                nutrition4:'',
                nutrition5:'',
                nutrition6:'',
            },
        }
    },
    computed: mapGetters(['newMenu']),
    methods:{
        ...mapActions(['getNewMenu']),
        saveMenu(){
            this.$v.form.$touch();
            if(this.$v.form.$error){
                console.log('فرم ثبت شد.')
            }else{
                this.getNewMenu({
                    name: this.form.name,
                    days1: this.form.days1,
                    days2: this.form.days2,
                    days3: this.form.days3,
                    days4: this.form.days4,
                    days5: this.form.days5,
                    days6: this.form.days6,
                    days7: this.form.days7,
                    nutrition1: this.form.nutrition1,
                    nutrition2: this.form.nutrition2,
                    nutrition3: this.form.nutrition3,
                    nutrition4: this.form.nutrition4,
                    nutrition5: this.form.nutrition5,
                    nutrition6: this.form.nutrition6,
                }).then(response => {
                    this.flashMessage.success({
                        message: 'منو با موفقیت ایجاد شد',
                        time: 3000,
                    });
                });
                this.$bvModal.hide('modal-1')

            }
        },
        closeModal(){
            this.$bvModal.hide('modal-1')
        },
    },
    validations: {
        form:{
            name: {required},
        }

    },

}
</script>
<style scoped>
    input:invalid {
        border-color: red;
    }
    small > .invalid {
        color: red;
    }
</style>
