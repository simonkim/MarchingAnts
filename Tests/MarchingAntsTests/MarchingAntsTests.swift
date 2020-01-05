import XCTest
@testable import MarchingAnts

final class MarchingAntsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MarchingAnts().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
