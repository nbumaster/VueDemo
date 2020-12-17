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

  // modifyPassword(data){
  //   return request({
  //     url: '/Api/member/',
  //     method: 'put',
  //     data
  //   })
  // },
}
