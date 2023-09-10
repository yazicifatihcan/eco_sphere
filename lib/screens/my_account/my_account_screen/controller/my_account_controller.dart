import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widget_extension.dart';
import 'package:flutter_base_project/screens/my_account/my_account_screen/view/components/how_to_calculate_bottom_sheet.dart';
import 'package:get/get.dart';
import '../../../../app/bl/general.dart';
import '../../../../app/components/bottom_sheet/general_information_bottom_sheet.dart';
import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/constants/enum/type_enum.dart';
import '../../../../app/controllers/general/session_service.dart';
import '../../../../app/mixin/state_bottom_sheet_mixin.dart';
import '../../../../app/model/response/activity_response_model.dart';
import '../../../../app/model/response/levels_response_model.dart';
import '../../../../app/model/response/user_activity_response_model.dart';
import '../../../../app/model/response/user_info_model.dart';
import '../../../../app/navigation/route/route.dart';
import '../../../../app/navigation/route/route_factory.dart';
import '../../../../app/theme/color/app_colors.dart';
import '../../../../core/exception/app_exception.dart';
import '../../../../core/i10n/i10n.dart';
import '../view/components/contact_us_bottom_sheet.dart';
import '../view/model/chart_data.dart';

class MyAccountController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => scaffoldKey.currentContext!;

  final SessionService sessionService = Get.find();

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<List<ChartData>> _chartData = Rx([]);
  final Rx<int> _selectTab = Rx(0);
  final Rx<List<UserActivityResponseModel>> _userActivities = Rx([]);
  final Rx<List<LevelsResponseModel>> _allLevels = Rx([]);
  final Rx<UserInfoModel> _currentUser = Rx(UserInfoModel());
  

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  List<ChartData> get chartData => _chartData.value;
  set chartData(List<ChartData> value) => _chartData.value = value;

  int get selectTab => _selectTab.value;
  set selectTab(int value) => _selectTab.value = value;

  List<UserActivityResponseModel> get userActivities => _userActivities.value;
  set userActivities(List<UserActivityResponseModel> value) => _userActivities.value = value;

  List<LevelsResponseModel> get allLevels => _allLevels.value;
  set allLevels(List<LevelsResponseModel> value) => _allLevels.value = value;

  UserInfoModel get currentUser => _currentUser.value;
  set currentUser(UserInfoModel value) => _currentUser.value = value;

  List<Color> graphColorPalette = [
    AppColor.primary,
    AppColor.lightGreenColor,
    AppColor.lightPrimary,
    AppColor.turkcellYellow
  ];

  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getCurrentUser();
      await getCurrentUserActivities();
      await getChartData();
      await getAllLevels();
      loadingStatus = LoadingStatus.Loaded;
      LoadingProgress.stop();
    } catch (e) {
      loadingStatus = LoadingStatus.Error;
      LoadingProgress.stop();
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



  Future<void> getCurrentUserActivities() async {
    final response = await General().getAllCurrentUserActivities();
    if (response.status == BaseModelStatus.Ok) {
      userActivities = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  Future<void> getCurrentUser() async {
    final response = await General().getCurrentUser();
    if (response.status == BaseModelStatus.Ok) {
      sessionService.currentUser = response.data!;
      currentUser = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  LevelsResponseModel getUsersCurrentLevel(){
    try{
      return allLevels.lastWhere((element) => element.co2Amount!<currentUser.savedCo2!);}
    catch(e){
      return allLevels[0];
    }
  }

  Future<void> getChartData() async {
    Map<String, List<AllActivitiesResponseModel>> categorizedActivities = {};

    for (var activity in userActivities) {
      final category = activity.activity!.category!.name!;
      categorizedActivities.putIfAbsent(category, () => []);
      categorizedActivities[category]!.add(activity.activity!);
    }

    categorizedActivities.forEach((key, value) {
      double y = 0;
      for (var element in value) {
        y = y + element.amount!;
      }
      chartData.add(ChartData(key, y));
    });

    chartData = chartData;
  }

  void unfocus() => FocusScope.of(context).unfocus();

  

  void onTapLegal() =>  Navigator.pushNamed(context, MainScreensEnum.legalScreen.path,arguments: LegalTypesEnum.ABOUT);

  void onTapFaq() =>  Navigator.pushNamed(context, MainScreensEnum.faqScreen.path);

  
  
  Future<void> onTapContactUs() async {
    final GlobalKey<FormState> fKey = GlobalKey<FormState>();
    final TextEditingController cContent = TextEditingController();
    final TextEditingController cEmail = TextEditingController(text: sessionService.currentUser.email);
    ContactUsBottomSheet(
      cContent: cContent,
      cEmail: cEmail,
      onTapSend: () {
        if(fKey.currentState!.validate()){
          onTapSend(cEmail.text.toLowerCase(), cContent.text);
        }
      },
      fKey: fKey,
    ).showBottomSheet(context: context);
}

  Future<void> onTapHowToCalculate() async {
    const HowToCalculateBottomSheet().showBottomSheet(context: context);
}



Future<void> onTapSend(String email,String content)async{
  try {
        LoadingProgress.start();
        await sendContactRequest(email,content);
        LoadingProgress.stop();
        await showSuccessStateBottomSheet(
          message: 'We got your message. Our team will check the message and get back to you!',
          title:  'Request Sent'
        );
        Navigator.pop(context);
      } catch (e) {
        LoadingProgress.stop();
        showErrorStateBottomSheet(
          message: e.toString(),
        );
      }
}

Future<void> sendContactRequest(String email,String content) async {
    // ContactUsRequestModel contactUsRequestModel = ContactUsRequestModel(
    //     email: email, message: content, name: sessionService.currentUser.username, subject: 'Contact Us');
    // final response = await General().createContactRequest(contactUsRequestModel);
    // if (response.status != BaseModelStatus.Ok) {
    //   throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    // }
  }


  Future<void> onTapLogout() async {
    GeneralInformationBottomSheet(
      title: 'Logout',
      subtitle: 'Are you sure you want to log out of EcoSphere’s app?',
      firstBtnText: 'Yes, log me out',
      onTapFirstBtn: onTapApproveLogoutBtn,
    ).openBottomSheet(context: context);
  }

  Future<void> onTapApproveLogoutBtn() async {
    try {
      LoadingProgress.start();
      await logout();
      await sessionService.logOut();
      LoadingProgress.stop();
      await MyRouteFactory().restartApp();
    } catch (e) {
      Navigator.pop(context);
      LoadingProgress.stop();
      showErrorStateBottomSheet(message: e.toString());
    }
  }

  Future<void> onTapDeleteAccount() async {
    GeneralInformationBottomSheet(
      title: 'Delete account',
      subtitle: 'Are you sure you want to delete your account? This action is irreversible.',
      firstBtnText: 'Yes, delete my account',
      onTapFirstBtn: onTapApproveDeleteAccountBtn,
    ).openBottomSheet(context: context);
  }

  Future<void> onTapApproveDeleteAccountBtn() async {
    try {
      LoadingProgress.start();
      await deleteAccount();
      await sessionService.logOut();
      LoadingProgress.stop();
      await MyRouteFactory().restartApp();
    } catch (e) {
      Navigator.pop(context);
      LoadingProgress.stop();
      showErrorStateBottomSheet(message: e.toString());
    }
  }

  Future<void> logout()async{
    await sessionService.logOut();
    MyRouteFactory().restartApp();
  }

  Future<void> deleteAccount() async {
    await sessionService.logOut();
    MyRouteFactory().restartApp();
  }

  void onTapTryAgain() {
    Navigator.pop(context);
    onReady();
  }
}


List<ChartData> dummyChartData = [
  ChartData('Shopping', 23),
  ChartData('Food', 60),
  ChartData('Home', 40),
  ChartData('Transport', 15),
];
