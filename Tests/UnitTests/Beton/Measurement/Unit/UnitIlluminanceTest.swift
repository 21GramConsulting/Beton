import Foundation
import XCTest

@testable import Beton

class UnitIlluminanceTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitIlluminance.default, .lux)
  }
}
