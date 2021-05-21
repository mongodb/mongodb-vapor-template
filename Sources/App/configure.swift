{{#leaf}}import Leaf
{{/leaf}}import MongoDBVapor
import Vapor

/// Configures the application.
public func configure(_ app: Application) throws {
    // Uncomment to serve files from the /Public folder.
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    {{#leaf}}
    // Use LeafRenderer for views.
    app.views.use(.leaf)
    {{/leaf}}
    // Use `ExtendedJSONEncoder` and `ExtendedJSONDecoder` for encoding/decoding `Content`. We use extended JSON both
    // here and on the frontend to ensure all MongoDB type information is correctly preserved.
    // See: https://docs.mongodb.com/manual/reference/mongodb-extended-json{{#leaf}}
    // Note that for _encoding_ content, this encoder only gets used for the REST API methods, since Leaf uses its own
    // custom encoder to encode data for rendering in Leaf views.{{/leaf}}
    ContentConfiguration.global.use(encoder: ExtendedJSONEncoder(), for: .json)
    ContentConfiguration.global.use(decoder: ExtendedJSONDecoder(), for: .json)

    // Register routes.
    try routes(app)
}
