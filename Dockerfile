FROM nginx:1.15-alpine
WORKDIR /app
ADD ./config /app/config
ADD ./entrypoint.sh /app/entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]