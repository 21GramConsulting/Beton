import Foundation
import XCTest
@testable import Beton

class UnitPressureTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitPressure.default, .bars)
  }
}