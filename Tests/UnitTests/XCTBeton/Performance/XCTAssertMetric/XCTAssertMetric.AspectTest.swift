import Beton
@testable import XCTBeton

class XCTAssertMetric_AspectTest: XCTestCase {
  private func AssertMaximum<Identifier>(
    of: XCTAssertMetric<Identifier>,
    aspect: XCTAssertMetric<Identifier>.Aspect,
    equals: Double
  ) {
    XCTAssertEqual(aspect.maximum, equals)
  }

  func testMaximum() {
    AssertMaximum(of: .clock, aspect: .relativeStandardDeviation(maximum: 123), equals: 123)
    AssertMaximum(of: .clock, aspect: .average(maximum: 123), equals: 123)
    AssertMaximum(of: .disk, aspect: .relativeStandardDeviation(maximum: 123), equals: 123)
    AssertMaximum(of: .disk, aspect: .average(maximum: 123), equals: 123)
    AssertMaximum(of: .memory, aspect: .relativeStandardDeviation(maximum: 123), equals: 123)
    AssertMaximum(of: .memory, aspect: .average(maximum: 123), equals: 123)
    AssertMaximum(of: .cpu, aspect: .relativeStandardDeviation(maximum: 123), equals: 123)
    AssertMaximum(of: .cpu, aspect: .average(maximum: 123), equals: 123)
  }
}