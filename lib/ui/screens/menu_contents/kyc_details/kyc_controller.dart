import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indian_race_fantasy/model/dialog_models/update_error.dart';
import 'package:indian_race_fantasy/model/model_api/kyc_update.dart';
import 'package:indian_race_fantasy/router.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/kyc_details/image_list_screen.dart';
import '../../../../api/api.dart';
import '../../../../model/dialog_models/update_success.dart';
import '../../../../model/model_api/user_details.dart';

class KYCController extends GetxController {
  bool isKYCSubmitted = false;
  Api api = Get.find();


  List<KycUpdate> kycUpdateData = [];
  var userDetails = UserDetails().obs;

  var kycData;

  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController pancardNumController = TextEditingController();
  TextEditingController aadharNumController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController upiIdController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  DateTime? selectedDate;

  final bool isAadharFormatError = false;


  final DateTime lastDate = DateTime.now().subtract(const Duration(days: 365 * 18));

  String? gender;

  String? accountNumberError;
  String? bankNameError;
  String? emailError;
  String? firstNameError;
  String? lastNameError;
  String? ifscCodeError;
  String? pancardNumError;
  String? aadharNumError;
  String? userNameError;
  String? genderError;
  String? dobError;

  String? selectedGender;
  final List<String> genderOption = ['Male', 'Female', 'Others'];



  @override
  void onInit() {
    getUserDetails(GetStorage().read('userId'));
    print(GetStorage().read('userId'));
    update();
    super.onInit();
    // getUserDetails(OtpController.instance.userId);
  }

  void selectGender(String gender) {
    selectedGender = gender;
    genderController.text = gender;
  }

  final ImagePicker _imagePicker = ImagePicker();
  // final Box<String> _imageBox = Hive.box<String>('images');
  RxList<String> _imagePaths = <String>[].obs;

  List<String> get imagePaths => _imagePaths.toList();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      final imagePath = pickedFile.path;
      // _imageBox.add(imagePath);
      _imagePaths.add(imagePath);
      Get.to(ImageListScreen(pickedImage: [imagePath]));
    }
  }

  void showGenderOption() {
    Get.dialog(
      AlertDialog(
        title: const Text("Select a gender"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: const Text('Male'),
                onTap: () {
                  selectGender('Male');
                  Get.back(); // Close the dialog using GetX
                },
              ),
              ListTile(
                title: const Text('Female'),
                onTap: () {
                  selectGender('Female');
                  Get.back(); // Close the dialog using GetX
                },
              ),
              ListTile(
                title: const Text('Others'),
                onTap: () {
                  selectGender('Other');
                  Get.back(); // Close the dialog using GetX
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void genderSelected(String gender) {
    selectedGender = gender;
    genderController.text = gender;
    this.gender = gender;
  }

  void showImageOption() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(39, 63, 81, 181),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Pick image from',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            pickImage(ImageSource.camera);
                            Get.back(); // Close the dialog using GetX
                          },
                          child: const Icon(Icons.camera_alt),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text('Camera'),
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            pickImage(ImageSource.gallery);
                            Get.back(); // Close the dialog using GetX
                          },
                          child: const Icon(Icons.image),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text('Gallery'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? lastDate,
      firstDate: DateTime(1940),
      lastDate: lastDate,
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateOfBirthController.text = "${selectedDate?.toLocal()}".split(' ')[0];
      update();
      print(dateOfBirthController.text);
    }
  }


  void showKycUpdateDialog() {
    Get.dialog(
      UpdateSuccess(
        onOkPressed: () {
          // Implement the refresh KYC logic here
          // This function will be called when the "OK" button is pressed
          isKYCSubmitted = true;
          Get.toNamed(RoutePaths.kycDetailsScreen);
        }, title: 'Your KYC Details is updated',
      ),
    );
  }

  Future<void> kycUpdate(String userId, String phoneNumber,) async {
    bool isValidPanCard(String panCardNumber) {
      // PAN card should be in the format of five uppercase letters, four digits, and one uppercase letter
      return RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(panCardNumber);
    }

    bool isValidAadhar(String aadharNumber) {
      // Aadhar number should be 12 digits
      return RegExp(r'^\d{12}$').hasMatch(aadharNumber);
    }

    bool isValidEmail(String emailCheck) {
      print("checkingemaillllllllllllllllllllllllllll");
      return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(emailCheck);
    }
    bool isValidUPIId(String upiId) {
      // Define a regular expression pattern for a valid UPI ID
      // This pattern allows alphanumeric characters, "@" and "."
      final RegExp regExp = RegExp(r'^[a-zA-Z0-9@.]+$');

      // Check if the UPI ID matches the pattern
      return regExp.hasMatch(upiId);
    }

    if (accountNumberController.text.isEmpty) {
      accountNumberError = 'Account Number is required';
    }

    if (bankNameController.text.isEmpty) {
      bankNameError = 'Bank Name is required';
    }

    if (emailController.text.isEmpty) {
      emailError = 'Email Name is required';
    }

    if (firstNameController.text.isEmpty) {
      firstNameError = 'First Name is required';
    }

    if (lastNameController.text.isEmpty) {
      lastNameError = 'Last Name is required';
    }

    if (ifscCodeController.text.isEmpty) {
      ifscCodeError = 'IFSC Code is required';
    }

    if (pancardNumController.text.isEmpty) {
      pancardNumError = 'PANCard number is required';
    }

    if (aadharNumController.text.isEmpty) {
      aadharNumError = 'Aadhar Card number is required';
    }

    if (userNameController.text.isEmpty) {
      userNameError = 'User Name is required';
    }

    if (genderController.text.isEmpty) {
      genderError = 'Gender is required';
    }

    if (dateOfBirthController.text.isEmpty) {
      dobError = 'Date of Birth is required';
    }

    // Check if any error message is set

    if (!isValidPanCard(pancardNumController.text)) {

      Get.snackbar(
        'Error',
        'Invalid PAN card number format',
        colorText: Colors.red,
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }
    if (!isValidAadhar(aadharNumController.text)) {
      Get.snackbar(
        'Error',
        'Invalid Aadhar card number format',
        colorText: Colors.red,
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    if (!isValidEmail(emailController.text)) {
      print("whyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");

      Get.snackbar(
        'Error',
        'Invalid Email format',
        colorText: Colors.red,
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    if (
    // accountNumberError != null ||
    // bankNameError != null ||
    emailError != null ||
        firstNameError != null ||
        lastNameError != null ||
        // ifscCodeError != null ||
        pancardNumError != null ||
        aadharNumError != null ||
        userNameError != null ||
        genderError != null ||
        dobError != null) {
      Get.snackbar(
        'Error',
        'Please fill in all required fields or Enter correct format of PAN card and Aadhar card number',
        // snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }


    KycUpdate kycData = KycUpdate(
      // accountNumber: accountNumberController.text,
      // bankName: bankNameController.text,
      email: emailController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      // ifscCode: ifscCodeController.text,
      kycPancardNumber: pancardNumController.text,
      kycAadharCardNumber: aadharNumController.text,
      userName: userNameController.text,
      gender: genderController.text,
      dateOfBirth: dateOfBirthController.text,
      userId: userId,
      // upiId: upiIdController.text,
    );

    try {
      await api.updateKyc(kycData);
      print('++++++++++++++++$kycData+++++++++++++');

      // Update user details after KYC update (Assuming you have a method for this)
      await updateUserDetails(userId);

      // Show the KYC update dialog
      showKycUpdateDialog();
    } catch (e) {
      UpdateError(onOkPressed: () {
        Get.back();
      }, title: 'Your KYC Details is not updated, Please fill all the Details in the form and try again.',);
      print('Error updating KYC: $e');
    }
  }

// Add a method to update user details
  Future<void> updateUserDetails(String userId) async {
    try {
      var userDetailsData = await api.getUserDetails(userId);
      userDetails.value = userDetailsData;
      userNameController.text = userDetailsData.userName ?? "";
      // bankNameController.text = userDetailsData.bankName ?? "";
      firstNameController.text = userDetailsData.firstName ?? "";
      lastNameController.text = userDetailsData.lastName ?? "";
      emailController.text = userDetailsData.email ?? "";
      genderController.text = userDetailsData.gender ?? "";
      pancardNumController.text = userDetailsData.kycPancardNumber ?? "";
      aadharNumController.text = userDetailsData.kycAadharCardNumber ?? "";
      dateOfBirthController.text = userDetailsData.dateOfBirth ?? "";
      // accountNumberController.text = userDetailsData.accountNumber ?? "";
      // ifscCodeController.text = userDetailsData.ifscCode ?? "";
      // upiIdController.text = userDetailsData.upiId ?? "";

      // Add more fields to update as needed
      print("Fetched user's username: ${userDetails.value.userName}");
    } catch (e) {
      print('Error updating user details: $e');
    }
  }

  Future<void> getUserDetails(String? userId) async {
    try {
      if (userId == null) {
        return;
      }
      var userDetailsData = await api.getUserDetails(userId);
      userDetails.value = userDetailsData;
      userNameController.text = userDetailsData.userName ?? "";
      firstNameController.text = userDetailsData.firstName ?? "";
      lastNameController.text = userDetailsData.lastName ?? "";
      emailController.text = userDetailsData.email ?? "";
      genderController.text = userDetailsData.gender ?? "";
      pancardNumController.text = userDetailsData.kycPancardNumber ?? "";
      aadharNumController.text = userDetailsData.kycAadharCardNumber ?? "";
      dateOfBirthController.text = userDetailsData.dateOfBirth ?? "";
      // accountNumberController.text = userDetailsData.accountNumber ?? "";
      // ifscCodeController.text = userDetailsData.ifscCode ?? "";
      // upiIdController.text = userDetailsData.upiId ?? "";
      // bankNameController.text = userDetailsData.bankName ?? "";


      print("Fetched user's username: ${userDetails.value.userName}");
      print(userDetailsData);
    } catch (e) {
      print('Error fetching user details: $e');
    }
  }

  @override
  void onClose() {
    // _imageBox.close();
    // Hive.close();
    super.onClose();
  }
}