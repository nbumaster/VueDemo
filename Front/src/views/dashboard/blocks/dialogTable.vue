<template>
  <div>
    <com-ocj-table
        :column="column"
        :data="tableData"
        :showOperation="true"
        :operationWidth="OperationWidth"
        :showSlots="['approveStatus']"
        :checkbox="false"
        >
        <template #approveStatus="scope">
            <span>123123123</span>
        </template>
    </com-ocj-table>
    <com-ocj-pager :page="pager" :total="100" @change="changePage" />

  </div>
</template>

<script>
export default {
  name: 'HomePage',
  data(){
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
    }
  },
  methods:{
    // 分页
    changePage(data) {
        console.log(data)
        this.pager = Object.assign(this.pager, data);
    },
  }
}
</script>

<style scoped>

</style>
