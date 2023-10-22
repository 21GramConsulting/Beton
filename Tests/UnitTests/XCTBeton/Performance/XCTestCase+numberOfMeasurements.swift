@testable import XCTBeton

extension XCTestCaseTest {
  func testNumberOfMeasurementsEqualToIterationCount() {
    iterationCountTest(iterations: 3)
  }

  func testIterationCountCanBeZero() {
    iterationCountTest(iterations: 0)
  }

  func testIterationCountCanBeOne() {
    iterationCountTest(iterations: 1)
  }

  private func iterationCountTest(iterations: Int) {
    let options = XCTMeasureOptions()
    options.iterationCount = iterations

    measure(metrics: [XCTClockMetric()], options: options) {}
    let measurements = fetchMeasurement(for: XCTAssertClockIdentifier.timeMonotonic)

    XCTAssertEqual(measurements.count, iterations)
  }
}
