import Foundation
import XCTest
@testable import Beton

class UnitElectricCurrentTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitElectricCurrent.default, .default)
  }
}