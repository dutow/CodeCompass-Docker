Docker images for CodeCompass
===

The goal of this repository to build and run CodeCompass using docker.

This provides some challeanges, as:

* CodeCompass has multiple configurations (e.g. database, debug/release)
* CodeCompass requires a hand-built clang - a build which can't be completed by the automatic builds of docker-hub
* the parser also needs the dependencies of the project to be parsed, which means a generic image can't be used to parse anything

These problems are sovled by:

* Using make for building (helps with config automation ; provides easy builds without the automatic build of dockerhub)
* The parser image can be customized with additional dependencies, it's just a template

Limitations
----

Right now, these makefiles:

* Only build the postgres variant
* Only provide images based on Ubuntu Xenial

Both limitation could be easily removed, and the naming schema already includes parameters for them.

Usage:
----

There are primarily two end user images:

* `dutow/codecompass-xenial-pgsql-server`
* `dutow/codecompass-xenial-pgsql-parser`

Both images execute the correct CodeCompass command by default, and require a postgresql database.

Their execution can be customized using the following environment variables:

| Name           | Image  | Default                             |
|----------------|--------|-------------------------------------|
| DB_HOST        | both   | dbserver                            |
| DB_USER        | both   | postgres                            |
| DB_PASSWORD    | both   | secret                              |
| DB_PORT        | both   | 5472                                |
| PROJECTNAME    | parser | Untitled                            |
| COMPILATION_DB | parser | /work/src/compilation_commands.json |
| CC_PORT        | server | 6251                                |

The CodeCompass workspace is hardcoded at the `/workspace` directory. This should be mounted with a volume.

### Parsing projects

Parsing is challanging:

* The compilation database contains absolute pathnames
* Compiling a project usually requires additional dependencies

The best way to deal with these issues is to treat the parser image just as a template, which has to be customized.

Examples are provided in the `examples` directory.

### Debugging

For debugging issues, images with debug binaries are also provided:

* `dutow/codecompass-xenial-pgsql-debug-server`
* `dutow/codecompass-xenial-pgsql-debug-parser`

Building:
----

To build the images:

```
git clone --recursive <repository>
make
```

To push the images:
```
make push
```

Note:

* the images build with the `dutow/` prefix by default. This can be changed in `config.mk`.
* pushing requires executing `docker login` first
* the push command executed the build command first

