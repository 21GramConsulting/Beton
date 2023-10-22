import XCTBeton

class XCTBetonExamples: XCTestCase {
  func testMeasureWithAssertionsUsingDefaults() {
    measure {
      let _ = (1..<1000).reduce(0, +)
    }
    XCTAssertMetric(.clock, .timeMonotonic, .average(maximum: 0.002))
  }

  func testMeasureWithAssertionsUsingAdditionalMetrics() {
    let options = XCTMeasureOptions()
    options.iterationCount = 100
    measure(metrics: [XCTCPUMetric(), XCTMemoryMetric()], options: options) {
      let _ = (1..<1000).reduce(0, +)
    }
    XCTAssertMetric(.cpu, .time, .average(maximum: 0.003))
    XCTAssertMetric(.cpu, .cycles, .average(maximum: 7000))
    XCTAssertMetric(.memory, .physical, .average(maximum: 20))
  }

  func testMeasureWithUnconfiguredMetric() {
    measure(metrics: [XCTCPUMetric()]) {
      let _ = (1..<1000).reduce(0, +)
    }
    XCTAssertMetric(.cpu, .time, .average(maximum: 0.003))
    // The following assertion would fail, no memory results collected.
    // XCTAssertMetric(.memory, .physical, .average(maximum: 20))
  }
}
