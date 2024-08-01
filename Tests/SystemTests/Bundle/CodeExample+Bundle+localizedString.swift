import Beton
import XCTest

extension CodeExamples {
  func testLocalizedStringExample() {
    let bundle = Bundle.module.localizationBundles["hu_HU"]
    XCTAssertEqual(bundle?.localizedString("Apple", from: "Test"), "Alma")
    XCTAssertEqual(bundle?.localizedString("Banana", from: "Test"), "Banana")
  }
}
