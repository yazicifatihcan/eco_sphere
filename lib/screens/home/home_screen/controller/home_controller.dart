import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/mixin/state_bottom_sheet_mixin.dart';
import 'package:flutter_base_project/app/model/response/daily_tasks_response_model.dart';
import 'package:get/get.dart';

import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';

class HomeController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<List<DailyTasksResponseModel>> _dailyTasks = Rx([]);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  List<DailyTasksResponseModel> get dailyTasks => _dailyTasks.value;
  set dailyTasks(List<DailyTasksResponseModel> value) => _dailyTasks.value = value;

  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getDailyTasks();
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Loaded;
    } catch (e) {
      loadingStatus = LoadingStatus.Error;
      showErrorStateBottomSheet(message: e.toString(), onTapFirstBtn: onTapTryAgain);
    }
  }

  Future<void> getDailyTasks() async {
    // final response = await General().allLegalList();
    // if (response.status == BaseModelStatus.Ok) {
    //   legals = response.data!;
    // } else {
    //   throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    // }

    await Future.delayed(const Duration(seconds: 2));
    dailyTasks = constantDailyTasks.map((e) => DailyTasksResponseModel().fromJson(e)).toList();
  }

  void onTapTryAgain() {
    Navigator.pop(context);
    onReady();
  }
}

List<Map<String, dynamic>> constantDailyTasks = [
  {
    "title": "Reduce Energy Consumption",
    "content":
        "Turn off lights, appliances, and electronics when not in use to conserve energy and reduce your carbon footprint.",
    "amount_saved_co2": "10 kg CO2"
  },
  {
    "title": "Use Public Transportation or Carpool",
    "content":
        "Opt for public transportation or carpooling to work or other destinations to reduce the carbon emissions associated with individual car use.",
    "amount_saved_co2": "15 kg CO2"
  },
  {
    "title": "Minimize Meat Consumption",
    "content":
        "Eating less meat, especially red meat, can significantly lower your carbon footprint as the meat industry is a major contributor to greenhouse gas emissions.",
    "amount_saved_co2": "20 kg CO2"
  }
];
