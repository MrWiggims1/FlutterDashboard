import '../Enums/enum_utils.dart';
import '../Enums/card_status.dart';
import '../Enums/due_status.dart';
import '../production_position.dart';
import '../trello_member.dart';
import 'attachment_info.dart';
import 'card.dart';
import 'checklist.dart';
import 'comment.dart';
import 'package:duration/duration.dart';

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
    var _comments = <Comment>[];
    if(json["comments"] != null) {
      (json["comments"] as List<dynamic>).forEach((comment) {
        _comments.add(Comment.fromJson(comment));
      });
    }

    var _attachments = <AttachmentInfo>[];
    if(json["attachments"] != null){
      for(var item in (json["attachments"] as List<dynamic>)){
        _attachments.add(AttachmentInfo.fromJson(item));
      };
    }

    var _trelloMembers = <TrelloMember>[];
    if(json["trelloMembers"] != null) {
      json["trelloMembers"].forEach((member) {
        _trelloMembers.add(TrelloMember.fromJson(member));
      });
    }

    var _checklists = <Checklist>[];
    if(json["checklists"] != null) {
      json["checklists"].forEach((checklist) {
        _checklists.add(Checklist.fromJson(checklist));
      });
    }

    return JobCard(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        areaOfOrigin: EnumUtils.areaOfOriginFromJson(json["areaOfOrigin"]),
        cardStatus: EnumUtils.cardStatusFromJson(json["cardStatus"]),
        comments: _comments,
        attachments: _attachments,
        trelloMembers: _trelloMembers,

        position: ProductionPosition.fromJson(json["position"]),
        checklists: _checklists,
        dueStatus: EnumUtils.dueStatusFromJson(json["dueStatus"]),
        taskTime: parseDuration(json["taskTime"])
    );
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