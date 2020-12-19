<template>
  <div class="table-content">
    <com-ocj-table
      :column="column"
      :data="tableList.items"
      :showOperation="true"
      operationWidth="180px"
      :showSlots="['index','state']"
      :checkbox="false"
      stripe
      >
      <template #index="scope">
        <span>{{ (pager.pageNo * pager.pageSize - pager.pageSize) + scope.$index+1 }}</span>
      </template>
      <template #state="scope">
        <el-tag size="small" type="info" v-if="scope.row.state===0">未执行</el-tag>
        <el-tag size="small" type="primary" v-if="scope.row.state===1">执行中</el-tag>
        <el-tag size="small" type="success" v-if="scope.row.state===2">执行成功</el-tag>
        <el-tag size="small" type="danger" v-if="scope.row.state===3">执行失败</el-tag>
      </template>
      <template #default="scope">
        <com-ocj-dialog title="修改信息" width="70%" :outClose="false">
          <el-link type="success" @click="handleEdit(scope.row)">编辑</el-link>
          <template #contain>
              <edit :rowData="rowData"></edit>
          </template>
        </com-ocj-dialog>
        <com-ocj-dialog title="执行命令" width="70%" :outClose="false">
          <el-link style="margin-left:15px" type="primary" @click="handleExecute(scope.row.id)">执行</el-link>
          <template #contain>
              <execute :executeId="executeId"></execute>
          </template>
        </com-ocj-dialog>
        <el-link style="margin-left:15px" type="danger" @click="handleDelete(scope.row.id)">删除</el-link>
      </template>
    </com-ocj-table>
    <com-ocj-pager :page="pager" :total="tableList.total" @change="changePage" />
  </div>
</template>

<script>
  import api from '@/api/demo' //引入member封装了的API
  import edit from './edit'
  import execute from './execute'
  export default {
    name : "listTable",
    components:{edit, execute},
    inject:['index'],
    props:{
        tableList:{
            type:Object,
            default: () => {}
        }
    },
    data () {
        return {
            pager: {//页数
                pageNo: 1,
                pageSize: 10
            },
            formData:{},
            column:[ //表格页头
                { index :'序号',width:'60px', type:'index'},
                { c1:'列1',},
                { c2:'列2'},
                { c3:'列3'},
                { c4 :'列4'},
                { c5 :'列5'},
                { c6 :'列6'},
                { c7 :'列7'},
                { c8 :'列8'},
                { c9 :'列9'},
                { state :'状态', align:'center'},
            ],
        };
    },
    methods:{
      handleEdit(row){
        this.rowData = row
      },
      handleExecute(id){
        this.executeId = id
        console.log(id)
      },
      handleDelete(id){
        this.$confirm(`确认要删除吗?`, '提示', {type: 'warning'}).then(() => {
          this.delete(id)
        }).catch(() => {})
      },
      handleCheck(row){
        this.$confirm(`确认要审核 ${row.username} 吗?`, '提示', {type: 'warning'}).then(() => {
          this.formData.id = row.id
          this.formData.state = 1
          this.save()
        }).catch(() => {})
      },
      changePage(page){
          this.index.page = page;
          this.index.fetchData();
      },
      //  删除
      async delete(id) {
        let res = await api.delDemoData({'id':id})
        this.$message({message: res.message, type: res.code === 20000 ?'success':'error'})
        this.index.fetchData()
      }
    }
  };
</script>
<style scoped>
</style>
