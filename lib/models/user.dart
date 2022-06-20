class User {
  int? userID;
  String? username;
  String? email;
  String? photoURL;
  String? role;

  User({this.userID, this.username, this.email, this.photoURL, this.role});

  factory User.fromMap(Map<String, dynamic> map) => User(
        userID: map['id'],
        username: map['name'],
        email: map['email'],
        photoURL: map['photo_url'] ?? '',
        role: map['role'] ?? '',
      );

  toMap() => {
        'id': userID,
        'name': username,
        'email': email,
        'photo_url': photoURL,
        'role': role,
      };
}
