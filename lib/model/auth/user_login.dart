class UserLogin {
  final String username;
  final String password;
  UserLogin({required this.username, required this.password});

  // to json
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'username': username, 'password': password};
  }

  //from json

  factory UserLogin.fromMap(Map<String, dynamic> map) {
    return UserLogin(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }
}
