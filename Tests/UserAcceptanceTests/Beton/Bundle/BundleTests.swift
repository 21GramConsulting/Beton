import Beton
import XCTest

class BundleTests: XCTestCase {
  func testLocalizedStringExample() {
    let bundle = Bundle.module.localizationBundles["hu_HU"]
    XCTAssertEqual(bundle?.localizedString("Apple", from: "Test"), "Alma")
    XCTAssertEqual(bundle?.localizedString("Banana", from: "Test"), "Banana")
  }
}
