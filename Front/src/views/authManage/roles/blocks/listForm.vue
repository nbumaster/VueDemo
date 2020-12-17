<template>
    <div>
        <el-form ref="ruleForm" :model="queryData">
            <com-ocj-form-item :column="4" :form="queryData" :config="config" clearable>
                <template #searchProduct>
                    <div style="float: left;">
                        <el-button @click="resetForm" size="small">重置</el-button>
                        <el-button type="primary" @click="search" size="small">查询</el-button>
                        <com-ocj-dialog title="新增角色" width="60%" style="margin:0px 10px">
                          <el-button type="success" size="small">新增角色</el-button>
                          <template #contain>
                              <editRoles></editRoles>
                          </template>
                        </com-ocj-dialog>
                    </div>
                </template>
            </com-ocj-form-item>
        </el-form>
    </div>
</template>

<script>
import editRoles from './editRoles';//新增,编辑帐号
export default {
  name :'listForm',
  components:{editRoles},
  data () {
      return {
          // 表单数据
          queryData:{},
          pager: {
              pageNo: 1,
              pageSize: 10
          },
          config:[
              {itemType:'input',prop:'keyword',label:'角色名称',placeholder:'请输入角色名称'},
              {itemType:'',prop:'searchProduct',label:'',hasSlot:true,span:2}
          ],
      };
  },
  methods:{
    search(){
        this.$emit('formQuery',this.queryData);
    },
    resetForm(){
        this.queryData = {};
        this.$parent.page.pageNo = 1;
        this.$emit('formQuery',this.queryData);
    },
    handleDelete(){
        this.$confirm(`确认要批量删除吗?`, '警告', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
        }).then(() => {
            //console.log(this.$parent.selectData)
            this.delete(this.$parent.selectData);
        }).catch(() => {
            console.log('cancel');
        });
    },
  }
};
</script>
