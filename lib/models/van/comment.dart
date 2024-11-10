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
    return switch (json){
      {
        "fullName": DateTime creationDate,
        "trelloMember": TrelloMember trelloMember,
        "content": String content,
      } =>
        Comment(
          creationDate: creationDate,
          trelloMember: trelloMember,
          content: content
        ),
      _ => throw const FormatException('Failed to load Comment.'),
    };
  }
}