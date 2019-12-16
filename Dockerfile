FROM ubuntu
#FROM openjdk:8

MAINTAINER RoiArthurB <https://github.com/RoiArthurB>

# Update Ubuntu mirror && install needed software
RUN apt update && apt install -y \
	wget \
	zip

# Create GAMA workspace
RUN mkdir -p /usr/local/gama \
	&& cd /usr/local/gama

# Install GAMA v1.8.0
RUN curl -SL https://github.com/gama-platform/gama/releases/download/v1.8.0/GAMA_1.8_Linux_with_JDK.zip \
	| unzip GAMA_1.8_Linux_with_JDK.zip \
	&& rm GAMA_1.8_Linux_with_JDK.zip

# fix GAMA JDK
RUN sed -i 's/java\ /\.\.\/jdk\/bin\/java\ /g' ./headless/gama-headless.sh


# Create command symlink
RUN chmod +x ./Gama ./headless/gama-headless.sh
RUN ln -s ./Gama /usr/bin/gama
RUN ln -s ./headless/gama-headless.sh /usr/sbin/gama-headless

# Docker env
WORKDIR ./headless

ENTRYPOINT ["bash", "./gama-headless.sh"]
CMD ["-help"]
