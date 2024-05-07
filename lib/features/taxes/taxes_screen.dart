import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart'; // ignore_for_file: must_be_immutable

class TaxesScreen extends StatelessWidget {
  const TaxesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 11.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                children: [
                  Center(
                    child: Text('Taxes', style: theme.textTheme.bodyLarge,),
                  ),
                  SizedBox(height: 12.h,),
                  _buildStackTotalDeductions(context),
                  SizedBox(height: 16.h),
                  _buildBannerWrapper(
                    context,
                    titleTwo: "Personal deductions",
                    price: "\$20.000",
                  ),
                  SizedBox(height: 16.h),
                  _buildBannerWrapper(
                    context,
                    titleTwo: "Business deductions",
                    price: "\$30.000",
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 17.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0x19F6F6F6),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top categories merchants in 2023",
                          style: theme.textTheme.bodyMedium,
                        ),
                        SizedBox(height: 20.h),
                        _buildDataView(
                          context,
                          iconviewThree: ImageConstant.imgIconview,
                          titleFour: "Uber",
                          price: "\$1.087",
                        ),
                        SizedBox(height: 24.h),
                        _buildDataView(
                          context,
                          iconviewThree: ImageConstant.imgIconview48x48,
                          titleFour: "Doordash",
                          price: "\$1.282",
                        ),
                        SizedBox(height: 24.h),
                        _buildDataView(
                          context,
                          iconviewThree: ImageConstant.imgIconview1,
                          titleFour: "Apple",
                          price: "\$975",
                        ),
                        SizedBox(height: 24.h),
                        _buildDataView(
                          context,
                          iconviewThree: ImageConstant.imgIconview2,
                          titleFour: "Walmart",
                          price: "\$364",
                        ),
                        SizedBox(height: 24.h),
                        _buildDataView5(context),
                        SizedBox(height: 24.h),
                        _buildDataView(
                          context,
                          iconviewThree: ImageConstant.imgIconview,
                          titleFour: "Uber",
                          price: "\$1.087",
                        ),
                        SizedBox(height: 10.h)
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  /// Section Widget
  Widget _buildStackTotalDeductions(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: Color(0x19F6F6F6) ,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Container(
        height: 108.h,
        width: 343.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 82.h,
                width: 168.w,
                child: SvgPicture.asset('assets/cfo_stat.svg'),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  top: 16.h,
                  right: 151.w,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total deductions in 2023",
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "\$50.000",
                      style: theme.textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDataView5(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgIconview3,
          height: 48.h,
          width: 48.w,
          radius: BorderRadius.circular(
            12.h,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              top: 13.h,
              bottom: 13.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Amazon",
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                  "\$491",
                  style: theme.textTheme.bodyLarge,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  /// Common widget
  Widget _buildBannerWrapper(
    BuildContext context, {
    required String titleTwo,
    required String price,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: Color(0x19F6F6F6),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleTwo,
            style: CustomTextStyles.bodyLargeSFProText.copyWith(
              color: Colors.white,
            ),
          ),
          Spacer(),
          Text(
            price,
            style: CustomTextStyles.bodyLargeSFProText.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 5.w),
          Icon(Icons.arrow_forward_ios, color: Colors.white,),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildDataView(
    BuildContext context, {
    required String iconviewThree,
    required String titleFour,
    required String price,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: iconviewThree,
          height: 48.h,
          width: 48.w,
          radius: BorderRadius.circular(
            12.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            top: 13.h,
            bottom: 13.h,
          ),
          child: Text(
            titleFour,
            style: theme.textTheme.bodyLarge!
          ),
          ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13.h),
          child: Text(
            price,
            style: theme.textTheme.bodyLarge!,
          ),
        )
      ],
    );
  }
}
