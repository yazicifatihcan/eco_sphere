import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/mixin/state_bottom_sheet_mixin.dart';
import 'package:get/get.dart';

import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/constants/app/app_constant.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/model/response/discover_response_model.dart';

class DiscoverController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  BuildContext get context => scaffoldKey.currentContext!;  

  final pageController = PageController();

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<List<DiscoverResponseModel>> _discovers = Rx([]);
  final Rx<int> _currentScreenIndex = 0.obs;


  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;
  
  List<DiscoverResponseModel> get discovers => _discovers.value;
  set discovers(List<DiscoverResponseModel> value) => _discovers.value = value;

  int get currentScreenIndex => _currentScreenIndex.value;
  set currentScreenIndex(int value) => _currentScreenIndex.value = value;


  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getDiscoverDatas();
      loadingStatus = LoadingStatus.Loaded;
      LoadingProgress.stop();
    } catch (e) {
      loadingStatus = LoadingStatus.Error;
      LoadingProgress.stop();
      showErrorStateBottomSheet(message: e.toString(), onTapFirstBtn: onTapTryAgain);
    }
  }

  void onPageChange(int index) => currentScreenIndex = index;

   void onTapNextScreen() async {
    if (currentScreenIndex == 49) {
      pageController.jumpToPage(0);
    } else {
      pageController.nextPage(
        duration: animationDurationMS,
        curve: Curves.ease,
      );
    }
  }


   Future<void> getDiscoverDatas() async {
    // final response = await General().allLegalList();
    // if (response.status == BaseModelStatus.Ok) {
    //   legals = response.data!;
    // } else {
    //   throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    // }
    await Future.delayed(const Duration(seconds: 2));
    discovers = constantDiscovers.map((e) => DiscoverResponseModel().fromJson(e)).toList();
    discovers.shuffle();
  }


    void onTapTryAgain() {
    Navigator.pop(context);
    onReady();
  }

}



List<Map<String, dynamic>> constantDiscovers = [
  {
    "title": "Historical Emissions",
    "content":
        "The Industrial Revolution in the 18th century marked the beginning of significant carbon emissions. As industries expanded and fossil fuels became a primary energy source, carbon dioxide levels in the atmosphere began to rise, contributing to the greenhouse effect and global warming."
  },
  {
    "title": "Largest Carbon Emitters",
    "content":
        "China is the world's largest carbon emitter, responsible for a substantial portion of global carbon dioxide emissions. The United States follows closely, with India also emerging as a significant contributor to carbon emissions due to its large population and rapid economic growth."
  },
  {
    "title": "Carbon Intensity of Food",
    "content":
        "The carbon footprint of food varies significantly depending on its source. Meat production, particularly beef and lamb, has a much higher carbon footprint compared to plant-based foods like vegetables and grains. Choosing a diet rich in plant-based foods can substantially reduce an individual's carbon footprint."
  },
  {
    "title": "Role of Transportation",
    "content":
        "Transportation is a major contributor to carbon emissions worldwide. Cars, trucks, and airplanes are among the primary culprits. The combustion of fossil fuels in internal combustion engines releases carbon dioxide into the atmosphere. Transitioning to electric vehicles and investing in public transportation systems can help mitigate this impact."
  },
  {
    "title": "Carbon Footprint of Clothing",
    "content":
        "The fashion industry is responsible for a substantial carbon footprint due to the phenomenon of fast fashion, which encourages rapid turnover of clothing items. Additionally, the production of synthetic fabrics and dyes contributes to environmental pollution and emissions. Sustainable fashion practices and choosing quality, long-lasting clothing items can help reduce this footprint."
  },
  {
    "title": "Carbon Offsetting",
    "content":
        "Carbon offset programs allow individuals and organizations to compensate for their carbon emissions by supporting projects that either reduce or capture carbon dioxide from the atmosphere. These projects can include reforestation, renewable energy installations, and methane capture from landfills. Carbon offsetting is a strategy to achieve carbon neutrality."
  },
  {
    "title": "Carbon Tax",
    "content":
        "Some countries have implemented carbon taxes as a policy tool to encourage emissions reduction. Carbon taxes impose a fee on the carbon content of fossil fuels, effectively internalizing the cost of carbon emissions. The revenue generated from carbon taxes can fund renewable energy projects and climate mitigation efforts."
  },
  {
    "title": "Renewable Energy Transition",
    "content":
        "Transitioning from fossil fuels to renewable energy sources like solar, wind, and hydropower is a critical step in reducing the carbon footprint of energy production. Renewable energy technologies generate electricity with minimal or no direct carbon emissions, making them a sustainable alternative to fossil fuels."
  },
  {
    "title": "Carbon Footprint of Electronics",
    "content":
        "The production, use, and disposal of electronic devices contribute to their carbon footprint. Manufacturing electronic components, such as semiconductors and circuit boards, consumes energy and raw materials. Proper recycling and responsible disposal of electronics can mitigate their environmental impact."
  },
  {
    "title": "Urbanization Impact",
    "content":
        "Urban areas tend to have higher per capita carbon footprints compared to rural areas due to concentrated populations, increased energy use, and transportation demands. Urban planning that promotes sustainability, public transportation, and energy efficiency can help reduce the carbon footprint of cities."
  },
  {
    "title": "Carbon Footprint of Air Travel",
    "content": "Long-haul flights can have a substantial carbon footprint due to significant fuel consumption."
  }
];
