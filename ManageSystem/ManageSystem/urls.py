# -*- coding:utf-8 -*-
from django.conf.urls import url
from web import api

urlpatterns = [
    #Api权限管理配置相关
    url(r'^Api/login/$', api.login.as_view()),  #登录
    url(r'^Api/userinfo/$', api.userinfo.as_view()),    # 获取用户信息
    url(r'^Api/member/$', api.adminManage.as_view()),   # 用户信息管理
    url(r'^Api/logout/$', api.logout.as_view()),    # 退出
    url(r'^Api/rolesManage/$', api.rolesManage.as_view()),  #角色管理
    url(r'^Api/auth/$', api.auth.as_view()),    #权限管理
    url(r'^Api/getAuthList/$', api.getAuthList.as_view()),  #获取权限列表
    url(r'^Api/getAuthsTree/$', api.getAuthsTree.as_view()),  #生成权限树结构（赋权时勾选用）

    #数据处理Api接口，演示数据增删改查操作
    url(r'^Api/demoDataManage/$', api.demoDataManage.as_view()),  #演示数据处理
    url(r'^Api/saveRecord/$', api.saveRecord.as_view()),  #保存日志记录

]
