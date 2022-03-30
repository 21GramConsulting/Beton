import Foundation
import XCTest
@testable import Beton

class UnitAngleTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitAngle.default, .degrees)
  }
}