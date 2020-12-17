import request from '@/utils/request'

export default {
  add(data) {
    return request({
      url: '/Api/agentManage/',
      method: 'post',
      data
    })
  },
  agentMember(data){
    return request({
      url: '/Api/agentManage/',
      method: 'get',
      params: { data }
    })
  },
  getChannel(data){
    return request({
      url: '/Api/agentManage/',
      method: 'get',
      params: { data }
    })
  },
  //审核代理会员
  changeState(data){
    return request({
      url: '/Api/agentManage/',
      method: 'put',
      data
    })
  },
  getMemberInfo(data){
    return request({
      url: '/Api/getMemberInfo/',
      method: 'get',
      params: { data }
    })
  },

  //获取手续费模板数据
  getFeeModel(data){
    return request({
      url: '/Api/getFeeModel/',
      method: 'get',
      params: { data }
    })
  },

  //删除代理会员帐号
  deleteAgentMember(data){
    return request({
      url: '/Api/deleteAgentMember/',
      method: 'post',
      data
    })
  },

  //获取全部代理帐号（管理员调用）
  getAgentAll(data){
    return request({
      url: '/Api/agentAuthManage/',
      method: 'get',
      params: { data }
    })
  },

  //获取代理编号列表
  getAgentCode(data){
    return request({
      url: '/Api/getAgentCode/',
      method: 'get',
      params: { data }
    })
  },

  //获取新注册的代理帐号
  getNewAgentment(data){
    return request({
      url: '/Api/getNewAgentment/',
      method: 'get',
      params: { data }
    })
  },
  //更新阅读状态
  updateState(data){
    return request({
      url: '/Api/getNewAgentment/',
      method: 'put',
      data
    })
  }
}
