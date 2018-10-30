import 'package:flutter/material.dart';

/// A shape with a notch in its outline.
///
/// Typically used as the outline of a 'host' widget to make a notch that
/// accomodates a 'guest' widget. e.g the [BottomAppBar] may have a notch to
/// accomodate the [FloatingActionBar].

/// See also: [ShapeBorder], which defines a shaped border without a dynamic
/// notch.


/// A rectangle with a smooth circular notch.
class DiamondNotched implements NotchedShape {
  /// Creates a `CircularNotchedRectangle`.
  ///
  /// The same object can be used to create multiple shapes.
  const DiamondNotched();

  /// Creates a [Path] that describes a rectangle with a smooth circular notch.
  ///
  /// `host` is the bounding box for the returned shape. Conceptually this is
  /// the rectangle to which the notch will be applied.
  ///
  /// `guest` is the bounding box of a circle that the notch accomodates. All
  /// points in the circle bounded by `guest` will be outside of the returned
  /// path.
  ///
  /// The notch is curve that smoothly connects the host's top edge and
  /// the guest circle.
  // TODO(amirh): add an example diagram here.
  @override
  Path getOuterPath(Rect host, Rect guest) {
    if (!host.overlaps(guest))
      return Path()..addRect(host);
    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(guest.left, host.top)
      ..lineTo(guest.center.dx, guest.bottom)
      ..lineTo(guest.right, host.top)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}
class CustomBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only();

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 2.0, rect.top)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}