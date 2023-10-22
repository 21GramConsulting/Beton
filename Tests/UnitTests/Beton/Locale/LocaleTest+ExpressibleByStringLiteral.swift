import Foundation
import XCTest

@testable import Beton

class LocaleTest: XCTestCase {
  func test_Locale_from_string_literal() {
    let locale: Locale = "hu_HU"
    XCTAssertEqual("hu_HU", locale.identifier)
  }
}
