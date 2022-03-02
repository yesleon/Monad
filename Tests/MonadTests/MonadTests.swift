//
//  MonadTests.swift
//
//
//  Created by Li-Heng Hsu on 2022/3/2.
//

import XCTest
@testable import Monad


final class MonadTests: XCTestCase {
    func testMap() {
        XCTAssertEqual(«1».map { $0 + 1 }, 1 + 1)
    }
    func testCompactMap() throws {
        XCTAssertThrowsError(try «1».compactMap { _ in Optional<String>.none })
        XCTAssertNoThrow(try «1».compactMap { _ in Optional<String>("") })
    }
    func testFlatMap() {
        XCTAssertEqual(«1».flatMap { Monad("\($0)") }, "1")
    }
}
