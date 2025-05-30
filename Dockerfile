# Используем Java-образ как базу
FROM openjdk:17-jdk-slim

# Указываем арг, который можно будет передать при билде (необязательно)
ARG JAR_FILE=target/my-app-1.0-SNAPSHOT.jar

# Копируем jar-файл в контейнер
COPY ${JAR_FILE} my-app-1.0-SNAPSHOT.jar

# Команда запуска приложения
ENTRYPOINT ["java", "-jar", "/my-app-1.0-SNAPSHOT.jar"]
