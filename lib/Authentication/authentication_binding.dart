
import 'package:get/get.dart';
import 'package:indian_race_fantasy/Authentication/authentication_repository.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationRepository());
  }
}