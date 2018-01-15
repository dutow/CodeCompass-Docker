CodeCompass-Docker MySQL example
===

This is a simple example for parsing MySQL with CodeCompass and docker.

The example uses `docker-compose`, but not in any productin-ready way:
is is used only to simplify the execution of multiple containers with volumes on a desktop machine.

Usage
---

Clone the mysql repository:

```
git clone https://github.com/mysql/mysql-server.git
```

Build the MySQL parser image, which is in the `parser-for-mysql` directory.
This command will build both a release and a debug image:

```
docker-compose build
```

Parse the sources:

```
docker-compose run parer
```

If something is wrong, use the debug image. This command will open a bash:

```
docker-compose run debug-sh
```

Finally, after the project is parsed, run the server:

```
docker-compose run server
```

