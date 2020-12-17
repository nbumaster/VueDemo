<template>
    <div class="app-container">
        <span>
          {{ name }}
          <span v-if="level==='0'">【管理员】</span>
          <span v-if="level==='1'"></span>
          <span v-if="level==='2'"></span>
          欢迎进入管理中心！
        </span>
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
        name: localStorage.getItem('name'),
        level: localStorage.getItem('level')
      }
    },
    methods:{

    }
};
</script>
<style scoped>
  .app-container{
    width: 100%;
    height: calc(100vh - 400px);
    display: flex;
    justify-content: center;
    align-items: center;
    font-size:20px
  }
</style>
