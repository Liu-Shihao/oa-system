## 笔记
项目启动后进入登录/登录页面:在view目录下的login.Vue register.Vue页面，都是同一个页面样式
用户注册需要短信验证码进行验证，但是发送短信验证码需要校验图片验证码，防止短信轰炸
接口调用的方法在api目录下的login.js

用户点击登录后，会调用store的Login action
然后页面会请求getInfo
## 开发

```bash

# 进入项目目录
cd oa-ui

# 安装依赖
npm install

npm install --registry=https://registry.npmmirror.com

# 启动服务
export NODE_OPTIONS=--openssl-legacy-provider

npm run dev
```

浏览器访问 http://localhost:80

## 发布

```bash
# 构建测试环境
npm run build:stage

# 构建生产环境
npm run build:prod
```