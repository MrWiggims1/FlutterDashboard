class ProductionPosition{
  final int? positionId;
  final String positionName;

  const ProductionPosition({
    required this.positionName,
    this.positionId
  });

  factory ProductionPosition.fromJson(Map<String, dynamic> json){
    return switch (json){
      {
      "positionId": int? positionId,
      "positionName": String positionName,
      } =>
          ProductionPosition(
            positionId: positionId,
            positionName: positionName,
          ),
      _ => throw const FormatException('Failed to load position.'),
    };
  }
}