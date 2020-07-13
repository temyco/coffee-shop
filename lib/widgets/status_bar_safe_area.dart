import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/resources/app_colors.dart';

/// Widget that wraps [SafeArea] into [Container] and [AnnotatedRegion], to
/// provide a possibility to change Status Bar color on both Android and iOS platforms.
///
/// It is achieved by using provided [statusBarColor] as a background color of
/// full screen size [Container], that is then displaying [child] inside of [SafeArea].
///
/// It will work by default on iOS, where native status bar is transparent,
/// but on Android bar is semitransparent, so given [statusBarColor] will be darker.
///
/// To prevent this, we must make status bar color also transparent in Android.
/// That's why this widget is overriding [SystemUiOverlayStyle.statusBarColor]
/// of passed [systemOverlayStyle] to [AppColors.transparent], and then applies it
/// with [AnnotatedRegion].
///
/// Also [systemOverlayStyle] can be used to control all other
/// parameters of [SystemUiOverlayStyle].
///
class StatusBarSafeArea extends StatelessWidget {
  final Color statusBarColor;
  final SystemUiOverlayStyle systemOverlayStyle;
  final Widget child;

  StatusBarSafeArea({
    @required this.statusBarColor,
    @required this.systemOverlayStyle,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemOverlayStyle.copyWith(statusBarColor: AppColors.transparent),
      child: Container(
        color: statusBarColor,
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
