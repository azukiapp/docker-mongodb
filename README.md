[azukiapp/mongodb](http://images.azk.io/#/mongodb)
==================

Base docker image to run a MongoDB database server in [`azk`](http://azk.io)

MongoDB versions (tags)
---

<versions>
- [`2.2.7`, `2.2`](https://github.com/azukiapp/docker-mongodb/blob/master/2.2/Dockerfile)
- [`2.4.17`, `2.4`](https://github.com/azukiapp/docker-mongodb/blob/master/2.4/Dockerfile)
- [`2.6.11`, `2.6`, `2`](https://github.com/azukiapp/docker-mongodb/blob/master/2.6/Dockerfile)
- [`3.0.7`, `3.0`, `3`, 'latest'](https://github.com/azukiapp/docker-mongodb/blob/master/3.0/Dockerfile)
- [`3.1.9`, `3.1`](https://github.com/azukiapp/docker-mongodb/blob/master/3.1/Dockerfile)
- [`3.2.0-rc2`, `3.2.0`, `3.2`, `3.2-rc2`](https://github.com/azukiapp/docker-mongodb/blob/master/3.2/Dockerfile)
</versions>

Image content:
---

- Ubuntu 14.04
- MongoDB

### Usage with `azk`

Example of using this image with [azk](http://azk.io):

```js
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */

// Adds the systems that shape your system
systems({
  mongodb: {
    image : { docker: "azukiapp/mongodb" },
    scalable: false,
    wait: 20,
    // Mounts folders to assigned paths
    mounts: {
      // to keep data between the executions
      '/data/db': persistent('mongodb-#{manifest.dir}'),
    },
    ports: {
      http: "28017/tcp",
      data: "27017/tcp",
    },
    http      : {
      // mongodb.azk.dev
      domains: [ "#{manifest.dir}-#{system.name}.#{azk.default_domain}" ],
    },
    export_envs        : {
      MONGODB_URI: "mongodb://#{net.host}:#{net.port.data}/#{manifest.dir}_development",
    },
  },
});
```


### Usage with `docker`

To create the image `azukiapp/mongodb`, execute the following command on the mongodb folder:

```sh
$ docker build -t azukiapp/mongodb .
```

To run the image and bind to port 27017 and 28017:

```sh
$ docker run -d -p 27017:27017 -p 28017:28017 -v <db-dir>:/data/db --name mongodb azukiapp/mongodb
```

Logs
---

```sh
# with azk
$ azk logs mongodb

# with docker
$ docker logs <CONTAINER_ID>
```

## License

Azuki Dockerfiles distributed under the [Apache License][license].

[license]: ./LICENSE
