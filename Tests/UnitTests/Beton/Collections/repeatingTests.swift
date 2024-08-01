import XCTBeton

@testable import Beton

class RepeatingTests: XCTestCase {
  func testRepeatingSyncMapper() {
    XCTAssertEqual(repeating(count: 3) { $0 + 5 }, [5, 6, 7])
    XCTAssertEqual(repeating(count: 3) { $0 + 10 }, [10, 11, 12])
    XCTAssertEqual(repeating(count: 5) { $0 + 5 }, [5, 6, 7, 8, 9])
    XCTAssertEqual(repeating(count: 5) { $0 + 10 }, [10, 11, 12, 13, 14])
  }

  func testRepeatingSyncResolver() {
    XCTAssertEqual(repeating(count: 3, 5), [5, 5, 5])
    XCTAssertEqual(repeating(count: 3, 10), [10, 10, 10])
    XCTAssertEqual(repeating(count: 5, 5), [5, 5, 5, 5, 5])
    XCTAssertEqual(repeating(count: 5, 10), [10, 10, 10, 10, 10])
  }

  func testRepeatingSyncPerformer() {
    var counter = 0

    // swift-format-ignore
    repeating(count: 3, counter += 1)
    XCTAssertEqual(counter, 3)

    // swift-format-ignore
    repeating(count: 5, counter += 2)
    XCTAssertEqual(counter, 13)
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

  // TODO: got a weird test failure once, better to investigate: {"code":null,"killed":false,"signal":"SIGSEGV","cmd":"/Applications/Xcode.app/Contents/Developer/usr/bin/xctest /Users/rocskaadam/src/21gram.consulting/src/Beton/.build/debug/BetonPackageTests.xctest"}
  func testRepeatingAsyncPerformer() async throws {
    var a = [Int]()
    await repeating(count: 13, a.append(1))
    print(a)
  }
}
