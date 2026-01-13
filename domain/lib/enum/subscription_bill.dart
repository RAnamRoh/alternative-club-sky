


enum SubscriptionBill {
  monthly,
  yearly
}

extension SubscriptionBillExtension on SubscriptionBill {
  String get name {
    switch (this) {
      case SubscriptionBill.monthly:
        return 'Monthly';
      case SubscriptionBill.yearly:
        return 'Yearly';
    }
  }
}