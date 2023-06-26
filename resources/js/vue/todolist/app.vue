<template>
    <div>
        <div class="heading">
            <h1 class="text-center">Todo Add form</h1>
            <addItemForm
             v-on:reloadList="getList()"
            />
        </div>
        <div class="list-view">
            <list-view 
            :items="items"
            v-on:reloadList="getList()"
            />
        </div>
    </div>
</template>

<script>
import addItemForm from './addItemForm'
import listView from './listView'

export default{
    components:{addItemForm, listView},
    data:function(){
        return {
            items:[]//initially my news array is empty
        }
    },
    methods:{
        getList(){
            axios.get('api/items')
            .then(response => {
                this.items = response.data// wrote a function and filled it
            })
            .catch(error => {
                console.log(error);
            })
        }
    },
    created(){//after the page is loaded, this list is formed and passed to the top
        this.getList();
    }
    
}
</script>
