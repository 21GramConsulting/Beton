import Foundation
import XCTest
@testable import Beton

extension URLTest {
  func testInit_stringLiteral() {
    XCTAssertEqual("https://google.com", URL(string: "https://google.com"))
  }
}
