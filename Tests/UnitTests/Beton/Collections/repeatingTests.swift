@testable import Beton
import XCTBeton

class RepeatingTests: XCTestCase {
  func testRepeating_sync_mapper () {
    XCTAssertEqual(repeating(count: 3) { $0 + 5 }, [5, 6,  7])
    XCTAssertEqual(repeating(count: 3) { $0 + 10 }, [10, 11,  12])
    XCTAssertEqual(repeating(count: 5) { $0 + 5 }, [5, 6,  7, 8, 9])
    XCTAssertEqual(repeating(count: 5) { $0 + 10 }, [10, 11,  12, 13, 14])
  }

  func testRepeating_sync_resolver () {
    XCTAssertEqual(repeating(count: 3, 5), [5, 5, 5,])
    XCTAssertEqual(repeating(count: 3, 10), [10, 10, 10])
    XCTAssertEqual(repeating(count: 5, 5), [5, 5, 5, 5, 5,])
    XCTAssertEqual(repeating(count: 5, 10), [10, 10, 10, 10, 10])
  }

  func testRepeating_sync_performer() {
    var counter = 0

    repeating(count: 3, counter += 1)
    XCTAssertEqual(counter, 3)

    repeating(count: 5, counter += 2)
    XCTAssertEqual(counter, 13)
  }

  func testRepeating_async_mapper() async throws {
    for try await item in await repeating(count: 10, { $0 + 5 }) {
      XCTAssertEqual(item.result, item.iteration + 5)
    }
  }

  func testRepeating_async_resolver() async throws {
    for try await item in await repeating(count: 10, 100) {
      XCTAssertEqual(item.result, 100)
    }
  }

  func testRepeating_async_performer() async throws {
    var a = [Int]()
    await repeating(count: 13, a.append(1))
    print(a)
  }
}
