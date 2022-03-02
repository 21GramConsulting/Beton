import Beton

public enum XCTAssertClockIdentifier {
  case timeMonotonic
}

extension XCTAssertClockIdentifier: XCTAssertMetricIdentifier {
  public typealias RelatedMetric = XCTClockMetric

  public var identifier: String {
    switch self {
    case .timeMonotonic: return "com.apple.dt.XCTMetric_Clock.time.monotonic"
    }
  }
}
