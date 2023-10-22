import Beton

private var results: [ObjectIdentifier: [XCTPerformanceMeasurement]] = [:]
private var copyMap: [ObjectIdentifier: ObjectIdentifier] = [:]

extension XCTMetric {
  public var measurements: [XCTPerformanceMeasurement] { results[id] ?? [] }
}

extension XCTMetric {
  func storing(measurements: [XCTPerformanceMeasurement]) -> [XCTPerformanceMeasurement] {
    results[originId, default: []].append(contentsOf: measurements)
    return measurements
  }

  func remembering<Copy>(copy: Copy) -> Copy {
    if let copy = copy as? Self { copyMap[copy.id] = id }
    return copy
  }

  func forgetSelf() {
    results[id] = nil
    copyMap[id] = nil
  }
}

extension XCTMetric {
  fileprivate var id: ObjectIdentifier { ObjectIdentifier(self) }

  fileprivate var originId: ObjectIdentifier {
    var originId = id
    while copyMap[originId] != nil { originId = copyMap[originId]! }
    return originId
  }

}
