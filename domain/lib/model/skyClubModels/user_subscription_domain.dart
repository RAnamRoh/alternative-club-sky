import 'dart:convert';

class UserSubscriptionDomain {
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
  SDUser user;
  SDCoupon coupon;
  String stripeSubscriptionId;
  String stripeStatus;
  double unitPointValue;
  String interval;

  UserSubscriptionDomain({
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

  factory UserSubscriptionDomain.fromJson(Map<String, dynamic> json) {
    return UserSubscriptionDomain(
      id: json['id'],
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
      user: SDUser.fromJson(json['user']),
      coupon: SDCoupon.fromJson(json['coupon']),
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

class SDUser {
  String id;
  String name;
  String email;
  String phoneNumber;
  SDAddress address;

  SDUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  factory SDUser.fromJson(Map<String, dynamic> json) {
    return SDUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: SDAddress.fromJson(json['address']),
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

class SDAddress {
  String street;
  String postalCode;
  String city;

  SDAddress({
    required this.street,
    required this.postalCode,
    required this.city,
  });

  factory SDAddress.fromJson(Map<String, dynamic> json) {
    return SDAddress(
      street: json['street'],
      postalCode: json['postal_code'],
      city: json['city'],
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

class SDCoupon {
  int value;

  SDCoupon({
    required this.value,
  });

  factory SDCoupon.fromJson(Map<String, dynamic> json) {
    return SDCoupon(
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}