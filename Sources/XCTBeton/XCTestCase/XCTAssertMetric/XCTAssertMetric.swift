import Beton

public struct XCTAssertMetric<Identifier> where Identifier: XCTAssertMetricIdentifier {}
public extension XCTAssertMetric {
  static var cpu:    XCTAssertMetric<XCTAssertCpuIdentifier> { .init() }
  static var memory: XCTAssertMetric<XCTAssertMemoryIdentifier> { .init() }
  static var disk:   XCTAssertMetric<XCTAssertDiskIdentifier> { .init() }
  static var clock:  XCTAssertMetric<XCTAssertClockIdentifier> { .init() }
}

public extension XCTAssertMetric {
  enum Aspect {
    case average(maximum: Double)
    case relativeStandardDeviation(maximum: Double)
  }
}

internal extension XCTAssertMetric.Aspect {
  var maximum: Double {
    switch self {
    case let .average(maximum):                   return maximum
    case let .relativeStandardDeviation(maximum): return maximum
    }
  }
}