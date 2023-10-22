import Foundation
import XCTest

@testable import Beton

extension URLTest {
  func testInitStringLiteral() {
    XCTAssertEqual("https://google.com", URL(string: "https://google.com"))
  }
}
