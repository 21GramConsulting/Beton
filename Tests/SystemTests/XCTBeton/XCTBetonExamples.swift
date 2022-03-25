import XCTBeton

class XCTBetonExamples: XCTestCase {
  func test_measure_with_assertions_using_defaults() {
    measure {
      let _ = (1..<1000).reduce(0, +)
    }
    XCTAssertMetric(.clock, .timeMonotonic, .average(maximum: 0.001))
  }
}
