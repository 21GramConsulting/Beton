import XCTest
import Beton

extension CodeExamples {
  fileprivate struct InvalidInt: Error {
    let value: String
  }

  func test_sequence_sum_with_throw_if_optional() throws {
    let sum = try ["1", "2", "3"].map { try Int($0) ?! InvalidInt(value: $0) }.sum()
    XCTAssertEqual(sum, 6)

    XCTAssertThrowsError(try ["1", "NaN", "3"].map { try Int($0) ?! InvalidInt(value: $0) }.sum())
  }

  func test_sequence_sum() {
    let arraySum = [1.1, 2.2, 3.3, 4.4, 5.5].sum()
    XCTAssertEqual(arraySum, 16.5)

    let rangeSum = (1..<10).sum()
    XCTAssertEqual(rangeSum, 45)

    let setSum = Set(arrayLiteral: 1, 2, 3, 2, 3).sum()
    XCTAssertEqual(setSum, 6)
  }
}
