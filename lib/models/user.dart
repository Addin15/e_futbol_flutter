class User {
  String? username;
  String? email;
  String? photoURL;
  String? role;

  User({this.username, this.email, this.photoURL, this.role});

  factory User.fromMap(Map<String, dynamic> map) => User(
        username: map['name'],
        email: map['email'],
        photoURL: map['photo_url'] ?? '',
        role: map['role'] ?? '',
      );

  toMap() => {
        'rname': username,
        'email': email,
        'photo_url': photoURL,
        'role': role,
      };
}
