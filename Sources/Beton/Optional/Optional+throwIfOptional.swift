infix operator ?!

/// Performs a `nil` checking operation, returning the wrapped value of an
/// [`Optional`](https://developer.apple.com/documentation/swift/optional) instance or throwing the given error.
public func ?!<Value, Error>(optional: Optional<Value>, error: Error) throws -> Value where Error: Swift.Error {
  switch optional {
  case .none: throw error
  case .some(let value): return value
  }
}
