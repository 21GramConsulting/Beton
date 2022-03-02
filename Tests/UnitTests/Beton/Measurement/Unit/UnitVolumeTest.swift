import Foundation
import XCTest
@testable import Beton

class UnitVolumeTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitVolume.default, .liters)
  }
}