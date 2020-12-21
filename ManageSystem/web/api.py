# -*- coding:utf-8 -*-
from django.db.models import Q
from django.http import JsonResponse
from web.models import *
from django.views.generic import View
import json

def getPageRecord(items, pageNo, pageSize):
    startRecord = (pageNo - 1) * pageSize + 1
    endRecord = pageNo * pageSize
    return list(items[startRecord - 1: endRecord])

def login_auth(func):
    def inner(request,*args,**kwargs):
        v = request.session.get("level")
        print(v)
        ret = {
            'code': 403000,
            'message': '没有访问权限'
        }
        if v=='' or v == None :
            print(u'没有登录！', v)
            return JsonResponse(ret)
        elif v != 0:
            print(u'没有访问权限！', v)
            return JsonResponse(ret)
        else:
            print(u'可以访问！')
        return func(request,*args,**kwargs)
    return inner

class login(View):

    def formatAuths(self, items):
        menuList = []

        for i in items:
            auth = Auths.objects.filter(id=i['authosKey_id'])
            for j in auth:

                if j.auth_type == 1 and j.parent_id==None:
                    menuModel = {
                        'path': j.req_url,
                        'name': j.name,
                        'icon': j.icon,
                        'children': []
                    }
                    menuList.append(menuModel)
                else:
                    subMenu = Auths.objects.filter(parent_id=j.id)
                    if subMenu:
                        menuModel = {
                            'path': j.req_url,
                            'name': j.name,
                            'icon': j.icon,
                            'children': []
                        }
                        for k in subMenu:
                            menuModel['children'].append(
                                {'path': k.req_url,
                                 'name': k.name,
                                 'icon': k.icon
                                 }
                            )
                        menuList.append(menuModel)

        return menuList

    def post(self, request):
        try:
            data = json.loads(request.body)
            username = data['username']
            password = data['password']
            item = Member.objects.filter(username=username, password=password)
            #print(item)
            if item.count() > 0:
                request.session['username'] = username
                request.session['user_id'] = item[0].id
                userInfo = {
                    'id': item[0].id,
                    'username': username,
                    'name': item[0].name,
                }
                # 查询返回该用户的权限项，然后格式化路由表数据返回给前端
                authItems = RolesToAuthos.objects.filter(rolesKey__member__username=username).values()
                print(authItems)
                return_items = self.formatAuths(list(authItems))
                print(return_items)
                json_info = {"code": 20000, "data": {"token": "admin-token", 'userInfo':userInfo, 'authItems':return_items}}
            else:
                json_info = {"code": 40000,'message':'用户名或密码错误！'}
        except Exception as e:
            json_info = {"code": 40000,'message':str(e)}

        return JsonResponse(json_info)

class adminManage(View):
    def json_info(self, message, code, add_data=[], total=0, extra=''):
        json_data = {'message': message, 'code': code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            req_data = request.GET.get('data')
            data = json.loads(req_data)
            username = data.get('username')
            name = data.get('name')
            items = Member.objects.values('id','username','name','info_datetime','password').order_by('-id')

            if username:
                items = items.filter(username__icontains=username)

            if name:
                items = items.filter(name__icontains=name)

            return_items = getPageRecord(items, data['pageNo'], data['pageSize'])  # 分页数据处理

            json_info = self.json_info(message='查询成功！', code=20000, add_data=return_items, total=items.count())
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

    def post(self, request):
        try:
            data = json.loads(request.body)
            id = data.get('id')
            username = data.get('username')
            password = data.get('password')
            name = data.get('name')

            if id:
                Member.objects.filter(id=id).update(username=username, password=password, name=name)
            else:
                item = Member.objects.create(username=username, password=password, name=name)

            json_info = self.json_info(message='保存成功！', code=20000)
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

    def delete(self, request):
        try:
            data = json.loads(request.body)
            id = data.get('id')
            Member.objects.filter(id=id).delete()
            json_info = self.json_info(message='删除成功！', code=20000)
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

class userinfo(View):

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

        return JsonResponse(json_info)

class logout(View):
    def post(self, request):
        request.session.flush()
        try:
            json_info = {"code": 20000, "data": {}}
        except:
            json_info = {"code": 40000, "data": {}}

        return JsonResponse(json_info)

class member(View):
    def json_info(self, message, code, add_data=[], total=0, extra=''):
        json_data = {
            'message': message,
            'code': code,
            'data': {
                "items": add_data,
                'total': total,
                'extra': extra
            }
        }
        return json_data

    def get(self, request):
        try:
            data = json.loads(request.GET.get('data'))
            items = Member.objects.values('id','username','name','password').order_by("-id")
            for i in items:
                i['roles'] = []
                print(i['id'])
                roles_items = Roles.objects.filter(id=i['id']).values()
                i['roles'] = list(roles_items)

            return_items = getPageRecord(items, data['pageNo'], data['pageSize'])  # 分页数据处理

            json_info = self.json_info(message='获取数据成功！', code=20000, add_data=return_items, total=items.count())
        except Exception as e:
            print(f"member -> get 报错：{str(e)}")
            json_info = self.json_info(message=str(e), code=40000, add_data=[], total=0)

        return JsonResponse(json_info)

    def put(self, request):
        try:
            data = json.loads(request.body)
            new_password = data.get('new_password')
            old_password = data.get('old_password')
            item = Member.objects.filter(id=request.session['user_id'], password=old_password)
            if item.count() == 0:
                raise Exception("旧密码输入错误，请重新输入!")

            if new_password:
                Member.objects.filter(id=request.session['user_id']).update(password=new_password)
            else:
                raise Exception("处理异常，请联系管理员!")
            json_info = self.json_info(message='修改密码成功！', code=20000)
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000, add_data=[], total=0)

        return JsonResponse(json_info)

    def post(self, request):
        try:
            data = json.loads(request.body)
            id = data.get('id')
            state = data.get('state')
            Member.objects.filter(id=id).update(state=state)
            json_info = self.json_info(message='操作成功！', code=20000)
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000, add_data=[], total=0)

        return JsonResponse(json_info)

    def delete(self, request):
        try:
            data = json.loads(request.body)
            id = data.get('id')
            Member.objects.filter(id=id).delete()
            json_info = self.json_info(message='操作成功！', code=20000)
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000, add_data=[], total=0)

        return JsonResponse(json_info)

class auth(View):
    def json_info(self, message, code, add_data=[], total=0, extra=''):
        json_data = {'message': message, 'code': code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            req_data = request.GET.get('data')
            parms = ('id','auth_type','name','auth_flag','req_url','content','parent__name','parent_id','component','icon')
            items = Auths.objects.values(*parms).order_by("-id")
            if req_data:
                data = json.loads(req_data)
                return_items = getPageRecord(items, data['pageNo'], data['pageSize'])  # 分页数据处理
            else:
                return_items = list(items)    #没有传递分页时，获取全部数据

            json_info = self.json_info(message='ok', code=20000, add_data=return_items, total=items.count())
        except Exception as e:
            print(str(e))
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

    def post(self, request):
        try:
            data = json.loads(request.body)
            id = data.get('id')
            formData = {
                'name': data.get('name'),
                'parent_id': data.get('parent_id'),
                'auth_type': data.get('auth_type'),
                'req_url': data.get('req_url'),
                'auth_flag': data.get('auth_flag'),
                'content': data.get('content'),
                'component': data.get('component'),
                'icon': data.get('icon')
            }
            if id:
                Auths.objects.filter(id=id).update(**formData)
            else:
                Auths.objects.create(**formData)

            json_info = self.json_info(message='保存权限成功', code=20000)
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

class rolesManage(View):
    def json_info(self, message, code, add_data=[], total=0, extra=''):
        json_data = {'message': message, 'code': code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def post(self, request):
        try:
            data = json.loads(request.body)
            id = data.get('id')
            authTree = data.get('authTree')
            formData = {
                'name': data.get('name'),
                'content': data.get('content'),
            }

            if id:
                Roles.objects.filter(id=id).update(**formData)
                RolesToAuthos.objects.filter(rolesKey_id=id).delete()
                for i in authTree:
                    RolesToAuthos.objects.create(rolesKey_id=id, authosKey_id=i)
            else:
                Roles.objects.create(**formData)
                for i in authTree:
                    RolesToAuthos.objects.create(rolesKey_id=id, authosKey_id=i)

            json_info = self.json_info(message='保存成功！', code=20000)
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

    def get(self, request):
        try:
            req_data = request.GET.get('data')
            data = json.loads(req_data)
            items = Roles.objects.values().order_by('id')

            if data.get('keyword'):
                keyword = data.get('keyword').strip()
                items = items.filter(name__icontains=keyword)

            return_items = getPageRecord(items, data['pageNo'], data['pageSize'])  # 分页数据处理

            json_info = self.json_info(message='查询成功！', code=20000, add_data=return_items, total=items.count())
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

    def delete(self, request):
        try:
            data = json.loads(request.body)
            id = data.get('id')
            print(id)
            Roles.objects.filter(id=id).delete()

            json_info = self.json_info(message='删除成功！', code=20000)
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

class getAuthList(View):
    def json_info(self, message, code, add_data=[], total=0, extra=''):
        json_data = {'message': message, 'code': code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            req_data = request.GET.get('data')
            data = json.loads(req_data)
            id = data.get('id')
            items = RolesToAuthos.objects.filter(rolesKey_id=id).values('authosKey_id')
            return_items = list(items)
            json_info = self.json_info(message='查询成功！', code=20000, add_data=return_items, total=items.count())
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

class getAuthsTree(View):
    def json_info(self, message, code, add_data=[], total=0, extra=''):
        json_data = {'message': message, 'code': code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            items = Auths.objects.values('id','name','auth_type').filter(parent_id=None)
            for i in items:
                if i['auth_type'] == 0:
                    subItems = Auths.objects.filter(parent_id=i['id']).values('id','name')
                    i['children'] = list(subItems)
            return_items = list(items)
            json_info = self.json_info(message='查询成功！', code=20000, add_data=return_items, total=items.count())
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

class demoDataManage(View):
    def json_info(self, message, code, add_data=[], total=0, extra=''):
        json_data = {'message': message, 'code': code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            req_data = request.GET.get('data')
            data = json.loads(req_data)
            keyword = data.get('keyword')
            items = DemoData.objects.values().order_by('-id')

            if keyword:
                items = items.filter(Q(c1__icontains=keyword) | Q(c2__icontains=keyword))

            responseItems = getPageRecord(items, data['pageNo'], data['pageSize'])  # 分页数据处理

            json_info = self.json_info(message='查询成功！', code=20000, add_data=responseItems, total=items.count())
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

    def post(self, request):
        try:
            data = json.loads(request.body)
            id = data.get('id')
            formData = {
                'c1': data.get('c1'),
                'c2': data.get('c2'),
                'c3': data.get('c3'),
                'c4': data.get('c4'),
                'c5': data.get('c5'),
                'c6': data.get('c6'),
                'c7': data.get('c7'),
                'c8': data.get('c8'),
                'c9': data.get('c9')
            }

            if id:
                DemoData.objects.filter(id=id).update(**formData)
            else:
                DemoData.objects.create(**formData)

            json_info = self.json_info(message='保存成功！', code=20000)
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

    def delete(self, request):
        try:
            data = json.loads(request.body)
            id = data.get('id')
            DemoData.objects.filter(id=id).delete()
            json_info = self.json_info(message='删除成功！', code=20000)
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)

class saveRecord(View):
    def json_info(self, message, code, add_data=[], total=0, extra=''):
        json_data = {'message': message, 'code': code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def post(self, request):
        try:
            data = json.loads(request.body)
            id = data.get('id')
            recordInfo = data.get('recordInfo')
            ExcuteRecord.objects.create(data=recordInfo) #保存执行日志
            DemoData.objects.filter(id=id).update(state=2)  #更新数据状态为“执行成功”

            json_info = self.json_info(message='保存日志成功！', code=20000)
        except Exception as e:
            json_info = self.json_info(message=str(e), code=40000)

        return JsonResponse(json_info)