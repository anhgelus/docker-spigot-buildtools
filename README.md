# Quick reference

-	**Maintained by**:  
	[Anhgelus Morhtuuzh](https://github.com/anhgelus/docker-spigot-buildtools)

-	**Where to get help**:  
	[the Docker Community Forums](https://forums.docker.com/), [the Docker Community Slack](https://dockr.ly/slack), [Anhgelus Morhtuuzh's Discord](), or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)

# Supported tags and respective `Dockerfile` links

-	[`latest`, `java17`](https://github.com/anhgelus/docker-spigot-buildtools/blob/master/)
-   [`java8`](https://github.com/anhgelus/docker-spigot-buildtools/blob/java8/)

# Quick reference (cont.)

-	**Where to file issues**:  
	[https://github.com/docker-library/openjdk/issues](https://github.com/docker-library/openjdk/issues)

-	**Source of this description**:  
	[README.md](https://github.com/anhgelus/docker-spigot-buildtools/blob/master/README.md)

# What is BuildTools?

BuildTools.jar is the solution to building Bukkit, CraftBukkit, Spigot, and the Spigot-API. (source: [BuildTools Wiki](https://www.spigotmc.org/wiki/buildtools/#what-is-it))

> [BuildTools Wiki](https://www.spigotmc.org/wiki/buildtools/)

Spigot is a registered trademark of SpigotMC and/or its affiliates.

![logo](https://static.spigotmc.org/img/spigot.png)

# How to use this image

## Build Spigot inside the container

The most straightforward way to use this image is to use a BuildTools container as both the build environment.

You can build Spigot with this command:

```console
$ docker run -it --rm --name buildtools -v "$PWD":/app/spigot.jar -e VERSION=1.19 anhgelus/spigot-buildtools:java17
```

To use a custom version, set the environment variable VERSION with the version you want to use.

Some versions are not suported by Spigot, look at the [BuildTools Wiki](https://www.spigotmc.org/wiki/buildtools/) to see the suported versions.

## Use the image itzg/minecraft-server with a custom Spigot build

You can also use this image to use an updated version of Spigot with old Minecraft versions.

Example:

```Dockerfile
FROM anhgelus/spigot-buildtools:java8 as buildtools
ENV VERSION 1.8.8
WORKDIR /app

FROM itzg/minecraft-server:java8
ENV EULA true
ENV VERSION 1.8.8-R0.1-SNAPSHOT-latest
ENV TYPE SPIGOT
RUN rm spigot_server-1.8.8-R0.1-SNAPSHOT-latest.jar
COPY --from=buildtools /app/spigot.jar /data/spigot_server-1.8.8-R0.1-SNAPSHOT-latest.jar
```

# License

View [license information](https://www.spigotmc.org/wiki/spigot-terms/) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
