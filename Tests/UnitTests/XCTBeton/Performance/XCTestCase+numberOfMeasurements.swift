@testable import XCTBeton

extension XCTestCaseTest {
  func test_number_of_measurements_equal_to_iteration_count() {
    iterationCountTest(iterations: 3)
  }

  func test_iteration_count_can_be_zero() {
    iterationCountTest(iterations: 0)
  }

  func test_iteration_count_can_be_one() {
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
