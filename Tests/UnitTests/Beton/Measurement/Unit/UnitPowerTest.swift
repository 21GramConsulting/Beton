import Foundation
import XCTest

@testable import Beton

class UnitPowerTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitPower.default, .watts)
  }
}
