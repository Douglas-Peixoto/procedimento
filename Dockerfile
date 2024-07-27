# Etapa de construção
FROM maven:3.8.6-openjdk-8-slim AS build
WORKDIR /app
COPY . /app
RUN mvn package

# Etapa de execução com Tomcat
FROM tomcat:9.0-jdk8
COPY --from=build /app/target/Zitrus.war /usr/local/tomcat/webapps/Zitrus.war

# Porta exposta (ajuste conforme necessário)
EXPOSE 8080
