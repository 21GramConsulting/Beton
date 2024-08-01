import Foundation
import XCTest

@testable import Beton

class UnitElectricPotentialDifferenceTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitElectricPotentialDifference.default, .volts)
  }
}
