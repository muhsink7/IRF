import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:indian_race_fantasy/model/dialog_models/kyc_update_error.dart';
import 'package:indian_race_fantasy/model/model_api/kyc_update.dart';
import 'package:indian_race_fantasy/router.dart';
import 'package:indian_race_fantasy/ui/screens/menu_contents/kyc_details/image_list_screen.dart';
import 'package:intl/intl.dart';

import '../../../../api/api.dart';
import '../../../../model/dialog_models/kyc_update_dialog.dart';
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

  final DateTime lastDate = DateTime.now().subtract(Duration(days: 365 * 18));

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

  String? selectedYear;
  final List<String> yearOption = [];

  String? selectedMonth;
  final List<String> monthOption = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  String? selectedDay;
  final List<String> dayOption = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];

  @override
  void onInit() {
    getUserDetails(GetStorage().read('userId'));
    print(GetStorage().read('userId'));
    generateYearOptions();
    update();
    super.onInit();
    // getUserDetails(OtpController.instance.userId);
  }

  void selectGender(String gender) {
    selectedGender = gender;
    genderController.text = gender;
  }

  void selectYear(String year) {
    selectedYear = year;
    yearController.text = year;
  }

  void selectMonth(String month) {
    selectedMonth = month;
    monthController.text = month;
  }

  void selectDay(String day) {
    selectedDay = day;
    dayController.text = day;
  }

  void generateYearOptions() {
    final int currentYear = DateTime.now().year;
    for (int year = currentYear - 100; year <= currentYear; year++) {
      yearOption.add(year.toString());
    }
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
        title: Text("Select a gender"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text('Male'),
                onTap: () {
                  selectGender('Male');
                  Get.back(); // Close the dialog using GetX
                },
              ),
              ListTile(
                title: Text('Female'),
                onTap: () {
                  selectGender('Female');
                  Get.back(); // Close the dialog using GetX
                },
              ),
              ListTile(
                title: Text('Others'),
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
            color: Color.fromARGB(39, 63, 81, 181),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                          child: Icon(Icons.camera_alt),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('Camera'),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            pickImage(ImageSource.gallery);
                            Get.back(); // Close the dialog using GetX
                          },
                          child: Icon(Icons.image),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('Gallery'),
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

  void showYearOption() {
    Get.dialog(
      AlertDialog(
          title: Text("Select a year"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (String year in yearOption)
                  ListTile(
                    title: Text(year),
                    onTap: () {
                      selectYear(year);
                      Get.back();
                    },
                  ),
              ],
            ),
          )),
    );
  }

  void showMonthOption() {
    Get.dialog(
      AlertDialog(
        title: Text("Select Month"),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        content: SingleChildScrollView(
          child: Column(
            children: [
              for (String month in monthOption)
                ListTile(
                  title: Text(month),
                  onTap: () {
                    selectMonth(month);
                    Get.back(); // Close the dialog
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void showDayOption() {
    Get.dialog(
      AlertDialog(
        title: Text("Select a Day"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              for (String day in dayOption)
                ListTile(
                  title: Text(day),
                  onTap: () {
                    selectDay(day);
                    print(day);
                    Get.back(); // Close the dialog
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  // void selectDateOfBirth(String userId, String phoneNumber) {
  //   String selectedYear = '';
  //   String selectedMonth = '';
  //   String selectedDay = '';
  //   showYearOption();
  //   ever(selectedYear, (_) {
  //     showMonthOption();
  //     ever(selectedMonthRx, (_) {
  //       showDayOption();
  //       ever(selectedDayRx, (_) {
  //         // All parts of the date are selected, now you can use them
  //         String dateOfBirth =
  //             "${selectedDayRx.value}-${selectedMonthRx.value}-${selectedYearRx.value}";
  //         print(dateOfBirth);
  //         // Call another function with the dateOfBirth value
  //         kycUpdate(userId, phoneNumber, dateOfBirth);
  //       });
  //     });
  //   });
  // }

//   String dateOfBirth = "01-08-1990"; // Replace this with your actual date of birth value
//
// // Split the date of birth string into year, month, and day
//   List<String> dateParts = dateOfBirth.split('-');
//   String year = dateParts[2];
//   String month = dateParts[1];
//   String day = dateParts[0];
//
// // Set the values in your controllers
//   controller.yearController.text = year;
//   controller.monthController.text = month;
//   controller.dayController.text = day;

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

  // void submitKYCDetails(String userId, String phoneNumber, String dateOfBirth) {
  //   kycUpdate(userId, phoneNumber, dateOfBirth);
  // }
  void showKycUpdateDialog() {
    Get.dialog(
      KycUpdateDialog(
        onOkPressed: () {
          // Implement the refresh KYC logic here
          // This function will be called when the "OK" button is pressed
          isKYCSubmitted = true;
          Get.toNamed(RoutePaths.kycDetailsScreen);
        },
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
      return RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(emailCheck);
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
        duration: Duration(seconds: 3),
      );
      return;
    }
    if (!isValidAadhar(aadharNumController.text)) {
      Get.snackbar(
        'Error',
        'Invalid Aadhar card number format',
        colorText: Colors.red,
        backgroundColor: Colors.white,
        duration: Duration(seconds: 3),
      );
      return;
    }

    if (!isValidEmail(emailController.text)) {
      Get.snackbar(
        'Error',
        'Invalid Email format',
        colorText: Colors.red,
        backgroundColor: Colors.white,
        duration: Duration(seconds: 3),
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
        duration: Duration(seconds: 3),
      );
      return;
    }


    KycUpdate kycData = KycUpdate(
      accountNumber: accountNumberController.text,
      bankName: bankNameController.text,
      email: emailController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      ifscCode: ifscCodeController.text,
      kycPancardNumber: pancardNumController.text,
      kycAadharCardNumber: aadharNumController.text,
      userName: userNameController.text,
      gender: genderController.text,
      dateOfBirth: dateOfBirthController.text,
      userId: userId,
    );

    try {
      await api.updateKyc(kycData);

      // Update user details after KYC update (Assuming you have a method for this)
      await updateUserDetails(userId);

      // Show the KYC update dialog
      showKycUpdateDialog();
    } catch (e) {
      KycUpdateError(onOkPressed: () {
        Get.back();
      });
      print('Error updating KYC: $e');
    }
  }

// Add a method to update user details
  Future<void> updateUserDetails(String userId) async {
    try {
      var userDetailsData = await api.getUserDetails(userId);
      userDetails.value = userDetailsData;
      userNameController.text = userDetailsData.userName ?? "";
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

      print("Fetched user's username: ${userDetails.value.userName}");
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
