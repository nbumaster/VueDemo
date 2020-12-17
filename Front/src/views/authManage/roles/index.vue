<template>
    <div class="app-container">
        <list-form @formQuery="formQuery"></list-form>
        <list-table :tableList="tableList"></list-table>
    </div>
</template>

<script>
import api from '@/api/roles'  //引入member封装了的API
import listForm from './blocks/listForm';
import listTable from './blocks/listTable';
export default {
    name : "index",
    //注入一个口子，供N层下级组件调用这个组件中的方法或数据
    provide(){
      return{
        index:this
      }
    },
    components:{
        listForm,
        listTable
    },
    data () {
        return {
            formData:{},
            tableList:{},   // 工序数据
            selectData:[],  //多选项
            dateTime: '',
            //重置分页作用
            page: {
                pageNo: 1,
                pageSize: 10
            }
        };
    },
    mounted() {
      this.fetchData()
    },
    methods:{
      // 表单数据
      formQuery(data){
          this.formData = data;
          this.fetchData();
      },
      async fetchData() {
        let res = await api.getData({...this.formData, ...this.page})
        if (res.code === 20000) {
          this.tableList = res.data
          //console.log(res.data)
        }
      }
    }
};
</script>
<style scoped>
</style>
