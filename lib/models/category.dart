class Category {
  int id;
  String label;

  Category({required this.id, required this.label});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      label: json['label'],
    );
  }
}