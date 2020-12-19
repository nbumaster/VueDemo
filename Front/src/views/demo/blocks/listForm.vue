<template>
    <div>
        <el-form ref="ruleForm" :model="queryData">
            <com-ocj-form-item :column="3" :form="queryData" :config="config" clearable>
                <template #searchProduct>
                    <div style="float: left;">
                      <el-button @click="resetForm" size="small">重置</el-button>
                      <el-button type="primary" @click="search" size="small">查询</el-button>
                      <com-ocj-dialog title="添加信息" width="70%" style="margin:0px 10px" :outClose="false">
                        <el-button type="success" size="small">添加信息</el-button>
                        <template #contain>
                            <edit></edit>
                        </template>
                      </com-ocj-dialog>
                    </div>
                </template>
            </com-ocj-form-item>
        </el-form>
    </div>
</template>

<script>
import edit from './edit.vue'
export default {
    name :'listForm',
    inject: ['index'],
    components:{edit},
    data () {
        return {
            // 表单数据
            queryData:{},
            pager: {
                pageNo: 1,
                pageSize: 10
            },
            config:[
                {itemType:"input",prop:"name",label:"字段"},
                {itemType:'',prop:'searchProduct',label:'',hasSlot:true,span:2}
            ],
        };
    },
    methods:{
        search(){
            this.$emit('formQuery',this.queryData);
        },
        resetForm(){
            this.queryData = {}
            this.index.page = this.pager
            this.$emit('formQuery',this.queryData)
        },
    }
};
</script>
