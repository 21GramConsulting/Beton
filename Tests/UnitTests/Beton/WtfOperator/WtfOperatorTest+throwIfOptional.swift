import XCTest
import Foundation
import Beton

extension WtfOperatorTest {
  func test_throw_if_optional_returns_value() throws {
    let url = try URL(string: "https://21gram.consulting") ?! GenericError()
    XCTAssertEqual(url.description, "https://21gram.consulting")
  }

  func test_throw_if_optional_throws_given_error() throws {
    XCTAssertThrowsError(try URL(string: "Not a URL") ?! GenericError()) { error in
      XCTAssertEqual(error as? GenericError, GenericError())
    }
  }

  func test_throw_if_optional_does_short_circuiting() throws {
    var called = false
    func error() -> Error {
      called = true
      return GenericError()
    }

    let goodNumber = try Int("100") ?! error()

    XCTAssertEqual(goodNumber, 100)
    XCTAssertFalse(called)

    do {
      let _ = try Int("invalid-input") ?! error()
    } catch {
      XCTAssertTrue(called)
    }
  }
}

fileprivate struct GenericError: Error, Equatable {}
