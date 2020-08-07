
# docker-bubbleupnpserver
# Introduction

This is a docker container based on [bubbleupnp-server](https://www.bubblesoftapps.com/bubbleupnpserver2/).

I`ve added configuration persistence on top of [Trauma/docker-bubbleupnpserver](https://github.com/Trauma/docker-bubbleupnpserver) existing build. 
Additional i've changed the base OS from Ubuntu to Debian. 

BubbleUPnP Server provides new services, many of them running on top of your existing UPnP/DLNA devices:

	- Make various media formats not natively supported by Chromecast playable with transcoding. Works in tandem with Android BubbleUPnP
	- Secure Internet access to your UPnP/DLNA Media Servers content with Android BubbleUPnP and foobar2000.
	- Stream and download your music, video, photos with your Android device from a mobile or WiFi connection with optional transcoding to reduce bandwidth.
	- No need to sync, to upload to the cloud, to register to an online service
	- Create OpenHome Media Renderers from any UPnP AV renderer (provides on-device playlist, multiple Control Point access to the same renderer)
	- Fix issues of UPnP/DLNA Media Servers (discovery issues, broken data, add some audio DLNA compliance) by Creating a proxy Media Server
	- Access your UPnP/DLNA Media Servers across different networks

**BUBBLEUPNP SERVER IS NOT AN UPNP AV MEDIA SERVER**

# Using Docker-compose

```  
  bubbleupnp:
    image: "sakujakira/bubbleupnp:latest"
    hostname: bubbleupnp
    container_name: "bubbleupnp"
    volumes:
      - ${USERDIR}/docker/bubbleupnp/config:/config
    ports:
      - "XXXXX:58050"
      - "XXXXX:58051"
      - "XXXXX:1900"
    restart: always
```

# manuell installation

Pull the image from the docker registry e.g.

```docker pull sakujakira/bubbleupnpserver```

or build it:  

```
git clone https://github.com/sakujakira/docker-bubbleupnpserver.git
cd docker-bubbleupnpserver
docker build --tag="$USER/bubbleupnpserver".
```
run your build:
```docker run -d --name=<your_container_name> --net=host $USER/bubbleupnpserver:latest```
## Quick Start
Run the downloaded image (as a daemon):
```docker run -d --name=<your_container_name> --net=host sakujakira/bubbleupnpserver:latest```

## Test it
http://<host.ip>:58050 or https://<host.ip>:58051

## Configuration
Configuration is available through bubbleupnpserer's web interface.

## Shell Access
For debugging and maintenance purposes you may want access the containers shell. Either add after the run command or tun e.g.
```docker exec -it "$USER/bubbleupnpserver" bash  ```

or

```docker ps```
```docker exec -it <container-id> bash   ```

## Autostart the container
add the parameter ```--restart=always``` to your docker run command.

# Known issues
1. healthcheck does not work
2. Plex Icon can`t be retrieved
