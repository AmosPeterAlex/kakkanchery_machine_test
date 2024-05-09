import 'dart:convert';

TestModel testModelFromJson(String str) => TestModel.fromJson(json.decode(str));

String testModelToJson(TestModel data) => json.encode(data.toJson());

class TestModel {
  String? message;
  Data? data;

  TestModel({
    this.message,
    this.data,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<ListElement>? list;
  int? totalCount;

  Data({
    this.list,
    this.totalCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "totalCount": totalCount,
      };
}

class ListElement {
  String? id;
  String? name;
  dynamic globalGalleryCategoryId;
  int? docType;
  int? uid;
  int? type;
  String? url;
  String? createdUserId;
  int? createdAt;
  dynamic updatedUserId;
  int? updatedAt;
  int? status;
  int? v;

  ListElement({
    this.id,
    this.name,
    this.globalGalleryCategoryId,
    this.docType,
    this.uid,
    this.type,
    this.url,
    this.createdUserId,
    this.createdAt,
    this.updatedUserId,
    this.updatedAt,
    this.status,
    this.v,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        name: json["_name"],
        globalGalleryCategoryId: json["_globalGalleryCategoryId"],
        docType: json["_docType"],
        uid: json["_uid"],
        type: json["_type"],
        url: json["_url"],
        createdUserId: json["_createdUserId"],
        createdAt: json["_createdAt"],
        updatedUserId: json["_updatedUserId"],
        updatedAt: json["_updatedAt"],
        status: json["_status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_name": name,
        "_globalGalleryCategoryId": globalGalleryCategoryId,
        "_docType": docType,
        "_uid": uid,
        "_type": type,
        "_url": url,
        "_createdUserId": createdUserId,
        "_createdAt": createdAt,
        "_updatedUserId": updatedUserId,
        "_updatedAt": updatedAt,
        "_status": status,
        "__v": v,
      };
}
