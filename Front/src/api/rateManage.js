import request from '@/utils/request'

export default {
  //指数名称添加
  add(data) {
    return request({
      url: '/Api/rateManage/',
      method: 'post',
      data
    })
  },
  //获取指数名称
  getData(data){
    return request({
      url: '/Api/rateManage/',
      method: 'get',
      params: { data }
    })
  },

  //删除指数名称
  deleteRate(data) {
    return request({
      url: '/Api/rateManage/',
      method: 'delete',
      data
    })
  },

  //获取手续费模板
  getModelData(data){
    return request({
      url: '/Api/rateModelManage/',
      method: 'get',
      params: { data }
    })
  },
  //保存手续费模板
  addModel(data) {
    return request({
      url: '/Api/rateModelManage/',
      method: 'post',
      data
    })
  },
  //删除手续费模板
  rateDeleteModel(data){
    return request({
      url: '/Api/rateModelManage/',
      method: 'delete',
      data
    })
  },


  //配置代理模板
  rateAgentModel(data){
    return request({
      url: '/Api/rateAgentModel/',
      method: 'post',
      data
    })
  },
  //获取当前代理的模板数据
  rateAgentModelList(data){
    return request({
      url: '/Api/rateAgentModel/',
      method: 'get',
      params: { data }
    })
  },

  //获取保证金列表数据
  getDeposit(data){
    return request({
      url: '/Api/depositManage/',
      method: 'get',
      params: { data }
    })
  },
  //保存保证金数据
  saveDeposit(data){
    return request({
      url: '/Api/depositManage/',
      method: 'post',
      data
    })
  },
  //删除保证金
  deleteDeposit(data){
    return request({
      url: '/Api/depositManage/',
      method: 'delete',
      data
    })
  },

}
