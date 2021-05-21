@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testFetchKittens() throws {
        let app = Application(.testing)
        defer {
            app.mongoDB.cleanup()
            app.shutdown()
        }
        try configure(app)
        try app.mongoDB.configure("mongodb://localhost:27017")

        try app.test(.GET, "", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            // test that the extended JSON we get can be decoded into `Kitten`s.
            XCTAssertNoThrow(try res.content.decode([Kitten].self))
        })
    }
}
