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
    return TrelloMember(
        fullName: json["fullName"],
        userName: json["userName"],
        avatarUrl: json["avatarUrl"]
    );
  }
}