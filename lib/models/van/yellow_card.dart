import '../Enums/area_of_orgin.dart';
import '../Enums/card_status.dart';
import '../van/attachment_info.dart';
import '../trello_member.dart';
import 'card.dart';
import 'comment.dart';

class YellowCard extends Card{
  final String partName;
  final DateTime? creationDate;

  const YellowCard({
    required super.id,
    required super.name,
    required super.url,
    required super.areaOfOrigin,
    required super.cardStatus,
    required super.comments,
    required super.attachments,
    required super.trelloMembers,

    required this.partName,
    this.creationDate
  });

  factory YellowCard.fromJson(Map<String, dynamic> json){
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

        'partName': String partName,
        'creationDate': DateTime creationDate
      } =>
        YellowCard(
          id: id,
          name: name,
          url: url,
          areaOfOrigin: areaOfOrigin,
          cardStatus: cardStatus,
          comments: comments,
          attachments: attachments,
          trelloMembers: trelloMembers,

          partName: partName,
          creationDate: creationDate
        ),
      _ => throw const FormatException('Failed to load yellow card.'),
    };
  }
}