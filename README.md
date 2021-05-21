# mongodb-vapor-template

This repository contains a template which can be used for generating new projects using MongoDB and Vapor via [MongoDBVapor](https://github.com/mongodb/mongodb-vapor) with Vapor's command line tool, [Vapor Toolbox](https://github.com/vapor/toolbox):

```
vapor new MyProject --template https://github.com/mongodb/mongodb-vapor-template/
```
## Getting Started
1. Install [Vapor Toolbox](https://github.com/vapor/toolbox). Installation instructions can be found [here for macOS](https://docs.vapor.codes/4.0/install/macos/#install-toolbox) and [here for Linux](https://docs.vapor.codes/4.0/install/linux/#install-toolbox).

2. [Install MongoDB](https://docs.mongodb.com/manual/installation/), and start up a standalone server locally (this will run on the default host/port, localhost:27017):
```
mongod --dbpath /data/path/here
```

3. Load some sample data into the database:
```
mongo home --eval "db.kittens.insert([{name:\"roscoe\",color:\"orange\"},{name:\"chester\",color:\"tan\"}])"
```

4. Initialize a new project from the command line:
```
vapor new MyProject --template https://github.com/mongodb/mongodb-vapor-template/
```

5. Move into the project directory, and build and run the application (this might take a while on the first time):
```
cd MyProject
swift build
swift run
```

5. If using Leaf, go to `http://localhost:8080` to see your app in action and load a list of kittens! Else, you can run `curl http://localhost:8080` to see the resulting JSON.

6. To add a new kitten: if using Leaf, use the form at `http://localhost:8080`. Else, you can
add new data via `curl`: `curl -d "name=Bob&color=white" http://localhost:8080`. 
## Resources:
* [MongoDBVapor README](https://github.com/mongodb/mongodb-vapor#readme)
* [MongoDBVapor API documentation](https://mongodb.github.io/mongodb-vapor/)
* [MongoDB + Vapor example application](https://github.com/mongodb/mongo-swift-driver/tree/main/Examples/VaporExample)
* [Vapor documentation](https://docs.vapor.codes/4.0/)
* [MongoDB server documentation](https://docs.mongodb.com/manual/)

## Get in Touch
Notice any issues with this template, or have ideas for how to make it more useful? Feel free to open a pull request or GitHub issue, or reach out to us on the [SWIFT Jira project](jira.mongodb.org/browse/SWIFT).
