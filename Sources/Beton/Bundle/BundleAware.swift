import Foundation

/// A utility protocol for any value that can be associated with a bundle.
///
/// This is useful for values that need to be associated with a bundle, but
/// don't have a bundle of their own.
///
/// Typically this is handy in server-side environments.

public protocol BundleAware {
  var bundle: Bundle? { get set }
}
