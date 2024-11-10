import '../Enums/red_flagIssue.dart';
import '../Enums/area_of_orgin.dart';
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

        'redFlagIssue': RedFlagIssue redFlagIssue,
        'creationDate': DateTime creationDate
      } =>
        RedCard(
          id: id,
          name: name,
          url: url,
          areaOfOrigin: areaOfOrigin,
          cardStatus: cardStatus,
          comments: comments,
          attachments: attachments,
          trelloMembers: trelloMembers,

          redFlagIssue: redFlagIssue,
          creationDate: creationDate
        ),
      _ => throw const FormatException('Failed to load yellow card.'),
    };
  }
}