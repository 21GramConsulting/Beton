infix operator |> : MultiplicationPrecedence

@inlinable
@discardableResult
public func |> <Input, Output>(
  lhs: @autoclosure () throws -> Input,
  rhs: (Input) throws -> Output
) rethrows -> Output {
  try rhs(lhs())
}

@inlinable
@discardableResult
public func |> <Input, Output>(
  lhs: @autoclosure () async throws -> Input,
  rhs: (Input) async throws -> Output
) async rethrows -> Output {
  try await rhs(lhs())
}
