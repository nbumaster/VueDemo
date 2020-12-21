<template>
    <div class="table-content">
        <com-ocj-table
          :column="column"
          :data="tableList.items"
          :showOperation="true"
          operationWidth="140px"
          :showSlots="['index','auth_type']"
          :checkbox="false"
          stripe
          >
          <template #index='scope'>
            <span>{{ (pager.pageNo * pager.pageSize - pager.pageSize) + scope.$index+1 }}</span>
          </template>
          <template #auth_type="scope">
            <el-tag size="mini" type="info" v-if="scope.row.auth_type===0">目录</el-tag>
            <el-tag size="mini" type="info" v-if="scope.row.auth_type===1">菜单</el-tag>
            <el-tag size="mini" type="info" v-if="scope.row.auth_type===2">按钮</el-tag>
          </template>
          <template #default="scope">
            <com-ocj-dialog title="新增权限" width="60%">
              <el-link type="success" size="small" @click="handleEdit(scope.row)">编辑</el-link>
              <template #contain>
                  <editAuth :rowData="rowData"></editAuth>
              </template>
            </com-ocj-dialog>
            <el-link type="danger" size="mini" style="margin-left:15px" @click="handleDelete(scope.row)">删除</el-link>
          </template>
        </com-ocj-table>
        <com-ocj-pager :page="pager" :total="tableList.total" @change="changePage" />
    </div>
</template>

<script>
import api from '@/api/auth'
import editAuth from './editAuth'
export default {
    name : "listTable",
    inject:['index'],
    components:{editAuth},
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
            column:[ //表格页头
                { index :'序号',width:'50px'},
                { name :'权限名称'},
                { auth_flag :'权限标识'},
                { auth_type :'类型', align:'center'},
                { req_url :'请求地址'},
                { parent__name :'父级目录'},
                { content :'备注说明'}
            ],
            rowData: {}
        };
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
        changePage(page){
            this.pager.pageNo = page.pageNo
            this.$parent.page = page
            this.$parent.fetchData()
        },
        handleDelete(row){
            this.$confirm(`确认要删除吗?`, '警告', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                this.delete(row.id);
            }).catch(() => {
                console.log('cancel');
            });
        },
        async delete(id){
          let res = await api.delete({'id':id})
          this.$message({message: res.message,type: res.code === 20000 ? 'success' : 'error'})
          this.index.fetchData()  //亮点：穿透N层调用父父父级组件中的方法
        }
    }
};
</script>
<style scoped>
</style>
