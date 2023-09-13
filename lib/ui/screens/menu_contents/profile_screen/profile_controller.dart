import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../api/api.dart';
import '../../../../model/model_api/user_details.dart';

class ProfileController extends GetxController {
  // Define observables for user details
  final RxString username = ''.obs;
  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString aadharNumber = ''.obs;
  final RxString pancardNumber = ''.obs;
  final RxString address = ''.obs;

  final box = GetStorage();
  Api api = Get.find();



  var userDetails = UserDetails();

  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserDetails(GetStorage().read('userId'));
    print(GetStorage().read('userId'));
    // fetchUserDetails();
    update();
  }

  Future<void> getUserDetails(String? userId) async {
    try {
      if(userId==null) {
        return;
      }
      var userDetailsData = await api.getUserDetails(userId);
      userDetails = userDetailsData;
      update();
      print("Fetched user's username: ${userDetails.userName}");
    } catch (e) {
      print('Error fetching user details: $e');
    }
  }

  // void fetchUserDetails(){
  //   getUserDetails(Api.instance.userId);
  // }

  void toggleLoading() {
    isLoading = !isLoading;
    update();
  }

}
