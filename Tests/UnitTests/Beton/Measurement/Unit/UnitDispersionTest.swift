import Foundation
import XCTest

@testable import Beton

class UnitDispersionTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitDispersion.default, .partsPerMillion)
  }
}
