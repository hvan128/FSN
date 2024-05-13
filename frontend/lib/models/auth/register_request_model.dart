class RegisterRequestModel {
  RegisterRequestModel({
    this.username,
    this.password,
    this.email,
    this.displayName,
    this.imageUrl,
    this.fcmToken,
  });
  late final String? username;
  late final String? password;
  late final String? email;
  late final String? displayName;
  late final String? imageUrl;
  late final String? fcmToken;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    displayName = json['displayName'];
    imageUrl = json['imageUrl'];
    fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['password'] = password;
    _data['email'] = email;
    _data['displayName'] = displayName;
    _data['imageUrl'] = imageUrl;
    _data['fcmToken'] = fcmToken;
    return _data;
  }
}