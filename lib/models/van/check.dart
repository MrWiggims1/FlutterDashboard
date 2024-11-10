class Check {
  final String id;
  final String name;
  final bool isChecked;

  const Check({
    required this.id,
    required this.name,
    required this.isChecked
  });

  factory Check.fromJson(Map<String, dynamic> json){
    return switch (json) {
      {
        'id': String id,
        'name': String name,
        'isChecked': bool isChecked,
      } =>
        Check(
            id: id,
            name: name,
            isChecked: isChecked
        ),
      _ => throw const FormatException('Failed to load check.'),
    };
  }
}