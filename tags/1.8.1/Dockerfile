FROM ubuntu:latest

MAINTAINER RoiArthurB <https://github.com/RoiArthurB>

LABEL org.label-schema.name="GAMA Headless Docker (1.8.1)" \
		org.label-schema.description="Docker image of GAMA headless" \
		org.label-schema.url="http://gama-platform.org" \
		org.label-schema.vcs-ref=$VCS_REF \
		org.label-schema.vcs-url="https://github.com/gama-platform/gama.docker" \
		org.label-schema.vendor="GAMA Platform" \
		org.label-schema.license="GPL-3.0" 

# Update Ubuntu mirror && install needed software
RUN apt update && \
	apt install -y --no-install-recommends curl ca-certificates unzip

# Create GAMA workspace
RUN mkdir -p /usr/lib/gama 
RUN cd /usr/lib/gama

# Install GAMA v1.8.0
RUN curl -o gama.zip -fSL https://github.com/gama-platform/gama/releases/download/1.8.1/GAMA_1.8.1_Linux.zip && \
	unzip gama.zip -d /usr/lib/gama

# Make script executable
RUN chmod +x /usr/lib/gama/Gama /usr/lib/gama/headless/gama-headless.sh

# Release image
FROM openjdk:8-jre-alpine
COPY --from=0 /usr/lib/gama /usr/lib/gama

RUN apk add bash

# Test if headless is running well
RUN java -version && /usr/lib/gama/headless/gama-headless.sh -help

# Docker env
WORKDIR /usr/lib/gama/headless

ENTRYPOINT ["/usr/lib/gama/headless/gama-headless.sh"]
CMD ["-help"]
