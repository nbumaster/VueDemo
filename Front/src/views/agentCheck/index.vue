<template>
  <div class="app-container">
    <list-form @formQuery="formQuery"></list-form>
    <list-table :tableList="tableList"></list-table>
  </div>
</template>

<script>
  import api from '@/api/agent' //引入member封装了的API
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
        selectData: [], //多选项
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
    methods: {
      // 表单数据
      formQuery(data) {
        this.formData = data;
        this.fetchData();
      },
      async fetchData() {
        let res = await api.agentMember({ ...this.formData,
          ...this.page,
          queryType:'admin'
        })
        if (res.code === 20000) {
          this.tableList = res.data
        }
      }
    }
  };
</script>
<style scoped>
</style>
