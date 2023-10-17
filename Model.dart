class User {

  String username;
  String password;

  User({required this.username,required this.password});

  Map<String, dynamic> toMap() {
    return {
     
      'username': username,
      'password': password,
    };
  }

  // Create a User from a map object
  factory User.fromMap(Map<String, dynamic> map) {
    return User(

      username: map['username'],
      password: map['password'],
    );
  }
}
