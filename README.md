# mongodb-vapor-template

This repository contains a template which can be used for generating new projects using MongoDB and Vapor via [MongoDBVapor](https://github.com/mongodb/mongodb-vapor) with Vapor's command line tool, [Vapor Toolbox](https://github.com/vapor/toolbox):

```
vapor new MyProject --template https://github.com/mongodb/mongodb-vapor-template/
```
## Getting Started
1. Install [Vapor Toolbox](https://github.com/vapor/toolbox). Installation instructions can be found [here for macOS](https://docs.vapor.codes/4.0/install/macos/#install-toolbox) and [here for Linux](https://docs.vapor.codes/4.0/install/linux/#install-toolbox).

2. Initialize a new project from the command line, and move into the project directory:
```
vapor new MyProject --template https://github.com/mongodb/mongodb-vapor-template/
cd MyProject
```

3. Set up a MongoDB deployment to connect to. You can [install MongoDB](https://docs.mongodb.com/manual/installation/), and (in a new terminal window) start up a standalone server locally (this will run on the default host/port, `localhost:27017`):
```
mongod --dbpath /data/path/here
```

Alternatively, you can use [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) to set up a fully managed MongoDB deployment in the cloud.

4. If using Atlas, or a local host/port besides the default `localhost:27017`, set your MongoDB connection string via environment variable:
```
export MONGODB_URI='connection-string-here'
```

5. Load some sample data into the database via the MongoDB shell:
```
mongo $MONGODB_URI home --eval "db.kittens.insert([{name:\"roscoe\",color:\"orange\"},{name:\"chester\",color:\"tan\"}])"
```

If using Atlas, you could also do this via [Atlas Data Explorer](https://docs.atlas.mongodb.com/data-explorer/).

6. Build and run the application (this might take a while on the first time):
```
swift build
swift run
```

7. If using Leaf, go to `http://localhost:8080` to see your app in action and load a list of kittens! Else, you can run `curl http://localhost:8080` to see the resulting JSON.

8. To add a new kitten: if using Leaf, use the form at `http://localhost:8080`. Else, you can
add new data via `curl`: `curl -d "name=Bob&color=white" http://localhost:8080`. 
## Resources:
* [MongoDBVapor README](https://github.com/mongodb/mongodb-vapor#readme)
* [MongoDBVapor API documentation](https://mongodb.github.io/mongodb-vapor/)
* [MongoDB + Vapor example application](https://github.com/mongodb/mongo-swift-driver/tree/main/Examples/VaporExample)
* [Vapor documentation](https://docs.vapor.codes/4.0/)
* [MongoDB server documentation](https://docs.mongodb.com/manual/)

## Get in Touch
Notice any issues with this template, or have ideas for how to make it more useful? Feel free to open a pull request or GitHub issue, or reach out to us on the [SWIFT Jira project](jira.mongodb.org/browse/SWIFT).
