# cpp-docker-dev-env
This is an example that shows how to make C++ development environment inside Docker container

**app** and **dev-env** folders supposed to be two separate projects.
**dev-env** contains two containers, one for building and another one with Qt Creator IDE inside for developing.
**app** just test application that uses build-env container.

Key features:
* Doesn't pollute your host system
* Fast start for a new team member
* Easy to maintain
* Everything is automated with GitLab

Known limitations and issues:
* Linux only
* X11 only
* Bad HiDPI support
