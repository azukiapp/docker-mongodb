[azukiapp/mongodb](http://images.azk.io/#/mongodb)
==================

Base docker image to run a MongoDB database server in [`azk`](http://azk.io)

MongoDB versions (tags)
---

<versions>
- [`latest`](https://github.com/azukiapp/docker-mongodb/blob/master/latest/Dockerfile)
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
    wait: {"retry": 20, "timeout": 1000},
    // Mounts folders to assigned paths
    mounts: {
      // equivalent persistent_folders
      '/data/db': persistent('mongodb-#{manifest.dir}'),
    },
    ports: {
      http: "28017:28017/tcp",
    },
    http      : {
      // mongodb.azk.dev
      domains: [ "#{manifest.dir}-#{system.name}.#{azk.default_domain}" ],
    },
    export_envs        : {
      MONGODB_URI: "mongodb://#{net.host}:#{net.port[27017]}/#{manifest.dir}_development",
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
