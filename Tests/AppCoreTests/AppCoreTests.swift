import XCTest
@testable import AppCore

final class AppCoreTests: XCTestCase {
    func testColorRedEqual() {
        let color = AppCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
    ]
}
