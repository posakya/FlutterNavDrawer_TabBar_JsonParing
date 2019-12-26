// To parse this JSON data, do
//
//     final jsonParse = jsonParseFromJson(jsonString);

import 'dart:convert';

JsonParse jsonParseFromJson(String str) => JsonParse.fromJson(json.decode(str));

String jsonParseToJson(JsonParse data) => json.encode(data.toJson());

class JsonParse {
  String status;
  String message;
  List<Datum> data;

  JsonParse({
    this.status,
    this.message,
    this.data,
  });

  factory JsonParse.fromJson(Map<String, dynamic> json) => JsonParse(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String name;
  String address;
  String phone;
  String weblink;
  String email;
  String position;
  String userId;
  String image;
  String colorCode;
  String colorCodeSecond;
  String layout;
  String faxNo;
  String poBoxNo;
  String companyName;
  String paidStatus;
  List<Service> services;

  Datum({
    this.name,
    this.address,
    this.phone,
    this.weblink,
    this.email,
    this.position,
    this.userId,
    this.image,
    this.colorCode,
    this.colorCodeSecond,
    this.layout,
    this.faxNo,
    this.poBoxNo,
    this.companyName,
    this.paidStatus,
    this.services,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    address: json["address"],
    phone: json["phone"],
    weblink: json["weblink"],
    email: json["email"],
    position: json["position"],
    userId: json["user_id"],
    image: json["image"],
    colorCode: json["color_code"],
    colorCodeSecond: json["color_code_second"],
    layout: json["layout"],
    faxNo: json["fax_no"],
    poBoxNo: json["po_box_no"],
    companyName: json["company_name"],
    paidStatus: json["paid_status"],
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "phone": phone,
    "weblink": weblink,
    "email": email,
    "position": position,
    "user_id": userId,
    "image": image,
    "color_code": colorCode,
    "color_code_second": colorCodeSecond,
    "layout": layout,
    "fax_no": faxNo,
    "po_box_no": poBoxNo,
    "company_name": companyName,
    "paid_status": paidStatus,
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class Service {
  int id;
  String userId;
  String service1;
  String service2;
  String service3;
  String service4;
  String service5;
  String service6;
  DateTime createdAt;
  DateTime updatedAt;

  Service({
    this.id,
    this.userId,
    this.service1,
    this.service2,
    this.service3,
    this.service4,
    this.service5,
    this.service6,
    this.createdAt,
    this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    userId: json["user_id"],
    service1: json["service_1"],
    service2: json["service_2"],
    service3: json["service_3"],
    service4: json["service_4"],
    service5: json["service_5"],
    service6: json["service_6"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "service_1": service1,
    "service_2": service2,
    "service_3": service3,
    "service_4": service4,
    "service_5": service5,
    "service_6": service6,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
