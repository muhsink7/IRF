import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:indian_race_fantasy/router.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      print("******************************************************");
      Get.toNamed(RoutePaths.otpScreen);
    } else {
      print("--------------------------------------------------------");
      Get.offAllNamed(RoutePaths.homeScreen);
    }
  }


  Future<void> phoneAuthentication(String phoneNo) async {
    print(phoneNo);
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
        verificationFailed: (e) {
          if (e.code == "Invalid Phone Number") {
            Get.snackbar("Error", "Provided PhoneNumber is not valid");
          } else {
            Get.snackbar("Error", "Something went wrong try again");
          }
        }
        );
    Get.toNamed(RoutePaths.otpScreen);
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = PhoneAuthProvider.credential(
      verificationId: verificationId.value,
      smsCode: otp,
    );
    try {
      var authResult = await _auth.signInWithCredential(credentials);
      return authResult.user != null;
    } catch (e) {
      print("Error verifying OTP: $e");
      return false;
    }
  }
}
