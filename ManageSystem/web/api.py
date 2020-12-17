# -*- coding:utf-8 -*-
from django.shortcuts import HttpResponse, redirect
from django.db.models import Q
from web.models import *
from web.jsonEncoder import *
from django.conf import settings
import datetime,random,json,math,decimal,time,os
from django.db.models import Avg, Sum, Count
from django.views.generic import View

def login_auth(func):
    def inner(request,*args,**kwargs):
        v = request.session.get("userType")
        if not v:
            print(u'没有登录！')
            #return HttpResponseRedirect("/home/#/login")
        elif request.session.get('userType') != '2':
            print(u'没有访问权限！')
            #return redirect("/home/#/login")
        else:
            print(u'可以访问！')
        return func(request,*args,**kwargs)
    return inner

class login(View):

    def post(self, request):
        try:
            data = json.loads(request.body)
            username = data['username']
            password = data['password']
            item = Member.objects.filter(username=username, password=password)
            if item.count() > 0:
                request.session['username'] = username
                request.session['user_id'] = item[0].id
                json_info = {"code": 20000, "data": {"token": "admin-token"}}
            else:
                json_info = {"code": 40000, "data": {}}
        except:
            json_info = {"code": 40000, "data": {}}

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class userInfo(View):

    def get(self, request):
        try:
            username = request.session['username']
            item = Member.objects.filter(username=username)
            if item.count() > 0:
                json_info = {"code": 20000, "data": {"token": "admin-token"}}
            else:
                json_info = {"code": 40000, "data": {}}
        except:
            json_info = {"code": 40000, "data": {}}

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class logout(View):

    def get(self, request):
        request.session.flush()
        try:
            json_info = {"code": 20000, "data": {}}
        except:
            json_info = {"code": 40000, "data": {}}

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class memberManage(View):
    def jsonResponse(self, message='', code='', add_data=[], total=0, extra=''):
        self.message = message
        self.code = code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'message': message, 'code': code, 'data': {"items": add_data, 'total': total}, 'extra': extra}
        return json_data

    def bugInfo(self):
        return self.jsonResponse(message='操作失败，请联系系统管理员！', code=40000)

    def get(self,request):
        try:
            items = Member.objects.all().values()
            jsonRes = self.jsonResponse(code=20000, add_data=list(items), total=items.count())
        except:
            jsonRes = self.bugInfo()

        return HttpResponse(json.dumps(jsonRes, cls=SupplementaryEncoder), content_type="application/json")

    def post(self, request):
        try:
            data = json.loads(request.body)
            username = data['username']
            password = data['password']
            name = data['name']
            item = Member.objects.filter(username=username)
            if item.count() > 0:
                jsonRes = self.jsonResponse(message='添加失败，用户名重复了！', code=40000)
            else:
                Member.objects.create(username=username, password=password, name=name)
                jsonRes = self.jsonResponse(message='操作成功！', code=20000)
        except:
            jsonRes = self.bugInfo()

        return HttpResponse(json.dumps(jsonRes, cls=SupplementaryEncoder), content_type="application/json")