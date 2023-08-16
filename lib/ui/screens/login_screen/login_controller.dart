import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:indian_race_fantasy/Authentication/authentication_repository.dart';

import '../../../router.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final countryCodeController = TextEditingController();
  final phoneNo = TextEditingController();

  void phoneAuthentication(String phoneNo){

    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

}

