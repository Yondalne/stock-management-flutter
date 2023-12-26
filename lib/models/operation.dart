class Operation {
  int id;
  String label;

  Operation({required this.id, required this.label});

  factory Operation.fromJson(Map<String, dynamic> json) {
    return Operation(
      id: json['id'],
      label: json['label'],
    );
  }
}