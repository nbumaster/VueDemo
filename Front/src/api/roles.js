import request from '@/utils/request'

export default {

  //添加角色
  add(data) {
    return request({
      url: '/Api/rolesManage/',
      method: 'post',
      data
    })
  },

  //获取角色列表信息
  getData(data){
    return request({
      url: '/Api/rolesManage/',
      method: 'get',
      params: { data }
    })
  },

  //删除角色
  delete(data){
    return request({
      url: '/Api/rolesManage/',
      method: 'delete',
      data
    })
  },

  //获取权限树
  getAuthsTree(data){
    return request({
      url: '/Api/getAuthsTree/',
      method: 'get',
      params: { data }
    })
  },

  //获取当前角色拥有权限
  getAuthList(data){
    return request({
      url: '/Api/getAuthList/',
      method: 'get',
      params: { data }
    })
  },

  //设置帐号角色
  setRoles(data){
    return request({
      url: '/Api/setRoles/',
      method: 'post',
      data
    })
  }
}
