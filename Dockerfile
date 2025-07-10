FROM openjdk:17-jdk-slim
WORKDIR /app

COPY . .

RUN chmod +x ./gradlew
RUN ./gradlew bootjar

ENV JAR_PATH=/app/build/libs
RUN mv ${JAR_PATH}/*.jar /app/app.jar
#*.jar : /app/build/libs에 이름을 알필요 없음
#/app/build/libs에 jar 파일이 2개 이상이면 오류

ENTRYPOINT ["java", "-jar", "app.jar"]
