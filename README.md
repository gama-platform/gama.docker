# GAMA Docker Container

This project is a simple Docker image that contains a GAMA platform ready to use in headless mode with [OpenJDK 8](https://openjdk.java.net/) with a minimal Ubuntu.

## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisities


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Installing

#### Docker Hub pull

```shell
$ docker pull gama-platform/gama:[continuous|1.8.0|..]
```

To see all the available tags, see [there](https://hub.docker.com/r/gamaplatform/gama/tags).

#### Building

Clone this repository

```
git clone https://github.com/gama-platform/gama.docker
```

Move in the cloned repository

```
cd ./gama.docker
```

Build the Docker image

```
docker build -t gama .
```

### Usage

#### Simple usage

The command to run the previously builded image is simple as below

```
docker run gamaplatform/gama:continuous <custom argument for headless execution>
```

By default, if you don't add argument after the container image, it will display the help message.

#### Shutdown the container

The container will stop automatically when the headless run will end.

#### Enter in the container

If you want to enter in bash inside the gama container, you will have to explicitly change the _Docker Entrypoint_ of the container by this way

```
docker run -i -t --entrypoint /bin/bash <containerID>
```

### Exemple

```
$ docker run gama -help
gama-headless.sh
******************************************************************
* GAMA version 1.8                                               *
* http://gama-platform.org                                       *
* (c) 2007-2019 UMI 209 UMMISCO IRD/SU & Partners                *
******************************************************************
 Welcome to Gama-platform.org version GAMA 1.8
sh ./gama-headless.sh [Options] [XML Input] [output directory]

List of available options:
      -help     				 	-- get the help of the command line
      -version     				-- get the the version of gama
      -m [mem]    					-- allocate memory (ex 2048m)
      -c        					-- start the console to write xml parameter file
      -v 							-- verbose mode
      -hpc [core] 					-- set the number of core available for experimentation
      -socket [socketPort] 		-- start socket pipeline to interact with another framework

      -p        					-- start pipeline to interact with another framework

      -validate [directory]    	-- invokes GAMA to validate the models present in the directory passed as argument
      -test [directory]		   	-- invokes GAMA to execute the tests present in the directory and display their results
      -failed		   				-- only display the failed and aborted test results
      -xml	[experimentName] [modelFile.gaml] [xmlOutputFile.xml]	-- only display the failed and aborted test results
 sh ./gama-headless.sh -xml experimentName gamlFile xmlOutputFile

      build an xml parameter file from a model
```

#### Environment Variables

* `/usr/lib/gama/headless/gama-headless.sh` - Headless launch script (Default `Entrypoint`)

#### Useful File Locations

* `/usr/usr/lib/gama` - The continuous version of [GAMA](http://gama-platform.org)

* `/usr/usr/lib/gama/headless/gama-platform.sh` - The helping file to launch [GAMA Headless](http://gama-platform.org/wiki/Headless)

## Built With

* GAMA-Platform - https://github.com/gama-platform/gama/releases/

## Find Us

* [GitHub](https://github.com/gama-platform)
* [Docker Hub](https://hub.docker.com/r/gamaplatform/gama)
* [GAMA-Platform](https://gama-platform.github.io/)

<!--
## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.
-->

# Authors

* **Arthur Brugiere** - *Initial work* - [RoiArthurB](https://github.com/RoiArthurB)

See also the list of [contributors](https://github.com/gama-platform/gama.docker/contributors) who participated in this project.

# License

This project is licensed under the GPL3 License - see the [LICENSE.md](LICENSE.md) file for details

