import Beton
import XCTest

extension CodeExamples {
  func test_localized_string_example() {
    let bundle = Bundle.module.localizationBundles["hu_HU"]
    XCTAssertEqual(bundle?.localizedString("Apple", from: "Test"), "Alma")
    XCTAssertEqual(bundle?.localizedString("Banana", from: "Test"), "Banana")
  }
}
