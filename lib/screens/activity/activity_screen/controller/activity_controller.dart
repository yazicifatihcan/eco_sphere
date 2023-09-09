import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/controllers/general/session_service.dart';
import 'package:flutter_base_project/app/extensions/date_time_extension.dart';
import 'package:flutter_base_project/app/extensions/widget_extension.dart';
import 'package:flutter_base_project/app/mixin/state_bottom_sheet_mixin.dart';
import 'package:flutter_base_project/app/model/response/user_activity_response_model.dart';
import 'package:get/get.dart';

import '../../../../app/bl/general.dart';
import '../../../../app/components/bottom_sheet/general_information_bottom_sheet.dart';
import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/model/response/activity_response_model.dart';
import '../../../../core/exception/app_exception.dart';
import '../../../../core/i10n/i10n.dart';

class ActivityController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  BuildContext get context => scaffoldKey.currentContext!;  

  final SessionService sessionService = Get.find();

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<List<AllActivitiesResponseModel>> _allActivities = Rx([]);
  final Rx<List<UserActivityResponseModel>> _userActivities = Rx([]);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  List<AllActivitiesResponseModel> get allActivities => _allActivities.value;
  set allActivities(List<AllActivitiesResponseModel> value) => _allActivities.value = value;

  List<UserActivityResponseModel> get userActivities => _userActivities.value;
  set userActivities(List<UserActivityResponseModel> value) => _userActivities.value = value;

  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getAllActivities();
      await getCurrentUserActivities();
      loadingStatus = LoadingStatus.Loaded;
      LoadingProgress.stop();
    } catch (e) {
      loadingStatus = LoadingStatus.Error;
      LoadingProgress.stop();
      showErrorStateBottomSheet(message: e.toString(), onTapFirstBtn: onTapTryAgain);
    }
  }

  Future<void> getAllActivities() async {
    final response = await General().getAllActivities();
    if (response.status == BaseModelStatus.Ok) {
      allActivities = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  Future<void> getCurrentUserActivities() async {
    final response = await General().getAllCurrentUserActivities();
    if (response.status == BaseModelStatus.Ok) {
      userActivities = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  int calculateRemainings(AllActivitiesResponseModel item) {
    int limit = item.dailyLimit!;

    for (var activity in userActivities) {
      bool isSameActivity = activity.activity!.id == item.id;
      if (isSameActivity &&
          activity.createDate!.getRawDateTime().toString() == DateTime.now().getRawDateTime().toString()) {
        limit--;
      }
    }
    return limit < 0 ? 0 : limit;
  }

  Future<void> onTapAddUserActivity(AllActivitiesResponseModel item) async{
    try{
      LoadingProgress.start();
      await addUserActivity(item);
      LoadingProgress.stop();
      await showSuccessStateBottomSheet(
        message: 'Activity succesfully saved.'
      );
      onReady();
    }catch(e){
      LoadingProgress.stop();
      showErrorStateBottomSheet(message: e.toString());
    }
  }

  Future<void> addUserActivity(AllActivitiesResponseModel item) async {
    UserActivityResponseModel userActivity = UserActivityResponseModel(
      activity: item,
      createDate: DateTime.now(),
      ownerId: sessionService.currentUser.uuid,
    );
    final response = await General().addUserActivity(userActivity);
    if (response.status != BaseModelStatus.Ok) {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  Future<void> onTapAddActivity(AllActivitiesResponseModel item) async {
    if(calculateRemainings(item)<=0){

      GeneralInformationBottomSheet(
      title: item.name!,
      subtitle: 'We appreciate your efforts but you completed this daily task already!',
      firstBtnText: 'Take a look at others',
      secondBtnText: 'Back',
      onTapFirstBtn: ()=>Navigator.pop(context),
    ).openBottomSheet(context: context);

    }else{
      GeneralInformationBottomSheet(
      title: item.name!,
      subtitle: 'Thanks for reducing your footprint. This action will increase your saved CO2 amount by ${item.amount} Kg CO2. Are you sure you want to proceed ?',
      firstBtnText: 'Yes',
      secondBtnText: 'No',
      onTapFirstBtn: () {
        Navigator.pop(context);
        onTapAddUserActivity(item);
      },
    ).openBottomSheet(context: context);
    }
  }

  void onTapTryAgain() {
    Navigator.pop(context);
    onReady();
  }
}