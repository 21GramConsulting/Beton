import Beton

fileprivate var results: [ObjectIdentifier: [XCTPerformanceMeasurement]] = [:]
fileprivate var copyMap: [ObjectIdentifier: ObjectIdentifier]            = [:]

public extension XCTMetric {
  var measurements: [XCTPerformanceMeasurement] { results[id] ?? [] }
}

internal extension XCTMetric {
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

fileprivate extension XCTMetric {
  var id: ObjectIdentifier { ObjectIdentifier(self) }

  var originId: ObjectIdentifier {
    var originId = id
    while copyMap[originId] != nil { originId = copyMap[originId]! }
    return originId
  }

}
