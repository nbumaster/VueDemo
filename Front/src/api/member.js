import request from '@/utils/request'

export default {
  addAdmin(data) {
    return request({
      url: '/Api/adminManage/',
      method: 'post',
      data
    })
  },
  getAdmin(data) {
    return request({
      url: '/Api/adminManage/',
      method: 'get',
      params: { data }
    })
  },
  deleteAdmin(data) {
    return request({
      url: '/Api/adminManage/',
      method: 'delete',
      data
    })
  },

  getData(data){
    return request({
      url: '/Api/getSettlement/',
      method: 'get',
      params: { data }
    })
  },
  modifyPassword(data){
    return request({
      url: '/Api/member/',
      method: 'put',
      data
    })
  },
  changeState(data){
    return request({
      url: '/Api/member/',
      method: 'post',
      data
    })
  },
  deleteMember(data){
    return request({
      url: '/Api/member/',
      method: 'delete',
      data
    })
  },
  sendPassword(data){
    return request({
      url: '/Api/sendPassword/',
      method: 'post',
      data
    })
  },
  sendMemberInfo(data){
    return request({
      url: '/Api/sendMemberInfo/',
      method: 'post',
      data
    })
  }
}
