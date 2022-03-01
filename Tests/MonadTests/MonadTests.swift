import XCTest
@testable import Monad

final class MonadTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Monad().text, "Hello, World!")
    }
}
