# 使用 Node.js 18 版本的官方镜像作为基础镜像
FROM node:20-alpine AS base

# 设置工作目录为 /data
WORKDIR /app

# 复制当前目录下的所有文件到容器的 /data 目录中
COPY . /app

# 创建 logs 目录
RUN mkdir -p app/logs

# 全局安装 pnpm
RUN npm install -g pnpm

# 安装pm2
RUN pnpm install -g pm2

# 使用 pnpm 安装项目依赖
RUN pnpm install

# 运行项目构建命令
# RUN pnpm run build
