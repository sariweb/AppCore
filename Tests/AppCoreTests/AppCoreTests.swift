import XCTest
@testable import AppCore

final class AppCoreTests: XCTestCase {
    func testColorRedEqual() {
        let color = AppCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testAppColorsAreEqual() {
        let color = AppCore.colorFromHexString("006736")
        XCTAssertEqual(color, AppCore.appColor)
    }
    
    func testSecondaryAppColorsAreEqual() {
        let color = AppCore.colorFromHexString("FCFFFD")
        XCTAssertEqual(color, AppCore.secondaryAppColor)
    }
    
//    static var allTests = [
//        ("testColorRedEqual", testColorRedEqual),
//    ]
}
