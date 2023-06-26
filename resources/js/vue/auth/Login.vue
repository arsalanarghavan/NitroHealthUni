<template>
    <div>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">ورود</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-5">
                        <div class="login-wrap">
                            <form autocomplete="off" @submit.prevent="login()" method="post" class="login-form">
                                <div class="form-group">
                                    <label for="email">ایمیل</label>
                                    <input type="email" id="email" class="form-control" placeholder="user@example.com"
                                    v-model="form.email"
                                    :class="{invalid: ($v.form.email.$dirty && !$v.form.email.required) || ($v.form.email.$dirty && !$v.form.email.email)}">
                                    <small
                                    class="helper-text invalid"
                                     v-if="$v.form.email.$dirty && !$v.form.email.required"
                                    >ایمیل نمی‌تواند خالی باشد!</small>
                                    <small
                                    class="helper-text invalid"
                                    v-else-if="$v.form.email.$dirty && !$v.form.email.email"
                                    >یک ایمیل معتبر وارد نمایید.</small>
                                </div>

                                <div class="form-group">
                                    <label for="password">رمز</label>
                                    <input type="password" id="password" class="form-control"
                                    v-model="form.password"
                                    :class="{invalid: ($v.form.password.$dirty && !$v.form.password.required) || ($v.form.password.$dirty && !$v.form.password.email)}">
                                    <small
                                    class="helper-text invalid"
                                    v-if="$v.form.password.$dirty && !$v.form.password.required"
                                    >رمز عبور را وارد کنید</small>
                                    <small
                                      class="helper-text invalid"
                                      v-else-if="$v.form.password.$dirty && !$v.form.password.minLength"
                                    >رمز عبور باید شامل {{$v.form.password.$params.minLength.min}} کاراکتر باشد. رمز وارد شده {{form.password.length}}</small>

                                    <small
                                    class="helper-text invalid"
                                    v-if="errors"
                                    >{{errors}}</small>
                                </div>
                                <div class="form-group mt-4">
                                    <button type="submit" class="form-control btn btn-primary rounded submit px-3">ورود</button>
                                </div>
                            </form>
                        </div>
                        <p>ایمیل: Info@ArsalanArghavan.ir</p>
                        <p>رمز: 12345678</p>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
import {email, required, minLength} from 'vuelidate/lib/validators'
import {mapGetters, mapActions} from 'vuex'

export default{

    data:function(){
        return{
            form:{
                email:'',
                password:'',
            },
            errors:null,
        }
    },
    validations: {
        form:{
            email: {email, required},
            password: {required, minLength: minLength(6)}
        }

    },
    methods:{
        login(){
            if (this.$v.$invalid) {
                this.$v.$touch();
                return
            }
            axios.get('/sanctum/csrf-cookie').then(response => {
                axios.post('/login', this.form)
                .then(response =>{
                    localStorage.setItem('x_xsrf_token', response.config.headers['X-XSRF-TOKEN']);
                    this.$router.push({name:'cabinet'});
                })
                .catch(response => {
                        //if (error.response.status === 422) {
                            this.errors = 'احتمالاً نام کاربری یا رمز عبور اشتباه است.';
                        //}
                    });
            })
        }
    }
}
</script>
<style>
    select{
        font-family: fontAwesome
    }
    .invalid {
        border-color: red;
        color: red;
    }
    small .invalid {
        color: red;
    }
</style>