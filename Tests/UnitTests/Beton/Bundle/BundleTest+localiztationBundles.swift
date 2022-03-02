import Foundation
import XCTest
@testable import Beton

extension BundleTest {
  func testLocalizationBundles() {
    XCTAssertTrue(Bundle.module.localizationBundles.keys.contains(Locale(identifier: "en_US")))
    XCTAssertTrue(Bundle.module.localizationBundles.keys.contains(Locale(identifier: "hu_HU")))
    XCTAssertFalse(Bundle.module.localizationBundles.keys.contains(Locale(identifier: "de_DE")))
  }
}