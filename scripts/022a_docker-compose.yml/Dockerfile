# https://docs.docker.com/engine/reference/builder/
# https://docs.docker.com/build/building/multi-stage/

FROM maven:3.8.5-openjdk-17 AS create
RUN java -version && mvn --version
RUN mkdir /app 
RUN cd /app && mvn org.apache.maven.plugins:maven-archetype-plugin:3.1.2:generate -DarchetypeArtifactId="maven-archetype-webapp" -DarchetypeGroupId="org.apache.maven.archetypes" -DarchetypeVersion="1.4" -DgroupId="com.example" -DartifactId="demo" -Dversion=1.0-SNAPSHOT -DinteractiveMode=false -e -X
RUN cd /app/demo && mvn package -e -X
