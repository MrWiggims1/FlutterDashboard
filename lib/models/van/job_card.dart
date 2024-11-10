import '../Enums/card_status.dart';
import '../Enums/due_status.dart';
import '../production_position.dart';
import '../Enums/area_of_orgin.dart';
import '../trello_member.dart';
import 'attachment_info.dart';
import 'card.dart';
import 'checklist.dart';
import 'comment.dart';

class JobCard extends Card{
  final ProductionPosition position;

  final List<Checklist> checklists;
  final DueStatus dueStatus;

  final Duration taskTime;

  Duration remainingTaskTime()
  {
    return taskTime * completionRate();
  }

  @override
  completionRate() {
    if(cardStatus == CardStatus.completed){
      return 1;
    }

    if(checklists.isEmpty){
      return 0;
    }

    double count = 0;
    double total = 0;

    for (var list in checklists)
    {
      count += 1;
      total += list.completionRate();
    }

    return total / count;
  }

  const JobCard({
    required super.id,
    required super.name,
    required super.url,
    required super.areaOfOrigin,
    required super.cardStatus,
    required super.comments,
    required super.attachments,
    required super.trelloMembers,

    required this.position,
    required this.checklists,
    required this.dueStatus,
    required this.taskTime,
  });

  factory JobCard.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
        'id': String id,
        'name': String name,
        'url': String url,
        'areaOfOrigin': AreaOfOrigin areaOfOrigin,
        'cardStatus': CardStatus cardStatus,
        'comments': List<Comment> comments,
        'attachments': List<AttachmentInfo> attachments,
        'trelloMembers': List<TrelloMember> trelloMembers,

        'position': ProductionPosition position,
        'checklists': List<Checklist> checklists,
        'dueStatus': DueStatus dueStatus,
        'taskTime': Duration taskTime
      } =>
        JobCard(
          id: id,
          name: name,
          url: url,
          areaOfOrigin: areaOfOrigin,
          cardStatus: cardStatus,
          comments: comments,
          attachments: attachments,
          trelloMembers: trelloMembers,

          position: position,
          checklists: checklists,
          dueStatus: dueStatus,
          taskTime: taskTime,
        ),
      _ => throw const FormatException('Failed to load yellow card.'),
    };
  }
}

extension JobCardListExtensions on List<JobCard>{

  double CompletionRate(bool scaleByTime){

    double total = 0;
    double completed = 0;

    for(JobCard job in this){
      if(scaleByTime) {
        double taskMinutes = job.taskTime.inMinutes as double;

        total += taskMinutes;
        completed += taskMinutes * job.completionRate();
      } else{
        total += 1;
        completed += job.completionRate();
      }
    }

    return completed / total;
  }
}