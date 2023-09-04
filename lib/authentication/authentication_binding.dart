
import 'package:get/get.dart';
import 'package:indian_race_fantasy/authentication/authentication_repository.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationRepository());
  }
}