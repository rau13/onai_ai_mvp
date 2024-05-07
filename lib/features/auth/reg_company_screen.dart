import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:onay_ai_mvp/features/auth/send_code_screen.dart';
import 'package:onay_ai_mvp/features/main/main_screen.dart';
import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class RegCompany extends StatefulWidget {
  RegCompany({Key? key})
      : super(
          key: key,
        );

  @override
  State<RegCompany> createState() => _RegCompanyState();
}

class _RegCompanyState extends State<RegCompany> {
  TextEditingController userProfileController = TextEditingController();

  List<String> dropdownItemList = ["California", "New York", "Boston"];

  TextEditingController companyController = TextEditingController();

  TextEditingController companyDescController = TextEditingController();

  FlutterSecureStorage fss = FlutterSecureStorage();

  String? dropDownValue =  null;

  var items = [
    'California',
    'New York',
    'Boston',
  ];

  @override
  void initState() {
    super.initState();
    companyController.addListener(_updateButtonState);
    companyDescController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    companyController.removeListener(_updateButtonState);
    companyDescController.removeListener(_updateButtonState);
    companyController.dispose();
    companyDescController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      // Эта функция вызывается каждый раз при изменении текста
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Your company",
                  style: theme.textTheme.headlineSmall,
                ),
                SizedBox(height: 12.h),
                Text(
                  "Now tell us more about your company",
                  style: CustomTextStyles.bodyLargeSFProText,
                ),
                SizedBox(height: 31.h),
                TextField(
                  controller: companyController,
                  style: theme.textTheme.bodyLarge,
                  decoration: InputDecoration(
                      labelText: 'Company Name',
                      labelStyle: theme.textTheme.bodySmall,
                      filled: true,
                      fillColor: Color(0XFF2D2E3A),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
                ),
                SizedBox(height: 20.h),
                InputDecorator(
                  baseStyle: theme.textTheme.bodyLarge,
                  decoration: InputDecoration(
                      fillColor: Color(0XFF2D2E3A),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color(0XFF2D2E3A),
                          ))),
                  child: SizedBox(
                    height: 30,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text('Select state', style: theme.textTheme.bodySmall,),
                        dropdownColor: Colors.transparent,
                        value: dropDownValue,
                        items: items.map((String? items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items!, style: theme.textTheme.bodyLarge,),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextField(
                  controller: companyDescController,
                  style: theme.textTheme.bodyLarge,
                  decoration: InputDecoration(
                      labelText: 'Company description',
                      labelStyle: theme.textTheme.bodySmall,
                      filled: true,
                      fillColor: Color(0XFF2D2E3A),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
                ),
                SizedBox(height: 20.h),
                TextField(
                  style: theme.textTheme.bodyLarge,
                  maxLines: 6,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 12.w,
                      ),
                      labelText: 'What is the main problem you want to choose with Onay?',
                      labelStyle: theme.textTheme.bodySmall,
                      filled: true,
                      fillColor: Color(0XFF2D2E3A),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
                ),
                SizedBox(height: 5.h)
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
          child: SizedBox(
            width: double.infinity,
            height: 56.h,
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(_areFieldsFilled() ? Color(0xff5F6FFF) : Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ))),
                onPressed: _areFieldsFilled() ? () {
                  fss.write(key: 'companyDesc', value: companyDescController.text);
                  fss.write(key: 'companyName', value: companyController.text);
                  fss.write(key: 'state', value: dropDownValue);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()));
                } : null,
                child: Center(
                  child: Text(
                    'Next',
                    style: theme.textTheme.bodyLarge,
                  ),
                )),
          ),
        ),
      ),
    );
  }
  bool _areFieldsFilled() {
    return companyController.text.isNotEmpty && companyDescController.text.isNotEmpty && dropDownValue != null;
  }

}
