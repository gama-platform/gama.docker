FROM ubuntu:latest

MAINTAINER RoiArthurB <https://github.com/RoiArthurB>

LABEL org.label-schema.name="GAMA Headless Docker (1.8.2)" \
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
RUN curl -o gama.zip -fSL $(curl -s https://api.github.com/repos/gama-platform/gama/releases/tags/1.8.2 | grep "1.8.2/GAMA.*withJDK.*Linux.*.zip" | cut -d ':' -f 2,3 | tr -d \") && \
	unzip gama.zip -d /usr/lib/gama

# Set absolute path
RUN sed -i 's/$( dirname "${BASH_SOURCE\[0\]}" )/\/usr\/lib\/gama\/headless/g' /usr/lib/gama/headless/gama-headless.sh

# Make script executable
RUN chmod +x /usr/lib/gama/Gama /usr/lib/gama/headless/gama-headless.sh

# Release image 
FROM alpine:3.13
COPY --from=0 /usr/lib/gama /usr/lib/gama

RUN apk --no-cache add openjdk11-jdk bash ttf-dejavu \
	&& java -version \
	&& ln -s /usr/lib/gama/headless/gama-headless.sh /usr/sbin/gama-headless

# Docker env
WORKDIR /usr/lib/gama/headless

ENTRYPOINT ["gama-headless"]
CMD ["-help"]
