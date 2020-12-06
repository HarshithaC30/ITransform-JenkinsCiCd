FROM openjdk:8
//ARG JAR_FILE=target/my-app-1.0-SNAPSHOT.jar
//WORKDIR /opt/app
//COPY ${JAR_FILE} /my-app-1.0-SNAPSHOT.jar 
//ENTRYPOINT ["java","-jar","my-app-1.0-SNAPSHOT.jar.jar"]

HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1
            
EXPOSE 8000
