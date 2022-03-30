import Foundation
import XCTest
@testable import Beton

class UnitConcentrationMassTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitConcentrationMass.default, .gramsPerLiter)
  }
}