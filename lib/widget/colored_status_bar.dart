import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColoredStatusBar extends StatelessWidget {
  const ColoredStatusBar({
    Key? key,
    this.color = Colors.white,
    this.brightness = Brightness.dark,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    final androidIconBrightness =
    brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: androidIconBrightness,
        statusBarBrightness: brightness,
      ),
      child: child,
    );
  }
}