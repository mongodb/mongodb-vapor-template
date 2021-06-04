import App
import MongoDBVapor
import Vapor

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)

let app = Application(env)
try configure(app)

// Configure the app to connect to a MongoDB deployment. If a connection string is provided via the `MONGODB_URI`
// environment variable it will be used; otherwise, use the default connection string for a local MongoDB server.
try app.mongoDB.configure(Environment.get("MONGODB_URI") ?? "mongodb://localhost:27017")

defer {
    // Cleanup the application's MongoDB data.
    app.mongoDB.cleanup()
    // Clean up the driver's global state. The driver will no longer be usable from this program after this method is
    // called.
    cleanupMongoSwift()
    app.shutdown()
}

try app.run()
