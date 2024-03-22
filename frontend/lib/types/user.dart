class User {
  final String id;
  final String username;
  final String email;
  final String? image;
  final String? description;
  final String? address;
  final String? phone;
  final String? birthday;
  final String? gender;
  final String? role;
  User({
    required this.id,
    required this.username,
    required this.email,
    this.image,
    this.description,
    this.address,
    this.phone,
    this.birthday,
    this.gender,
    this.role,
  });
}

