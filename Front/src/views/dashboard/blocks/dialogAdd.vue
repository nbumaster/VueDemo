<template>
  <div>
    <el-form :model="formData" label-position="left" :rules="ruleForm">
        <com-ocj-form-item :form="formData" :config="formConfig" :column="1">
            <template #search>
                <div>
                    <el-button type="primary">查询</el-button>
                </div>
            </template>
        </com-ocj-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: 'HomePage',
  data(){
    return {
      //表单数据,,
      formData:{},
      //表单验证
      ruleForm:{},
      //表单配置
      formConfig:[
          {itemType:'input',prop:'',label:'实物物资ID',width:'200px'},
          {itemType:'radio',label:'目标用户',prop:'targetUsers',listName:'label',listKey:'value',list:[
              {label:'不限',value:'0'},
              {label:'按用户等级',value:'1'},
              {label:'按新媒体账号注册时间',value:'2'},
          ]},
          {itemType:'select',prop:'activeAddress',width:'200px',label:'活动范围',listName:'label',listKey:'value',list:[
              {label:'上海',value:'1'},{label:'全国（含上海）',value:'2'},{label:'全国（不含上海）',value:'3'}
          ]},
          {itemType:'switch',prop:'',label:'发起部门'},
          {itemType:'checkbox',prop:'',label:'实物物资ID'},
          {itemType:'datePicker',prop:'',label:'商品名称',width:'200px'},
          {itemType:'',prop:'search',hasSlot:true,label:''}
      ],
    }
  }
}
</script>

<style scoped>

</style>
