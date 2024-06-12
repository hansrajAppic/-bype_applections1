import 'package:flutter/material.dart';

class CostamContainer extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BoxDecoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;
  final Clip clipBehavior;
  final BoxShape shape;

  const CostamContainer({
    Key? key,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration != null
          ? decoration!.copyWith(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(69, 143, 145, 135),
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(12), // optional border radius
              shape: shape,
            )
          : BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(69, 143, 145, 135),
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(12), // optional border radius
              shape: shape,
            ),
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      child: child,
      clipBehavior: clipBehavior,
    );
  }
}
