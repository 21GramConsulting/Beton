import Beton

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
