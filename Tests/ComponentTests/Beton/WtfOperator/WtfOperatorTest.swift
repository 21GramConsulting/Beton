import XCTest
import Foundation
import Beton

class WtfOperatorTest: XCTestCase {
  func testThrowsIfNil() {
    XCTAssertThrowsError(try stub(nil) ?!  StubError.error) {
      XCTAssertEqual($0 as? StubError, StubError.error)
    }
  }

  func testReturnsIfNotNil() {
    XCTAssertEqual(try stub(123) ?! StubError.error, 123)
  }

  func testThrowsIfNil() async throws {
    do {
      let _ = try await (await stub(nil)) ?!  StubError.error
      XCTFail("Must have thrown.")
    } catch let error as StubError {
      XCTAssertEqual(error, StubError.error)
    }
  }

  func testReturnsIfNotNil() async throws {
    let actual = try await (await stub(123)) ?! StubError.error
    XCTAssertEqual(actual, 123)
  }
}

fileprivate enum StubError: Error { case error }
fileprivate func stub(_ value: Int?) -> Int? { value }
fileprivate func stub(_ value: Int?) async -> Int? { value }
