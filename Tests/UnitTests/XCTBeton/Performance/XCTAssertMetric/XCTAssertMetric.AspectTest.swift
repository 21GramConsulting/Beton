import Beton

@testable import XCTBeton

class XCTAssertMetric_AspectTest: XCTestCase {
  private func assertMaximum<Identifier>(
    of: XCTAssertMetric<Identifier>,
    aspect: XCTAssertMetric<Identifier>.Aspect,
    equals: Double
  ) {
    XCTAssertEqual(aspect.maximum, equals)
  }

  func testMaximum() {
    assertMaximum(of: .clock, aspect: .relativeStandardDeviation(maximum: 123), equals: 123)
    assertMaximum(of: .clock, aspect: .average(maximum: 123), equals: 123)
    assertMaximum(of: .disk, aspect: .relativeStandardDeviation(maximum: 123), equals: 123)
    assertMaximum(of: .disk, aspect: .average(maximum: 123), equals: 123)
    assertMaximum(of: .memory, aspect: .relativeStandardDeviation(maximum: 123), equals: 123)
    assertMaximum(of: .memory, aspect: .average(maximum: 123), equals: 123)
    assertMaximum(of: .cpu, aspect: .relativeStandardDeviation(maximum: 123), equals: 123)
    assertMaximum(of: .cpu, aspect: .average(maximum: 123), equals: 123)
  }
}
