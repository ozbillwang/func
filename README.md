# func

Running Azure Functions Core Tools (`func`) in Docker

This image is ridiculously large, approximately `3.4GB`. If you have any ideas to reduce its size, please let me know.

Link to Docker Hub Repository

https://hub.docker.com/repository/docker/debianlinux/func/general

What's Included?

* Azure Functions Core Tools ( command `func` )
* Azure CLI ( command `az` )
* .NET 6.0 (If you need to deploy Node.js or other applications, please fork this repository and replace it with the application you require.)

### Usage
```
$ docker build -t func . 

$ docker images |grep func

func   latest   c5a3f6894aaa   6 hours ago     3.43GB

$ docker run -ti --rm -v $(pwd):/apps -w /apps func bash
root@debfbd8e29a5:/apps# az login
root@debfbd8e29a5:/apps# func azure functionapp publish <function_app_name>

# if you need debug
root@debfbd8e29a5:/apps# export CLI_DEBUG=1
root@debfbd8e29a5:/apps# func azure functionapp publish <function_app_name>
```

Follow up blog: https://medium.com/@ozbillwang/install-azure-functions-core-tools-in-docker-4dbc7a63dc21
