infix operator |> : MultiplicationPrecedence

@inlinable
@discardableResult
public func |> <Input, Output>(
  lhs: @autoclosure () throws -> Input,
  rhs: (Input) throws -> Output
) rethrows -> Output {
  try rhs(lhs())
}
