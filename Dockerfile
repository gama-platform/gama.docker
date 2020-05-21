FROM ubuntu:bionic

MAINTAINER RoiArthurB <https://github.com/RoiArthurB>

LABEL org.label-schema.name="GAMA Headless Docker" \
		org.label-schema.description="Docker image of GAMA headless" \
		org.label-schema.url="http://gama-platform.org" \
		org.label-schema.vcs-ref=$VCS_REF \
		org.label-schema.vcs-url="https://github.com/gama-platform/gama.docker" \
		org.label-schema.vendor="GAMA Platform" \
		org.label-schema.license="GPL-3.0" 

# Update Ubuntu mirror && install needed software
RUN apt update && \
	apt install -y --no-install-recommends curl ca-certificates unzip && \
	# Keep layer as small as possible
        rm -rf /var/lib/apt/lists/*

# Create GAMA workspace
RUN mkdir -p /usr/lib/gama 
RUN cd /usr/lib/gama

# Download the last continuous build from 
RUN curl -o gama.zip -fSL $(curl -s https://api.github.com/repos/gama-platform/gama/releases/tags/continuous | grep  continuous/GAMA1.8_Continuous_withJDK_Linux | cut -d : -f 2,3 | tr -d \") && \
	unzip gama.zip -d /usr/lib/gama && \
	rm gama.zip


# Create command symlink
RUN chmod +x /usr/lib/gama/Gama /usr/lib/gama/headless/gama-headless.sh && \
	ln -s /usr/lib/gama/Gama /usr/bin/gama && \
	ln -s /usr/lib/gama/headless/gama-headless.sh /usr/sbin/gama-headless

# Docker env
WORKDIR /usr/lib/gama/headless

ENTRYPOINT ["gama-headless"]
CMD ["-help"]
