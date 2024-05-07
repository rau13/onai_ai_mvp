import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/app_export.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 17.sp,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray500,
          fontSize: 15.sp,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray500,
          fontSize: 12.sp,
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 24.sp,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 20.sp,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 17.sp,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray500,
          fontSize: 15.sp,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primaryContainer: Color(0XFF22209A),
    secondaryContainer: Color(0XFF818EFF),
    errorContainer: Color(0XFF9A207F),
    onError: Color(0XFF048172),
    onErrorContainer: Color(0X19FFFFFF),
    onPrimary: Color(0XFF0C0C1D),
    onPrimaryContainer: Color(0XFFFFDEF7),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Black
  Color get black900 => Color(0XFF000000);
// BlueGray
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray900 => Color(0XFF2D2E3A);
// Cyan
  Color get cyan400 => Color(0XFF30C6E0);
  Color get cyan50 => Color(0XFFC5FFF8);
// DeepPurple
  Color get deepPurple900 => Color(0XFF23209A);
// Gray
  Color get gray10019 => Color(0X19F6F6F6);
  Color get gray500 => Color(0XFFA7A7A7);
// Green
  Color get green50 => Color(0XFFDEFFE3);
  Color get green5001 => Color(0XFFDDFFE3);
  Color get green700 => Color(0XFF279137);
  Color get greenA400 => Color(0XFF38FA7A);
// Indigo
  Color get indigo100 => Color(0XFFBEBCFF);
// LightBlue
  Color get lightBlue100 => Color(0XFFACE6FF);
  Color get lightBlue800 => Color(0XFF0C77A5);
// Pink
  Color get pink50 => Color(0XFFFFDEE1);
// Red
  Color get red500 => Color(0XFFFA3939);
  Color get red800 => Color(0XFFAE2636);
}
