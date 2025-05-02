# GAMA Docker Container

This project is a simple Docker image that contains a GAMA platform ready to use in headless mode within a minimal [Alpine](https://alpinelinux.org/) with [Eclipse Adoptium OpenJDK 21 64-Bit Server VM](https://adoptium.net/temurin/releases/) container.

## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisities


In order to run this container you'll need to install [docker](https://docs.docker.com/get-started/get-docker/).

### Usage

#### Tags

The [GAMA Platform Docker repository](https://hub.docker.com/r/gamaplatform/gama) does contain a lot of different versions of GAMA :

- **Stable releases** 
  - starting from [1.8 Release Candidate 2](https://hub.docker.com/layers/gamaplatform/gama/1.8-rc2/images/sha256-76035a577c8541ca6610a949cc58a4e76a7423da2e89c140a67cd75ae3e29efc?context=explore)
- **Rolling releases** 
  - [_alpha_](https://hub.docker.com/layers/gamaplatform/gama/alpha/images/sha256-f381dcea8d1f7dac3bb18752a5ce263c32a0e90474dc14b8799d73a320d5f67c?context=explore) which is the latest build done with current github code. This is not tested contrary to official releases.
- **Meta tags**
  - [_latest_](https://hub.docker.com/layers/gamaplatform/gama/latest/images/sha256-15746fa81624c38b085d891e521fb4fe737f06b3a1f6a955dc53b4d5558ad46f?context=explore) which is the latest official release

#### Simple usage

The command to run the previously builded image is simple as below

```
docker run gamaplatform/gama:latest <custom argument for headless execution>
```

By default, if you don't add argument after the container image, it will display the help message.

#### Shutdown the container

The container will stop automatically when the headless run will end.

#### Enter in the container

If you want to enter in bash inside the gama container, you will have to explicitly change the _Docker Entrypoint_ of the container by this way

```
docker run -i -t --entrypoint /bin/bash <containerID>
```

### Example

```
$ docker run --rm gamaplatform/gama:1.8.1 -help
gama-headless.sh
******************************************************************
* GAMA version 1.8.1                                             *
* http://gama-platform.org                                       *
* (c) 2007-2019 UMI 209 UMMISCO IRD/SU & Partners                *
******************************************************************
 Welcome to Gama-platform.org version GAMA 1.8.1
sh ./gama-headless.sh [Options] [XML Input] [output directory]

List of available options:
      -help                   -- get the help of the command line
      -version                -- get the the version of gama
      -m [mem]                -- allocate memory (ex 2048m)
      -c                      -- start the console to write xml parameter file
      -v                      -- verbose mode
      -hpc [core]             -- set the number of core available for experimentation
      -socket [socketPort]    -- start socket pipeline to interact with another framework
      -p                      -- start pipeline to interact with another framework
      -validate [directory]   -- invokes GAMA to validate the models present in the directory passed as argument
      -test [directory]       -- invokes GAMA to execute the tests present in the directory and display their results
      -failed                 -- only display the failed and aborted test results
      -xml [experimentName] [modelFile.gaml] [xmlOutputFile.xml] -- only display the failed and aborted test results
 sh ./gama-headless.sh -xml experimentName gamlFile xmlOutputFile

      build an xml parameter file from a model
```

#### Environment Variables

* `/usr/lib/gama/headless/gama-headless.sh` - Headless launch script (Default `Entrypoint`)

#### Useful File Locations

* `/opt/gama-platform` - The installed version of [GAMA](http://gama-platform.org)

* `/opt/gama-platform/headless/gama-platform.sh` - The helping file to launch [GAMA Headless](https://gama-platform.org/wiki/RunningHeadless)

### Installing

#### Docker Hub pull

```shell
$ docker pull gamaplatform/gama:[latest|1.8.1|..]
```

To see all the available tags, see [there](https://hub.docker.com/r/gamaplatform/gama/tags).

#### Building

Clone this repository

```
git clone https://github.com/gama-platform/gama.docker
```

Move in the cloned repository

```
cd ./gama.docker/tags/<any-tag-name>
```

Build the Docker image

```
docker build -t gama .
```
## Docker compose 
```
services:
  gama:
    image: gamaplatform/gama:alpha
    # Modify here the command to be run by the container upon execution
    command: gama-headless -v /opt/gama-platform/headless/samples/roadTraffic.xml /opt/gama-platform/output
    container_name: gama_container
    # Map the outputs of the execution to a local "output" directory
    volumes: 
      - ./output:/opt/gama-platform/output
    restart: no
```
You can run the following to execute the example docker compose file :
```
$ docker compose up -d
```
If you want to run your own model inside the container, map it to volumes inside the container :
```
services:
  gama:
    image: gamaplatform/gama:alpha
    command: gama-headless -v /opt/gama-platform/headless/your_model/ExperimentFile.xml /opt/gama-platform/output
    container_name: gama_container
    volumes: 
      - ./output:/opt/gama-platform/output
      - /path/to/your_model:/opt/gama-platform/headless/your_model
    restart: no
```
## Built With

* GAMA-Platform - https://github.com/gama-platform/gama/releases/
* Docker - https://docker.com
* AlpineOS - https://alpinelinux.org/
* OpenJDK 17 - https://openjdk.java.net/

## Find Us

* [GitHub](https://github.com/gama-platform)
* [Docker Hub](https://hub.docker.com/r/gamaplatform/gama)
* [GAMA-Platform](https://gama-platform.github.io/)

<!--
## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.
-->

# Authors

* **Arthur Brugiere** - [RoiArthurB](https://github.com/RoiArthurB)

See also the list of [contributors](https://github.com/gama-platform/gama.docker/contributors) who participated in this project.

# License

This project is licensed under the GPL3 License - see the [LICENSE.md](LICENSE.md) file for details

