import Foundation
import XCTest

@testable import Beton

class UnitDurationTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitDuration.default, .seconds)
  }
}
