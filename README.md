# Tailscale Android for self-hosted control server

This repository allows you to build the [Android app for Tailscale](https://github.com/tailscale/tailscale-android) with a custom control server address, making it possible to connect it to self-hosted deployments, such as [headscale](https://github.com/juanfont/headscale).

It works by cloning the upstream repository, applying the necessary patch to the source code to allow for a custom control server, and building the application.

The build process requires the same dependencies as the upstream project.

```shell
$ TAILSCALE_CONTROL_SERVER=https://vpn.example.com make
$ make install
```
