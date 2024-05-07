import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onay_ai_mvp/core/app_export.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 165.w,
              height: 124.h,
              decoration: BoxDecoration(
                color: Color(0x19F6F6F6),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/edit.svg'),
                  Text('Start typing\nsomething', style: theme.textTheme.bodyMedium,)
                ],
              ),
            ),
          ),
        ],

      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 76.h,
        color: Color(0xff1E1F25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('assets/Icon color.svg'),
            SvgPicture.asset('assets/Icon color-1.svg'),
            SvgPicture.asset('assets/folder_add.svg'),
            Container(
              height: 36.h,
              width: 199.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: SearchTextField(fieldValue: (value){
              
              }),
            ),
            SvgPicture.asset('assets/headphones.svg')
          ],
        ),
      ),
    );
  }
}
class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.fieldValue,
  });

  final ValueChanged<String> fieldValue;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      suffixIcon: Icon(Icons.mic),
      backgroundColor: const Color(0x19F6F6F6),
      placeholder: 'Message',
      onChanged: (String value) {
        fieldValue('The text has changed to: $value');
      },
      onSubmitted: (String value) {
        fieldValue('Submitted text: $value');
      },
    );
  }
}
