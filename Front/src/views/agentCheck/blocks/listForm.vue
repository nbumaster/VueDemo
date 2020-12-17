<template>
    <div>
        <el-form ref="ruleForm" :model="queryData">
            <com-ocj-form-item :column="3" :form="queryData" :config="config" clearable>
                <template #searchProduct>
                    <div style="float: left;">
                      <el-button @click="resetForm" size="small">重置</el-button>
                      <el-button type="primary" @click="search" size="small">查询</el-button>
                      <com-ocj-dialog title="添加一级代理" width="70%" style="margin:0px 10px" :outClose="false">
                        <el-button type="success" size="small">添加一级代理</el-button>
                        <template #contain>
                            <addAgent :level_type="1"></addAgent>
                        </template>
                      </com-ocj-dialog>
                      <com-ocj-dialog title="添加员工帐号" width="70%" :outClose="false">
                        <el-button type="warning" size="small">添加员工帐号</el-button>
                        <template #contain>
                            <addStaff :level_type="-1"></addStaff>
                        </template>
                      </com-ocj-dialog>
                    </div>
                </template>
            </com-ocj-form-item>
        </el-form>
    </div>
</template>

<script>
import addAgent from './addAgent.vue'
import addStaff from './addStaff'
export default {
    name :'listForm',
    components:{addAgent, addStaff},
    data () {
        return {
            // 表单数据
            queryData:{},
            pager: {
                pageNo: 1,
                pageSize: 10
            },
            config:[
                {itemType:"input",prop:"name",label:"编号/姓名"},
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
            this.$parent.page = this.pager;
            this.$emit('formQuery',this.queryData);
        },
    }
};
</script>
