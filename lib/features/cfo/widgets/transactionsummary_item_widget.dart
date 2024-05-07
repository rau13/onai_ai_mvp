import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../../../widgets/custom_image_view.dart';// ignore: must_be_immutable

class TransactionsummaryItemWidget extends StatelessWidget {

  String title;
  String money;
  Color color;
  String date;

  TransactionsummaryItemWidget({Key? key, required this.title, required this.money, required this.color, required this.date})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0x19F6F6F6)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgVideoCamera,
                height: 16.h,
                width: 16.w,
                margin: EdgeInsets.only(
                  left: 4.w,
                  bottom: 2.h,
                ),
              )
            ],
          ),
          SizedBox(height: 13.h),
          Text(
            money,
            style: theme.textTheme.headlineSmall!.copyWith(
              color: color
            ),
          ),
          SizedBox(height: 13.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: date,
                  style: CustomTextStyles.bodySmallSFPro,
                ),
                TextSpan(
                  text: money,
                  style: CustomTextStyles.bodySmallSFProOnErrorContainer,
                )
              ],
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
