import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }

  TextStyle get sFPro {
    return copyWith(
      fontFamily: 'SF Pro',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyLargeGray500 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyLargeSFProText => theme.textTheme.bodyLarge!.sFProText;
  static get bodyMediumOnErrorContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get bodyMediumSFProText => theme.textTheme.bodyMedium!.sFProText;
  static get bodySmallSFPro => theme.textTheme.bodySmall!.sFPro;
  static get bodySmallSFProOnErrorContainer =>
      theme.textTheme.bodySmall!.sFPro.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get bodySmallSFPro_1 => theme.textTheme.bodySmall!.sFPro;
  static get bodySmallSecondaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
// Headline text style
  static get headlineSmallRed500 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.red500,
      );
}
