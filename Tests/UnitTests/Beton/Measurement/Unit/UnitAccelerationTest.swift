import Foundation
import XCTest
@testable import Beton

class UnitAccelerationTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitAcceleration.default, .metersPerSecondSquared)
  }
}