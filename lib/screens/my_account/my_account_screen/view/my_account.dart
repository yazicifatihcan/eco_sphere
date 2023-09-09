import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/components/button/clckable_text.dart';
import 'package:flutter_base_project/app/extensions/num_extension.dart';
import 'package:flutter_base_project/app/extensions/widget_extension.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../app/components/button/base_button.dart';
import '../../../../app/components/button/two_option_switch_button.dart';
import '../../../../app/components/card/achievement_card.dart';
import '../../../../app/components/card/field_tile.dart';
import '../../../../app/constants/assets/assets.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';
import '../controller/my_account_controller.dart';
import 'model/chart_data.dart';

part 'components/chart_legend_item.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyAccountController>();
    return GestureDetector(
      onTap: controller.unfocus,
      child: Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left:paddingXS),
            child: Text(
              'My Profile',
              style: s31W700DarkPeachi,
            ),
          ),
        ),
        body: Obx(() => controller.loadingStatus != LoadingStatus.Loaded
            ? const SizedBox.shrink()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingXS),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: paddingXL),
                      AchievementCard(
                        userInfo: controller.currentUser,
                        userLevel: controller.getUsersCurrentLevel(),
                      ),
                      const SizedBox(height: paddingXL),
                      Obx(()=>TwoOptionSwitchButton(
                        firstTitle: 'Footprint',
                        secondTitle: 'Equals To...',
                        onTapSwitch: (value)=>controller.selectTab=value,
                        selectedValue: controller.selectTab,
                      )),
                      const SizedBox(height: paddingXS),
                      Center(child: Text('Your weekly emissions',style: s16W700Dark,)),
                      const SizedBox(height: paddingXS),
                      Center(child: ClickableText(onTap: controller.onTapHowToCalculate, text: 'How do we calculate it?',textStyle: s10W800Primary,)),
                      const SizedBox(height: paddingXS),
                      Obx(()=>Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SfCircularChart(
                                palette: controller.graphColorPalette,
                                margin: EdgeInsets.zero,
                                series: [
                                  DoughnutSeries<ChartData, String>(
                                    innerRadius: "90",
                                    cornerStyle: CornerStyle.bothFlat,
                                    radius: "130",
                                    dataSource: controller.chartData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                  )
                                ],
                              ),
                              Positioned(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.currentUser.savedCo2!.removeTrailingZeros(),
                                      style: s31W700DarkPeachi,
                                    ),
                                    Text(
                                      'Kg CO2',
                                      style: s20W500Dark,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ChartLegendItem(
                                      title: controller.chartData[index].x,
                                      color: controller.graphColorPalette[index],
                                    ),
                                separatorBuilder: (content, index) => const SizedBox(
                                      height: paddingXXXS,
                                    ),
                                itemCount: controller.chartData.length),
                          ),
                        ],
                      ).isVisible(controller.selectTab==0),),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: paddingM),
                            Text(controller.userActivities.length.toString(),style: s31W700PrimaryPeachi,),
                            Text('Actions are done!',style: s16W700Dark,),
                            const SizedBox(height: paddingXL),
                            Text(
                              'You saved ${controller.currentUser.savedCo2!.removeTrailingZeros()} Kg CO2',
                              style: s16W700Dark,
                            ),
                          ],
                        ).isVisible(controller.selectTab==1),
                      ),
                      const SizedBox(height: paddingXL),
                      BaseButton.primary(
                        onTap: () {},
                        txt: 'Update Your NFT',
                      ),
                      const SizedBox(height: paddingXXXS),
                      BaseButton.secondary(
                        onTap: () {},
                        txt: 'Mint Your NFT',
                      ),
                      const SizedBox(height: paddingXL),
                      Text(
                        'Support',
                        style: s25W700DarkPeachi,
                      ),
                      const SizedBox(height: paddingXS),
                      FieldTile(
                        iconPath: legalIcon,
                        onTap: controller.onTapLegal,
                        text: 'Legal',
                      ),
                      const SizedBox(height: paddingXL),
                      FieldTile(
                        iconPath: faqIcon,
                        onTap: controller.onTapFaq,
                        text: 'FAQs',
                      ),
                      const SizedBox(height: paddingXL),
                      FieldTile(
                        iconPath: contactUsIcon,
                        onTap: controller.onTapContactUs,
                        text: 'Contact Us',
                      ),
                      const SizedBox(height: paddingXL),
                      Text(
                        'Security',
                        style: s25W700DarkPeachi,
                      ),
                      const SizedBox(height: paddingXS),
                      FieldTile(
                        iconPath: logoutIcon,
                        onTap: controller.onTapLogout,
                        text: 'Logout',
                      ),
                      const SizedBox(height: paddingXL),
                      FieldTile(
                        iconPath: deleteAccountIcon,
                        onTap: controller.onTapDeleteAccount,
                        text: 'Delete Account',
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(height: paddingXL),
                    ],
                  ),
                ),
              )),
      ),
    );
  }
}
