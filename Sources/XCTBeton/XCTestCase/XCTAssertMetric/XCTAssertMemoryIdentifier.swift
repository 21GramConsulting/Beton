import Beton

/// Identifies the type of memory usage you want to make assertion for in a performance test.
///
/// ``XCTMemoryMetric`` compares the memory use before and after running the block argument to a
/// ``XCTestCase/measure(metrics:block:)``, and reports the difference. To make assertion to these statistics
/// use any of the values of ``XCTAssertMemoryIdentifier``.
///
/// - SeeAlso: https://developer.apple.com/documentation/xctest/xctmemorymetric
public enum XCTAssertMemoryIdentifier {
  case physical
  case physicalPeak
}

extension XCTAssertMemoryIdentifier: XCTAssertMetricIdentifier {
  public typealias RelatedMetric = XCTMemoryMetric

  public var identifier: String {
    switch self {
    case .physical:     return "com.apple.dt.XCTMetric_Memory.physical"
    case .physicalPeak: return "com.apple.dt.XCTMetric_Memory.physical_peak"
    }
  }
}
