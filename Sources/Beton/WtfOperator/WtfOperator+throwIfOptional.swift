/// Performs a `nil` checking operation, returning the wrapped value of an
/// [`Optional`](https://developer.apple.com/documentation/swift/optional) instance or throwing the given error.
///
/// The ``?!`` operator unwraps the left-hand side if it has a value, or it throws the right-hand side. The result of
/// this operation will have the non-optional type of the left-hand side’s `Wrapped` type.
///
/// Like the `??` operator, this operator uses short-circuit evaluation. For example:
///
/// ```swift
/// struct GenericError: Error {}
///
/// var called = false
/// func error() -> Error {
///   called = true
///   return GenericError()
/// }
///
/// let goodNumber = try Int("100") ?! error()
/// // goodNumber == 100
/// // called == false
///
/// do {
///   let _ = try Int("invalid-input") ?! error() // Throws GenericError
/// } catch {
///   // called == true
/// }
/// ```
/// - Parameters:
///   - optional: An optional value.
///   - error: The error to throw if the optional value is `nil`.
public func ?!<Value, Error>(optional: Optional<Value>, error: @autoclosure () -> Error) throws -> Value where Error: Swift.Error {
  switch optional {
  case .none: throw error()
  case .some(let value): return value
  }
}
