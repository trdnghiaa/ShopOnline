class User {
  final String username;
  final String password;
  final String email;
  final String phone;

  User({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
  });

  // Tạo một User object từ JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  // Chuyển User object thành JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
    };
  }
}
