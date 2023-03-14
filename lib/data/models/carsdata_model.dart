// To parse this JSON data, do
//
//     final carsDataModel = carsDataModelFromJson(jsonString);

import 'dart:convert';

CarsDataModel carsDataModelFromJson(String str) =>
    CarsDataModel.fromJson(json.decode(str));

String carsDataModelToJson(CarsDataModel data) => json.encode(data.toJson());

class CarsDataModel {
  CarsDataModel({
    this.status,
    this.content,
    this.serverTime,
  });

  String? status;
  List<CarsDataModelContent>? content;
  int? serverTime;

  factory CarsDataModel.fromJson(Map<String, dynamic> json) => CarsDataModel(
        status: json["status"],
        content: json["content"] == null
            ? []
            : List<CarsDataModelContent>.from(
                json["content"]!.map((x) => CarsDataModelContent.fromJson(x))),
        serverTime: json["serverTime"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "content": content == null
            ? []
            : List<dynamic>.from(content!.map((x) => x.toJson())),
        "serverTime": serverTime,
      };
}

class CarsDataModelContent {
  CarsDataModelContent({
    this.id,
    this.title,
    this.dateTime,
    this.tags,
    this.content,
    this.ingress,
    this.image,
    this.created,
    this.changed,
  });

  int? id;
  String? title;
  String? dateTime;
  List<dynamic>? tags;
  List<ContentContent>? content;
  String? ingress;
  String? image;
  int? created;
  int? changed;

  factory CarsDataModelContent.fromJson(Map<String, dynamic> json) =>
      CarsDataModelContent(
        id: json["id"],
        title: json["title"],
        dateTime: json["dateTime"],
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        content: json["content"] == null
            ? []
            : List<ContentContent>.from(
                json["content"]!.map((x) => ContentContent.fromJson(x))),
        ingress: json["ingress"],
        image: json["image"],
        created: json["created"],
        changed: json["changed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "dateTime": dateTime,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "content": content == null
            ? []
            : List<dynamic>.from(content!.map((x) => x.toJson())),
        "ingress": ingress,
        "image": image,
        "created": created,
        "changed": changed,
      };
}

class ContentContent {
  ContentContent({
    this.type,
    this.subject,
    this.description,
  });

  String? type;
  String? subject;
  String? description;

  factory ContentContent.fromJson(Map<String, dynamic> json) => ContentContent(
        type: json["type"],
        subject: json["subject"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "subject": subject,
        "description": description,
      };
}
