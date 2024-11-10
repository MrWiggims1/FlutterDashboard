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
    return switch (json){
      {
        "id": String id,
        "url": String url,
        "fileName": String fileName,
      } =>
        AttachmentInfo(
            id: id,
            url: url,
            fileName: fileName
        ),
      _ => throw const FormatException('Failed to load Attachment Info.'),
    };
  }
}