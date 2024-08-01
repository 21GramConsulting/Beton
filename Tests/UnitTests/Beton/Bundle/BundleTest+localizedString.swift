import Foundation
import XCTest

@testable import Beton

extension BundleTest {
  func testLocalizedStringKeyOnly() {
    XCTAssertEqual(
      Bundle.module.localizedString("Test"),
      Bundle.module.localizedString(forKey: "Test", value: nil, table: nil)
    )
  }

  func testLocalizedStringKeyAndTableOnly() {
    XCTAssertEqual(
      Bundle.module.localizedString("Test", from: "Test"),
      Bundle.module.localizedString(forKey: "Test", value: nil, table: "Test")
    )
  }

  func testLocalizedStringKeyAndValueOnly() {
    XCTAssertEqual(
      Bundle.module.localizedString("Test", fallback: "Test"),
      Bundle.module.localizedString(forKey: "Test", value: "Test", table: nil)
    )
  }
}
