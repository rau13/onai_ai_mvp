import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../../../widgets/custom_image_view.dart';
 // ignore: must_be_immutable

class ListyouneedtoItemWidget extends StatelessWidget {

  String title;
  String money;
  String asset;

  ListyouneedtoItemWidget({Key? key, required this.title, required this.money, required this.asset})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: AppDecoration.fillOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 5.h,
              bottom: 6.h,
            ),
            child: Text(
              title,
              style: CustomTextStyles.bodyMediumOnErrorContainer,
            ),
          ),
          Spacer(),
          SvgPicture.asset(asset),
          Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              top: 1.h,
            ),
            child: Text(
              money,
              style: theme.textTheme.headlineSmall,
            ),
          )
        ],
      ),
    );
  }
}
