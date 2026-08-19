# A Simple and Stupid Network Utilities Image

[![CI build](https://github.com/alyiox/net-tools-container/actions/workflows/ci.yml/badge.svg)](https://github.com/alyiox/net-tools-container/actions/workflows/ci.yml)
[![Docker image](https://img.shields.io/docker/pulls/qqbuby/net-tools?logo=docker&label=docker%20image)](https://hub.docker.com/r/qqbuby/net-tools)
[![License](https://img.shields.io/github/license/alyiox/net-tools-container)](LICENSE)

A small container image with common network utilities for debugging containers and Kubernetes workloads:

- `bash-completion`
- `curl`
- `ethtool`
- `iproute2`
- `iputils-ping`
- `jq`
- `dnsutils`
- `netcat-openbsd`
- `net-tools`
- `nmap`
- `telnet`
- `tcpdump`
- `traceroute`
- `wget`

## Usage

The pre-built image is available on [Docker Hub](https://hub.docker.com/r/qqbuby/net-tools).

### Kubernetes

```console
$ kubectl create -n default deployment net-tools --image docker.io/qqbuby/net-tools -- tail -f /dev/null
deployment.apps/net-tools created
$ kubectl get po -n default -l app=net-tools
NAME                         READY   STATUS    RESTARTS   AGE
net-tools-6847549946-67hmf   1/1     Running   0          56s
$ kubectl exec -n default net-tools-6847549946-67hmf -- ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0@if18: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default qlen 1000
    link/ether b6:3b:a5:74:3c:e5 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 10.244.1.48/24 brd 10.244.1.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::b43b:a5ff:fe74:3ce5/64 scope link
       valid_lft forever preferred_lft forever

$ kubectl exec -n default net-tools-6847549946-67hmf -- dig +short +search kubernetes
10.96.0.1
$ kubectl get svc -n default
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.96.0.1   <none>        443/TCP   15d
```

### Docker

```console
$ docker run --rm -it qqbuby/net-tools ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
33: eth0@if34: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default
    link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.17.0.2/16 brd 172.17.255.255 scope global eth0
       valid_lft forever preferred_lft forever
```

## Build

Build the image locally with the `Dockerfile` in this repository:

```console
$ docker build -t qqbuby/net-tools .
```
