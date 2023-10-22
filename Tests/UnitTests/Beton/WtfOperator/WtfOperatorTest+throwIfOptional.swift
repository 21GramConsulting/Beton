import Beton
import Foundation
import XCTest

extension WtfOperatorTest {
  func testThrowIfOptionalReturnsValue() throws {
    let url = try URL(string: "https://21gram.consulting") ?! GenericError()
    XCTAssertEqual(url.description, "https://21gram.consulting")
  }

  func testThrowIfOptionalThrowsGivenError() throws {
    XCTAssertThrowsError(try Optional<Any>.none ?! GenericError()) { error in
      XCTAssertEqual(error as? GenericError, GenericError())
    }
  }

  func testThrowIfOptionalDoesShortCircuiting() throws {
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

private struct GenericError: Error, Equatable {}
