import 'check.dart';

class Checklist {
  final String id;
  final String name;
  final List<Check> checks;

  double completionRate()
  {
    double totalCount = checks.length as double;

    if(totalCount == 0) {
      return 1;
    }

    double completeCountCount = checks.where((c) => c.isChecked).length as double;

    return completeCountCount / totalCount;
  }

  const Checklist({
    required this.id,
    required this.name,
    required this.checks,
  });

  factory Checklist.fromJson(Map<String, dynamic> json){
    var _checks = <Check>[];
    if(json["checks"] != null) {
      json["checks"].forEach((check) {
        _checks.add(Check.fromJson(check));
      });
    }

    return Checklist(
        id: json["id"],
        name: json["name"],
        checks: _checks);
  }
}