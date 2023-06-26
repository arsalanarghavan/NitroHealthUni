<template>
    <div>
        <hr>
        <addMessageVuex/>
        <hr>
        <h1 class="text-center">Chat({{countPosts}})</h1>
        
       <div class="message" v-for="(message, index) in allPosts" :key="index">
            <p>{{message.id}}</p>
            <p>{{message.message}}</p>
        </div>
        <hr>
        
    </div>
</template>
<script>
import addMessageVuex from './addMessageVuex'
import {mapGetters, mapActions} from 'vuex'

export default{
    components:{addMessageVuex},
    computed:
        /*allPosts(){
             return this.$store.getters.allPosts;//this is getting the data directly
         }*/// or via mapgetters the two entries are identical
        mapGetters(['allPosts', 'countPosts']),
    async mounted(){
        //this.$store.dispatch('getList')//actions are called with the dispatch keyword
        this.getList()
    },
    methods:mapActions(['getList'])

    
}
</script>
<style scoped>
.message{
    border:1px solid black
}
</style>
