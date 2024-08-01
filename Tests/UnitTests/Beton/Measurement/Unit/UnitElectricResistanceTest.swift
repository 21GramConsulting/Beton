import Foundation
import XCTest

@testable import Beton

class UnitElectricResistanceTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitElectricResistance.default, .ohms)
  }
}
