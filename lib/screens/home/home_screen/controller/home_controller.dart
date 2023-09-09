import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/controllers/general/session_service.dart';
import 'package:flutter_base_project/app/extensions/date_time_extension.dart';
import 'package:flutter_base_project/app/extensions/widget_extension.dart';
import 'package:flutter_base_project/app/mixin/state_bottom_sheet_mixin.dart';
import 'package:flutter_base_project/app/model/response/activity_response_model.dart';
import 'package:flutter_base_project/app/model/response/levels_response_model.dart';
import 'package:flutter_base_project/app/model/response/user_info_model.dart';
import 'package:flutter_base_project/screens/navigation/bottom_navigation/bottom_navigation_bar_item/controller/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';
import '../../../../app/bl/general.dart';
import '../../../../app/components/bottom_sheet/general_information_bottom_sheet.dart';
import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/model/response/user_activity_response_model.dart';
import '../../../../core/exception/app_exception.dart';
import '../../../../core/i10n/i10n.dart';

class HomeController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  final SessionService sessionService = Get.find();

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<List<AllActivitiesResponseModel>> _dailyTasks = Rx([]);
  final Rx<List<LevelsResponseModel>> _allLevels = Rx([]);
  final Rx<List<UserActivityResponseModel>> _userActivities = Rx([]);
  final Rx<UserInfoModel> _currentUser = Rx(UserInfoModel());

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  List<AllActivitiesResponseModel> get dailyTasks => _dailyTasks.value;
  set dailyTasks(List<AllActivitiesResponseModel> value) => _dailyTasks.value = value;

  List<LevelsResponseModel> get allLevels => _allLevels.value;
  set allLevels(List<LevelsResponseModel> value) => _allLevels.value = value;

  List<UserActivityResponseModel> get userActivities => _userActivities.value;
  set userActivities(List<UserActivityResponseModel> value) => _userActivities.value = value;

  UserInfoModel get currentUser => _currentUser.value;
  set currentUser(UserInfoModel value) => _currentUser.value = value;

  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getAllLevels();
      await getCurrentUser();
      await getDailyTasks();
      await getCurrentUserActivities();
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


  void onTapTakeAction(){
    Get.find<BottomNavigationBarController>().selectedIndex=2;
  }

  Future<void> getCurrentUser() async {
    final response = await General().getCurrentUser();
    if (response.status == BaseModelStatus.Ok) {
       currentUser = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  Future<void> getDailyTasks() async {
    final response = await General().getAllDailyTasks();
    if (response.status == BaseModelStatus.Ok) {
      dailyTasks = response.data!;
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
      subtitle: 'We appreciate your efforts but you reached daily limit for this activity !',
      firstBtnText: 'Add Another',
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

  LevelsResponseModel getUsersCurrentLevel(){
    try{
      return allLevels.firstWhere((element) => element.co2Amount!<currentUser.savedCo2!);}
    catch(e){
      return allLevels[0];
    }
  }

  LevelsResponseModel getUsersNextLevel(){
    LevelsResponseModel currentLevel = getUsersCurrentLevel();
    int index = allLevels.indexWhere((element) => element.id==currentLevel.id);
    if(index==allLevels.length-1){
      return allLevels.last;
    }else{
      return allLevels[index+1];
    }
  }


  Future<void> abc() async{

  //   final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //     ced.forEach((element) async{ 
  //       final d = const Uuid().v4();
  //       final e = AllActivitiesResponseModel().fromJson(element);

  //       await firestore.collection(FirebaseTablesEnum.DAILY_TASKS.name).doc(d).set(
  //         AllActivitiesResponseModel(
  //           id:d,
  //           amount: e.amount,
  //           category: e.category,
  //           dailyLimit: 1,
  //           imageUrl: e.imageUrl,
  //           name: e.name
  //         ).toJson()
  //       );
  //     });
  // }
}
}

final List<Map<String, dynamic>> ced = [
  {
    'name': 'Dance me to end of love',
    'category': {
      'id': 'a8aaa843-c8af-4e72-b7bd-5f7fe960d40e',
      'name': 'Transport',
    },
    "image_url": 'https://cdn-icons-png.flaticon.com/128/2918/2918598.png',
    "amount":3,
  },
  {
    'name': 'Shopping on Gucci',
    'category': {
      'id': '97874659-d55f-4cae-8a76-dbfe63eec6c4',
      'name': 'Shopping',
    },
    "image_url": 'https://cdn-icons-png.flaticon.com/128/11488/11488025.png',
    "amount":1,
  },
];

// final List<Map<String,dynamic97874659-d55f-4cae-8a76-dbfe63eec6c4 {
// 'name':'Shopping',
// },
// {
// '509228be-3262-4bd4-84c9-948da6a7ce4b',
// },
// {
// 'name':'01268e33-3506-4916-9085-acc8fe11bc46 {
// 'name':'Home',
// },
// {
// 'name':'Other',
// },
// ];


// final List<Map<String,dynamic>> ced = [
//   {
// 'id':'123',
// 'name':'The Seed',
// 'co2_amount':5000,
// 'image_url':'www.google.com'
// },
// {
// 'id':'123',
// 'name':'Sprout',
// 'co2_amount':15000,
// 'image_url':'www.google.com'
// },
// {
// 'id':'123',
// 'name':'Seedling',
// 'co2_amount':30000,
// 'image_url':'www.google.com'
// },
// {
// 'id':'123',
// 'name':'Tree',
// 'co2_amount':60000,
// 'image_url':'www.google.com'
// },
// {
// 'id':'123',
// 'name':'Old Tree',
// 'co2_amount':100000,
// 'image_url':'www.google.com'
// },
// {
// 'id':'123',
// 'name':'Forest',
// 'co2_amount':150000,
// 'image_url':'www.google.com'
// }
// ];