import request from '@/utils/request'

export default {
  addDemoData(data) {
    return request({
      url: '/Api/demoDataManage/',
      method: 'post',
      data
    })
  },
  getDemoData(data){
    return request({
      url: '/Api/demoDataManage/',
      method: 'get',
      params: { data }
    })
  },
  delDemoData(data){
    return request({
      url: '/Api/demoDataManage/',
      method: 'delete',
      data
    })
  },
  saveRecord(data){
    return request({
      url: '/Api/saveRecord/',
      method: 'post',
      data
    })
  }
}
