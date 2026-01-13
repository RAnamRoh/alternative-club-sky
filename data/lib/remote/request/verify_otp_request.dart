class VerifyOtpRequest {
  String? verificationCode;

  VerifyOtpRequest({
    this.verificationCode,
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verification_code'] = verificationCode;
    return data;
  }

  VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    verificationCode = json['verification_code'];
  }


}