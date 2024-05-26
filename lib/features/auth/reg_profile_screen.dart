import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:onay_ai_mvp/features/auth/reg_company_screen.dart';
import 'package:onay_ai_mvp/features/auth/send_code_screen.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_radio_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class RegProfileScreen extends StatefulWidget {
  const RegProfileScreen({super.key});

  @override
  State<RegProfileScreen> createState() => _RegProfileScreenState();
}

class _RegProfileScreenState extends State<RegProfileScreen> {

  TextEditingController surnameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController birthDateController = TextEditingController();

  FlutterSecureStorage fss = const FlutterSecureStorage();

  String genderValue = "";

  List<String> radioList = ["lbl_male", "lbl_female"];

  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.addListener(_updateButtonState);
    surnameController.addListener(_updateButtonState);
    birthDateController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    nameController.removeListener(_updateButtonState);
    surnameController.removeListener(_updateButtonState);
    birthDateController.removeListener(_updateButtonState);
    nameController.dispose();
    surnameController.dispose();
    birthDateController.dispose();
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
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 15.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Your profile",
                  style: theme.textTheme.headlineSmall,
                ),
                SizedBox(height: 13.h),
                Text(
                  "Tell us more about yourself",
                  style: CustomTextStyles.bodyLargeSFProText,
                ),
                SizedBox(height: 31.h),
                TextField(
                  controller: nameController,
                  style: theme.textTheme.bodyLarge,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: theme.textTheme.bodySmall,
                      filled: true,
                      fillColor: const Color(0XFF2D2E3A),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
                ),
                SizedBox(height: 20.h),
                TextField(
                  controller: surnameController,
                  style: theme.textTheme.bodyLarge,
                  decoration: InputDecoration(
                      labelText: 'Surname',
                      labelStyle: theme.textTheme.bodySmall,
                      filled: true,
                      fillColor: const Color(0XFF2D2E3A),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
                ),
                SizedBox(height: 20.h),
                TextField(
                  controller: birthDateController,
                  style: theme.textTheme.bodyLarge,
                  decoration: InputDecoration(
                      hintText: 'date.month.year',
                      labelText: 'Date of Birth',
                      labelStyle: theme.textTheme.bodySmall,
                      filled: true,
                      fillColor: const Color(0XFF2D2E3A),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0))),
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
                    backgroundColor: MaterialStateProperty.all<Color>(_areFieldsFilled() ? const Color(0xff5F6FFF) : Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ))),
                onPressed: _areFieldsFilled() ? () {
                  fss.write(key: 'name', value: nameController.text);
                  fss.write(key: 'surname', value: surnameController.text);
                  fss.write(key: 'birthDate', value: birthDateController.text);

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegCompany()));
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
    return nameController.text.isNotEmpty && surnameController.text.isNotEmpty && birthDateController.text.isNotEmpty;
  }
}
