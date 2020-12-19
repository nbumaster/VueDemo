import request from '@/utils/request'

export default {
  addAdmin(data) {
    return request({
      url: '/Api/member/',
      method: 'post',
      data
    })
  },
  getAdmin(data) {
    return request({
      url: '/Api/member/',
      method: 'get',
      params: { data }
    })
  },
  deleteAdmin(data) {
    return request({
      url: '/Api/member/',
      method: 'delete',
      data
    })
  },
  modifyPassword(data){
    return request({
      url: '/Api/member/',
      method: 'put',
      data
    })
  }
}
