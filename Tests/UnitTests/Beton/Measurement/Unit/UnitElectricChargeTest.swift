import Foundation
import XCTest
@testable import Beton

class UnitElectricChargeTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitElectricCharge.default, .ampereHours)
  }
}