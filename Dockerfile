# Epochfall demo, browser build, served by nginx. Coolify: build pack "Dockerfile", port 80.
FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY site/ /usr/share/nginx/html/
EXPOSE 80
