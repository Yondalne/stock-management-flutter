class User {
  int id;
  String name;
  String email;
  String password; // Note: In a real app, avoid storing plaintext passwords like this in Dart models
  String contact;

  User({required this.id, required this.name, required this.email, required this.password, required this.contact});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      contact: json['contact'],
    );
  }
}