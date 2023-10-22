import Foundation
import XCTest

@testable import Beton

class UnitFrequencyTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitFrequency.default, .hertz)
  }
}
