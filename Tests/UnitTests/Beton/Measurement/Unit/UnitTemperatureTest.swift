import Foundation
import XCTest
@testable import Beton

class UnitTemperatureTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitTemperature.default, .celsius)
  }
}