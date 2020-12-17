<template>
    <div class="app-container">
        <list-form></list-form>
    </div>
</template>

<script>
import listForm from './blocks/listForm'
export default {
    name : "tableListPage",
    components:{
        listForm,
    },
    data () {
        return {

        };
    },
    mounted() {
      //this.fetchData()
    },
    methods:{

    }
};
</script>
<style scoped>
</style>
