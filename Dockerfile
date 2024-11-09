# 步骤 1：构建 Vue 项目
FROM node:16 AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build

# 步骤 2：使用 NGINX 服务器
FROM nginx:latest
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
