<template>
  <div class="page-content">
    公告区组件
  </div>
</template>

<script>
export default {
  name: 'HomePage',
  data(){
    return {

    }
  },
  mounted() {
    this.logout()
  },
  methods:{
    async logout() {
      await this.$store.dispatch('user/logout')
      localStorage.clear()
      this.$router.push(`/login?redirect=dashboard`)
    }
  }
}
</script>

<style scoped>

</style>
