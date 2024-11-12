import '../Enums/enum_utils.dart';
import '../Enums/red_flagIssue.dart';
import '../Enums/area_of_origin.dart';
import '../Enums/card_status.dart';
import '../trello_member.dart';
import 'attachment_info.dart';
import 'card.dart';
import 'comment.dart';

class RedCard extends Card{
  final RedFlagIssue redFlagIssue;
  final DateTime? creationDate;

  const RedCard({
    required super.id,
    required super.name,
    required super.url,
    required super.areaOfOrigin,
    required super.cardStatus,
    required super.comments,
    required super.attachments,
    required super.trelloMembers,

    required this.redFlagIssue,
    this.creationDate
  });

  factory RedCard.fromJson(Map<String, dynamic> json){
    var _comments = <Comment>[];
    if(json["comments"] != null) {
      json["comments"].forEach((comment) {
        _comments.add(Comment.fromJson(comment));
      });
    }

    var _attachments = <AttachmentInfo>[];
    if(json["attachments"] != null) {
      json["attachments"].forEach((info) {
        _attachments.add(AttachmentInfo.fromJson(info));
      });
    }

    var _trelloMembers = <TrelloMember>[];
    if(json["trelloMembers"] != null) {
      json["trelloMembers"].forEach((member) {
        _trelloMembers.add(TrelloMember.fromJson(member));
      });
    }

    return RedCard(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        areaOfOrigin: EnumUtils.areaOfOriginFromJson(json["areaOfOrigin"]),
        cardStatus: EnumUtils.cardStatusFromJson(json["cardStatus"]),
        comments: _comments,
        attachments: _attachments,
        trelloMembers: _trelloMembers,

        redFlagIssue: EnumUtils.redFlagIssueFromJson(json["dueStatus"]),
        creationDate: json["creationDate"]
    );
  }
}