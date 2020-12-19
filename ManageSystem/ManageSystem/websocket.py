# -*- coding:utf-8 -*-
import subprocess, os, django, json
# os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ManageSystem.settings')
# django.setup()

async def websocket_application(scope, receive, send):
    while True:
        event = await receive()

        if event['type'] == 'websocket.connect':
            await send({
                'type': 'websocket.accept'
            })

        if event['type'] == 'websocket.disconnect':
            break

        #消息处理
        if event['type'] == 'websocket.receive':
            text = json.loads(event['text']).get('exe') #开始指令，如果下达'ping'则开始执行
            id = json.loads(event['text']).get('id')    #所执行的命令记录ID
            if text == 'ping':
                p = subprocess.Popen('ping www.baidu.com', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
                while True:
                    # 读取一行shell命令返回的信息
                    line = p.stdout.readline().decode('gbk')
                    #发送这一行信息到客户端
                    await send({
                        'type': 'websocket.send',
                        'text': line
                    })
                    #如果子进程正常结束，发送结束指令给客户端，并终止循环
                    if subprocess.Popen.poll(p) == 0:
                        await send({
                            'type': 'websocket.send',
                            'text': '命令执行完成<===>id=' + str(id)
                        })
                        break