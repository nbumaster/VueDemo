import request from '@/utils/request'

export default {
  //获取列表数
  getList(data) {
    return request({
      url: '/Api/cashInManage/',
      method: 'get',
      params: { data }
    })
  },

	//删除入金记录
	deleteCashIn(data){
		return request({
		  url: '/Api/cash_delete/',
		  method: 'post',
      data
		})
	}
}
