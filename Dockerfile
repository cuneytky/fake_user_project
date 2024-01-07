FROM maven:3.6.3-jdk-11-openj9 as builder

WORKDIR usr/app
COPY pom.xml .
COPY src ./src
RUN mvn package -Dmaven.test.skip

FROM adoptopenjdk/openjdk11:jre

COPY --from=builder usr/app/target/fake-user-app-0.0.1-SNAPSHOT.jar /fake-user-app-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-jar", "fake-user-app-0.0.1-SNAPSHOT.jar"]

#FROM chef:latest
#
#RUN apt-get update && apt-get install -y cheese pepperoni mushrooms
#
#WORKDIR /pizza
#
#ENTRYPOINT ["make_pizza.sh"]
#CMD ["--topping", "cheese"]
#make_pizza.sh --topping cheese
##
##CMD can be overridden by the person creating the image
##
##ENTRYPOINT ["make_pizza.sh", "--topping", "pepperoni"]
##make_pizza.sh --topping pepperoni
##ENTRYPOINT can not be overridden
#
##CMD ["make_pizza.sh", "--topping", "pepperoni"]
##CMD ["make_pizza.sh", "--topping", "mushrooms"]
##CMD ["make_pizza.sh", "--topping", "cheese"]
#
#.sh
#sh -> shell
#Shell -> Is the software running the terminal commands in the behind scene.
#
#deploy_image.sh
#
#ADD filepathInHostOrInURL filepathInContainer
#EXPOSE
#ENV
#VOLUME
#
#ADD can copy files from host or URL
#ADD extracts .tar files automatically
#
#EXPOSE is for defining the port that will run the container
#
#ENV for createing environment variables
#ENV variableName=value
#Strin str = "Hello";
#print(str);        -->> Hello
#
#  ${user}
#
#ENV hostname=myHostName
#
#host.name=${hostname}
#
#VOLUME pathToStoreTheVolume
#
#
#
#