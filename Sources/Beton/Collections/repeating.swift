import AsyncAlgorithms
import Foundation

@discardableResult
@inlinable
public func repeating<T>(
  count: Int,
  _ function: (Int) throws -> T
) rethrows -> [T] {
  var result = [T]()
  result.reserveCapacity(count)
  try (0..<count).forEach { index in
    result.append(try function(index))
  }
  return result
}

public typealias RepeatingMapper<T> = ((Int) -> T) -> [T]
@discardableResult
@inlinable
public func repeating<T>(
  count: Int
) -> RepeatingMapper<T> {
  { function in repeating(count: count, function) }
}

public typealias ThrowingRepeatingMap<T> = ((Int) throws -> T) throws -> [T]
@discardableResult
@inlinable
public func repeating<T>(
  count: Int
) -> ThrowingRepeatingMap<T> {
  { try repeating(count: count, $0) }
}

public typealias AsyncRepeatingChannel<T: Sendable> = AsyncChannel<(iteration: Int, result: T)>
@discardableResult
@inlinable
public func repeating<T: Sendable>(
  count: Int,
  _ function: @Sendable @escaping (Int) async -> T
) async -> AsyncRepeatingChannel<T> {
  let channel = AsyncRepeatingChannel<T>()

  Task {
    await withTaskGroup(of: Void.self) { group in
      for i in 0..<count {
        group.addTask { await channel.send((i, function(i))) }
      }
    }
    channel.finish()
  }

  return channel
}

@discardableResult
@inlinable
public func repeating<T>(
  count: Int,
  _ function: @autoclosure @escaping () throws -> T
) rethrows -> [T] {
  try repeating(count: count) { _ in try function() }
}

@discardableResult
@inlinable
public func repeating<T>(
  count: Int,
  _ function: @escaping () throws -> T
) rethrows -> [T] {
  try repeating(count: count) { _ in try function() }
}

public typealias RepeatingResolver<T> = (@escaping @autoclosure () -> T) -> [T]
@discardableResult
@inlinable
public func repeating<T>(
  count: Int
) -> RepeatingResolver<T> {
  { f in repeating(count: count) { _ in f() } }
}

public typealias ThrowingRepeatingResolver<T> = (
  @escaping () throws -> T
) throws -> [T]
@discardableResult
@inlinable
public func repeating<T>(
  count: Int
) -> ThrowingRepeatingResolver<T> {
  { f in try repeating(count: count) { _ in try f() } }
}

@discardableResult
@inlinable
public func repeating<T: Sendable>(
  count: Int,
  _ function: @Sendable @escaping @autoclosure () async -> T
) async -> AsyncRepeatingChannel<T> {
  await repeating(count: count) { _ in await function() }
}
