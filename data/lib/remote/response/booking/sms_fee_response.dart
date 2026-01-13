// To parse this JSON data, do
//
//     final smsFeeResponse = smsFeeResponseFromJson(jsonString);

import 'dart:convert';

SmsFeeResponse smsFeeResponseFromJson(String str) => SmsFeeResponse.fromJson(json.decode(str));

String smsFeeResponseToJson(SmsFeeResponse data) => json.encode(data.toJson());

class SmsFeeResponse {
  String keyName;
  String value;
  bool isActive;
  int id;

  SmsFeeResponse({
    required this.keyName,
    required this.value,
    required this.isActive,
    required this.id,
  });

  factory SmsFeeResponse.fromJson(Map<String, dynamic> json) => SmsFeeResponse(
    keyName: json["keyName"],
    value: json["value"],
    isActive: json["isActive"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "keyName": keyName,
    "value": value,
    "isActive": isActive,
    "id": id,
  };
}
