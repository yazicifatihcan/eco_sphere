import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/constants/enum/type_enum.dart';
import '../../../../app/mixin/state_bottom_sheet_mixin.dart';
import '../../../../app/model/response/all_legal_response_model.dart';

class LegalController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<LegalTypesEnum> _selectedLegalType = LegalTypesEnum.ABOUT.obs;
  final Rx<List<AllLegalListResponseModel>> _legals = Rx([]);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  LegalTypesEnum get selectedLegalType => _selectedLegalType.value;
  set selectedLegalType(LegalTypesEnum value) => _selectedLegalType.value = value;

  List<AllLegalListResponseModel> get legals => _legals.value;
  set legals(List<AllLegalListResponseModel> value) => _legals.value = value;


  final LegalTypesEnum legalType;
  LegalController({required this.legalType});

  @override
  void onInit() {
    super.onInit();
    selectedLegalType = legalType;
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getAllLegals();
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Loaded;
    } catch (e) {
      loadingStatus = LoadingStatus.Error;
      showErrorStateBottomSheet(message: e.toString(), onTapFirstBtn: onTapTryAgain);
    }
  }

  Future<void> getAllLegals() async {
    // final response = await General().allLegalList();
    // if (response.status == BaseModelStatus.Ok) {
    //   legals = response.data!;
    // } else {
    //   throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    // }

    await Future.delayed(const Duration(seconds: 2));
    legals = constantLegals.map((e) => AllLegalListResponseModel().fromJson(e)).toList();
  }

  AllLegalListResponseModel get selectedLegal => legals.firstWhere((element) => element.legalType == selectedLegalType.name);

  void onTapLegalCategoryChip(LegalTypesEnum index) => selectedLegalType = index;

  void onTapTryAgain() {
    Navigator.pop(context);
    onReady();
  }
}


List<Map<String,dynamic>> constantLegals = [
  {
    "id": "64ef430e66e4385e7dd453aa",
    "legalType": "PRIVACY",
    "title": "Privacy Policy",
    "content": "This Privacy Policy outlines how EcoSphere, an IoT application, collects and uses data. We gather data through IoT devices to calculate your individual carbon footprint. This includes data from smartwatches for activities like walking, driving, and public transportation usage, as well as daily activity data. Additionally, you can manually input information such as taking short showers, consuming a vegetable-based diet, and choosing reusable products.",
    "createdAt": "2023-08-30T13:24:30.106Z",
    "updatedAt": "2023-08-30T13:24:30.106Z"
  },
  {
    "id": "64ef432166e4385e7dd453ab",
    "legalType": "TERMS",
    "title": "Terms and Conditions",
    "content": "Welcome to EcoSphere! These Terms and Conditions govern your use of our IoT application. By using EcoSphere, you agree to abide by these terms. Please read them carefully. If you do not agree to these terms, please do not use our app.",
    "createdAt": "2023-08-30T13:24:49.740Z",
    "updatedAt": "2023-08-30T13:24:49.740Z"
  },
  {
    "id": "64ef433666e4385e7dd453ac",
    "legalType": "ABOUT",
    "title": "About Us",
    "content": "Welcome to EcoSphere! We are dedicated to helping you reduce your carbon footprint through innovative IoT technology. Our app collects data from various sources to provide you with insights and suggestions for a more eco-friendly lifestyle.",
    "createdAt": "2023-08-30T13:25:10.324Z",
    "updatedAt": "2023-08-30T13:25:10.324Z"
  }
];

