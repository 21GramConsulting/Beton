import Foundation
import XCTest
@testable import Beton

class UnitInformationStorageTest: XCTestCase {
  func testDefault() {
    XCTAssertEqual(UnitInformationStorage.default, .bits)
  }
}