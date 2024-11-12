class ProductionPosition{
  final int? positionId;
  final String positionName;

  const ProductionPosition({
    required this.positionName,
    this.positionId
  });

  factory ProductionPosition.fromJson(Map<String, dynamic> json){
    return ProductionPosition(
        positionId: json["positionId"],
        positionName: json["positionName"]
    );
  }
}