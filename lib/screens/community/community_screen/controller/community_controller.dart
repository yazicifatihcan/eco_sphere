import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/mixin/state_bottom_sheet_mixin.dart';
import 'package:get/get.dart';

import '../../../../app/bl/general.dart';
import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/model/response/levels_response_model.dart';
import '../../../../app/model/response/user_info_model.dart';
import '../../../../core/exception/app_exception.dart';
import '../../../../core/i10n/i10n.dart';

class CommunityController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  BuildContext get context => scaffoldKey.currentContext!;  

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<List<UserInfoModel>> _allUsers = Rx([]);
  final Rx<List<LevelsResponseModel>> _allLevels = Rx([]);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  List<UserInfoModel> get allUsers => _allUsers.value;
  set allUsers(List<UserInfoModel> value) => _allUsers.value = value;

  List<LevelsResponseModel> get allLevels => _allLevels.value;
  set allLevels(List<LevelsResponseModel> value) => _allLevels.value = value;


   @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getAllLevels();
      await getAllUsers();
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Loaded;
    } catch (e) {
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Error;
      showErrorStateBottomSheet(message: e.toString(), onTapFirstBtn: onTapTryAgain);
    }
  }

  Future<void> getAllLevels() async {
    final response = await General().getAllLevels();
    if (response.status == BaseModelStatus.Ok) {
      allLevels = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  Future<void> getAllUsers() async {
    final response = await General().getAllUsers();
    if (response.status == BaseModelStatus.Ok) {
      allUsers = response.data!;
      allUsers.sort((a,b)=>b.savedCo2!.compareTo(a.savedCo2!));
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  LevelsResponseModel getUsersCurrentLevel(UserInfoModel user){
    try{
      return allLevels.lastWhere((element) => element.co2Amount!<user.savedCo2!);}
    catch(e){
      return allLevels[0];
    }
  }

   void onTapTryAgain() {
    Navigator.pop(context);
    onReady();
  }

}