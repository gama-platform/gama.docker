# Overview
This project is a simple Docker image that contains a GAMA platform ready to use in headless mode with [OpenJDK 8](https://openjdk.java.net/) with a minimal Ubuntu.

# Prerequisites
* a working [Docker](http://docker.io) engine
<!-- * a working [Docker Compose](http://docker.io) installation -->

# Building
Clone this repository

```
git clone https://github.com/gama-platform/gama.docker
```

Build the Docker image

```
docker build gama .
```

# Installation
Docker will automatically install the newly built image into the cache.

# Tips and Tricks


## Simple usage

The command to run the previously builded image is simple as below

```
docker run gama <custom argument for headless execution>
```

By default, if you don't add argument after `gama` it will display the help message.

## Shutdown the container

The container will stop automatically when the headless run will end.

## Enter in the container

If you want to enter in bash inside the gama container, you will have to explicitly change the _Docker Entrypoint_ of the container by this way

```
docker run -i -t --entrypoint /bin/bash <containerID>
```

<!-- # Troubleshooting -->

## Built With

* [GAMA Platform _1.8_](https://gama-platform.github.io/)
* [Docker]()

## Support

Please post issues about that project here:  

    https://github.com/gama-platform/gama.docker/issues

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Authors

* **Arthur Brugiere** - *Initial work* - [RoiArthurB](https://github.com/RoiArthurB)

See also the list of [contributors](https://github.com/gama-platform/gama.docker/contributors) who participated in this project.

## License

This project is licensed under the GPL3 License - see the [LICENSE.md](LICENSE.md) file for details

