import Foundation
import XCTest
@testable import Beton

class UnitAreaTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitArea.default, .squareMeters)
  }
}