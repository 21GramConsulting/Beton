import Beton
import XCTest

extension CodeExamples {
  fileprivate struct InvalidValue: Error {
    let value: String
  }

  func test_sequence_sum_with_throw_if_optional() throws {
    func parseMeter(_ s: String) throws -> Measurement<UnitLength> {
      Measurement(value: try Double(s) ?! InvalidValue(value: s), unit: .meters)
    }

    let sum = try ["1", "2", "3"].map(parseMeter).sum()
    XCTAssertEqual(sum.description, "6.0 m")

    XCTAssertThrowsError(try ["1", "bad number", "3"].map(parseMeter).sum())
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
