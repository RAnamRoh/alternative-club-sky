import 'package:data/remote/response/explore/offer_response.dart';
import 'package:domain/model/skyClubModels/faq.dart';
import 'package:domain/model/skyClubModels/offer_domain.dart';

class OfferMapper {


  static List<OfferDomain> offerResponseListToOfferDomainList(List<OfferResponse> offerResponseList) {
    return offerResponseList.map((offerResponse) => offerResponseToOfferDomain(offerResponse)).toList();
  }


  static OfferDomain offerResponseToOfferDomain(OfferResponse offerResponse) {
    final OfferDomain offerDomain = OfferDomain(
        id: offerResponse.id,
        offerId: offerResponse.offerId,
        title: offerResponse.title,
        subTitle: offerResponse.subTitle,
        description: offerResponse.description,
        imageUrl: offerResponse.imageUrl,
        actionSlug: offerResponse.actionSlug,
        displayOrder: offerResponse.displayOrder,
        startDate: offerResponse.startDate,
        endDate: offerResponse.endDate,
        isActive: offerResponse.isActive,
        isPublic: offerResponse.isPublic,
        audience: offerResponse.audience,
        couponCode: offerResponse.couponCode,
        discountAmount: offerResponse.discountAmount,
        isPercentage: offerResponse.isPercentage,
        appliesToAirlines: offerResponse.appliesToAirlines,
        purchaseType: offerResponse.purchaseType,
        minimumPurchaseAmount: offerResponse.minimumPurchaseAmount,
        minimumFlightPurchase: offerResponse.minimumFlightPurchase,
        limitTotalUse: offerResponse.limitTotalUse,
        limitToPerUser: offerResponse.limitToPerUser,
        terms: offerResponse.terms,
        faQs: offerResponse.faQs.map((faqResponse) => faqResponseToDomain(faqResponse)).toList(),
    );

    return offerDomain;

  }

  static Faq faqResponseToDomain(OfferFaQResponse faqResponse) {
    final Faq faqDomain = Faq(
      question: faqResponse.question,
      answer: faqResponse.answer,
    );

    return faqDomain;
  }
}
