import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onay_ai_mvp/features/auth/reg_phone_screen.dart';

import '../../theme/theme_helper.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 48.w, right: 48.w, top: 38.h),
                child: SizedBox(
                  height: 279.h,
                  width: 279.w,
                  child: SvgPicture.asset('assets/welcome_png.svg'),
                ),
              ),
              SizedBox(height: 39.h,),
              Text('Welcome to Onay', style: theme.textTheme.headlineSmall,),
              SizedBox(height: 12.h,),
              Text('Onay means ‘easy’ in Kazakh. So make your accounting easy and pay-as-you-go',
                style: theme.textTheme.bodyLarge,),
              SizedBox(height: 32.h,),
              SizedBox(
                width: 343.w,
                height: 56.h,
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff5F6FFF)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                          )
                      )
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegPhoneScreen()));
                    },
                    child: Center(
                      child: Text('Get started', style: theme.textTheme.bodyLarge,),
                    )),
              ),
              SizedBox(height: 32.h,),
              Text('or sign in with', style: theme.textTheme.bodyLarge,),
              SizedBox(height: 16.h,),
              SizedBox(
                width: 152.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: theme.primaryColorLight,
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: SvgPicture.asset('assets/apple_icon.svg'),
                      ),
                    ),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: theme.primaryColorLight,
                        shape: BoxShape.circle
                      ),
                      child: SvgPicture.asset('assets/google_icon.svg'),
                    ),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: theme.primaryColorLight,
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: SvgPicture.asset('assets/facebook_icon.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45.h,),
              Text('By registering, I accept the terms of use and personal data collection and processing policy',
              style: theme.textTheme.bodySmall,)
            ],
          ),
        ),
      ),
    );
  }
}
