import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base_project/app/libs/firebase/firebae_auth_manager.dart';
import 'package:flutter_base_project/app/model/response/activity_response_model.dart';
import 'package:flutter_base_project/app/model/response/levels_response_model.dart';
import 'package:flutter_base_project/app/model/response/user_info_model.dart';
import 'package:get/get.dart';

import '../constants/enum/loading_status_enum.dart';
import '../constants/enum/type_enum.dart';
import '../controllers/general/session_service.dart';
import '../model/header/session_header_model.dart';
import '../model/response/base_http_model.dart';
import '../model/response/user_activity_response_model.dart';

/// Tüm moldüllerde ile kullanılan Http işlemleri burada yapılmakta
///
class General extends SessionHeaderModel {
  General() : super(token: Get.find<SessionService>().getUserToken() ?? '');

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  SessionService sessionService = Get.find();

  Future<BaseHttpModel<List<LevelsResponseModel>>> getAllLevels() async {
    try {
      final CollectionReference<Map<String, dynamic>> collectionRef =
          firestore.collection(FirebaseTablesEnum.LEVEL_BREAKPOINTS.name);
      final response = await collectionRef.get();
      List<LevelsResponseModel> allLevels = response.docs
          .map(
            (e) => LevelsResponseModel().fromJson(
              e.data(),
            ),
          )
          .toList();
      allLevels.sort((a,b)=>a.co2Amount!.compareTo(b.co2Amount!));
      return BaseHttpModel(status: BaseModelStatus.Ok, data: allLevels);
    } on FirebaseException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<List<AllActivitiesResponseModel>>> getAllActivities() async {
    try {
      final CollectionReference<Map<String, dynamic>> collectionRef =
          firestore.collection(FirebaseTablesEnum.ACTIVITIES.name);
      final response = await collectionRef.get();
      List<AllActivitiesResponseModel> allActivities = response.docs
          .map(
            (e) => AllActivitiesResponseModel().fromJson(
              e.data(),
            ),
          )
          .toList();
      return BaseHttpModel(status: BaseModelStatus.Ok, data: allActivities);
    } on FirebaseException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<List<AllActivitiesResponseModel>>> getAllDailyTasks() async {
    try {
      final CollectionReference<Map<String, dynamic>> collectionRef =
          firestore.collection(FirebaseTablesEnum.DAILY_TASKS.name);
      final response = await collectionRef.get();
      List<AllActivitiesResponseModel> allActivities = response.docs
          .map(
            (e) => AllActivitiesResponseModel().fromJson(
              e.data(),
            ),
          )
          .toList();
      return BaseHttpModel(status: BaseModelStatus.Ok, data: allActivities);
    } on FirebaseException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<List<UserInfoModel>>> getAllUsers() async {
    try {
      final CollectionReference<Map<String, dynamic>> collectionRef =
          firestore.collection(FirebaseTablesEnum.USERS.name);
      final response = await collectionRef.get();
      List<UserInfoModel> allActivities = response.docs
          .map(
            (e) => UserInfoModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return BaseHttpModel(status: BaseModelStatus.Ok, data: allActivities);
    } on FirebaseException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }


  Future<BaseHttpModel> addUserActivity(UserActivityResponseModel userActivityResponseModel) async {
    try {
      await firestore.collection(FirebaseTablesEnum.USER_ACTIVITIES.name).add(userActivityResponseModel.toJson());
      await firestore
          .collection(FirebaseTablesEnum.USERS.name)
          .doc(token)
          .update({"saved_co2": FieldValue.increment(userActivityResponseModel.activity!.amount!)});
      return BaseHttpModel(status: BaseModelStatus.Ok);
    } on FirebaseException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<List<UserActivityResponseModel>>> getAllCurrentUserActivities() async {
    try {
      final response = await firestore
          .collection(FirebaseTablesEnum.USER_ACTIVITIES.name)
          .where('owner_id', isEqualTo: sessionService.currentUser.uuid).get();
      List<UserActivityResponseModel> userActivities = response.docs
          .map(
            (e) => UserActivityResponseModel().fromJson(
              e.data(),
            ),
          )
          .toList();
      return BaseHttpModel(status: BaseModelStatus.Ok,data: userActivities);
    } on FirebaseException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<UserInfoModel>> getCurrentUser() async {
    try {
      final user = await FirebaseAuthManager().getUserInfoFromFirebase(sessionService.currentUser.uuid!);
      return BaseHttpModel(status: BaseModelStatus.Ok, data: user);
    } on FirebaseException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }
}
