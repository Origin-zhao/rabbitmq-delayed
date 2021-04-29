FROM rabbitmq:3.8.9-management-alpine
MAINTAINER  joyuan
#ENV TZ=Asia/Shanghai
RUN apk add -U tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --update curl && rm -rf /var/cache/apk/*
RUN curl -L https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.8.9/rabbitmq_delayed_message_exchange-3.8.9-0199d11c.ez > $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.8.9-0199d11c.ez
RUN chown rabbitmq:rabbitmq $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.8.9-0199d11c.ez
RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange
#RUN rabbitmq-plugins enable --offline rabbitmq_consistent_hash_exchange
