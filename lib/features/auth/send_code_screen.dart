import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:onay_ai_mvp/features/auth/reg_profile_screen.dart';

import '../../theme/theme_helper.dart';

class SendCodeScreen extends StatefulWidget {

  String phone_number;

  SendCodeScreen({super.key, required this.phone_number});

  @override
  State<SendCodeScreen> createState() => _SendCodeScreenState();
}

class _SendCodeScreenState extends State<SendCodeScreen> {



  TextEditingController codeController = TextEditingController();
  FlutterSecureStorage fss = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    codeController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    codeController.removeListener(_updateButtonState);
    codeController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      // Эта функция вызывается каждый раз при изменении текста
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
                onTap: (){
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
              Text('Type a code number', style: theme.textTheme.headlineSmall,),
              SizedBox(height: 12.h,),
              Text('We sent SMS code for verification to +7 \n${widget.phone_number}', style: theme.textTheme.bodyLarge,),
              SizedBox(height: 32.h,),
              TextField(
                controller: codeController,
                keyboardType: TextInputType.number,
                style: theme.textTheme.bodyLarge,
                decoration: InputDecoration(
                  labelText: 'Code number',
                  labelStyle: theme.textTheme.bodySmall,

                  filled: true,
                  fillColor: Color(0XFF2D2E3A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  )
                ),
              ),
              SizedBox(height: 16.h,),
              Text('Resend code after 00:59', style: theme.textTheme.bodySmall,),
              SizedBox(height: 150.h,),
              SizedBox(
                width: 343.w,
                height: 56.h,
                child: TextButton(

                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(codeController.text.isEmpty ? Colors.grey : Color(0xff5F6FFF)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            )
                        )
                    ),
                    onPressed: codeController.text.isEmpty ? null : (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegProfileScreen()));
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
