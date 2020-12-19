<template>
    <div>
        <el-form ref="ruleForm" :model="queryData">
            <com-ocj-form-item :column="4" :form="queryData" :config="config" clearable>
                <template #searchProduct>
                    <div style="float: left;">
                        <el-button @click="resetForm" size="small">重置</el-button>
                        <el-button type="primary" @click="search" size="small">查询</el-button>
                       <com-ocj-dialog title="添加帐号" width="60%" style="margin:0px 10px" :outClose="false">
                            <el-button type="success" size="small">添加帐号</el-button>
                            <template #contain>
                                <edit-member></edit-member>
                            </template>
                        </com-ocj-dialog>
                    </div>
                </template>
            </com-ocj-form-item>
        </el-form>
    </div>
</template>

<script>
import editMember from './editMember';//新增,编辑帐号
export default {
    name :'listForm',
    components:{editMember},
    data () {
        return {
            // 表单数据
            queryData:{},
            pager: {
                pageNo: 1,
                pageSize: 10
            },
            config:[
                {itemType:'input',prop:'username',label:'用户名',placeholder:'请输入用户名'},
                {itemType:'input',prop:'name',label:'姓名',placeholder:'请输入姓名'},
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
            if (this.$parent.selectData.length === 0){
                this.$message.error('请至少选择一项！');
                return false;
            }
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
        //  删除
        async delete(idList) {
            var parms = this.$qs.stringify({
                idList: JSON.stringify(idList),
            });
            this.axios.delete('/Api/barCodeQuery/', {data: parms}).then((res) => {
                var msg = res.data.msg;
                if (msg === 'ok') {
                    this.$message.success("操作成功！");
                    this.$parent.get_tableData();
                } else {
                    this.$message.error('操作失败！');
                }
            });
        },
    }
};
</script>
