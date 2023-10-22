import Foundation
import AsyncAlgorithms

// MARK: Mappers

/// Runs the provided callback consecutively one after another,
/// passing the current iteration count as an argument,
/// and returning the array of results in iteration order.
/// - Parameters:
///   - count: Number of times to run the given function.
///   - function: The callback to execute mapping its results to the final result.
/// - Returns: An array of all the values returned by the callback.
public func repeating<T>(count: Int, _ function: (Int) -> T) -> [T] {
  (0..<count).map { function($0) }
}

public typealias AsyncRepeatingChannel<T: Sendable> = AsyncChannel<(iteration: Int, result: T)> where T: Sendable
/// Runs the provided callback asynchronously,
/// passing the current iteration count as an argument,
/// and returning an AsyncSequence of the results.
/// **This function is by design out-of-order.**
/// - Parameters:
///   - count: Number of times to run the given function.
///   - function: The callback to execute, mapping results to the final result.
/// - Returns: A channel of results.
public func repeating<T>(
  count: Int,
  _ function: @escaping (Int) async -> T
) async -> AsyncRepeatingChannel<T> where T: Sendable {
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

// MARK: Resolvers

/// Runs the provided callback consecutively one after another, returning the array of results in iteration order.
/// - Parameters:
///   - count: Number of times to run the given function.
///   - function: The callback to execute mapping its results to the final result.
/// - Returns: An array of all the values returned by the callback.
public func repeating<T>(
  count: Int,
  _ function: @autoclosure () -> T
) -> [T] {
  repeating(count: count) { _ in function() }
}

/// Runs the provided callback asynchronously, returning the results.
/// **This function is by design out-of-order.**
/// - Parameters:
///   - count: Number of times to run the given function.
///   - function: The callback to execute mapping its results to the final result.
/// - Returns: A channel of all the values returned by the callback.
public func repeating<T>(
  count: Int,
  _ function: @escaping @autoclosure () async -> T
) async -> AsyncRepeatingChannel<T> where T: Sendable {
  await repeating(count: count) { _ in await function()}
}


// MARK: Performers

/// Runs the provided callback `count` number of times, ignoring its results.
/// - Parameters:
///   - count: Number of times to run the given function.
///   - function: The callback to execute `count` times.
public func repeating(count: Int, _ function: @autoclosure () -> ()) {
  let _ = repeating(count: count) { [function] _ in function() }
}

/// Runs asynchronously the provided callback `count` number of times, ignoring the results.
/// - Parameters:
///   - count: Number of times to run the given function.
///   - function: The callback to execute `count` times
public func repeating(
  count: Int,
  _ function: @autoclosure @escaping () async -> ()
) async {
  let _ = await repeating(count: count) { _ in await function() }
}
