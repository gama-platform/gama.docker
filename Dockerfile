FROM ubuntu:bionic

MAINTAINER RoiArthurB <https://github.com/RoiArthurB>

# Update Ubuntu mirror && install needed software
RUN apt update && \
	apt install -y --no-install-recommends wget ca-certificates unzip && \
	# Keep layer as small as possible
	apt autoremove -y && \
	apt autoclean -y

# Create GAMA workspace
RUN mkdir -p /usr/lib/gama 
RUN cd /usr/lib/gama

# Install GAMA v1.8.0
RUN wget https://github.com/gama-platform/gama/releases/download/v1.8.0/GAMA_1.8_Linux_with_JDK.zip && \
	unzip GAMA_1.8_Linux_with_JDK.zip -d /usr/lib/gama && \
	rm GAMA_1.8_Linux_with_JDK.zip && \

	# fix GAMA JDK path
	sed -i 's/java\ /\.\.\/jdk\/bin\/java\ /g' /usr/lib/gama/headless/gama-headless.sh


# Create command symlink
RUN chmod +x /usr/lib/gama/Gama /usr/lib/gama/headless/gama-headless.sh && \
	ln -s /usr/lib/gama/Gama /usr/bin/gama && \
	ln -s /usr/lib/gama/headless/gama-headless.sh /usr/sbin/gama-headless

# Docker env
WORKDIR /usr/lib/gama/headless

ENTRYPOINT ["gama-headless"]
CMD ["-help"]
