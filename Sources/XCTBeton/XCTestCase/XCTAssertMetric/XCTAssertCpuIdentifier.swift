import Beton

public enum XCTAssertCpuIdentifier {
  case time
  case cycles
  case instructionsRetired
}

extension XCTAssertCpuIdentifier: XCTAssertMetricIdentifier {
  public typealias RelatedMetric = XCTCPUMetric

  public var identifier: String {
    switch self {
    case .time:                return "com.apple.dt.XCTMetric_CPU.time"
    case .cycles:              return "com.apple.dt.XCTMetric_CPU.cycles"
    case .instructionsRetired: return "com.apple.dt.XCTMetric_CPU.instructions_retired"
    }
  }
}
