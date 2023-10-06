import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indian_race_fantasy/model/model_api/raceCardDetails.dart';
import 'package:indian_race_fantasy/model/model_api/today_tournament.dart';
import 'package:indian_race_fantasy/model/model_api/tournament_model.dart';
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

  Future<TournamentDetails> createTournament() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://localhost:5000/tournament/create/tournament'));
    request.body = json.encode({
      "tournamentName": "MY Tournament2",
      "entryFee": 100,
      "prizeMoney": 500,
      "startingPoint": 0,
      "pricePool": "Prize pool details",
      "payoutStructure": "Payout structure details",
      "minPlayers": 10,
      "maxPlayers": 50,
      "announceDate": "15/10/23",
      "announceTime": "10:15:00",
      "startDate": "30/11/23",
      "startTime": "08:00:00",
      "registrationDate": "29/10/23",
      "registrationTime": "09:00:00",
      "races": [
        "Race 1",
        "Race 2"
      ]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // Parse the response and return it
      final jsonResponse = json.decode(await response.stream.bytesToString());
      return TournamentDetails.fromJson(jsonResponse);
    } else {
      // Handle the error and return a default value or throw an exception
      print(response.reasonPhrase);
      // Return a default value or throw an exception here
      throw Exception('Failed to create tournament');
    }
  }


  Future<RaceCardDetails> getRaceCardDetails(String date) async {
    try {
      print("-------------$date-------------");
      var headers = {
        'Content-Type': 'application/json'
      };

      var request = http.Request(
          'GET', Uri.parse(
          'http://15.206.68.154:5000/users/getDetails/raceCard?date=$date'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseString = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // final responseBody = json.decode(responseString);
        print("**********************************");
        final Map<String, dynamic> responseBody = json.decode(responseString);
        final raceCardDetails = RaceCardDetails.fromJson(responseBody);
        // final raceCardDetails = RaceCardDetails.fromJson(responseBody);
        // print(responseBody);
        return raceCardDetails;
      } else {
        // Handle specific error cases based on response status code
        if (response.statusCode == 404) {
          throw Exception('Race card not found');
        } else {
          throw Exception(
              'Failed to load race card details: ${response.statusCode}');
        }
      }
    } catch (e) {
      // Handle exceptions here
      throw Exception('Failed to load race card details: $e');
    }
  }

  Future<TodayTournamentDetails> getTodayTournamentDetails(String date) async {
    try {
      print("-------------$date-------------");
      var headers = {
        'Content-Type': 'application/json'
      };

      var request = http.Request(
          'GET', Uri.parse(
          'http://15.206.68.154:5000/tournament/getDetails/today/tournament?date=$date'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseString = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // final responseBody = json.decode(responseString);
        print("**********************************");
        final Map<String, dynamic> responseBody = json.decode(responseString);
        final todayTournament = TodayTournamentDetails.fromJson(responseBody);
        // final raceCardDetails = RaceCardDetails.fromJson(responseBody);
        // print(responseBody);
        print(todayTournament);
        return todayTournament;
      } else {
        // Handle specific error cases based on response status code
        if (response.statusCode == 404) {
          throw Exception('Race card not found');
        } else {
          throw Exception(
              'Failed to load race card details: ${response.statusCode}');
        }
      }
    } catch (e) {
      // Handle exceptions here
      throw Exception('Failed to load race card details: $e');
    }
  }
}