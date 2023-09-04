import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indian_race_fantasy/ui/screens/home_screen/home_controller.dart';

class MainController extends GetxController{

  final  HomeController homeController = Get.put(HomeController());


  RxInt indexChangeNotifier = 2.obs; // Use RxInt from GetX
  @override
  void onInit() {
    refreshUserDetails();
    update();
    super.onInit();
  }

  void refreshUserDetails() {
    // Call the getUserDetails method to refresh the user details
    // Assuming you have a reference to HomeController
    homeController.getUserDetails(GetStorage().read('userId'));
  }
}