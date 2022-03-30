import Beton

/// Identifies the type of time you want to make assertion for in a performance test.
///
/// ``XCTClockMetric`` measures the total elapsed time during execution of the block argument to
/// ``XCTestCase/measure(metrics:block:)``. To make assertion to these statistics use any of the values of
/// ``XCTAssertClockIdentifier``.
///
/// - SeeAlso: https://developer.apple.com/documentation/xctest/xctclockmetric
public enum XCTAssertClockIdentifier {
  /// Represents monotonic records of time, regardless of changes to the system clock. These result includes time spent
  /// executing code under test, and time when the CPU is idle or running other code.
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
