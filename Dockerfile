FROM ubuntu
#FROM openjdk:8

MAINTAINER RoiArthurB <https://github.com/RoiArthurB>

# Update Ubuntu
RUN apt update
RUN apt upgrade -y

# install needed software
RUN apt install wget zip -y

# install OpenJDK 8
#RUN apt install openjdk-8-jdk-headless -y

# Install GAMA v1.8.0
RUN wget https://github.com/gama-platform/gama/releases/download/v1.8.0/GAMA_1.8_Linux_with_JDK.zip
RUN unzip GAMA_1.8_Linux_with_JDK.zip

# Remove useless archive
RUN rm GAMA_1.8_Linux_with_JDK.zip

WORKDIR ./headless

ENTRYPOINT ["bash", "./gama-headless.sh"]
CMD ["-help"]
