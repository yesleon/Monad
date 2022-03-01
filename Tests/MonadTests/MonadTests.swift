import XCTest
@testable import Monad

final class MonadTests: XCTestCase {
    func testExample() {
        XCTAssertTrue(«1».map { $0 + 1 } == 1 + 1)
    }
    func testThrowingFoundNil() throws {
        XCTAssertThrowsError(try «1».compactMap { _ in Optional<String>("") })
    }
}

prefix operator «
postfix operator »

public postfix func » <T>(lhs: T) -> Monad<T> {
    return Monad(wrapped: lhs)
}
public prefix func « <T>(rhs: Monad<T>) -> T {
    return rhs.wrapped
}
