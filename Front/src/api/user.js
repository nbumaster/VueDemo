import request from '@/utils/request'

export function login(data) {
  return request({
    url: '/Api/login/',
    method: 'post',
    data
  })
}

export function getInfo(token) {
  return request({
    url: '/Api/userinfo/',
    method: 'get',
    params: { token }
  })
}

export function logout() {
  return request({
    url: '/Api/logout/',
    method: 'post'
  })
}
