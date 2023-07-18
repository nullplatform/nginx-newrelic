FROM nginx:1.24.0-bullseye

RUN apt-get update
RUN apt-get install gpg systemctl -y
RUN echo "license_key: 65f4621637ad374c6abe3fe41d646e89b1d3NRAL" | tee -a /etc/newrelic-infra.yml
RUN curl -fsSL https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/newrelic-infra.gpg
RUN echo "deb https://download.newrelic.com/infrastructure_agent/linux/apt bullseye main" | tee -a /etc/apt/sources.list.d/newrelic-infra.list
RUN apt-get update
RUN apt-get install nri-nginx -y
COPY ./nginx-config.yml /etc/newrelic-infra/integrations.d/nginx-config.yml

WORKDIR /app
ADD ./config /app/config
ADD ./entrypoint.sh /app/entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
