import Foundation
import XCTest

@testable import Beton

class UnitMassTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitMass.default, .grams)
  }
}
