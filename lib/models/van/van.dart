import '../production_position.dart';
import 'department.dart';
import 'red_card.dart';

class Van{
  final String id;
  final String name;
  final String url;

  final List<Department> departments;
  final List<RedCard> unallocatedRedCards;

  final DateTime? handover;
  final Map<DateTime, ProductionPosition> positionHistory;

  const Van({
    required this.id,
    required this.name,
    required this.url,
    required this.departments,
    required this.unallocatedRedCards,
    this.handover,
    required this.positionHistory
  });

  factory Van.fromJson(Map<String, dynamic> json)
  {
    var _deps = <Department>[];
    if(json["departments"] != null) {
      json["departments"].forEach((dep) {
        _deps.add(Department.fromJson(dep));
      });
    }

    var _posHist = <DateTime, ProductionPosition>{};
    if(json["positionHistory"] != null) {
      Map<DateTime, dynamic> posHMap =
          json["positionHistory"] as Map<DateTime, dynamic>;
      posHMap.keys.forEach((posKey) {
        _posHist[posKey] = ProductionPosition.fromJson(posHMap[posKey]);
      });
    }

    var _unallocRedCards = <RedCard>[];
    if(json["unallocatedRedCards"] != null) {
      json["unallocatedRedCards"].forEach((card) {
        _unallocRedCards.add(RedCard.fromJson(card));
      });
    }

    return Van(
      id: json["id"],
      name: json["name"],
      url : json["url"],
      handover: json["handover"],
      departments: _deps,
      positionHistory: _posHist,
      unallocatedRedCards: _unallocRedCards
    );
  }
}