import 'package:flutter/material.dart';

class FontM3 {
  static BuildContext? _context;

  static void init(BuildContext context) {
    _context = context;
  }

  static TextTheme get _t {
    final ctx = _context;
    if (ctx == null) return const TextTheme();
    return Theme.of(ctx).textTheme;
  }

  static TextStyle get bodySmall => _t.bodySmall ?? const TextStyle();

  static TextStyle get bodyMedium => _t.bodyMedium ?? const TextStyle();

  static TextStyle bodyMediumEmphasized({
    Color? color,
    FontWeight? fontWeight,
  }) {
    final base = bodyMedium;
    return base.copyWith(
      color: color ?? base.color,
      fontWeight: fontWeight ?? base.fontWeight,
    );
  }

  static TextStyle bodySmallEmphasized({Color? color, FontWeight? fontWeight}) {
    final base = bodySmall;
    return base.copyWith(
      color: color ?? base.color,
      fontWeight: fontWeight ?? base.fontWeight,
    );
  }
}

// class FontM3 {
//   final BuildContext context;

//   FontM3(this.context);

//   /* Versi awal */
//   // TextTheme get _textTheme => Theme.of(context).textTheme;

//   /* Versi global awal */
//   // static TextTheme get _textTheme =>
//   //     Theme.of(Get.currentContext!).textTheme;

//   /* Versi global aman */
//   static TextTheme get _textTheme {
//     final ctx = Get.currentContext;
//     if (ctx == null) return const TextTheme();
//     return Theme.of(ctx).textTheme;
//   }

//   // BASE STYLE (RAW)
//   static TextStyle? displayLarge() => _textTheme.displayLarge;
//   static TextStyle? displayMedium() => _textTheme.displayMedium;
//   static TextStyle? displaySmall() => _textTheme.displaySmall;

//   static TextStyle? headlineLarge() => _textTheme.headlineLarge;
//   static TextStyle? headlineMedium() => _textTheme.headlineMedium;
//   static TextStyle? headlineSmall() => _textTheme.headlineSmall;

//   static TextStyle? titleLarge() => _textTheme.titleLarge;
//   static TextStyle? titleMedium() => _textTheme.titleMedium;
//   static TextStyle? titleSmall() => _textTheme.titleSmall;

//   static TextStyle? bodyLarge() => _textTheme.bodyLarge;
//   static TextStyle? bodyMedium() => _textTheme.bodyMedium;
//   static TextStyle? bodySmall() => _textTheme.bodySmall;

//   static TextStyle? labelLarge() => _textTheme.labelLarge;
//   static TextStyle? labelMedium() => _textTheme.labelMedium;
//   static TextStyle? labelSmall() => _textTheme.labelSmall;

//   // PRIVATE EMPHASIZED CORE
//   static TextStyle _emphasized(
//     TextStyle base, {
//     Color? color,
//     String? fontFamily,
//     double? fontSize,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//     double? letterSpacing,
//     double? wordSpacing,
//     double? height,
//     TextDecoration? decoration,
//     Color? decorationColor,
//   }) {
//     return base.copyWith(
//       color: color ?? base.color,
//       fontFamily: fontFamily ?? base.fontFamily,
//       fontSize: fontSize ?? base.fontSize,
//       fontWeight: fontWeight ?? base.fontWeight,
//       fontStyle: fontStyle ?? base.fontStyle,
//       letterSpacing: letterSpacing ?? base.letterSpacing,
//       wordSpacing: wordSpacing ?? base.wordSpacing,
//       height: height ?? base.height,
//       decoration: decoration,
//       decorationColor: decorationColor,
//     );
//   }

//   // EMPHASIZED (PUBLIC API)
//   static TextStyle displayLargeEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.displayLarge!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle displayMediumEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.displayMedium!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle displaySmallEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.displaySmall!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle headlineLargeEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.headlineLarge!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle headlineMediumEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.headlineMedium!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle headlineSmallEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.headlineSmall!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle titleLargeEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.titleLarge!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle titleMediumEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.titleMedium!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle titleSmallEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.titleSmall!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle bodyLargeEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.bodyLarge!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle bodyMediumEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.bodyMedium!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle bodySmallEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.bodySmall!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle labelLargeEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.labelLarge!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle labelMediumEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.labelMedium!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );

//   static TextStyle labelSmallEmphasized({
//     Color? color,
//     FontWeight? fontWeight,
//     FontStyle? fontStyle,
//   }) => _emphasized(
//     _textTheme.labelSmall!,
//     color: color,
//     fontWeight: fontWeight,
//     fontStyle: fontStyle,
//   );
// }
