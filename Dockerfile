FROM openjdk:11
COPY ./example /usr/src/myapp
WORKDIR /usr/src/myapp
EXPOSE 6789
RUN javac src/WebServer.java
CMD ["java", "src/WebServer"]
