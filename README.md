本项目使用的是开源项目修改的，源项目地址https://github.com/sky22333/ansible-ui

# Ansible UI 离线部署指南

## 1. 概述
本部署包提供了 Ansible UI 的完整离线运行环境，基于 Docker 和 Docker Compose 构建。适用于无外网环境或需要快速交付的场景。

## 2. 包含文件
- `ansible-ui-image.tar`: Ansible UI 的 Docker 镜像包（包含前端和后端）。
- `docker-compose.yaml`: 容器编排配置文件。
- `install.sh`: 一键安装启动脚本（Linux环境）。

## 3. 环境要求
- 操作系统：Linux (CentOS 7+, Ubuntu 18.04+, Debian 10+ 等)
- Docker Engine: 19.03+
- Docker Compose: v2.0+ (建议使用 `docker compose` 插件)

## 4. 安装步骤

### 步骤 1: 上传部署包
将 `ansible-ui-deploy` 目录完整上传至目标服务器。

### 步骤 2: 执行安装脚本
进入目录并运行安装脚本：
```bash
cd ansible-ui-deploy
sh install.sh
```

**或者手动执行：**
如果不使用脚本，可以手动运行以下命令：
```bash
# 导入镜像
docker load -i ansible-ui-image.tar

# 启动服务
docker compose up -d
```

### 步骤 3: 验证部署
等待几秒钟服务启动后，在浏览器访问：
`http://服务器IP:5000`

**默认管理员账号：**
- 用户名：`admin123`
- 密码：`admin123`

*建议登录后尽快在 `docker-compose.yaml` 中修改密码并重启服务。*

## 5. 常见问题
- **端口冲突**：默认占用 `5000` 端口。如需修改，请编辑 `docker-compose.yaml` 文件中的端口映射（例如 `8080:5000`）。
- **权限问题**：如果提示 Docker 权限不足，请使用 `sudo` 或将用户加入 `docker` 组。

## 6. 数据及日志
- 数据库文件默认挂载在 `../db` 目录（相对于 docker-compose.yaml 的上级或配置路径）。
- 根据 `docker-compose.yaml` 的配置，建议确保持久化目录存在且有写入权限。

---
**技术支持**
如有问题，请联系系统管理员或查看容器日志：
`docker logs -f ansible-ui-app`
