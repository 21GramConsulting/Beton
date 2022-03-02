import Foundation
import XCTest
@testable import Beton

extension BundleTest {
  func testLocalizedString_keyOnly() {
    XCTAssertEqual(
      Bundle.module.localizedString("Test"),
      Bundle.module.localizedString(forKey: "Test", value: nil, table: nil)
    )
  }

  func testLocalizedString_keyAndTableOnly() {
    XCTAssertEqual(
      Bundle.module.localizedString("Test", from: "Test"),
      Bundle.module.localizedString(forKey: "Test", value: nil, table: "Test")
    )
  }

  func testLocalizedString_keyAndValueOnly() {
    XCTAssertEqual(
      Bundle.module.localizedString("Test", fallback: "Test"),
      Bundle.module.localizedString(forKey: "Test", value: "Test", table: nil)
    )
  }
}
