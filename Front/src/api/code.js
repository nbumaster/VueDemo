import request from '@/utils/request'

export default {
  addCode(data) {
    return request({
      url: '/Api/codeManage/',
      method: 'post',
      data
    })
  },
  getCode(data){
    return request({
      url: '/Api/codeManage/',
      method: 'get',
      params: { data }
    })
  },
  getParentCode(data){
    return request({
      url: '/Api/codeManage/',
      method: 'get',
      params: { data }
    })
  },

  delCode(data){
    return request({
      url: '/Api/codeManage/',
      method: 'delete',
      data
    })
  }
}
