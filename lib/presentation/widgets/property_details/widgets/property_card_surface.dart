import 'package:flutter/material.dart';

class PropertyCardSurface extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double radius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double lightShadowOpacity;
  final double darkShadowOpacity;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final Clip clipBehavior;

  const PropertyCardSurface({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.radius = 16,
    this.backgroundColor,
    this.borderColor,
    this.lightShadowOpacity = 0.02,
    this.darkShadowOpacity = 0.2,
    this.shadowBlurRadius = 8,
    this.shadowOffset = const Offset(0, 4),
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final content = padding == null
        ? child
        : Padding(
            padding: padding!,
            child: child,
          );

    return Container(
      margin: margin,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.cardColor,
        borderRadius: BorderRadius.circular(radius),
        border: borderColor == null ? null : Border.all(color: borderColor!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: theme.brightness == Brightness.light
                  ? lightShadowOpacity
                  : darkShadowOpacity,
            ),
            blurRadius: shadowBlurRadius,
            offset: shadowOffset,
          ),
        ],
      ),
      child: content,
    );
  }
}
