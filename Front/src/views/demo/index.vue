<template>
  <div class="app-container">
    <list-form @formQuery="formQuery"></list-form>
    <list-table :tableList="tableList"></list-table>
  </div>
</template>

<script>
  import api from '@/api/demo'
  import listForm from './blocks/listForm';
  import listTable from './blocks/listTable';
  export default {
    name: "tableListPage",
		provide(){
		  return{
		    index:this
		  }
		},
    components: {
      listForm,
      listTable
    },
    data() {
      return {
        formData: {},
        tableList: {}, // 数据

        //初始分页
        page: {
          pageNo: 1,
          pageSize: 10
        }
      };
    },
    mounted() {
      this.fetchData()
    },
    methods: {
      // 表单数据
      formQuery(data) {
        this.formData = data;
        this.fetchData();
      },
      //获取数据
      async fetchData() {
        let res = await api.getDemoData({...this.formData, ...this.page,})
        if (res.code === 20000) {
          this.tableList = res.data
        } else {
          this.$message({message: res.message,type: 'error'})
        }
      }
    }
  };
</script>
<style scoped>
</style>
