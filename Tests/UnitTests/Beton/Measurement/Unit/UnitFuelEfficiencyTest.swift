import Foundation
import XCTest
@testable import Beton

class UnitFuelEfficiencyTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitFuelEfficiency.default, .litersPer100Kilometers)
  }
}