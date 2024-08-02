import Foundation

/// Returns a measurement raised to the given power.
///
/// Raising a measurement affects only its value and keeps the original unit.
///
/// ```swift
/// let measurement = pow(Measurement<UnitInformationStorage>(value: 2, unit: .bits), 3)
/// let limit       = Measurement<UnitInformationStorage>(value: 1, unit: .bytes)
/// if limit <= measurement {
///   print("Large enough data: \(measurement)") // Prints: Large enough data: 8.0 bit
/// }
/// ```
public func pow<Unit>(_ x: Measurement<Unit>, _ y: Double) -> Measurement<Unit> {
  Measurement<Unit>(
    value: pow(x.value, y),
    unit: x.unit
  )
}
