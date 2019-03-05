[![CircleCI](https://circleci.com/gh/govau/cga-cli.svg?style=svg)](https://circleci.com/gh/govau/cga-cli)
[![Docker Automated build](https://img.shields.io/docker/automated/govau/cga-cli.svg?style=plastic)](https://hub.docker.com/r/govau/cga-cli/) 
[![Docker Build Status](https://img.shields.io/docker/build/govau/cga-cli.svg?style=plastic)](https://hub.docker.com/r/govau/cga-cli/)

# CLI tools for cloud.gov.au

Provides a docker image with the CLI tools used to build and administer the cloud.gov.au platform.

[CircleCI](https://circleci.com/gh/govau/cga-cli) is used to test each change. The image on the `master` branch is automatically published on [docker hub](https://hub.docker.com/r/govau/cga-cli/).

### How to use it?

*Assumes you have docker running*

This image is published on [docker hub](https://hub.docker.com/r/govau/cga-cli/). To use it (with some common things added to the container environment):

```
docker run -it --rm \
  -v $PWD:/workspace \
  -w /workspace \
  -v $HOME/.aws:/root/.aws \
  -v $HOME/.ssh:/root/.ssh \
  cga-cli bash
```

The above command when run the first time will automatically pull the latest image from docker hub. If you run it again later, it will use the previously pulled version. To pull the latest version:

```
docker pull govau/cga-cli
```

### How to build it locally?

*Assumes you have docker running*

1. Clone this repository:
```
git clone https://github.com/govau/cga-cli.git
```

2. Build the image and tag it cga-cli:
```
docker build --tag cga-cli cga-cli
```

3. Verify the built image:
```
docker run -it --rm cga-cli kubectl --version
```