import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model_api/kyc_update.dart';
import '../model/model_api/user_details.dart';
import '../router.dart';

class Api {
  static final String baseUrl = 'http://15.206.68.154:5000'; // Your API base URL

  final box = GetStorage();


  Future<void> phoneAuthentication(String phoneNo) async {
    if (phoneNo.isNotEmpty) {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
        'POST',
        Uri.parse('http://15.206.68.154:5000/users/send-otp'),
      );
      request.body = json.encode({
        "phoneNumber": phoneNo,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        // You can return any relevant data here if needed.
        Get.toNamed(RoutePaths.otpScreen, arguments: phoneNo);
      } else {
        print(response.reasonPhrase);
        throw Exception('Failed to send OTP');
      }
    } else {
      throw Exception('Mobile Number is empty');
    }
  }

  Future<void> verifyOtp(String otp, String phoneNumber) async {
    if (otp.isNotEmpty) {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse('http://15.206.68.154:5000/users/verify-otp'));
      request.body = json.encode({
        "phoneNumber": phoneNumber,
        "otp": otp,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseString = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        var responseData = json.decode(responseString);
        var userId = responseData['userId'];
        phoneNumber = phoneNumber;
        getUserDetails(responseData['userId']);
        //updateKyc(userId, phoneNumber);
        box.write('kycUpdateData', responseString);
        box.write('is_authenticated', true);
        box.write('userId', responseData['userId']);
        box.write('phoneNumber',phoneNumber);
      } else {
        print(response.reasonPhrase);
      }

      bool isVerified = response.statusCode == 200;
      if (isVerified) {
        Get.offAllNamed(RoutePaths.mainScreen);
      } else {
        Get.back();
      }
    } else {
      print("OTP is empty");
    }
  }

  Future<void> updateKyc(KycUpdate kycData) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT', Uri.parse('http://15.206.68.154:5000/users/update/${kycData.userId}'));
    request.body = json.encode(kycData.toJson());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<UserDetails> getUserDetails(String userId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('http://15.206.68.154:5000/users/getUserDetails?userId=$userId'));
    request.body = json.encode({});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseData = json.decode(await response.stream.bytesToString());
      return UserDetails.fromJson(responseData);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}