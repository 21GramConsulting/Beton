import Foundation
import XCTest

@testable import Beton

class PipeTests: XCTestCase {
  enum TestError: Error { case test }

  private func double(_ value: Int) -> Int {
    return value * 2
  }

  func testPipe_returnsTheEndResult() {
    let increment = { $0 + 1 }
    XCTAssertEqual(2 |> increment, 3)
    XCTAssertEqual(
      1
        |> increment
        |> increment
        |> increment,
      4
    )
    XCTAssertEqual(
      1
        |> increment
        |> double
        |> increment
        |> double,
      10
    )
  }

  func testPipe_rethrowsErrors() {
    let increment = { $0 + 1 }
    let failing = { (_: Int) throws -> Int in throw TestError.test }
    XCTAssertThrowsError(try 1 |> increment |> failing)
  }

}
