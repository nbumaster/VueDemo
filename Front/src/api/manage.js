import request from '@/utils/request'

export default {
  //添加文档
  addDoc(data) {
    return request({
      url: '/Api/docManage/',
      method: 'post',
      data
    })
  },

  //获取文档列表/单项
  getDoc(data) {
    return request({
      url: '/Api/docManage/',
      method: 'get',
      params: { data }
    })
  },

  //删除一个文档
  delDoc(data) {
    return request({
      url: '/Api/docManage/',
      method: 'delete',
      data
    })
  }
}
