import Foundation

public func pow<Unit>(_ x: Measurement<Unit>, _ y: Double) -> Measurement<Unit> {
  Measurement<Unit>(
    value: pow(x.value, y),
    unit: x.unit
  )
}