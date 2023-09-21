import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../api/api.dart';
import '../../../model/model_api/user_details.dart';

class BettingController extends GetxController with  GetSingleTickerProviderStateMixin {
  final box = GetStorage();
  Api api = Get.find();
  var userDetails = UserDetails();
  bool isLoading = false;

  int selectedMainTabIndex = 0;
  int selectedSubTabIndex = 0;

  // Data for the 7 main tabs and 5 sub-tabs
  List<String> mainTabs = [
    "Main Tab 1",
    "Main Tab 2",
    "Main Tab 3",
    "Main Tab 4",
    "Main Tab 5",
    "Main Tab 6",
    "Main Tab 7"
  ];
  List<List<String>> subTabs = [
    ["Sub Tab 1.1", "Sub Tab 1.2", "Sub Tab 1.3", "Sub Tab 1.4", "Sub Tab 1.5"],
    ["Sub Tab 2.1", "Sub Tab 2.2", "Sub Tab 2.3", "Sub Tab 2.4", "Sub Tab 2.5"],
    ["Sub Tab 3.1", "Sub Tab 3.2", "Sub Tab 3.3", "Sub Tab 3.4", "Sub Tab 3.5"],
    ["Sub Tab 4.1", "Sub Tab 4.2", "Sub Tab 4.3", "Sub Tab 4.4", "Sub Tab 4.5"],
    ["Sub Tab 5.1", "Sub Tab 5.2", "Sub Tab 5.3", "Sub Tab 5.4", "Sub Tab 5.5"],
    ["Sub Tab 6.1", "Sub Tab 6.2", "Sub Tab 6.3", "Sub Tab 6.4", "Sub Tab 6.5"],
    ["Sub Tab 7.1", "Sub Tab 7.2", "Sub Tab 7.3", "Sub Tab 7.4", "Sub Tab 7.5"],
  ];

  // Sample data for displaying details based on selected tabs
  List<List<String>> details = [
    // Details for Main Tab 1
    [
      "Main Tab 1, Sub Tab 1.1 Details",
      "Main Tab 1, Sub Tab 1.2 Details",
      "Main Tab 1, Sub Tab 1.3 Details",
      "Main Tab 1, Sub Tab 1.4 Details",
      "Main Tab 1, Sub Tab 1.5 Details"
    ],
    // Details for Main Tab 2
    [
      "Main Tab 2, Sub Tab 2.1 Details",
      "Main Tab 2, Sub Tab 2.2 Details",
      "Main Tab 2, Sub Tab 2.3 Details",
      "Main Tab 2, Sub Tab 2.4 Details",
      "Main Tab 2, Sub Tab 2.5 Details"
    ],
    // Details for Main Tab 3
    [
      "Main Tab 3, Sub Tab 3.1 Details",
      "Main Tab 3, Sub Tab 3.2 Details",
      "Main Tab 3, Sub Tab 3.3 Details",
      "Main Tab 3, Sub Tab 3.4 Details",
      "Main Tab 3, Sub Tab 3.5 Details"
    ],
    // Details for Main Tab 4
    [
      "Main Tab 4, Sub Tab 4.1 Details",
      "Main Tab 4, Sub Tab 4.2 Details",
      "Main Tab 4, Sub Tab 4.3 Details",
      "Main Tab 4, Sub Tab 4.4 Details",
      "Main Tab 4, Sub Tab 4.5 Details"
    ],
    // Details for Main Tab 5
    [
      "Main Tab 5, Sub Tab 5.1 Details",
      "Main Tab 5, Sub Tab 5.2 Details",
      "Main Tab 5, Sub Tab 5.3 Details",
      "Main Tab 5, Sub Tab 5.4 Details",
      "Main Tab 5, Sub Tab 5.5 Details"
    ],
    // Details for Main Tab 6
    [
      "Main Tab 6, Sub Tab 6.1 Details",
      "Main Tab 6, Sub Tab 6.2 Details",
      "Main Tab 6, Sub Tab 6.3 Details",
      "Main Tab 6, Sub Tab 6.4 Details",
      "Main Tab 6, Sub Tab 6.5 Details"
    ],
    // Details for Main Tab 7
    [
      "Main Tab 7, Sub Tab 7.1 Details",
      "Main Tab 7, Sub Tab 7.2 Details",
      "Main Tab 7, Sub Tab 7.3 Details",
      "Main Tab 7, Sub Tab 7.4 Details",
      "Main Tab 7, Sub Tab 7.5 Details"
    ],
  ];

  late TabController tabController = TabController(length: 7, vsync: this);


  @override
  void onInit() {

    super.onInit();

    getUserDetails(GetStorage().read('userId'));
    print("+++++++++++Betting++++++++++++");
    // TODO: implement onInit
    tabController.addListener(() {
      selectedMainTabIndex = tabController.index;
    });
    // fetchUserDetails();
    update();
  }

  Future<void> getUserDetails(String? userId) async {
    try {
      if (userId == null) {
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
