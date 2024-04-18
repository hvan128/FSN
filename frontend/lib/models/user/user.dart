List<UserModel> userFromJson(dynamic str) =>
    List<UserModel>.from((str).map((x) => UserModel.fromJson(x)));

class UserModel {
  int? id;
  String? username;
  String? email;
  String? imageUrl;
  String? token;
  String? displayName;
  String? description;
  String? address;
  String? phone;
  String? birthday;
  String? gender;
  bool? isNewUser;
  String? role;

  UserModel(
      {this.imageUrl,
      this.description,
      this.address,
      this.phone,
      this.birthday,
      this.gender,
      this.role,
      this.id,
      this.username,
      this.email,
      this.isNewUser,
      this.token,
      this.displayName});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    token = json['token'];
    displayName = json['displayName'];
    imageUrl = json['imageUrl'];
    isNewUser = json['isNewUser'];
    description = json['description'];
    address = json['address'];
    phone = json['phone'];
    birthday = json['birthday'];
    gender = json['gender'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['token'] = token;
    data['displayName'] = displayName;
    data['description'] = description;
    data['isNewUser'] = isNewUser;
    data['imageUrl'] = imageUrl;
    data['address'] = address;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['role'] = role;
    return data;
  }
}
