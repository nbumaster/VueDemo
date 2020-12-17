<template>
  <div id="app">
    <router-view v-if="isRouterAlive"></router-view>
    <el-dialog
      v-if="level"
      title="信息提示"
      :visible.sync="dialogVisible"
      width="30%"
      :show-close="false"
      :close-on-click-modal="false">
      <span style="font-size:18px">您有新的代理申请，请及时处理</span>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="gotoPage">前往</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
  import api from '@/api/agent'
  export default {
    name: 'App',
    provide() {
      return {
        reload: this.reload,
      }
    },
    data() {
      return {
        isRouterAlive: true,
        level:localStorage.getItem('level')==='0'?true:false,
        total:0,
        dialogVisible:false,
      }
    },
    // mounted() {
    //   if (this.timer) {
    //     clearInterval(this.timer)
    //   } else {
    //     this.timer = setInterval(() => {
    //       if(this.level){
    //         //this.getNewAgentment()
    //       }
    //     }, 1000 * 15 * 1)
    //   }
    // },
    methods: {
      reload() {
        this.isRouterAlive = false
        this.$nextTick(function() {
          this.isRouterAlive = true
        })
      },
      gotoPage(){
        this.updateState()
        this.dialogVisible = false
        this.$router.push('/agentCheck')
      },
      async getNewAgentment(){
        let res = await api.getNewAgentment({})
        if(res.data.total){
          this.dialogVisible = true
        }
      },
      async updateState(){
        let res = await api.updateState({})
      }
    }
  }
</script>
