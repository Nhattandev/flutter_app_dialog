import 'package:flutter/material.dart';

/// A [BaseDialogWidget] that wrap  [DialogWidget].
///
/// The [child] argument must not be null.
///
/// Usage:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (BuildContext context) {
///   return BaseDialogWidget(
///   child: InfoDialog(),);
///  });
/// ```
///
class BaseDialogWidget extends StatelessWidget {
  const BaseDialogWidget({
    Key? key,
    this.backgroundColor,
    this.elevation,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.shape,
    required this.child,
    this.verticalSymmetric,
    this.horizontalSymmetric,
  }) : super(key: key);

  final double? verticalSymmetric;

  /// VerticalSymmetric, default value is: 24
  final double? horizontalSymmetric;

  /// HorizontalSymmetric, default value is 20
  final Color? backgroundColor;

  /// Background color of dialog
  final double? elevation;

  /// Elevation default value is [_defaultElevation] = 24

  final Duration insetAnimationDuration;

  /// InsetAnimationDuration
  ///
  /// Default value is Duration(milliseconds: 100)
  final Curve insetAnimationCurve;

  /// InsetAnimationCurve
  ///
  /// Curves.decelerate,
  final ShapeBorder? shape;

  /// Border shape
  final Widget child;

  /// Child of base dialog
  ///
  /// Provide sub type of dialog: Basic, payment, rating, etc
  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)));
  static const double _defaultElevation = 24.0;

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          EdgeInsets.symmetric(
              horizontal: horizontalSymmetric ?? 20,
              vertical: verticalSymmetric ?? 24),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 280.0),
            child: Material(
              color: backgroundColor ??
                  dialogTheme.backgroundColor ??
                  Theme.of(context).dialogBackgroundColor,
              elevation:
                  elevation ?? dialogTheme.elevation ?? _defaultElevation,
              shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
              type: MaterialType.card,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
