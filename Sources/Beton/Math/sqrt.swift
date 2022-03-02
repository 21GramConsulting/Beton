import Foundation

public func sqrt<Unit>(_ x: Measurement<Unit>) -> Measurement<Unit> {
  Measurement<Unit>(
    value: sqrt(x.value),
    unit: x.unit
  )
}