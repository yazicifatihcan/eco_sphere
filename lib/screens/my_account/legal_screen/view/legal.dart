import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/components/app_bar/app_bar_with_arrow_back.dart';
import '../../../../app/components/button/custom_choice_chip.dart';
import '../../../../app/components/card/legal_information_card.dart';
import '../../../../app/constants/assets/assets.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/constants/enum/type_enum.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../controller/legal_controller.dart';

class Legal extends StatelessWidget {
  const Legal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LegalController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: const AppBarWithArrowBack(title: 'Legal'),
      body: Obx(() => controller.loadingStatus != LoadingStatus.Loaded
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXL),
                child: Column(
                  children: [
                    Obx(
                      () => Row(
                        children: 
                        
                        [
                          Expanded(
                              child: CustomChoiceChip(
                            title: 'About Us',
                            insidePadding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXS),
                            onTap: () => controller.onTapLegalCategoryChip(LegalTypesEnum.ABOUT),
                            isSelected: controller.selectedLegalType == LegalTypesEnum.ABOUT,
                          )),
                          const SizedBox(width: paddingXS),
                          Expanded(
                            child: CustomChoiceChip(
                              title: 'Ts & Cs',
                              insidePadding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXS),
                              onTap: () => controller.onTapLegalCategoryChip(LegalTypesEnum.TERMS),
                              isSelected: controller.selectedLegalType == LegalTypesEnum.TERMS,
                            ),
                          ),
                          const SizedBox(width: paddingXS),
                          Expanded(
                            child: CustomChoiceChip(
                              title: 'Privacy',
                              insidePadding: const EdgeInsets.symmetric(horizontal: paddingXS, vertical: paddingXS),
                              onTap: () => controller.onTapLegalCategoryChip(LegalTypesEnum.PRIVACY),
                              isSelected: controller.selectedLegalType == LegalTypesEnum.PRIVACY,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: paddingXS),
                    Obx(
                      () => LegalInformationCard(
                        iconPath: controller.selectedLegalType == LegalTypesEnum.ABOUT
                            ? aboutUsIcon
                            : controller.selectedLegalType == LegalTypesEnum.PRIVACY
                                ? privacyPolicyIcon
                                : termsAndConditionsIcon,
                        title: controller.selectedLegal.title!,
                        content: controller.selectedLegal.content!,
                      ),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
