

import 'package:data/remote/response/booking/booking_detail_response.dart';
import 'package:domain/model/skyClubModels/passenger_info_model.dart';

class BKPassengerInfoMapper {
  static PassengerInfoModel mapBDPassengerToPassengerInfoModel(BDPassenger response){



    final String name = '${response.givenName} ${response.surname}';
    final String ticketNumber = '';
    final String ssrCode = '000';
    final String paxType = response.type.isNotEmpty ? response.type : '';
    final String contact = response.phones.isNotEmpty ? response.phones : '';
    final String passportNo = '';
    final String bagAllowance = '';

   final passengermodel = PassengerInfoModel(
        name: name,
        ticketNumber: ticketNumber,
        ssrCode: ssrCode,
        paxType: paxType,
        contact: contact,
        passportNo: passportNo,
        bagAllowance: bagAllowance
    );


    return passengermodel;

  }


  static List<PassengerInfoModel> mapListBDPassengerToPassengerInfoModel(List<BDPassenger> responses){
    return responses.map((e) => mapBDPassengerToPassengerInfoModel(e)).toList();
  }

}