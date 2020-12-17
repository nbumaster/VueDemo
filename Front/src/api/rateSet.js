import request from '@/utils/request'

export default {
  rateGet(data){
    return request({
      url: '/Api/rateSet/',
      method: 'get',
      params: { data }
    })
  },
  rateSet(data){
    return request({
      url: '/Api/rateSet/',
      method: 'put',
      data
    })
  },
  rateDefaultGet(data){
    return request({
      url: '/Api/rateDefaultGet/',
      method: 'get',
      params: { data }
    })
  },
}
