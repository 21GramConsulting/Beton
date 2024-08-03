import XCTBeton

@testable import Beton

class RepeatingTests: XCTestCase {
  enum TestError: Error { case test }
  func testRepeatingSyncMapper() {
    XCTAssertEqual(repeating(count: 3) { $0 + 5 }, [5, 6, 7])
    XCTAssertEqual(repeating(count: 3) { $0 + 10 }, [10, 11, 12])
    XCTAssertEqual(repeating(count: 5) { $0 + 5 }, [5, 6, 7, 8, 9])
    XCTAssertEqual(repeating(count: 5) { $0 + 10 }, [10, 11, 12, 13, 14])
  }

  func testRepeatingSyncMapper_rethrows() {
    XCTAssertThrowsError(try repeating(count: 3) { _ in throw TestError.test })
  }

  func testRepeatingSyncMapper_currying() {
    let threeTimes: RepeatingMapper<Int> = repeating(count: 3)
    let fiveTimes: RepeatingMapper<Int> = repeating(count: 5)
    XCTAssertEqual(threeTimes({ $0 + 5 }), [5, 6, 7])
    XCTAssertEqual(threeTimes({ $0 + 10 }), [10, 11, 12])
    XCTAssertEqual(fiveTimes({ $0 + 5 }), [5, 6, 7, 8, 9])
    XCTAssertEqual(fiveTimes({ $0 + 10 }), [10, 11, 12, 13, 14])
  }

  func testRepeatingSyncMapper_currying_rethrows() {
    let threeTimes: ThrowingRepeatingMap<Int> = repeating(count: 3)
    XCTAssertThrowsError(try threeTimes { _ in throw TestError.test })
  }

  func testRepeatingSyncResolver() {
    XCTAssertEqual(repeating(count: 3, 5), [5, 5, 5])
    XCTAssertEqual(repeating(count: 3, 10), [10, 10, 10])
    XCTAssertEqual(repeating(count: 5, 5), [5, 5, 5, 5, 5])
    XCTAssertEqual(repeating(count: 5, 10), [10, 10, 10, 10, 10])
  }

  func testRepeatingResolver_rethrows() {
    XCTAssertThrowsError(try repeating(count: 3, { throw TestError.test }))
  }

  func testRepeatingResolver_currying() {
    let threeTimes: RepeatingResolver<Int> = repeating(count: 3)
    let fiveTimes: RepeatingResolver<Int> = repeating(count: 5)
    XCTAssertEqual(threeTimes(5), [5, 5, 5])
    XCTAssertEqual(threeTimes(10), [10, 10, 10])
    XCTAssertEqual(fiveTimes(5), [5, 5, 5, 5, 5])
    XCTAssertEqual(fiveTimes(10), [10, 10, 10, 10, 10])
  }

  func testRepeatingResolver_currying_rethrows() {
    let threeTimes: ThrowingRepeatingResolver<Int> = repeating(count: 3)
    XCTAssertThrowsError(
      try threeTimes {
        throw TestError.test
      }
    )
  }

  func testRepeatingSync_sideEffectFocused() {
    var counter = 0

    // swift-format-ignore
    repeating(count: 3, counter += 1)
    XCTAssertEqual(counter, 3)

    // swift-format-ignore
    repeating(count: 5, counter += 2)
    XCTAssertEqual(counter, 13)
  }

  func testRepeatingSync_sideEffectFocused_rethrows() {
    let throwingCallback: () throws -> Void = { throw TestError.test }
    XCTAssertThrowsError(
      try repeating(count: 3) {
        try throwingCallback()
      }
    )
  }

  func testRepeatingAsyncMapper() async throws {
    let map = await repeating(count: 10) { (value: Int) async -> Int in
      value + 5
    }
    for try await item in map {
      XCTAssertEqual(item.result, item.iteration + 5)
    }
  }

  func testRepeatingAsyncResolver() async throws {
    for try await item in await repeating(count: 10, 100) {
      XCTAssertEqual(item.result, 100)
    }
  }

  func testRepeatingAsync_sideEffectFocused() async throws {
    actor Counter {
      var count = 0
      func increment() { count += 1 }
    }
    let counter = Counter()
    await repeating(count: 13, await counter.increment())
    let result = await counter.count
    XCTAssertEqual(result, 13)
  }
}
