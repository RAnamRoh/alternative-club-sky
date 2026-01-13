enum FrequentFlyer {
  aerLingus, // Aer Lingus Travel Award
  airCanada, // Air Canada Aeroplan
  airFrance, // Air France Frequence Plus
  airNewZealand, // Air New Zealand Air Points
  airTran, // Air Tran A Plus Rewards
  alaska, // Alaska Airlines Mileage Plan
  alitalia, // Alitalia Club Mille Miglia
  ana, // All Nippon Airways ANA Mileage Club
  americanAirlines, // American Airlines AAdvantage
  asiana, // Asiana Asiana Club
  austrian, // Austrian Airlines Miles & More
  britishAirways, // British Airways Executive Club
  cathayPacific, // Cathay Pacific Airways Asia Miles
  continental, // Continental OnePass
  delta, // Delta Air Lines SkyMiles
  emirates, // Emirates
  etihad, // Etihad Airways
  evaAir, // EVA Evergreen Club
  finnair, // Finnair Plus Bonus Program
  frontier, // Frontier EarlyReturns
  garudaIndonesia, // Garuda Indonesia GarudaMiles
  hawaiianAirlines, // Hawaiian Airlines HawaiianMiles
  iberia, // Iberia Iberia Plus
  japanAirlines, // Japan Airlines JAL Mileage Bank
  jetBlue, // JetBlue TrueBlue
  klm, // KLM Flying Dutchman
  koreanAir, // Korean Airlines Skypass
  lufthansa, // Lufthansa Miles & More
  malaysiaAirlines, // Malaysia Airlines Enrich
  mexicana, // Mexicana Frequenta
  midwest, // Midwest Airlines Midwest Miles
  northwest, // Northwest Airlines WorldPerks
  philippineAirlines, // Philippine Airlines Mabuhay Miles
  qantas, // Qantas Frequent Flyer
  sas, // SAS EuroBonus
  singaporeAirlines, // Singapore Airlines KrisFlyer
  southAfrican, // South African Airways
  southwest, // Southwest Airlines Rapid Rewards
  swiss, // Swiss TravelClub
  tapPortugal, // TAP Air Portugal Navigator
  thaiAirways, // Thai Airways Royal Orchid Plus
  united, // United Airlines Mileage Plus
  usAirways, // US Airways Dividend Miles
  varig, // Varig Smiles
  virginAustralia // Virgin Australia
}

extension FrequentFlyerExtension on FrequentFlyer {
  String get name {
    switch (this) {
      case FrequentFlyer.aerLingus: return 'Aer Lingus Travel Award';
      case FrequentFlyer.airCanada: return 'Air Canada Aeroplan';
      case FrequentFlyer.airFrance: return 'Air France Frequence Plus';
      case FrequentFlyer.airNewZealand: return 'Air New Zealand Air Points';
      case FrequentFlyer.airTran: return 'Air Tran A Plus Rewards';
      case FrequentFlyer.alaska: return 'Alaska Airlines Mileage Plan';
      case FrequentFlyer.alitalia: return 'Alitalia Club Mille Miglia';
      case FrequentFlyer.ana: return 'All Nippon Airways ANA Mileage Club';
      case FrequentFlyer.americanAirlines: return 'American Airlines AAdvantage';
      case FrequentFlyer.asiana: return 'Asiana Asiana Club';
      case FrequentFlyer.austrian: return 'Austrian Airlines Miles & More';
      case FrequentFlyer.britishAirways: return 'British Airways Executive Club';
      case FrequentFlyer.cathayPacific: return 'Cathay Pacific Airways Asia Miles';
      case FrequentFlyer.continental: return 'Continental OnePass';
      case FrequentFlyer.delta: return 'Delta Air Lines SkyMiles';
      case FrequentFlyer.emirates: return 'Emirates';
      case FrequentFlyer.etihad: return 'Etihad Airways';
      case FrequentFlyer.evaAir: return 'EVA Evergreen Club';
      case FrequentFlyer.finnair: return 'Finnair Plus Bonus Program';
      case FrequentFlyer.frontier: return 'Frontier EarlyReturns';
      case FrequentFlyer.garudaIndonesia: return 'Garuda Indonesia GarudaMiles';
      case FrequentFlyer.hawaiianAirlines: return 'Hawaiian Airlines HawaiianMiles';
      case FrequentFlyer.iberia: return 'Iberia Iberia Plus';
      case FrequentFlyer.japanAirlines: return 'Japan Airlines JAL Mileage Bank';
      case FrequentFlyer.jetBlue: return 'JetBlue TrueBlue';
      case FrequentFlyer.klm: return 'KLM Flying Dutchman';
      case FrequentFlyer.koreanAir: return 'Korean Airlines Skypass';
      case FrequentFlyer.lufthansa: return 'Lufthansa Miles & More';
      case FrequentFlyer.malaysiaAirlines: return 'Malaysia Airlines Enrich';
      case FrequentFlyer.mexicana: return 'Mexicana Frequenta';
      case FrequentFlyer.midwest: return 'Midwest Airlines Midwest Miles';
      case FrequentFlyer.northwest: return 'Northwest Airlines WorldPerks';
      case FrequentFlyer.philippineAirlines: return 'Philippine Airlines Mabuhay Miles';
      case FrequentFlyer.qantas: return 'Qantas Frequent Flyer';
      case FrequentFlyer.sas: return 'SAS EuroBonus';
      case FrequentFlyer.singaporeAirlines: return 'Singapore Airlines KrisFlyer';
      case FrequentFlyer.southAfrican: return 'South African Airways';
      case FrequentFlyer.southwest: return 'Southwest Airlines Rapid Rewards';
      case FrequentFlyer.swiss: return 'Swiss TravelClub';
      case FrequentFlyer.tapPortugal: return 'TAP Air Portugal Navigator';
      case FrequentFlyer.thaiAirways: return 'Thai Airways Royal Orchid Plus';
      case FrequentFlyer.united: return 'United Airlines Mileage Plus';
      case FrequentFlyer.usAirways: return 'US Airways Dividend Miles';
      case FrequentFlyer.varig: return 'Varig Smiles';
      case FrequentFlyer.virginAustralia: return 'Virgin Australia';
    }
  }

  String get code {
    switch (this) {
      case FrequentFlyer.aerLingus: return 'EI';
      case FrequentFlyer.airCanada: return 'AC';
      case FrequentFlyer.airFrance: return 'AF';
      case FrequentFlyer.airNewZealand: return 'NZ';
      case FrequentFlyer.airTran: return 'FL';
      case FrequentFlyer.alaska: return 'AS';
      case FrequentFlyer.alitalia: return 'AZ';
      case FrequentFlyer.ana: return 'EH';
      case FrequentFlyer.americanAirlines: return 'AA';
      case FrequentFlyer.asiana: return 'OZ';
      case FrequentFlyer.austrian: return 'OS';
      case FrequentFlyer.britishAirways: return 'BA';
      case FrequentFlyer.cathayPacific: return 'CX';
      case FrequentFlyer.continental: return 'CO';
      case FrequentFlyer.delta: return 'DL';
      case FrequentFlyer.emirates: return 'EK';
      case FrequentFlyer.etihad: return 'EY';
      case FrequentFlyer.evaAir: return 'BR';
      case FrequentFlyer.finnair: return 'AY';
      case FrequentFlyer.frontier: return 'F9';
      case FrequentFlyer.garudaIndonesia: return 'GA';
      case FrequentFlyer.hawaiianAirlines: return 'HA';
      case FrequentFlyer.iberia: return 'IB';
      case FrequentFlyer.japanAirlines: return 'JL';
      case FrequentFlyer.jetBlue: return 'B6';
      case FrequentFlyer.klm: return 'KL';
      case FrequentFlyer.koreanAir: return 'KE';
      case FrequentFlyer.lufthansa: return 'LH';
      case FrequentFlyer.malaysiaAirlines: return 'MH';
      case FrequentFlyer.mexicana: return 'MX';
      case FrequentFlyer.midwest: return 'MY';
      case FrequentFlyer.northwest: return 'NW';
      case FrequentFlyer.philippineAirlines: return 'PR';
      case FrequentFlyer.qantas: return 'QF';
      case FrequentFlyer.sas: return 'SK';
      case FrequentFlyer.singaporeAirlines: return 'SQ';
      case FrequentFlyer.southAfrican: return 'SA';
      case FrequentFlyer.southwest: return 'WN';
      case FrequentFlyer.swiss: return 'LX';
      case FrequentFlyer.tapPortugal: return 'TP';
      case FrequentFlyer.thaiAirways: return 'TG';
      case FrequentFlyer.united: return 'UA';
      case FrequentFlyer.usAirways: return 'US';
      case FrequentFlyer.varig: return 'LC';
      case FrequentFlyer.virginAustralia: return 'VA';
    }
  }
}
