import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:indian_race_fantasy/ui/screens/otp_screen/otp_controller.dart';

import '../../../api/api.dart';
import '../../../model/model_api/user_details.dart';



class HomeController extends GetxController {

  final box = GetStorage();
  Api api = Get.find();



  var userDetails = UserDetails();


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