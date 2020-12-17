import request from '@/utils/request'

export default {
  //获取列表数
  getList(data) {
    return request({
      url: '/Api/cashOutManage/',
      method: 'get',
      params: { data }
    })
  },
}
