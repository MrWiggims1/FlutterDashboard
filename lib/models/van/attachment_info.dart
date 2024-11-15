import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AttachmentInfo{
  final String id;
  final String url;
  final String fileName;

  const AttachmentInfo({
    required this.id,
    required this.url,
    required this.fileName,
  });

  factory AttachmentInfo.fromJson(Map<String, dynamic> json){

    return AttachmentInfo(
        id: json["id"],
        url: json["url"],
        fileName: json["fileName"]
    );
  }
}