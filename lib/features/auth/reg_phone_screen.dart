import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:onay_ai_mvp/features/auth/send_code_screen.dart';

import '../../theme/theme_helper.dart';

class RegPhoneScreen extends StatefulWidget {
  const RegPhoneScreen({super.key});

  @override
  State<RegPhoneScreen> createState() => _RegPhoneScreenState();
}

class _RegPhoneScreenState extends State<RegPhoneScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'KZ';
  PhoneNumber number = PhoneNumber(isoCode: 'KZ');
  FlutterSecureStorage fss = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    controller.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    controller.removeListener(_updateButtonState);
    controller.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  width: 86.w,
                  height: 42.h,
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  ),
                ),
              ),
              SizedBox(height: 12.h,),
              Text('Your phone number', style: theme.textTheme.headlineSmall,),
              SizedBox(height: 12.h,),
              Text('We\'ll send SMS code for verification', style: theme.textTheme.bodyLarge,),
              SizedBox(height: 32.h,),
              Container(
                width: 331.w,
                height: 62.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0XFF2D2E3A),
                ),
                child: Stack(
                  children: [
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        useBottomSheetSafeArea: true,
                      ),
                      inputDecoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 10, left: 0),
                          border: InputBorder.none,
                          labelText: 'Phone number',
                          labelStyle: theme.textTheme.bodySmall
                      ),
                      textStyle: theme.textTheme.bodyLarge,
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.white),
                      initialValue: number,
                      textFieldController: controller,
                      formatInput: true,
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                    Positioned(
                        left: 85.w,
                        top: 5.h,
                        child: Container(
                          height: 40.h,
                          width: 1.w,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 260.h,),
              SizedBox(
                width: 343.w,
                height: 56.h,
                child: TextButton(

                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>( controller.text.isEmpty ? Colors.grey : Color(0xff5F6FFF)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            )
                        )
                    ),
                    onPressed:controller.text.isEmpty ? null : () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SendCodeScreen(phone_number: controller.text,)));
                    },
                    child: Center(
                      child: Text('Sign in', style: theme.textTheme.bodyLarge,),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
