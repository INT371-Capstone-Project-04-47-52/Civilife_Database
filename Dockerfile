FROM mysql:8.0.23 as mysql
COPY ./scriptCVL ./scriptCVL
ENV  MYSQL_ROOT_PASSWORD=cvl044752
EXPOSE 3306