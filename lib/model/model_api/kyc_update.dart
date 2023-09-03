class KycUpdate {
  String? userId;
  String? phoneNumber;
  int? balanceAmount;
  String? kycStatus;
  String? registeredDate;
  String? firstName;
  String? lastName;
  String? accountNumber;
  String? email;
  String? bankName;
  String? dateOfBirth;
  String? gender;
  String? ifscCode;
  String? kycAadharCardNumber;
  String? userName;
  String? kycPancardNumber;
  String? kycAadharBack;
  String? kycAadharFront;
  String? kycPancardFront;
  String? upiId;

  KycUpdate(
      {this.userId,
        this.phoneNumber,
        this.balanceAmount,
        this.kycStatus,
        this.registeredDate,
        this.firstName,
        this.lastName,
        this.accountNumber,
        this.email,
        this.bankName,
        this.dateOfBirth,
        this.gender,
        this.ifscCode,
        this.kycAadharCardNumber,
        this.userName,
        this.kycPancardNumber,
        this.kycAadharBack,
        this.kycAadharFront,
        this.kycPancardFront,
        this.upiId});

  KycUpdate.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    phoneNumber = json['phoneNumber'];
    balanceAmount = json['balanceAmount'];
    kycStatus = json['kycStatus'];
    registeredDate = json['registeredDate'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    accountNumber = json['accountNumber'];
    email = json['email'];
    bankName = json['bankName'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    ifscCode = json['ifscCode'];
    kycAadharCardNumber = json['kycAadharCardNumber'];
    userName = json['userName'];
    kycPancardNumber = json['kycPancardNumber'];
    kycAadharBack = json['kycAadharBack'];
    kycAadharFront = json['kycAadharFront'];
    kycPancardFront = json['kycPancardFront'];
    upiId = json['upiId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['phoneNumber'] = this.phoneNumber;
    data['balanceAmount'] = this.balanceAmount;
    data['kycStatus'] = this.kycStatus;
    data['registeredDate'] = this.registeredDate;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['accountNumber'] = this.accountNumber;
    data['email'] = this.email;
    data['bankName'] = this.bankName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['ifscCode'] = this.ifscCode;
    data['kycAadharCardNumber'] = this.kycAadharCardNumber;
    data['userName'] = this.userName;
    data['kycPancardNumber'] = this.kycPancardNumber;
    data['kycAadharBack'] = this.kycAadharBack;
    data['kycAadharFront'] = this.kycAadharFront;
    data['kycPancardFront'] = this.kycPancardFront;
    data['upiId'] = this.upiId;
    return data;
  }
}