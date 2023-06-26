<template>
    <div>
        <p>نام کاربری: {{user.data.name}}</p>
        <p>ایمیل: {{user.data.email}}</p>
        <p>نقش کاربری:
        <span v-for="(role, index) in myRoles" :key="index">{{index}}</span>
        </p>
            <div class="col-3">
                <button @click.prevent="logout()" class="form-control btn btn-danger rounded submit px-3">خروج</button>
            </div>
        {{token}}
    </div>
</template>

<script>
import {mapGetters, mapActions} from 'vuex'
export default {
    data:function(){
        return{
            user:null,
            roles:null,
            token: localStorage.getItem('token')
        }
    },
    computed: mapGetters(['myRoles']),
    methods:{
        ...mapActions(['getMyRoles']),
        logout(){
            axios.post('/logout')
            .then(response => {
                console.log(response);
                localStorage.removeItem('x_xsrf_token');
                this.$router.push('/login');
            })
            .catch(error =>{
                console.log(error);
            })
        },
    },
    async created(){
        axios.get('api/user')
        .then(response =>{
            this.user = response
        })
        .catch(error => {
            this.$router.push({ name: 'login' })
        });
        this.getMyRoles()
    }
}
</script>
<style scoped>
.has-error{
    border-color: red;

}
</style>
