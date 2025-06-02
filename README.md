## Requirements
* java version 11
* ant version 1.10
* lib maven-resolver-ant-tasks version 1.15
* zip


### lib maven-resolver-ant-tasks

The lib maven-resolver-ant-tasks is required and must be located in the macros/lib or the ${ANT_HOME}/lib directory.

to install the lib lib maven-resolver-ant-tasks in the local macros/lib you can use the script macros/install_lib.sh

```
cd macros

# Usage
./install_lib.sh
Usage: ./install_lib.sh
 -h : print this help
 -v MAVEN_RESOLVER_ANT_TASKS_VERSION : Version of the maven-resolver-ant-tasks-VERSION-uber.jar
                                       See: https://repo.maven.apache.org/maven2/org/apache/maven/resolver/maven-resolver-ant-tasks
 -o TARGET_DIR                       : target dir (default value: lib)

# Example: Install the maven-resolver-ant-tasks version 1.5.2
./install_lib.sh -v 1.5.2

```

## Build

build a delivery item with the foloowing command:

```
ant
```

The output xynaorm-<VERSION>.zip ist found in the directory build
