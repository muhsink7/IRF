import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indian_race_fantasy/model/model_api/today_tournament.dart';
import 'package:intl/intl.dart';

import '../../../api/api.dart';
import '../../../model/model_api/user_details.dart';
import '../betting_screen/betting_controller.dart';



class HomeController extends GetxController {

  final box = GetStorage();
  Api api = Get.find();
  var userDetails = UserDetails();
  List<TodayTournamentDetails> todayTournaments = [];
  late String formattedDate;


  final RxInt currentBannerIndex = 0.obs;

  final List<Map> imageList = [
    {
      "id" : 1,
      'image': 'assets/images/image1.png',
      'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaMs8d5haQSAxv82HkI_fiixeWQ3IUzkyK9osfV6gBPmGhskl-KS78zUsSKeQTNzwKoGU&usqp=CAU',
    },
    {
      "id" : 2,
      'image': 'assets/images/image2.png',
      'url': '2wCEAAoGBxMUExYUFBQYGBYZFhocGRoZGhoaHxkgHxobHxwaHxwfHywiHB8oHRwaIzQjKCwuMTExGSE3PDcwOyswMS4BCwsLDw4PHRERHTYoIik2MDYyMDI2MjI6MTsyMjIwMDAyMjAwMjAwMDAwMDAwMDAwMjkwMDAwMDAwMDAwMDAwMP',
    },
    {
      "id" : 3,
      'image': 'assets/images/image3.png',
      'url': 'https://lh3.googleusercontent.com/qaSZDhmXgpZNgxk6WCo5FgrZ1rOwYSiw7-CrCdPEnyDMPj5DOGqft-ADuEGzYSI3mJ_5EJBVm1dbD9d98QhHIRii1YjcSYGE=s750',
    },
  ];
  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    currentBannerIndex;
    currentDate();
    print("**********$formattedDate*******");
    getUserDetails(GetStorage().read('userId'));
    fetchTodayTournamentDetails(formattedDate);
    print(GetStorage().read('userId'));
    // fetchUserDetails();
    update();
  }
  // final BettingController bettingController = Get.put(BettingController());
  //
  // // Function to handle selecting a race
  // void handleSelectRace(int raceIndex) {
  //   bettingController.selectRace(raceIndex);
  // }

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


  void fetchTodayTournamentDetails(String? date) async {

      if (formattedDate != null) {
        date = formattedDate!;
        print("+++/+++/++/+++/+++$date+++/+++/+++/+++");

        final List<TodayTournamentDetails> todayTournamentDetails =
        await api.getTodayTournamentDetails(date);
        todayTournaments = todayTournamentDetails;
        print("today tournament: $todayTournamentDetails");

        // Ensure you have the correct model structure for the response.
        // The response may be a list of tournaments or a single tournament.
        // If it's a list, you can iterate through them as follows:
        for (var tournamentDetails in todayTournamentDetails) {
          print("Tournament Name: ${tournamentDetails.tournamentName}");

          // Access race details for this tournament if needed
          if (tournamentDetails.races != null) {
            for (var race in tournamentDetails.races) {
              // Access the tableName and details for each race
              print("Race Table Name: ${race[0].tableName}");
              for (var detail in race[0].details) {
                print("Horse Name: ${detail.horseName}");
                // Access other details as needed
              }
            }
          }
        }
      } else {
        print('formattedDate is null');
        // Add proper error handling or fallback logic if needed
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