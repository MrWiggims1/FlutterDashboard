class TrelloMember{
  final String fullName;
  final String userName;
  final String avatarUrl;

  const TrelloMember({
    required this.fullName,
    required this.userName,
    required this.avatarUrl,
  });

  factory TrelloMember.fromJson(Map<String, dynamic> json){
    return switch (json){
      {
        "fullName": String fullName,
        "userName": String userName,
        "avatarUrl": String avatarUrl,
      } =>
          TrelloMember(
            fullName: fullName,
            userName: userName,
            avatarUrl: avatarUrl
          ),
      _ => throw const FormatException('Failed to load trello member.'),
    };
  }
}