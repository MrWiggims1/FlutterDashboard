import '../trello_member.dart';

class Comment{
  final DateTime creationDate;
  final TrelloMember trelloMember;
  final String content;

  const Comment({
    required this.creationDate,
    required this.trelloMember,
    required this.content,
  });

  factory Comment.fromJson(Map<String, dynamic> json){
    return Comment(
        creationDate: json["creationDate"],
        trelloMember: TrelloMember.fromJson(json["trelloMember"]),
        content: json["content"]
    );
  }
}