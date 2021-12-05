# Toolbox

Toolbox is a Docker container with a bunch of useful tools installed.

Additionally, the container runs as a non-root user,
which is very useful if your k8s cluster enforces a security policy requiring such.

Example:
```
kubectl run --rm -it --overrides='{"apiVersion": "v1", "spec": {"securityContext": {"runAsUser": 1001}}}' --image=ghcr.io/bhb603/toolbox:main toolbox
```
