import request from '@/utils/request'

export default {
  add(data) {
    return request({
      url: '/Api/auth/',
      method: 'post',
      data
    })
  },
  getData(data){
    return request({
      url: '/Api/auth/',
      method: 'get',
      params: { data }
    })
  },
  //删除权限
  delete(data){
    return request({
      url: '/Api/auth/',
      method: 'delete',
      data
    })
  },

}
