import Beton

/// Identifies the type of disk usage you want to make assertion for in a performance test.
///
/// ``XCTStorageMetric`` records the amount of data logically written to the disk in the block argument to
/// ``XCTestCase/measure(metrics:block:)``.To make assertion to these statistics use any of the values of
/// ``XCTAssertDiskIdentifier``.
///
/// - SeeAlso: https://developer.apple.com/documentation/xctest/xctstoragemetric
public enum XCTAssertDiskIdentifier {
  case logicalWrites
}

extension XCTAssertDiskIdentifier: XCTAssertMetricIdentifier {
  public typealias RelatedMetric = XCTStorageMetric

  public var identifier: String {
    switch self {
    case .logicalWrites: return "com.apple.dt.XCTMetric_Disk.logical_writes"
    }
  }
}
