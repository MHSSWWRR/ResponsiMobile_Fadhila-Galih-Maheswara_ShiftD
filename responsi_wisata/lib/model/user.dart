class UserModel {
  final String email;
  final String token;

  UserModel({
    required this.email,
    required this.token,
  });

  // Mengubah dari JSON ke Object UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      token: json['token'],
    );
  }

  // Mengubah dari Object UserModel ke JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'token': token,
    };
  }
}
