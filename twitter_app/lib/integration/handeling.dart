class changepassword {
  String currentPassword;
  String password;
  String confirmNewPassword;

  changepassword(
      {this.currentPassword, this.password, this.confirmNewPassword});

  changepassword.fromJson(Map<String, dynamic> json) {
    currentPassword = json['currentPassword'];
    password = json['password'];
    confirmNewPassword = json['confirmNewPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPassword'] = this.currentPassword;
    data['password'] = this.password;
    data['confirmNewPassword'] = this.confirmNewPassword;
    return data;
  }
}
