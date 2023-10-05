import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indian_race_fantasy/model/model_api/raceCardDetails.dart';

import '../../../api/api.dart';
import '../../../model/model_api/user_details.dart';

class BettingController extends GetxController with  GetTickerProviderStateMixin {
  final box = GetStorage();
  Api api = Get.find();
  var userDetails = UserDetails();
  // var raceCardDetails = RaceCardDetails(id: id, date: date, data: data, v: v)
  var  raceDetails = RaceCardDetails();
  bool isLoading = false;

  int selectedMainTabIndex = 0;
  int selectedSubTabIndex = 0;

  // Data for the 7 main tabs and 5 sub-tabs
  List<String> mainTabs = [
    "R 1",
    "R 2",
    "R 3",
    "R 4",
    "R 5",
    "R 6",
    "R 7"
  ];
  List<List<String>> subTabs = [
    ["WIN 1.1", "SHP 1.2", "PLACE 1.3", "FORECAST 1.4", "QUINELLA 1.5"],
    ["WIN 2.1", "SHP 2.2", "PLACE 2.3", "FORECAST 2.4", "QUINELLA 2.5"],
    ["WIN 3.1", "SHP 3.2", "PLACE 3.3", "FORECAST 3.4", "QUINELLA 3.5"],
    ["WIN 4.1", "SHP 4.2", "PLACE 4.3", "FORECAST 4.4", "QUINELLA 4.5"],
    ["WIN 5.1", "SHP 5.2", "PLACE 5.3", "FORECAST 5.4", "QUINELLA 5.5"],
    ["WIN 6.1", "SHP 6.2", "PLACE 6.3", "FORECAST 6.4", "QUINELLA 6.5"],
    ["WIN 7.1", "SHP 7.2", "PLACE 7.3", "FORECAST 7.4", "QUINELLA 7.5"],
  ];

  late TabController tabController = TabController(length: 7, vsync: this);
  late TabController tabController2 = TabController(length: 5, vsync: this);



  @override
  void onInit() {

    super.onInit();

    getUserDetails(GetStorage().read('userId'));
    print("+++++++++++Betting++++++++++++");
    // TODO: implement onInit
    tabController.addListener(() {
      selectedMainTabIndex = tabController.index;
      selectedSubTabIndex = tabController2.index; // Reset sub-tab index when main tab changes
      update();
    });
    tabController2.addListener(() {
      selectedSubTabIndex = tabController2.index; // Reset sub-tab index when main tab changes
      update();
    });
    // fetchUserDetails();
    update();
  }
  void fetchRaceCardDetails(String? date) async {
    try {
      print("++++++++++++++$date++++++++++++");
      if (date == null) {
        // Handle the case where date is null, provide a default value, or return an error.
        print('Date is null. Handle this case.');
        return;
      }
      // final currentDate = date;
      // final date = '19/09/23'; // Replace with the actual date you want to fetch

      final raceCardDetails = await api.getRaceCardDetails(date);
      raceDetails = raceCardDetails;
      print(raceCardDetails);

      // Now you can use the raceCardDetails object
      print('Race Card Table Name: ${raceDetails.data?[0].tableName}');

      // for (final raceDetails in raceCardDetails.data ?? []) {
      //   print('Table Name: ${raceDetails.tableName}');
      //   for (final raceDetails in raceCardDetails.data ?? []) {
      //     print('Table Name: ${raceDetails.horseName}');
      //   }
      // }
      final Map<String, List<RaceDetails>> raceDetailsByTable = {};

      for (final raceDetails in raceCardDetails.data ?? []) {
        final tableName = raceDetails.tableName.toString(); // Convert enum to string

        if (!raceDetailsByTable.containsKey(tableName)) {
          raceDetailsByTable[tableName] = [];
        }

        raceDetailsByTable[tableName]?.add(raceDetails);
      }

// Now, print all the data grouped by table name
      raceDetailsByTable.forEach((tableName, raceDetailsList) {
        print('Table Name: $tableName');
        for (final raceDetail in raceDetailsList) {
          print('Horse Number: ${raceDetail.horseNumber}');
          print('Draw Box: ${raceDetail.drawBox}');
          print('Horse Name: ${raceDetail.horseName}');
          print('ACS: ${raceDetail.aCS}');
          print('Trainer: ${raceDetail.trainer}');
          print('Jockey: ${raceDetail.jockey}');
          print('Weight: ${raceDetail.weight}');
          print('Allowance: ${raceDetail.allowance}');
          print('Rating: ${raceDetail.rating}');
          print('-----------------------------');
        }
      });


      print('Race Card ID: ${raceCardDetails.id}');
      print('Date: ${raceCardDetails.date}');
      print('Version: ${raceCardDetails.v}');

      // for (final raceDetails in raceCardDetails.data) {
      //   print('Table Name: ${raceDetails.tableName}');
      //   print('Horse Number: ${raceDetails.horseNumber}');
      //   print('Draw Box: ${raceDetails.drawBox}');
      //   print('Horse Name: ${raceDetails.horseName}');
      //   print('ACS: ${raceDetails.aCS}');
      //   print('Trainer: ${raceDetails.trainer}');
      //   print('Jockey: ${raceDetails.jockey}');
      //   print('Weight: ${raceDetails.weight}');
      //   print('Allowance: ${raceDetails.allowance}');
      //   print('Rating: ${raceDetails.rating}');
      //   print('-----------------------------');
      // }
    } catch (e) {
      print('Error fetching race card details: $e');
    }
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
