import XCTest
import Beton

extension CodeExamples {
  func test_sequence_sum() {
    let arraySum = [1.1, 2.2, 3.3, 4.4, 5.5].sum()
    XCTAssertEqual(arraySum, 16.5)

    let rangeSum = (1..<10).sum()
    XCTAssertEqual(rangeSum, 45)

    let setSum = Set(arrayLiteral: 1, 2, 3, 2, 3).sum()
    XCTAssertEqual(setSum, 6)
  }
}
