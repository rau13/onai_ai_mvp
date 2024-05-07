import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart'; // ignore_for_file: must_be_immutable

  class ProfileScreen extends StatefulWidget {
    const ProfileScreen({Key? key})
        : super(
            key: key,
          );

    @override
    State<ProfileScreen> createState() => _ProfileScreenState();
  }

  class _ProfileScreenState extends State<ProfileScreen> {


    String companyName = '';
    String name = '';
    String surname = '';
    String companyDes = '';
    String state = '';

    FlutterSecureStorage fss = FlutterSecureStorage();

    @override
    void initState() {
      getFssData();
      super.initState();
    }

    void getFssData() async {
      try {
        String? localCompanyName = await fss.read(key: 'companyName');
        String? localName = await fss.read(key: 'name');
        String? localSurname = await fss.read(key: 'surname');
        String? localCompanyDes = await fss.read(key: 'companyDesc');
        String? localState = await fss.read(key: 'state');

        if (localCompanyName != null && localName != null && localSurname != null && localCompanyDes != null && localState != null) {
          setState(() {
            companyName = localCompanyName;
            name = localName;
            surname = localSurname;
            companyDes = localCompanyDes;
            state = localState;
          });
        } else {
          print("Error: Some data is missing from storage");
        }
      } catch (e) {
        // Handle any errors that might occur during the read process
        print('Failed to read data from storage: $e');
      }
    }

    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: theme.colorScheme.onPrimary,
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('Profile', style: theme.textTheme.bodyLarge,),
                ),
                SizedBox(height: 12.h,),
                Row(
                  children: [
                    SvgPicture.asset('assets/avatar_profile.svg'),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        top: 11.h,
                        bottom: 11.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$name $surname",
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "CEO",
                            style: theme.textTheme.bodyMedium,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Company name",
                      style: CustomTextStyles.bodyMediumSFProText,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      companyName,
                      style: CustomTextStyles.bodyLargeSFProText,
                    )
                  ],
                ),
                SizedBox(height: 23.h
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "State",
                      style: CustomTextStyles.bodyMediumSFProText,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      state,
                      style: CustomTextStyles.bodyLargeSFProText,
                    )
                  ],
                ),
                SizedBox(height: 26.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Company description",
                      style: CustomTextStyles.bodyMediumSFProText,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      companyDes,
                      style: CustomTextStyles.bodyLargeSFProText,
                    )
                  ],
                ),
                SizedBox(height: 26.h),
                _buildBannerWrapper(
                  context,
                  asset: 'assets/employees_icon.svg',
                  televisionOne: ImageConstant.imgLock,
                  titleFive: "Employees",
                ),
                SizedBox(height: 12.h),
                _buildBannerWrapper(
                  context,
                  asset: 'assets/bills_payments_icon.svg',
                  televisionOne: ImageConstant.imgTelevisionSecondarycontainer,
                  titleFive: "Bills & Payment",
                ),
                SizedBox(height: 12.h),
                _buildBannerWrapper(
                  context,
                  asset: 'assets/support_icon.svg',
                  televisionOne: ImageConstant.imgActionsSupport,
                  titleFive: "Support",
                ),
                SizedBox(height: 5.h)
              ],
            ),
          ),
        ),
      );
    }


    /// Common widget
    Widget _buildBannerWrapper(
      BuildContext context, {
        required String asset,
      required String televisionOne,
      required String titleFive,
    }) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          children: [
            SvgPicture.asset(asset),
            Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                top: 2.h,
              ),
              child: Text(
                titleFive,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onErrorContainer.withOpacity(1),
                ),
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgArrowdown,
              height: 24.h,
              width: 24.w,
            )
          ],
        ),
      );
    }
  }
