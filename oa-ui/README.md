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