# Docker Factor development environment
This is a simple `make` and `Docker`-based development environment for playing with [Factor](https://factorcode.org/). The image is based on the [Ubuntu 22.04](https://hub.docker.com/_/ubuntu) Docker base image.

To build the image:

    make build

To run a REPL:

    make repl
    
To execute a Factor file (e.g. the file 'test.factor'):

    make shell
    factor test.factor

# License
This work is licensed under a CC-BY-SA-NC-4.0 license as specified in the supplied LICENSE file.
