# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models

class Member(models.Model):     #帐号信息表
    username = models.CharField(max_length=100, null=True)  #用户名
    password = models.CharField(max_length=100, null=True)  #密码
    name = models.CharField(max_length=50, null=True)   #姓名
    rolesKey = models.ForeignKey('Roles', null=True, on_delete=models.CASCADE)  # 关联角色ID
    info_datetime = models.DateTimeField(auto_now=True) #日期
    def __unicode__(self):
        return self.username

class Roles(models.Model):  # 角色信息表
  name = models.CharField(max_length=50, null=True)  # 角色名称 （例：一级代理、二级代理、普通管理员）
  content = models.CharField(max_length=200, null=True)  # 角色描述
  def __unicode__(self):
    return self.name

class RolesToAuthos(models.Model):  # 角色与权限多对多关系表
  rolesKey = models.ForeignKey('Roles', null=True, on_delete=models.CASCADE)  # 关联角色ID
  authosKey = models.ForeignKey('Auths', null=True, on_delete=models.CASCADE)  # 关联权限ID
  def __unicode__(self):
    return self.rolesKey

class Auths(models.Model):  # 权限菜单信息表
  auth_type = models.IntegerField(default=0)  # 类型  0: 目录   1：菜单   2：按钮
  name = models.CharField(max_length=50, null=True)  # 名称
  auth_flag = models.CharField(max_length=50, null=True)  # 权限标识
  req_url = models.CharField(max_length=250, null=True)  # 请求地址
  content = models.CharField(max_length=300, null=True)  # 备注说明
  parent = models.ForeignKey('Auths', null=True, on_delete=models.CASCADE)  # 父级目录
  component = models.CharField(max_length=50, null=True)  # 组件地址 例如：@/views/rateManage/label
  icon = models.CharField(max_length=50, null=True)  # icon图标名称
  def __unicode__(self):
    return self.name

class DemoData(models.Model):   #演示数据表
    c1 = models.CharField(max_length=50, null=True) #演示数据列
    c2 = models.CharField(max_length=50, null=True)
    c3 = models.CharField(max_length=50, null=True)
    c4 = models.CharField(max_length=50, null=True)
    c5 = models.CharField(max_length=50, null=True)
    c6 = models.CharField(max_length=50, null=True)
    c7 = models.CharField(max_length=50, null=True)
    c8 = models.CharField(max_length=50, null=True)
    c9 = models.CharField(max_length=50, null=True)
    state = models.IntegerField(default=0)  #状态    0：未执行    1：执行中   2：执行成功  3：执行失败
    def __unicode__(self):
        return self.c1

class ExcuteRecord(models.Model):   #执行命令日志记录表
    data = models.TextField(null=True)   #执行结果内容
    endDateTime = models.DateTimeField(auto_now=True, null=True)    #执行结束时间
    def __unicode__(self):
        return self.data