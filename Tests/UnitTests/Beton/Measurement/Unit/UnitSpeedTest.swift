import Foundation
import XCTest

@testable import Beton

class UnitSpeedTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitSpeed.default, .kilometersPerHour)
  }
}
