# -*- coding:utf-8 -*-

from django.conf.urls import url
from web import api
from django.views.generic import TemplateView
from django.views.generic.base import RedirectView

# handler403 = permission_denied
# handler404 = page_not_found
# handler500 = page_error

urlpatterns = [

    #Api接口URL配置
    #登录
    url(r'^Api/login/$', api.login.as_view()),

    # 获取用户信息
    url(r'^Api/userinfo/$', api.userInfo.as_view()),

    # 用户信息管理
    url(r'^Api/member/$', api.memberManage.as_view()),

    # 退出
    url(r'^Api/logout/$', api.logout.as_view()),

]
