class UserModel {
  String email;
  String phone;
  String name;
  String uId;
  String image;
  bool isEmailVerified;

  UserModel({
    this.uId = '',
    required this.phone,
    required this.name,
    required this.email,
    required this.image,
    this.isEmailVerified = false,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          uId: json['uId'],
          email: json['email'],
          name: json['name'],
          phone: json['phone'],
          image: json['image'],
          isEmailVerified: json['isEmailVerified'],
        );

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'uId': uId,
      'image': image,
      'isEmailVerified': isEmailVerified,
    };
  }
}
