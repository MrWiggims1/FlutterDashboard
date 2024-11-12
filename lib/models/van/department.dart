import 'job_card.dart';
import 'red_card.dart';
import 'yellow_card.dart';

class Department{
  final String name;

  final List<JobCard> jobCards;
  final List<RedCard> redCards;
  final List<YellowCard> yellowCards;

  const Department({
    required this.name,
    required this.jobCards,
    required this.redCards,
    required this.yellowCards,
  });

  factory Department.fromJson(Map<String, dynamic> json){
    var _jobs = <JobCard>[];
    if(json["jobCards"] != null) {
      json["jobCards"].forEach((card) {
        _jobs.add(JobCard.fromJson(card));
      });
    }

    var _reds = <RedCard>[];
    if(json["redCards"] != null) {
      json["redCards"].forEach((card) {
        _reds.add(RedCard.fromJson(card));
      });
    }

    var _yellows = <YellowCard>[];
    if(json["yellowCards"] != null) {
      json["yellowCards"].forEach((card) {
        _yellows.add(YellowCard.fromJson(card));
      });
    }

    return Department(
        name: json["name"],
        jobCards: _jobs,
        redCards: _reds,
        yellowCards: _yellows
    );
  }
}