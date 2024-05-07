import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onay_ai_mvp/core/app_export.dart';
import 'package:onay_ai_mvp/features/select_your_bank/select_your_bank_screen.dart';

class BookkeepingScreen extends StatefulWidget {
  const BookkeepingScreen({super.key});

  @override
  State<BookkeepingScreen> createState() => _BookkeepingScreenState();
}

class _BookkeepingScreenState extends State<BookkeepingScreen> {

  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('Bookkeeping', style: theme.textTheme.bodyLarge,),
                ),
                SizedBox(height: 16.h,),
                InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectYourBankScreen()));
                    },
                    child: Righticonwrapper(asset: 'assets/bookkeeping_1.svg', title: 'Integrations',)),
                SizedBox(height: 12.h,),
                Righticonwrapper(asset: 'assets/bookkeeping_2.svg', title: 'Entry & Receipts',),
                SizedBox(height: 12.h,),
                Righticonwrapper(asset: 'assets/bookkeeping_3.svg', title: 'For Review'),
                SizedBox(height: 12.h,),
                Righticonwrapper(asset: 'assets/bookkeeping_4.svg', title: 'Find a Bookkeeper'),
                SizedBox(height: 12.h,),
                Righticonwrapper(asset: 'assets/bookkeeping_5.svg', title: 'Pay',),
                SizedBox(height: 12.h,),
                Righticonwrapper(asset: 'assets/bookkeeping_6.svg', title: 'Get Paid',),
                SizedBox(height: 24.h,),
                Text('Timeline', style: theme.textTheme.headlineSmall,),
                SizedBox(height: 12.h,),
                Row(
                  children: [
                    SizedBox(
                      width: 225.w,
                      child: SearchTextField(
                          fieldValue: (String value){
                            setState(() {
                              text = value;
                            });
                          }
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Chips(),
                  ],
                ),
                SizedBox(height: 12.h,),
                Bannerwrapper(title: 'Advertising', company: 'Google Ads', money: '500.00', date: 'Oct 12',),
                SizedBox(height: 12.h,),
                Bannerwrapper(title: 'Advertising', company: 'Google Ads', money: '500.00', date: 'Oct 12',),
                SizedBox(height: 12.h,),
                Bannerwrapper(title: 'Travel', company: 'Uber', money: '6.33', date: 'Oct 12',),
                SizedBox(height: 12.h,),
                Bannerwrapper(title: 'Rent or Lease', company: 'Carter Management', money: '500.00', date: 'Oct 7',),
                SizedBox(height: 12.h,),
                Bannerwrapper(title: 'Dues & Subscriptions', company: 'Rephrase.info', money: '500.00', date: 'Oct 6',),
                SizedBox(height: 20.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Righticonwrapper extends StatelessWidget {
  String asset;
  String title;

  Righticonwrapper({super.key, required this.asset, required this.title});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 72,
          decoration: BoxDecoration(
            color: const Color(0x19F6F6F6),
            borderRadius: BorderRadius.circular(12)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(asset, height: 48.h, width: 48.w,),
              SizedBox(width: 16.w,),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            title,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
class Chips extends StatelessWidget {
  const Chips({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 105.w,
          height: 35.h,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0x19F6F6F6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sort by',
                style: theme.textTheme.bodySmall,
              ),

              const Icon(Icons.arrow_drop_down, color: Colors.white,)
            ],
          ),
        ),
      ],
    );
  }
}

class Bannerwrapper extends StatelessWidget {

  String title;
  String company;
  String money;
  String date;

  Bannerwrapper({super.key, required this.title, required this.money, required this.date, required this.company});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 70,
          decoration: ShapeDecoration(
            color: const Color(0x19F6F6F6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: Text(
                                        title,
                                        style: TextStyle(
                                          color: Color(0xFFA7A7A7),
                                          fontSize: 15,
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    date,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFFA7A7A7),
                                      fontSize: 15,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: Text(
                                        company,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    '-\$$money',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.w,),
                      SvgPicture.asset('assets/bookkeeping_filter.svg'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}