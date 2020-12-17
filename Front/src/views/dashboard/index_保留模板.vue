<template>
    <div class="app-container">
        <com-ocj-table
            :column="column"
            :data="tableData"
            :showOperation="true"
            :operationWidth="OperationWidth"
            :showSlots="['approveStatus']"
            :checkbox="true"
            >
            <template #approveStatus="scope">
                <span>123123123</span>
            </template>
        </com-ocj-table>
        <com-ocj-pager :page="pager" :total="100" @change="changePage" />

        <el-divider></el-divider>

        <com-ocj-dialog title="弹窗" width="60%" :outClose="false">
            <el-button type="primary" style="margin-left:10px;">表单弹窗</el-button>
            <template #contain>
                <!-- 弹窗内容 -->
                <dialogAdd></dialogAdd>
            </template>
        </com-ocj-dialog>

        <com-ocj-dialog title="弹窗" width="60%">
            <el-button type="primary" style="margin-left:10px;">表格弹窗</el-button>
            <template #contain>
                <!-- 弹窗内容 -->
                <dialogTable></dialogTable>
            </template>
        </com-ocj-dialog>

        <el-divider></el-divider>

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
import dialogAdd from './blocks/dialogAdd'
import dialogTable from './blocks/dialogTable'
export default {
    name : "tableListPage",
    components:{dialogAdd, dialogTable},
    data () {
        return {
            pager: {//页数
                pageNo: 1,
                pageSize: 10
            },
            OperationWidth:'180',
            tableData:[
              {c1:'1', c2:'现金抽奖',c3:'抽奖', c4:'是'},
              {c1:'1', c2:'现金抽奖',c3:'抽奖', c4:'是'},
              {c1:'1', c2:'现金抽奖',c3:'抽奖', c4:'是'},
              {c1:'1', c2:'现金抽奖',c3:'抽奖', c4:'是'}
            ],
            column:[ //表格页头
                { c1 :'活动编号'},
                { c2 :'活动名称'},
                { c3 :'活动类型'},
                { c4 :'是否有效'}
            ],

            //表单数据
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
        };
    },
    methods:{
      // 分页
      changePage(data) {
          console.log(data)
          //this.pager = Object.assign(this.pager, data);
      },
    }
};
</script>
<style scoped>
</style>