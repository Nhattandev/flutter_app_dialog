import 'package:flutter/material.dart';

/// A [BaseDialogWidget] that wrap  [DialogWidget].
///
class BaseDialogWidget extends StatelessWidget {
  const BaseDialogWidget({
    Key key,
    this.backgroundColor,
    this.elevation,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.shape,
    this.child,
    this.verticalSymmetric,
    this.horizontalSymmetric,
  }) : super(key: key);

  final double verticalSymmetric;
  final double horizontalSymmetric;

  final Color backgroundColor;

  final double elevation;

  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;
  final ShapeBorder shape;

  final Widget child;
  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)));
  static const double _defaultElevation = 24.0;

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          EdgeInsets.symmetric(horizontal: horizontalSymmetric ?? 20, vertical: verticalSymmetric ?? 24),
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
              color: backgroundColor ?? dialogTheme.backgroundColor ?? Theme.of(context).dialogBackgroundColor,
              elevation: elevation ?? dialogTheme.elevation ?? _defaultElevation,
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
