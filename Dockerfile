FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY hi.java .
RUN javac hi.java
CMD ["java", "hi"]