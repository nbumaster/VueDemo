<template>
    <div class="table-content">
        <com-ocj-table
          :column="column"
          :data="tableList.items"
          :showOperation="true"
          operationWidth="140px"
          :showSlots="['index','info_datetime','roles']"
          :checkbox="false"
          stripe
          >
          <template #index='scope'>
            <span>{{ (page.pageNo * page.pageSize - page.pageSize) + scope.$index+1 }}</span>
          </template>
          <template #roles="scope">
            {{ scope.row.roles }}
          </template>
          <template #info_datetime="scope">
            {{ scope.row.info_datetime | formatTime2 }}
          </template>
         <template #default="scope">
            <com-ocj-dialog title="修改员工帐号" width="60%" :outClose="false">
             <el-link type="primary" style="margin-right:10px" @click="handleEdit(scope.row)">编辑</el-link>
             <template #contain>
                 <edit-member :rowData="rowData"></edit-member>
             </template>
            </com-ocj-dialog>
            <!-- <el-link type="danger" @click="handleDelete(scope.row)">删除</el-link> -->
            <!-- <el-dropdown>
              <span class="el-dropdown-link">
                设置角色<i class="el-icon-arrow-down el-icon--right"></i>
              </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item v-for="(item,index) in rolesItems" :key='index' @click.native='setRoles(scope.row.id, item.id, item.name)'>{{ item.name }}</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown> -->
          </template>
        </com-ocj-table>
        <com-ocj-pager :page="page" :total="tableList.total" @change="changePage" />
    </div>
</template>

<script>
import api from '@/api/roles'
import api2 from '@/api/member'
import editMember from './editMember';//新增,编辑帐号
export default {
    name : "listTable",
    components:{editMember},
    inject:['index'],
    props:{
        tableList:{
            type:Object,
            default: () => {}
        }
    },
    data () {
        return {
          rolesItems:[],
          page: {//页数
              pageNo: 1,
              pageSize: 10
          },
          column:[ //表格页头
              { index :'序号',width:'50px'},
              { username :'用户名'},
              { info_datetime :'创建日期'}
          ],
        };
    },
    mounted() {
      this.fetchData()
    },
    methods:{
      handleSelectionChange(val) {
          this.$parent.selectData = []
          val.forEach(item=>{
              this.$parent.selectData.push(item.id)
          })
      },
      handleEdit(row){
          this.rowData = row;
      },
      handleDelete(row){
        this.$confirm(`确认要删除 ${row.username} 吗?`, '提示', {type: 'warning'}).then(() => {
          this.delete(row.id)
        }).catch(() => {})
      },
      changePage(page){
          this.page.pageNo = page.pageNo
          this.$parent.page = page
          this.$parent.fetchData()
      },
      async setRoles(agentID, rolesId){
        let res = await api.setRoles({'agentID':agentID, 'rolesId':rolesId})
        this.$message({message: res.message,type: res.code === 20000 ? 'success' : 'error'})
        this.index.fetchData()  //亮点：穿透N层调用父父父级组件中的方法
        //console.log(agentID, rolesId)
      },
      filterAdmin(items){
        //过滤掉管理员角色设置
        items.forEach((item,index)=>{
          if(item.name === '管理员'){
            items.splice(index,1)
          }
        })
        return items
      },
      async fetchData() {
        let res = await api.getData({...this.page})
        if (res.code === 20000) {
          this.rolesItems = this.filterAdmin(res.data.items)
          //console.log(res.data)
        }
      },
      async delete(id){
        let res = await api2.deleteAdmin({'id':id})
        this.$message({message: res.message, type: res.code === 20000 ?'success':'error'})
        this.index.fetchData()
      }
    }
};
</script>
<style scoped>
  .el-dropdown-link {
      cursor: pointer;
      color: #409EFF;
    }
    .el-icon-arrow-down {
      font-size: 12px;
    }
</style>
