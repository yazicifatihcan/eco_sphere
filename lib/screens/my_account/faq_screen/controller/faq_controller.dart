
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/mixin/state_bottom_sheet_mixin.dart';
import '../../../../app/model/response/faq_response_model.dart';

class FaqController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  final Rx<int?> _faqOpenedIndex = Rx(null);
  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<List<FaqResponseModel>> _faqs = Rx([]);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  List<FaqResponseModel> get faqs => _faqs.value;
  set faqs(List<FaqResponseModel> value) => _faqs.value = value;

  int? get faqOpenedIndex => _faqOpenedIndex.value;
  set faqOpenedIndex(int? value) => _faqOpenedIndex.value = value;

  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getAllFaqs();
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Loaded;
    } catch (e) {
      loadingStatus = LoadingStatus.Error;
      showErrorStateBottomSheet(message: e.toString(), onTapFirstBtn: onTapTryAgain);
    }
  }

  Future<void> getAllFaqs() async {
    // final response = await General().faqList();
    // if (response.status == BaseModelStatus.Ok) {
    //   faqs = response.data!;
    // } else {
    //   throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    // }
    await Future.delayed(const Duration(seconds: 2));
    faqs = constantFaqs.map((e) => FaqResponseModel().fromJson(e)).toList();
  }

  void onTapFaqCard(int? index) {
    if (index == faqOpenedIndex) {
      faqOpenedIndex = null;
    } else {
      faqOpenedIndex = index;
    }
  }

  void onTapTryAgain() {
    Navigator.pop(context);
    onReady();
  }
}




List<Map<String,dynamic>> constantFaqs = [
  {
    "id": "64ef42e466e4385e7dd453a7",
    "question": "FAQ - 1: What is the Green IoT App?",
    "answer": "Answer 1: The Green IoT App is an IoT application developed using Helium. It calculates your individual carbon footprint by gathering data from various IoT sources. This app collects data from smartwatches, tracking activities like walking, driving, and public transportation, as well as daily activity metrics.",
    "createdAt": "2023-08-30T13:23:48.871Z",
    "updatedAt": "2023-08-30T13:23:48.871Z"
  },
  {
    "id": "64ef42ed66e4385e7dd453a8",
    "question": "FAQ - 2: How does the Green IoT App collect data?",
    "answer": "Answer 2: The Green IoT App collects data through IoT devices such as smartwatches. It tracks activities like walking, driving, and public transportation usage to provide accurate information for calculating your carbon footprint. Additionally, you can manually input data, such as taking shorter showers, choosing plant-based meals, or using reusable products, to customize your daily activities.",
    "createdAt": "2023-08-30T13:23:57.452Z",
    "updatedAt": "2023-08-30T13:23:57.452Z"
  },
  {
    "id": "64ef42f666e4385e7dd453a9",
    "question": "FAQ - 3: What IoT devices are compatible with the Green IoT App?",
    "answer": "Answer 3: The Green IoT App is compatible with a variety of IoT devices, including smartwatches. These devices provide essential data for calculating your carbon footprint, including activity levels and transportation modes. You can check the app's compatibility list for specific devices.",
    "createdAt": "2023-08-30T13:24:06.119Z",
    "updatedAt": "2023-08-30T13:24:06.119Z"
  },
  {
    "id": "64ef42f666e4385e7dd453aa",
    "question": "FAQ - 4: Can I manually input data into the app?",
    "answer": "Answer 4: Yes, you can manually input data into the Green IoT App. This includes activities like taking shorter showers, choosing vegetarian meals, or opting for reusable products. These manual inputs allow you to customize your carbon footprint calculations to align with your daily activities.",
    "createdAt": "2023-08-30T13:24:06.119Z",
    "updatedAt": "2023-08-30T13:24:06.119Z"
  },
  {
    "id": "64ef42f666e4385e7dd453ab",
    "question": "FAQ - 5: What is the purpose of calculating my carbon footprint?",
    "answer": "Answer 5: Calculating your carbon footprint helps raise awareness of your environmental impact. It allows you to make informed choices to reduce your carbon emissions and contribute to a more sustainable future.",
    "createdAt": "2023-08-30T13:24:06.119Z",
    "updatedAt": "2023-08-30T13:24:06.119Z"
  },
  {
    "id": "64ef42f666e4385e7dd453ac",
    "question": "FAQ - 6: How can I connect the Green IoT App to my IoT devices?",
    "answer": "Answer 6: Connecting your IoT devices to the Green IoT App is usually straightforward. Follow the app's instructions to pair your devices via Bluetooth or Wi-Fi, and ensure they are compatible with the app.",
    "createdAt": "2023-08-30T13:24:06.119Z",
    "updatedAt": "2023-08-30T13:24:06.119Z"
  },
  {
    "id": "64ef42f666e4385e7dd453ad",
    "question": "FAQ - 7: Is the Green IoT App available on multiple platforms?",
    "answer": "Answer 7: Yes, the Green IoT App is designed to be available on multiple platforms, including iOS and Android. You can download it from the respective app stores.",
    "createdAt": "2023-08-30T13:24:06.119Z",
    "updatedAt": "2023-08-30T13:24:06.119Z"
  },
  {
    "id": "64ef42f666e4385e7dd453ae",
    "question": "FAQ - 8: Can I view my carbon footprint history in the app?",
    "answer": "Answer 8: Yes, the Green IoT App typically provides a history feature where you can view your carbon footprint over time. This helps you track your progress and see the impact of your sustainable choices.",
    "createdAt": "2023-08-30T13:24:06.119Z",
    "updatedAt": "2023-08-30T13:24:06.119Z"
  },
  {
    "id": "64ef42f666e4385e7dd453af",
    "question": "FAQ - 9: Are there eco-friendly recommendations in the app?",
    "answer": "Answer 9: Absolutely, the Green IoT App often offers eco-friendly recommendations based on your carbon footprint data. It suggests ways to reduce your environmental impact and live a more sustainable lifestyle.",
    "createdAt": "2023-08-30T13:24:06.119Z",
    "updatedAt": "2023-08-30T13:24:06.119Z"
  },
  {
    "id": "64ef42f666e4385e7dd453b0",
    "question": "FAQ - 10: Can I share my achievements on social media?",
    "answer": "Answer 10: Yes, many users enjoy sharing their sustainability achievements on social media. The Green IoT App typically allows you to share your progress and inspire others to join the sustainability movement.",
    "createdAt": "2023-08-30T13:24:06.119Z",
    "updatedAt": "2023-08-30T13:24:06.119Z"
  }
];