class Provider {
  int id;
  String name;
  String email;
  String contact;

  Provider({required this.id, required this.name, required this.email, required this.contact});

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      contact: json['contact'],
    );
  }
}