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
    return switch(json){
      {
        'name': String name,
        'jobCards': List<JobCard> jobCards,
        'redCards': List<RedCard> redCards,
        'yellowCards': List<YellowCard> yellowCards
      } =>
        Department(
          name: name,
          jobCards: jobCards,
          redCards: redCards,
          yellowCards: yellowCards
        ),
      _ =>throw const FormatException('Failed to load department.'),
    };
  }
}