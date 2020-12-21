# 说明文档

> 这是一个前后端分离项目演示版, 前端框架VUE + ElementUi。后端框架使用 Python3 Django，数据库版本采用Mysql5.7以上


## 前端开发环境

```bash

# 进入项目根目录
cd VueDemo

# 进入前端项目目录
cd Front

# 安装依赖
npm install

# 如果网络卡死或异常，可以通过淘宝镜像安装依赖
npm install --registry=https://registry.npm.taobao.org

# 启动前端服务
npm run dev
```

## Django后端服务启动

```bash
# 进入后端目录
cd ManageSystem

# 激活虚拟环境
venv\Scripts\activate.bat

#安装所需依赖包
pip install -r requirements.txt

# 以ASGI方式启动后端服务（只有用uvicorn启动才能使用websocket通讯）
uvicorn --host 0.0.0.0 ManageSystem.asgi:application

```

浏览器访问 [http://localhost:9528](http://localhost:9528)

## 前端发布生产环境

```bash
# 构建生产环境
npm run build:prod
```



Copyright (c) 2020 - by Robin.lau
