infix operator ?!

public func ?!<Value, Error>(lhs: Optional<Value>, rhs: Error) throws -> Value where Error: Swift.Error {
  switch lhs {
  case .none: throw rhs
  case .some(let value): return value
  }
}
