import '../Enums/area_of_orgin.dart';
import '../Enums/card_status.dart';
import '../trello_member.dart';
import 'attachment_info.dart';
import 'comment.dart';

class Card{
  final String id;
  final String name;
  final String url;

  final AreaOfOrigin areaOfOrigin;
  final CardStatus cardStatus;

  final List<Comment> comments;
  final List<AttachmentInfo> attachments;
  final List<TrelloMember> trelloMembers;

  completionRate(){
    if(cardStatus == CardStatus.completed) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  String toString() {
    return "$name - $id";
  }

  const Card({
    required this.id,
    required this.name,
    required this.url,
    required this.areaOfOrigin,
    required this.cardStatus,
    required this.comments,
    required this.attachments,
    required this.trelloMembers
  });
}