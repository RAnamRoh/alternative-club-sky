import 'dart:convert';

class UserSubscriptionResponse {
  String id;
  String membershipRef;
  String type;
  bool isActive;
  DateTime paidDate;
  DateTime endDate;
  double paidAmount;
  int point;
  String comment;
  bool isManual;
  String userId;
  SRUser user;
  SRCoupon coupon;
  String stripeSubscriptionId;
  String stripeStatus;
  double unitPointValue;
  String interval;

  UserSubscriptionResponse({
    required this.id,
    required this.membershipRef,
    required this.type,
    required this.isActive,
    required this.paidDate,
    required this.endDate,
    required this.paidAmount,
    required this.point,
    required this.comment,
    required this.isManual,
    required this.userId,
    required this.user,
    required this.coupon,
    required this.stripeSubscriptionId,
    required this.stripeStatus,
    required this.unitPointValue,
    required this.interval,
  });

  factory UserSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return UserSubscriptionResponse(
      id: json['id'] ,
      membershipRef: json['membershipRef'],
      type: json['type'],
      isActive: json['isActive'],
      paidDate: DateTime.parse(json['paidDate']),
      endDate: DateTime.parse(json['endDate']),
      paidAmount: json['paidAmount'].toDouble(),
      point: json['point'],
      comment: json['comment'],
      isManual: json['isManual'],
      userId: json['userId'],
      user: SRUser.fromJson(json['user']),
      coupon: SRCoupon.fromJson(json['coupon']),
      stripeSubscriptionId: json['stripeSubscriptionId'],
      stripeStatus: json['stripeStatus'],
      unitPointValue: json['unitPointValue'].toDouble(),
      interval: json['interval'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'membershipRef': membershipRef,
      'type': type,
      'isActive': isActive,
      'paidDate': paidDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'paidAmount': paidAmount,
      'point': point,
      'comment': comment,
      'isManual': isManual,
      'userId': userId,
      'user': user.toJson(),
      'coupon': coupon.toJson(),
      'stripeSubscriptionId': stripeSubscriptionId,
      'stripeStatus': stripeStatus,
      'unitPointValue': unitPointValue,
      'interval': interval,
    };
  }
}

class SRUser {
  String id;
  String name;
  String email;
  String phoneNumber;
  SRAddress address;

  SRUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  factory SRUser.fromJson(Map<String, dynamic> json) {
    return SRUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: SRAddress.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address.toJson(),
    };
  }
}

class SRAddress {
  String? street;
  String? postalCode;
  String? city;

  SRAddress({
    required this.street,
    required this.postalCode,
    required this.city,
  });

  factory SRAddress.fromJson(Map<String, dynamic> json) {
    return SRAddress(
      street: json['street'] ?? '',
      postalCode: json['postal_code'] ?? '',
      city: json['city'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'postal_code': postalCode,
      'city': city,
    };
  }
}

class SRCoupon {
  int value;

  SRCoupon({
    required this.value,
  });

  factory SRCoupon.fromJson(Map<String, dynamic> json) {
    return SRCoupon(
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}