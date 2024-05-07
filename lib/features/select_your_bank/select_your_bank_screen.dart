import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onay_ai_mvp/core/app_export.dart';

class SelectYourBankScreen extends StatefulWidget {
  const SelectYourBankScreen({super.key});

  @override
  State<SelectYourBankScreen> createState() => _SelectYourBankScreenState();
}

class _SelectYourBankScreenState extends State<SelectYourBankScreen> {

  List<String> assets = ['assets/bank_icon.svg', 'assets/bank_icon_1.svg', 'assets/bank_icon_2.svg', 'assets/bank_icon_3.svg', 'assets/bank_icon_4.svg', 'assets/bank_icon_5.svg', 'assets/bank_icon_6.svg'];
  List<String> titles = ['HSBC', 'Barclays', 'Lloyd Banks', 'Santander', 'Royal Bank of Scotland', 'NatWest', 'Royal Banl of Scotland'];
  List<String> subtitles = ['www.hsbc.co.uk', 'www.barclays.co.uk', 'www.lloydbanks.co.uk', 'www.santander.co.uk', 'www.rbs.co.uk', 'www.nationwide.co.uk', 'www.revolut.co.uk'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
                  const Spacer(),
                  Center(
                    child: Text(
                      'Integrations',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  const Spacer()
                ],
              ),
              SizedBox(height: 10.h,),
              Text('Select your bank', style: theme.textTheme.headlineSmall,),
              SizedBox(height: 12.h,),
              SearchTextField(fieldValue: (String value) {

              },),
              SizedBox(height: 15.h,),
              SizedBox(
                height: 550.h,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index){
                  return ListTile(
                    leading: SvgPicture.asset(assets[index]),
                    subtitle: Text(subtitles[index], style: theme.textTheme.bodyMedium,),
                    title: Text(titles[index], style: theme.textTheme.bodyLarge,),
                  );
                }),
              )
            ],
          ),
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
      suffixIcon: const Icon(Icons.add),
      backgroundColor: const Color(0x19F6F6F6),
      placeholder: 'Поиск',
      onChanged: (String value) {
        fieldValue('The text has changed to: $value');
      },
      onSubmitted: (String value) {
        fieldValue('Submitted text: $value');
      },
    );
  }
}