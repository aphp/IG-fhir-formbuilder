FROM nginx:stable-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
## Copy default nginx config
COPY ./nginx/default.conf /etc/nginx/nginx.conf
## Copy the output folder to default nginx public folder
COPY output /usr/share/nginx/html

RUN chown -R appuser:appgroup /usr/share/nginx/html

WORKDIR /app
USER appuser
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

