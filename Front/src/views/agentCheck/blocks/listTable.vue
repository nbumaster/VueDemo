<template>
  <div class="table-content">
    <com-ocj-table
      :column="column"
      :data="tableList.items"
      :showOperation="true"
      operationWidth="180px"
      :showSlots="['index','rateData','bank_name','state','username','level']"
      :checkbox="false"
      stripe
      >
      <template #index="scope">
        <span>{{ (pager.pageNo * pager.pageSize - pager.pageSize) + scope.$index+1 }}</span>
      </template>
      <template #username="scope">
        <div>{{ scope.row.username }}</div>
        <div>({{ scope.row.name }})</div>
      </template>
      <template #level="scope">
        <span v-if="scope.row.level===-1">员工帐号</span>
        <span v-if="scope.row.level===1">一级代理</span>
        <span v-if="scope.row.level===2">二级代理</span>
        <div>{{ scope.row.code }}</div>
      </template>
      <template #rateData="scope">
        {{ scope.row.R1 }} / {{ scope.row.R2 }} / {{ scope.row.R3 }} / {{ scope.row.R4 }} / {{ scope.row.R5 }}
      </template>
      <template #bank_name="scope">
        <div>{{ scope.row.bank_name }}</div>
        <div>{{ scope.row.bank_card }}</div>
      </template>
      <template #state="scope">
        <el-tag size="small" type="info" v-if="scope.row.state===0">待审核</el-tag>
        <el-tag size="small" type="success" v-else-if="scope.row.state===1">已审核</el-tag>
        <el-tooltip class="item" effect="light" :content="`拒绝理由： ${scope.row.denied}`" placement="top-start" v-else>
          <el-tag size="small" type="danger">被拒绝</el-tag>
        </el-tooltip>
      </template>
      <template #default="scope">
        <com-ocj-dialog title="修改代理信息" width="70%" :outClose="false">
          <el-link type="success" @click="handleEdit(scope.row)" style="margin-right:15px">编辑</el-link>
          <template #contain>
              <addAgent :level_type="scope.row.level" :rowData="rowData"></addAgent>
          </template>
        </com-ocj-dialog>
        <el-link type="success" @click="handleCheck(scope.row)" v-if="scope.row.state===0">审核</el-link>
        <el-link type="info" v-if="scope.row.state===1 || scope.row.state===2">已审</el-link>
        <el-link style="margin-left:15px" type="danger" @click="handleDenied(scope.row)">拒绝</el-link>
        <el-link style="margin-left:15px" type="danger" @click="handleDelete(scope.row)">删除</el-link>
      </template>
    </com-ocj-table>
    <com-ocj-pager :page="pager" :total="tableList.total" @change="changePage" />
  </div>
</template>

<script>
  import api from '@/api/agent' //引入member封装了的API
  import addAgent from './addAgent'
  export default {
    name : "listTable",
    components:{addAgent},
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
                { index :'序号',width:'60px'},
                { username:'代理', width:'100', align:'center'},
                { level:'级别'},
                { parent__name:'归属'},
                { rateData :'CL / HSI / MHI / DAX / DXM', width:'230'},
                { rate :'USD/HKD/EUR', width:'150'},
                { bank_lxr :'户名', width:'100'},
                { bank_name :'银行卡', align:'center'},
                { bank_mobile :'手机', width:'120'},
                { state :'状态', width:'100'},
            ],
        };
    },
    methods:{
      handleEdit(row){
        this.rowData = row
      },
      handleDelete(row){
        this.$confirm(`确认要删除 ${row.username} 吗?`, '提示', {type: 'warning'}).then(() => {
          this.delete(row.id)
        }).catch(() => {})
      },
      handleCheck(row){
        this.$confirm(`确认要审核 ${row.username} 吗?`, '提示', {type: 'warning'}).then(() => {
          this.formData.id = row.id
          this.formData.state = 1
          this.save()
        }).catch(() => {})
      },
      handleDenied(row){
        this.$prompt('请输入拒绝理由', '提示', {
          inputPattern: /\S/,
          inputErrorMessage: '理由不能为空'
        }).then(({ value }) => {
          this.formData.id = row.id
          this.formData.state = 2
          this.formData.denied = value
          this.save()
        }).catch(() => {})
      },
      changePage(page){
          this.$parent.page = page;
          this.$parent.fetchData();
      },
      //  保存
      async save() {
        let res = await api.changeState(this.formData)
        this.$message({message: res.message, type: res.code === 20000 ?'success':'error'})
        this.$parent.fetchData()
      },
      //  删除
      async delete(id) {
        let res = await api.deleteAgentMember({'id':id})
        this.$message({message: res.message, type: res.code === 20000 ?'success':'error'})
        this.index.fetchData()
      }
    }
  };
</script>
<style scoped>
</style>
