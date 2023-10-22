import Foundation
import XCTest

@testable import Beton

class LocaleTest: XCTestCase {
  func testLocaleFromStringLiteral() {
    let locale: Locale = "hu_HU"
    XCTAssertEqual("hu_HU", locale.identifier)
  }
}
