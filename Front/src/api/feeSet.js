import request from '@/utils/request'

export default {
  setDeposit(data){
    return request({
      url: '/Api/setDeposit/',
      method: 'post',
      data
    })
  },
  setFee(data){
    return request({
      url: '/Api/setFee/',
      method: 'post',
      data
    })
  },

  //手续费模设置对应柜台帐号
  setSource(data){
    return request({
      url: '/Api/setSource/',
      method: 'post',
      data
    })
  },

  //设置手续费模板排序号
  setOrder(data){
    return request({
      url: '/Api/setOrder/',
      method: 'post',
      data
    })
  },

  //修改客户手机号码
  memberPhoneModify(data){
    return request({
      url: '/Api/memberPhoneModify/',
      method: 'post',
      data
    })
  }
}
