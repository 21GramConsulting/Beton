import Beton

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
