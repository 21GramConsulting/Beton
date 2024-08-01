import Foundation
import XCTest

@testable import Beton

class MathTest: XCTestCase {

  func testPow() {
    XCTAssertEqual(
      pow(Measurement<UnitInformationStorage>(value: 2, unit: .bits), 3),
      Measurement<UnitInformationStorage>(value: 1, unit: .bytes)
    )
  }

  func testSqrt() {
    XCTAssertEqual(
      sqrt(Measurement<UnitInformationStorage>(value: 8, unit: .bits)),
      Measurement<UnitInformationStorage>(value: sqrt(8), unit: .bits)
    )
  }
}
