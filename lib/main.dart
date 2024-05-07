import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onay_ai_mvp/core/app_export.dart';
import 'package:onay_ai_mvp/features/auth/reg_profile_screen.dart';
import 'package:onay_ai_mvp/features/auth/reg_company_screen.dart';
import 'package:onay_ai_mvp/features/auth/reg_phone_screen.dart';
import 'package:onay_ai_mvp/features/auth/send_code_screen.dart';
import 'package:onay_ai_mvp/features/auth/welcome_screen.dart';
import 'package:onay_ai_mvp/features/bookkeeping/bookkeeping_screen.dart';
import 'package:onay_ai_mvp/features/cfo/cfo_screen.dart';
import 'package:onay_ai_mvp/features/main/main_screen.dart';
import 'package:onay_ai_mvp/features/profile/profile_screen.dart';
import 'package:onay_ai_mvp/features/select_your_bank/select_your_bank_screen.dart';
import 'package:onay_ai_mvp/features/taxes/taxes_screen.dart';
import 'package:onay_ai_mvp/features/taxes/taxes_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // You can use the library anywhere in the app even in theme
          theme: theme,
          home: child,
        );
      },
      child: const WelcomeScreen(),
    );
  }
}