import Beton
import Foundation
import XCTest

class WtfOperatorTest: XCTestCase {
  func testThrowsIfNil() {
    XCTAssertThrowsError(try stub(nil) ?! StubError.error) {
      XCTAssertEqual($0 as? StubError, StubError.error)
    }
  }

  func testReturnsIfNotNil() {
    XCTAssertEqual(try stub(123) ?! StubError.error, 123)
  }

  func testThrowsIfNil() async throws {
    do {
      let _ = try await (await stub(nil)) ?! StubError.error
      XCTFail("Must have thrown.")
    } catch let error as StubError {
      XCTAssertEqual(error, StubError.error)
    }
  }

  func testReturnsIfNotNil() async throws {
    let actual = try await (await stub(123)) ?! StubError.error
    XCTAssertEqual(actual, 123)
  }

  // MARK: Synchronous WTF Operator without a wrapper
  func testWtfOperatorSyncNoWrapResolves() throws {
    XCTAssertEqual(try throwingStub(123) ?! StubError.error, 123)
  }
  func testWtfOperatorSyncNoWrapFails() throws {
    XCTAssertThrowsError(try throwingStub(StubError.error) ?! StubError.error) {
      XCTAssertEqual($0 as? StubError, StubError.error)
    }
  }

  // MARK: Synchronous WTF Operator with an any wrapper
  func testWtfOperatorSyncWrapAnyResolves() throws {
    XCTAssertEqual(try throwingStub(123) ?! { _ in AnotherStubError.anotherError }, 123)
  }
  func testWtfOperatorSyncWrapAnyFails() throws {
    XCTAssertThrowsError(
      try throwingStub(StubError.error) ?! { _ in AnotherStubError.anotherError }
    ) {
      XCTAssertEqual($0 as? AnotherStubError, .anotherError)
    }
  }

  // MARK: Synchronous WTF Operator with a specialized wrapper
  func testWtfOperatorSyncWrapSpecializedResolves() throws {
    XCTAssertEqual(try throwingStub(123) ?! StubError.init, 123)
  }
  func testWtfOperatorSyncWrapSpecializedFailsCanWrap() throws {
    XCTAssertThrowsError(try throwingStub(StubError.error) ?! StubError.init) {
      XCTAssertEqual($0 as? StubError, .wrappedError(StubError.error))
    }
  }
  func testWtfOperatorSyncWrapSpecializedFailsCantWrap() throws {
    XCTAssertThrowsError(try throwingStub(AnotherStubError.anotherError) ?! StubError.init) {
      XCTAssertEqual($0 as? AnotherStubError, .anotherError)
    }
  }

  // MARK: Asynchronous WTF Operator without a wrapper
  func testWtfOperatorAsyncNoWrapResolves() async throws {
    let actual = try await (await stub(123)) ?! StubError.error
    XCTAssertEqual(actual, 123)
  }
  func testWtfOperatorAsyncNoWrapFails() async throws {
    do {
      let _ = try await (await throwingStub(AnotherStubError.anotherError)) ?! StubError.error
      XCTFail("Must have thrown.")
    } catch let error as StubError {
      XCTAssertEqual(error, StubError.error)
    }
  }

  // MARK: Asynchronous WTF Operator with an any wrapper
  func testWtfOperatorAsyncWrapAnyResolves() async throws {
    let actual = try await (await stub(123)) ?! { _ in StubError.error }
    XCTAssertEqual(actual, 123)
  }
  func testWtfOperatorAsyncWrapAnyFails() async throws {
    do {
      let _ =
        try await (await throwingStub(StubError.error)) ?! { _ in AnotherStubError.anotherError }
      XCTFail("Must have thrown.")
    } catch let error as AnotherStubError {
      XCTAssertEqual(error, .anotherError)
    }
  }

  // MARK: Asynchronous WTF Operator with a specialized wrapper
  func testWtfOperatorAsyncWrapSpecializedResolves() async throws {
    let actual = try await (await stub(123)) ?! StubError.init
    XCTAssertEqual(actual, 123)
  }
  func testWtfOperatorAsyncWrapSpecializedFailsCanWrap() async throws {
    do {
      let _ = try await (await throwingStub(StubError.error)) ?! StubError.init
      XCTFail("Must have thrown.")
    } catch let error as StubError {
      XCTAssertEqual(error, .wrappedError(.error))
    }
  }
  func testWtfOperatorAsyncWrapSpecializedFailsCantWrap() async throws {
    do {
      let _ = try await (await throwingStub(AnotherStubError.anotherError)) ?! StubError.init
      XCTFail("Must have thrown.")
    } catch let error as AnotherStubError {
      XCTAssertEqual(error, .anotherError)
    }
  }
}

private enum StubError: Error, Equatable {
  case error
  indirect case wrappedError(StubError)

  init() { self = .error }
  init(_ error: StubError) { self = .wrappedError(error) }
}

private enum AnotherStubError: Error { case anotherError }

private func stub(_ value: Int?) -> Int? { value }
private func stub(_ value: Int?) async -> Int? { value }

private func throwingStub(_ value: Int) throws -> Int { value }
private func throwingStub(_ value: Int) async throws -> Int { value }
private func throwingStub(_ error: Error) throws -> Int { throw error }
private func throwingStub(_ error: Error) async throws -> Int { throw error }
