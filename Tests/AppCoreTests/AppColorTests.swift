import XCTest
@testable import AppCore

final class AppColorTests: XCTestCase {
    func testColorRedEqual() {
        let color = AppCore.Color.fromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testAppColorsAreEqual() {
        let color = AppCore.Color.fromHexString("006736")
        XCTAssertEqual(color, AppCore.Color.appColor)
    }
    
    func testSecondaryAppColorsAreEqual() {
        let color = AppCore.Color.fromHexString("FCFFFD")
        XCTAssertEqual(color, AppCore.Color.secondaryAppColor)
    }
}
