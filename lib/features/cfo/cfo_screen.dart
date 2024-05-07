import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'widgets/gridgroupicon_item_widget.dart';
import 'widgets/listyouneedto_item_widget.dart';
import 'widgets/transactionsummary_item_widget.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CFOScreen extends StatefulWidget {
  CFOScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<CFOScreen> createState() => _CFOScreenState();
}

class _CFOScreenState extends State<CFOScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final List<String> _yourBurn = ['Money In', 'Money Out', 'Burn', 'Runaway'];
  final List<String> _yourBurnMoney = ['\$1.004', '\$15.424', '-\$14.420', '19 months'];
  final List<Color> _yourBurnColor = [Colors.white, Colors.white, Color(0xffFA3939), Colors.white];
  final List<String> _yourBurnDate = ['Aug 2023: ', 'Aug 2023: ', 'Aug 2023: ', 'April 2025: '];

  final List<String> _collectPayTitle = ['You need to collect', 'You need to pay'];
  final List<String> _collectPayMoney = ['\$111.682', '\$2.341'];
  final List<String> _collectPayAssets = ['assets/trending_up.svg', 'assets/trending_down.svg'];

  final List<String> _cashFlowTitle = ['Cash Flow Statement', 'Profit & Loss Statement', 'Balance Sheet', 'Unit Economics', 'Expence Analysis', 'Explore AI-CFO'];
  final List<String> _cashFlowAssets = ['assets/cash_flow.svg', 'assets/profit_loss.svg', 'assets/balance_sheet.svg', 'assets/unit_economics.svg', 'assets/expence_analysis.svg', 'assets/explore_ai_cfo.svg'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        // appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SafeArea(
            child: Column(
              children: [
                Center(
                  child: Text('CFO', style: theme.textTheme.bodyLarge,),
                ),
                SizedBox(height: 14.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5.h),
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Burn",
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 13.h),
                          _buildTransactionSummary(context),
                          SizedBox(height: 35.h),
                          Text(
                            "Collect & Pay",
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 12.h),
                          _buildListYouNeedTo(context),
                          SizedBox(height: 20.h),
                          _buildGridGroupIcon(context),
                          SizedBox(height: 20.h,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        // bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildTransactionSummary(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 125.h,
        crossAxisCount: 2,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 12.w,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemCount: _yourBurn.length,
      itemBuilder: (context, index) {
        return TransactionsummaryItemWidget(title: _yourBurn[index], money: _yourBurnMoney[index], color: _yourBurnColor[index], date: _yourBurnDate[index],);
      },
    );
  }

  /// Section Widget
  Widget _buildListYouNeedTo(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 12.h,
        );
      },
      itemCount: _collectPayTitle.length,
      itemBuilder: (context, index) {
        return ListyouneedtoItemWidget(title: _collectPayTitle[index], money: _collectPayMoney[index], asset: _collectPayAssets[index],);
      },
    );
  }

  /// Section Widget
  Widget _buildGridGroupIcon(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 133.h,
        crossAxisCount: 2,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 12.w,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemCount: _cashFlowTitle.length,
      itemBuilder: (context, index) {
        return GridgroupiconItemWidget(title: _cashFlowTitle[index], asset: _cashFlowAssets[index],);
      },
    );
  }
}
