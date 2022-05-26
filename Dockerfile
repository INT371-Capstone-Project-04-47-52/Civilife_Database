FROM mysql:8.0.23 as mysql
COPY ./scriptCVL ./scriptCVL
ENV  MYSQL_ROOT_PASSWORD="rLE4UUzq$!=xZ4%v"
EXPOSE 3306