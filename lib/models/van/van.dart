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

  factory Van.fromJson(Map<String, dynamic> json){
    return switch(json){
    {
      'id': String id,
      'name': String name,
      'url': String url,
      'departments': List<Department> departments,
      'unallocatedRedCards': List<RedCard> unallocatedRedCards,
      'handover': DateTime? handover,
      'positionHistory': Map<DateTime, ProductionPosition> positionHistory,
    } =>
      Van(
        id: id,
        name: name,
        url: url,
        departments: departments,
        unallocatedRedCards: unallocatedRedCards,
        handover: handover,
        positionHistory: positionHistory,
      ),
      _ => throw const FormatException('Failed to load van.'),
    };
  }
}