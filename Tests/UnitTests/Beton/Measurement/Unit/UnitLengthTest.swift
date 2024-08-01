import Foundation
import XCTest

@testable import Beton

class UnitLengthTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitLength.default, .meters)
  }
}
