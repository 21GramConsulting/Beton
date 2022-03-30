import Foundation
import XCTest
@testable import Beton

class UnitEnergyTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitEnergy.default, .joules)
  }
}