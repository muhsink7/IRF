import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indian_race_fantasy/model/model_api/raceCardDetails.dart';
import 'package:intl/intl.dart';

import '../../../api/api.dart';
import '../../../model/model_api/today_tournament.dart';
import '../../../model/model_api/user_details.dart';

class BettingController extends GetxController with  GetTickerProviderStateMixin {
  final box = GetStorage();
  Api api = Get.find();
  var userDetails = UserDetails();
  // var raceCardDetails = RaceCardDetails(id: id, date: date, data: data, v: v)
  var  raceDetails = RaceCardDetails();
  bool isLoading = false;
  List<TodayTournamentDetails> todayTournaments = [];
  late String formattedDate;
  var tableNames;
  // var race;


  int selectedMainTabIndex = 0;
  int selectedSubTabIndex = 0;
  int raceIndex = 0;

  // Data for the 7 main tabs and 5 sub-tabs
  List<String> mainTabs = [
    // "R 1",
    // "R 2",
    // "R 3",
    // "R 4",
    // "R 5",
    // "R 6",
    // "R 7"
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

  late TabController tabController ;
  late TabController tabController2 = TabController(length: 5, vsync: this);

  void currentDate() {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Create a DateFormat instance for the desired format
    DateFormat dateFormat = DateFormat('dd/MM/yy');

    // Format the date as a string
    formattedDate = dateFormat.format(now);

    // Print the formatted date
    print(formattedDate);  // This will print something like "06/10/23" for October 6, 2023
  }



  @override
  void onInit() {

    super.onInit();
    currentDate();
    getUserDetails(GetStorage().read('userId'));
    print("+++++++++++Betting++++++++++++");
    final arguments = Get.arguments as Map<String, dynamic>;
    final tournament = arguments['tournament'];
    print("&&&&&&&+++++++++++$tournament++++++++++++&&&&&&&");
    // TODO: implement onInit
    fetchTodayTournamentDetails(formattedDate);
    print("+++++++++++$tableNames++++++++++++");
    if (tournament != null && tournament.tableNames != null) {
      mainTabs = tournament.tableNames;
      tabController = TabController(length: mainTabs.length, vsync: this);
    } else {
      // Handle the case when 'tournament' or 'tableNames' is not available
    }
    tabController.addListener(() {
      selectedMainTabIndex = tabController.index;
      selectedSubTabIndex = tabController2.index; // Reset sub-tab index when main tab changes
      update();
    });
    tabController2.addListener(() {
      selectedSubTabIndex = tabController2.index; // Reset sub-tab index when main tab changes
      update();
    });
    // displaySelectedRaceDetails(tabController.index, raceIndex);
    // fetchUserDetails();
    update();
  }
  void updateMainTabs(List<String> tableNames) {
    mainTabs = tableNames;
    print(mainTabs);
    tabController = TabController(length: tableNames.length, vsync: this);
    update(); // Trigger the UI update
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

  bool areTableNamesUnique(List<String> tableNames) {
    Set<String> uniqueTableNames = Set.from(tableNames);
    return uniqueTableNames.length == tableNames.length;
  }

  void fetchTodayTournamentDetails(String? date) async {
    try {
      date = formattedDate;
      print("+++/+++/++/+++/+++$date+++/+++/+++/+++");

      final List<TodayTournamentDetails> todayTournamentDetails = await api.getTodayTournamentDetails(date);
      todayTournaments = todayTournamentDetails;

      for (var tournamentDetails in todayTournamentDetails) {
        final tableNames = tournamentDetails.races?.map((race) => race[0]).toList() ?? [];
        print(tableNames);

        if (tableNames.isNotEmpty) {
          if (areTableNamesUnique(tableNames)) {
            updateMainTabs(tableNames);
            final selectedTableName = "Race 1"; // Replace with the table name you want to see details for

            for (var race in tournamentDetails.races ?? []) {
              if (race.isNotEmpty && race[0] == selectedTableName) {
                // This is the selected table
                print("Table Name: $selectedTableName");
                for (var horseDetails in race) {
                  if (horseDetails is Map<String, dynamic>) {
                    final horseNumber = horseDetails["Horse Number"];
                    final horseName = horseDetails["Horse Name"];
                    final drawBox = horseDetails["Draw Box"];
                    // Add more fields as needed
                    print('Horse Number: $horseNumber');
                    print('Horse Name: $horseName');
                    print('Draw Box: $drawBox');
                    // Display other fields as well
                  }
                }
              }
            }
          } else {
            print('Table names are not unique.');
          }

          // You can now access race details for a specific table name
          final selectedTableName = "Race 1"; // Replace with the table name you want to see details for
          // displayRaceDetailsForTable(todayTournamentDetails, selectedTableName);



          break;
        }
      }
    } catch (e) {
      print('Error fetching Today Tournament details: $e');
    }
  }

  // void displayRaceDetailsForTable(List<TodayTournamentDetails> tournaments, String selectedTableName) {
  //   for (var tournament in tournaments) {
  //     print("tournament: $tournament");
  //     if (tournament.races != null) {
  //       for (var race in tournament.races!) {
  //         race.map((races) => Race(
  //           tableName: race[0],
  //           // horseNumber: race![0],
  //           // drawBox: race['Draw Box'],
  //           // horseName: race['Horse Name'],
  //           // aCS: race['A/C/S'],
  //           // trainer: race['Trainer'],
  //           // jockey: race['Jockey'],
  //           // weight: race['Weight'],
  //           // allowance: race['Allowance'],
  //           // rating: race['Rating'],
  //         ),);
  //       }
  //       //   if (race.isNotEmpty && race[0]['tableName'] == selectedTableName) {
  //       //     print('Race Table Name: $selectedTableName');
  //       //     for (var horseDetails in race) {
  //       //       if (horseDetails['Horse Number'] != null) {
  //       //         final horseNumber = int.parse(horseDetails['Horse Number']);
  //       //         final horseName = horseDetails['Horse Name'];
  //       //         final drawBox = int.parse(horseDetails['Draw Box']);
  //       //         // Add more fields as needed
  //       //         print('Horse Number: $horseNumber');
  //       //         print('Horse Name: $horseName');
  //       //         print('Draw Box: $drawBox');
  //       //       }
  //       //     }
  //       //   }
  //       // }
  //     }
  //   }
  // }






  // void displaySelectedRaceDetails(int mainTabIndex, int selectedRaceIndex) {
  //   print("Selected Race Index: $selectedRaceIndex, Main Tab Index: $mainTabIndex");
  //
  //   if (mainTabIndex >= 0 && mainTabIndex < todayTournaments.length) {
  //     final tournament = todayTournaments[mainTabIndex];
  //
  //     if (selectedRaceIndex >= 0 && selectedRaceIndex < tournament.races!.length) {
  //       final race = tournament.races![selectedRaceIndex];
  //       print(race);
  //
  //       // final horseNumber = race.horseNumber;
  //       // final horseName = race.horseName;
  //       // final drawBox = race.drawBox;
  //       // // Access other race details here...
  //       //
  //       // print('Horse Number: $horseNumber');
  //       // print('Horse Name: $horseName');
  //       // print('Draw Box: $drawBox');
  //       // Print or use other race details as needed...
  //     } else {
  //       print("Invalid selectedRaceIndex");
  //     }
  //   } else {
  //     print("Invalid mainTabIndex");
  //   }
  // }



  // void fetchUserDetails(){
  //   getUserDetails(Api.instance.userId);
  // }

  void toggleLoading() {
    isLoading = !isLoading;
    update();
  }
}
