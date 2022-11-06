# https://docs.docker.com/engine/reference/builder/
# https://docs.docker.com/build/building/multi-stage/

# usando um arquetipo padrao maven
#FROM maven:3.8.5-openjdk-17 AS create
#RUN java -version && mvn --version
#RUN mkdir /app 
#RUN cd /app && mvn org.apache.maven.plugins:maven-archetype-plugin:3.1.2:generate -DarchetypeArtifactId="maven-archetype-webapp" -DarchetypeGroupId="org.apache.maven.archetypes" -DarchetypeVersion="1.4" -DgroupId="com.example" -DartifactId="demo" -Dversion=1.0-SNAPSHOT -DinteractiveMode=false -e -X

FROM oraclelinux:8.5 AS common
RUN dnf update -y
RUN dnf install -y zip wget

# usando o Spring Initializr
FROM common AS create
RUN mkdir /app && cd /app && curl -G https://start.spring.io/starter.zip -d dependencies=web -d packaging=war -d javaVersion=17 -d type=maven-project -o demo.zip
RUN cd /app && unzip demo.zip && rm -f demo.zip
RUN sed -i '/<artifactId>spring-boot-starter-web<\/artifactId>/a <exclusions><exclusion><artifactId>logback-classic</artifactId><groupId>ch.qos.logback</groupId></exclusion><exclusion><artifactId>log4j-to-slf4j</artifactId><groupId>org.apache.logging.log4j</groupId></exclusion><exclusion><artifactId>spring-boot-starter-logging</artifactId><groupId>org.springframework.boot</groupId></exclusion></exclusions>' /app/pom.xml
RUN sed -i '/<dependencies>/a <dependency><groupId>org.springframework.boot</groupId><artifactId>spring-boot-starter-thymeleaf</artifactId> <exclusions><exclusion><artifactId>logback-classic</artifactId><groupId>ch.qos.logback</groupId></exclusion><exclusion><artifactId>log4j-to-slf4j</artifactId><groupId>org.apache.logging.log4j</groupId></exclusion><exclusion><artifactId>spring-boot-starter-logging</artifactId><groupId>org.springframework.boot</groupId></exclusion></exclusions></dependency>' /app/pom.xml
RUN echo 'package com.example.demo; import org.springframework.stereotype.Controller; import org.springframework.beans.factory.annotation.Value; import org.springframework.web.bind.annotation.GetMapping; import org.springframework.ui.Model; @Controller public class SimpleController { @Value("${spring.application.name}") String appName; @GetMapping("/") public String homePage(Model model) { model.addAttribute("appName", appName); return "home"; } }' >  /app/src/main/java/com/example/demo/SimpleController.java
RUN echo '<html> <head><title>Home Page</title></head> <body> <h1>Hello !</h1> <p>Welcome to <span th:text="${appName}">Our App</span></p> </body> </html>' > /app/src/main/resources/templates/home.html 
RUN echo -e "spring.thymeleaf.cache=false\nspring.thymeleaf.enabled=true\nspring.thymeleaf.prefix=classpath:/templates/\nspring.thymeleaf.suffix=.html\nspring.application.name=Bootstrap Spring Boot" > /app/src/main/resources/application.properties

FROM maven:3.8.5-openjdk-17 AS build
COPY --from=create /app /app
RUN cd /app && mvn package -e -X

FROM common AS server
RUN mkdir /app && cd /app && wget https://github.com/wildfly/wildfly/releases/download/26.1.2.Final/wildfly-26.1.2.Final.zip && unzip wildfly-26.1.2.Final.zip && rm -f wildfly-26.1.2.Final.zip

FROM openjdk:17.0-jdk-oraclelinux8 AS deploy
COPY --from=server /app /app
COPY --from=build  /app/target/demo-0.0.1-SNAPSHOT.war /app/wildfly-26.1.2.Final/standalone/deployments/demo.war
ENTRYPOINT /app/wildfly-26.1.2.Final/bin/standalone.sh -b 0.0.0.0
EXPOSE 8080
