import Foundation

/// Returns the square root of a measurement.
///
/// Square root of a measurement affects only its value and keeps the original unit.
///
/// ```swift
/// let measurement = sqrt(Measurement<UnitInformationStorage>(value: 64, unit: .bits))
/// let limit       = Measurement<UnitInformationStorage>(value: 1, unit: .bytes)
/// if measurement <= limit {
///   print("Small enough data: \(measurement)") // Prints: Small enough data: 8.0 bit
/// }
/// ```
public func sqrt<Unit>(_ x: Measurement<Unit>) -> Measurement<Unit> {
  Measurement<Unit>(
    value: sqrt(x.value),
    unit: x.unit
  )
}
