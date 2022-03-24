import XCTest
import Foundation
import Beton

extension OptionalTest {
  func test_throw_if_optional_returns_value() throws {
    let url = try URL(string: "https://21gram.consulting") ?! Error.failure
    XCTAssertEqual(url.description, "https://21gram.consulting")
  }

  func test_throw_if_optional_throws_given_error() throws {
    XCTAssertThrowsError(try URL(string: "Not a URL") ?! Error.failure) { error in
      XCTAssertEqual(error as? Error, Error.failure)
    }
  }
}

fileprivate enum Error: Swift.Error {
  case failure
}
