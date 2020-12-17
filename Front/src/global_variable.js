//服务端URL拼接。例如：222.96.98.12:8000  (调取服务端的静态资源使用)
const serverHost =   'http://' + location.hostname + ':8000'
const wsHost = 'ws://' + location.hostname + ':8000'

//前端页面地址。例如:  222.96.98.12:8080
const pageHost = 'http://' + location.host

export default {
  serverHost,
  pageHost,
  wsHost
}
