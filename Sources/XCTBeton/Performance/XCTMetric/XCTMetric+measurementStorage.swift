import Beton
import Foundation

private let measurementStorage = MeasurementStorage()

private final class MeasurementStorage: @unchecked Sendable {
  private let lock = NSLock()
  private var results: [ObjectIdentifier: [XCTPerformanceMeasurement]] = [:]
  private var copyMap: [ObjectIdentifier: ObjectIdentifier] = [:]

  func measurements(for id: ObjectIdentifier) -> [XCTPerformanceMeasurement] {
    lock.lock()
    defer { lock.unlock() }
    return results[id] ?? []
  }

  func store(
    measurements: [XCTPerformanceMeasurement],
    for id: ObjectIdentifier
  ) {
    lock.lock()
    defer { lock.unlock() }
    results[originID(for: id), default: []].append(contentsOf: measurements)
  }

  func remember(copy id: ObjectIdentifier, of originID: ObjectIdentifier) {
    lock.lock()
    defer { lock.unlock() }
    copyMap[id] = originID
  }

  func forget(id: ObjectIdentifier) {
    lock.lock()
    defer { lock.unlock() }
    results[id] = nil
    copyMap[id] = nil
  }

  private func originID(for id: ObjectIdentifier) -> ObjectIdentifier {
    var originID = id
    while let rememberedID = copyMap[originID] {
      originID = rememberedID
    }
    return originID
  }
}

extension XCTMetric {
  public var measurements: [XCTPerformanceMeasurement] {
    measurementStorage.measurements(for: id)
  }
}

extension XCTMetric {
  func storing(measurements: [XCTPerformanceMeasurement]) -> [XCTPerformanceMeasurement] {
    measurementStorage.store(measurements: measurements, for: id)
    return measurements
  }

  func remembering<Copy>(copy: Copy) -> Copy {
    if let copy = copy as? Self {
      measurementStorage.remember(copy: copy.id, of: id)
    }
    return copy
  }

  func forgetSelf() {
    measurementStorage.forget(id: id)
  }
}

extension XCTMetric {
  fileprivate var id: ObjectIdentifier { ObjectIdentifier(self) }
}
