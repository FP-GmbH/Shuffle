///
/// MIT License
///
/// Copyright (c) 2020 Mac Gallagher
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in all
/// copies or substantial portions of the Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
/// SOFTWARE.
///

import UIKit

public protocol CardAnimatableOptions {
  var maximumRotationAngle: CGFloat { get }
  var relativeReverseSwipeOverlayFadeDuration: Double { get }
  var relativeSwipeOverlayFadeDuration: Double { get }
  var resetSpringDamping: CGFloat { get }
  var totalResetDuration: TimeInterval { get }
  var totalReverseSwipeDuration: TimeInterval { get }
  var totalSwipeDuration: TimeInterval { get }
  var swipeMotionAxis: Axis { get }
}

/// The animation options provided to the internal card animator.
public final class CardAnimationOptions: CardAnimatableOptions {

  /// The static default instance of `CardAnimationOptions`.
  public static let `default`: CardAnimationOptions = CardAnimationOptions()

  public let swipeMotionAxis: Axis

  /// The maximum rotation angle of the card, measured in radians.
  ///
  /// Defined as a value in the range `[0, CGFloat.pi/2]`. Defaults to `CGFloat.pi/10`.
  public let maximumRotationAngle: CGFloat

  /// The duration of the fade animation applied to the overlays after the reverse swipe translation.
  /// Measured relative to the total reverse swipe duration.
  ///
  /// Defined as a value in the range `[0, 1]`. Defaults to `0.15`.
  public let relativeReverseSwipeOverlayFadeDuration: Double

  /// The duration of the fade animation applied to the overlays before the swipe translation.
  /// Measured relative to the total swipe duration.
  ///
  /// Defined as a value in the range `[0, 1]`. Defaults to `0.15`.
  public let relativeSwipeOverlayFadeDuration: Double

  /// The damping coefficient of the spring-like animation applied when a swipe is canceled.
  ///
  /// Defined as a value in the range `[0, 1]`. Defaults to `0.5`
  public let resetSpringDamping: CGFloat

  /// The duration of the spring-like animation applied when a swipe is canceled,
  /// measured in seconds.
  ///
  /// This value must be greater than zero. Defaults to `0.6`.
  public let totalResetDuration: TimeInterval

  /// The total duration of the reverse swipe animation, measured in seconds.
  ///
  /// This value must be greater than zero. Defaults to `0.25`.
  public let totalReverseSwipeDuration: TimeInterval

  /// The total duration of the swipe animation, measured in seconds.
  ///
  /// This value must be greater than zero. Defaults to `0.7`.
  public let totalSwipeDuration: TimeInterval

  public init(maximumRotationAngle: CGFloat = .pi / 10,
              relativeReverseSwipeOverlayFadeDuration: Double = 0.15,
              relativeSwipeOverlayFadeDuration: Double = 0.15,
              resetSpringDamping: CGFloat = 0.5,
              totalResetDuration: TimeInterval = 0.6,
              totalReverseSwipeDuration: TimeInterval = 0.25,
              totalSwipeDuration: TimeInterval = 0.7,
              swipeMotionAxis: Axis = .all) {

    self.maximumRotationAngle = max(-.pi / 2, min(maximumRotationAngle, .pi / 2))
    self.relativeReverseSwipeOverlayFadeDuration = max(0, min(relativeReverseSwipeOverlayFadeDuration, 1))
    self.relativeSwipeOverlayFadeDuration = max(0, min(relativeSwipeOverlayFadeDuration, 1))
    self.resetSpringDamping = max(0, min(resetSpringDamping, 1))
    self.totalResetDuration = max(0, totalResetDuration)
    self.totalReverseSwipeDuration = max(0, totalReverseSwipeDuration)
    self.totalSwipeDuration = max(0, totalSwipeDuration)
    self.swipeMotionAxis = swipeMotionAxis
  }
}
