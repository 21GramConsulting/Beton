import Foundation
import XCTest

@testable import Beton

class Notification_NameTests: XCTestCase {
  func test_init_stringLiteral() {
    let name: Notification.Name = "test"
    XCTAssertEqual(name.rawValue, "test")
  }
}
