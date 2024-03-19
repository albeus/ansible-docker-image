# Ansible container image

Image to integrate Ansible in CI/CD systems.

# Release state

This is a first PoC that need optimization and security assessment.

# Releasing images

You can use the Makefile for running docker commands. E.g:

```
make build
```

```
make latest
```

```
make VERSION=2.16.4  tag-version
```

# Versioning

The image tag reflects the ansible_core version: <core_version>_<rel>. An
extra version number is appeneded to track others image changes.

E.g. 2.15.3_1.0 is the release 1.0 based on ansible_core==2.15.3
