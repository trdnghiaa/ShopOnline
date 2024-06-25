class User {
  final String username;
  final String password;
  final String email;

  User({
    required this.username,
    required this.password,
    required this.email,
  });

  // Tạo một User object từ JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      email: json['email'],
    );
  }

  // Chuyển User object thành JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
    };
  }
}
