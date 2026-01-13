import 'package:domain/enum/subscription_level.dart';

enum Countries {
  afghanistan,
  albania,
  algeria,
  andorra,
  angola,
  antigua_and_barbuda,
  argentina,
  armenia,
  australia,
  austria,
  azerbaijan,
  bahamas,
  bahrain,
  bangladesh,
  barbados,
  belarus,
  belgium,
  belize,
  benin,
  bhutan,
  bolivia,
  bosnia_and_herzegovina,
  botswana,
  brazil,
  brunei,
  bulgaria,
  burkina_faso,
  burundi,
  cabo_verde,
  cambodia,
  cameroon,
  canada,
  central_african_republic,
  chad,
  chile,
  china,
  colombia,
  comoros,
  congo,
  costa_rica,
  croatia,
  cuba,
  cyprus,
  czech_republic,
  denmark,
  djibouti,
  dominica,
  dominican_republic,
  ecuador,
  egypt,
  el_salvador,
  equatorial_guinea,
  eritrea,
  estonia,
  eswatini,
  ethiopia,
  fiji,
  finland,
  france,
  gabon,
  gambia,
  georgia,
  germany,
  ghana,
  greece,
  grenada,
  guatemala,
  guinea,
  guinea_bissau,
  guyana,
  haiti,
  honduras,
  hungary,
  iceland,
  india,
  indonesia,
  iran,
  iraq,
  ireland,
  israel,
  italy,
  jamaica,
  japan,
  jordan,
  kazakhstan,
  kenya,
  kiribati,
  korea_north,
  korea_south,
  kuwait,
  kyrgyzstan,
  laos,
  latvia,
  lebanon,
  lesotho,
  liberia,
  libya,
  liechtenstein,
  lithuania,
  luxembourg,
  madagascar,
  malawi,
  malaysia,
  maldives,
  mali,
  malta,
  marshall_islands,
  mauritania,
  mauritius,
  mexico,
  micronesia,
  moldova,
  monaco,
  mongolia,
  montenegro,
  morocco,
  mozambique,
  myanmar,
  namibia,
  nauru,
  nepal,
  netherlands,
  new_zealand,
  nicaragua,
  niger,
  nigeria,
  north_macedonia,
  norway,
  oman,
  pakistan,
  palau,
  panama,
  papua_new_guinea,
  paraguay,
  peru,
  philippines,
  poland,
  portugal,
  qatar,
  romania,
  russia,
  rwanda,
  saint_kitts_and_nevis,
  saint_lucia,
  saint_vincent_and_the_grenadines,
  samoa,
  san_marino,
  sao_tome_and_principe,
  saudi_arabia,
  senegal,
  serbia,
  seychelles,
  sierra_leone,
  singapore,
  slovakia,
  slovenia,
  solomon_islands,
  somalia,
  south_africa,
  south_sudan,
  spain,
  sri_lanka,
  sudan,
  suriname,
  sweden,
  switzerland,
  syria,
  taiwan,
  tajikistan,
  tanzania,
  thailand,
  timor_leste,
  togo,
  tonga,
  trinidad_and_tobago,
  tunisia,
  turkey,
  turkmenistan,
  tuvalu,
  uganda,
  ukraine,
  united_arab_emirates,
  united_kingdom,
  united_states,
  uruguay,
  uzbekistan,
  vanuatu,
  vatican_city,
  venezuela,
  vietnam,
  yemen,
  zambia,
  zimbabwe
}

extension CountryExtension on Countries {
  String get name {
    switch (this) {
      case Countries.afghanistan:
        return 'Afghanistan';
      case Countries.albania:
        return 'Albania';
      case Countries.algeria:
        return 'Algeria';
      case Countries.andorra:
        return 'Andorra';
      case Countries.angola:
        return 'Angola';
      case Countries.antigua_and_barbuda:
        return 'Antigua and Barbuda';
      case Countries.argentina:
        return 'Argentina';
      case Countries.armenia:
        return 'Armenia';
      case Countries.australia:
        return 'Australia';
      case Countries.austria:
        return 'Austria';
      case Countries.azerbaijan:
        return 'Azerbaijan';
      case Countries.bahamas:
        return 'Bahamas';
      case Countries.bahrain:
        return 'Bahrain';
      case Countries.bangladesh:
        return 'Bangladesh';
      case Countries.barbados:
        return 'Barbados';
      case Countries.belarus:
        return 'Belarus';
      case Countries.belgium:
        return 'Belgium';
      case Countries.belize:
        return 'Belize';
      case Countries.benin:
        return 'Benin';
      case Countries.bhutan:
        return 'Bhutan';
      case Countries.bolivia:
        return 'Bolivia';
      case Countries.bosnia_and_herzegovina:
        return 'Bosnia and Herzegovina';
      case Countries.botswana:
        return 'Botswana';
      case Countries.brazil:
        return 'Brazil';
      case Countries.brunei:
        return 'Brunei';
      case Countries.bulgaria:
        return 'Bulgaria';
      case Countries.burkina_faso:
        return 'Burkina Faso';
      case Countries.burundi:
        return 'Burundi';
      case Countries.cabo_verde:
        return 'Cabo Verde';
      case Countries.cambodia:
        return 'Cambodia';
      case Countries.cameroon:
        return 'Cameroon';
      case Countries.canada:
        return 'Canada';
      case Countries.central_african_republic:
        return 'Central African Republic';
      case Countries.chad:
        return 'Chad';
      case Countries.chile:
        return 'Chile';
      case Countries.china:
        return 'China';
      case Countries.colombia:
        return 'Colombia';
      case Countries.comoros:
        return 'Comoros';
      case Countries.congo:
        return 'Congo';
      case Countries.costa_rica:
        return 'Costa Rica';
      case Countries.croatia:
        return 'Croatia';
      case Countries.cuba:
        return 'Cuba';
      case Countries.cyprus:
        return 'Cyprus';
      case Countries.czech_republic:
        return 'Czech Republic';
      case Countries.denmark:
        return 'Denmark';
      case Countries.djibouti:
        return 'Djibouti';
      case Countries.dominica:
        return 'Dominica';
      case Countries.dominican_republic:
        return 'Dominican Republic';
      case Countries.ecuador:
        return 'Ecuador';
      case Countries.egypt:
        return 'Egypt';
      case Countries.el_salvador:
        return 'El Salvador';
      case Countries.equatorial_guinea:
        return 'Equatorial Guinea';
      case Countries.eritrea:
        return 'Eritrea';
      case Countries.estonia:
        return 'Estonia';
      case Countries.eswatini:
        return 'Eswatini';
      case Countries.ethiopia:
        return 'Ethiopia';
      case Countries.fiji:
        return 'Fiji';
      case Countries.finland:
        return 'Finland';
      case Countries.france:
        return 'France';
      case Countries.gabon:
        return 'Gabon';
      case Countries.gambia:
        return 'Gambia';
      case Countries.georgia:
        return 'Georgia';
      case Countries.germany:
        return 'Germany';
      case Countries.ghana:
        return 'Ghana';
      case Countries.greece:
        return 'Greece';
      case Countries.grenada:
        return 'Grenada';
      case Countries.guatemala:
        return 'Guatemala';
      case Countries.guinea:
        return 'Guinea';
      case Countries.guinea_bissau:
        return 'Guinea-Bissau';
      case Countries.guyana:
        return 'Guyana';
      case Countries.haiti:
        return 'Haiti';
      case Countries.honduras:
        return 'Honduras';
      case Countries.hungary:
        return 'Hungary';
      case Countries.iceland:
        return 'Iceland';
      case Countries.india:
        return 'India';
      case Countries.indonesia:
        return 'Indonesia';
      case Countries.iran:
        return 'Iran';
      case Countries.iraq:
        return 'Iraq';
      case Countries.ireland:
        return 'Ireland';
      case Countries.israel:
        return 'Israel';
      case Countries.italy:
        return 'Italy';
      case Countries.jamaica:
        return 'Jamaica';
      case Countries.japan:
        return 'Japan';
      case Countries.jordan:
        return 'Jordan';
      case Countries.kazakhstan:
        return 'Kazakhstan';
      case Countries.kenya:
        return 'Kenya';
      case Countries.kiribati:
        return 'Kir';
      case Countries.korea_north:
        return 'North Korea';
      case Countries.korea_south:
        return 'South Korea';
      case Countries.kuwait:
        return 'Kuwait';
      case Countries.kyrgyzstan:
        return 'Kyrgyzstan';
      case Countries.laos:
        return 'Laos';
      case Countries.latvia:
        return 'Latvia';
      case Countries.lebanon:
        return 'Lebanon';
      case Countries.lesotho:
        return 'Lesotho';
      case Countries.liberia:
        return 'Liberia';
      case Countries.libya:
        return 'Libya';
      case Countries.liechtenstein:
        return 'Liechtenstein';
      case Countries.lithuania:
        return 'Lithuania';
      case Countries.luxembourg:
        return 'Luxembourg';
      case Countries.madagascar:
        return 'Madagascar';
      case Countries.malawi:
        return 'Malawi';
      case Countries.malaysia:
        return 'Malaysia';
      case Countries.maldives:
        return 'Maldives';
      case Countries.mali:
        return 'Mali';
      case Countries.malta:
        return 'Malta';
      case Countries.marshall_islands:
        return 'Marshall Islands';
      case Countries.mauritania:
        return 'Mauritania';
      case Countries.mauritius:
        return 'Mauritius';
      case Countries.mexico:
        return 'Mexico';
      case Countries.micronesia:
        return 'Micronesia';
      case Countries.moldova:
        return 'Moldova';
      case Countries.monaco:
        return 'Monaco';
      case Countries.mongolia:
        return 'Mongolia';
      case Countries.montenegro:
        return 'Montenegro';
      case Countries.morocco:
        return 'Morocco';
      case Countries.mozambique:
        return 'Mozambique';
      case Countries.myanmar:
        return 'Myanmar';
      case Countries.namibia:
        return 'Namibia';
      case Countries.nauru:
        return 'Nauru';
      case Countries.nepal:
        return 'Nepal';
      case Countries.netherlands:
        return 'Netherlands';
      case Countries.new_zealand:
        return 'New Zealand';
      case Countries.nicaragua:
        return 'Nicaragua';
      case Countries.niger:
        return 'Niger';
      case Countries.nigeria:
        return 'Nigeria';
      case Countries.north_macedonia:
        return 'North Macedonia';
      case Countries.norway:
        return 'Norway';
      case Countries.oman:
        return 'Oman';
      case Countries.pakistan:
        return 'Pakistan';
      case Countries.palau:
        return 'Palau';
      case Countries.panama:
        return 'Panama';
      case Countries.papua_new_guinea:
        return 'Papua New Guinea';
      case Countries.paraguay:
        return 'Paraguay';
      case Countries.peru:
        return 'Peru';
      case Countries.philippines:
        return 'Philippines';
      case Countries.poland:
        return 'Poland';
      case Countries.portugal:
        return 'Portugal';
      case Countries.qatar:
        return 'Qatar';
      case Countries.romania:
        return 'Romania';
      case Countries.russia:
        return 'Russia';
      case Countries.rwanda:
        return 'Rwanda';
      case Countries.saint_kitts_and_nevis:
        return 'Saint Kitts and Nevis';
      case Countries.saint_lucia:
        return 'Saint Lucia';
      case Countries.saint_vincent_and_the_grenadines:
        return 'Saint Vincent and the Grenadines';
      case Countries.samoa:
        return 'Samoa';
      case Countries.san_marino:
        return 'San Marino';
      case Countries.sao_tome_and_principe:
        return 'São Tomé and Príncipe';
      case Countries.saudi_arabia:
        return 'Saudi Arabia';
      case Countries.senegal:
        return 'Senegal';
      case Countries.serbia:
        return 'Serbia';
      case Countries.seychelles:
        return 'Seychelles';
      case Countries.sierra_leone:
        return 'Sierra Leone';
      case Countries.singapore:
        return 'Singapore';
      case Countries.slovakia:
        return 'Slovakia';
      case Countries.slovenia:
        return 'Slovenia';
      case Countries.solomon_islands:
        return 'Solomon Islands';
      case Countries.somalia:
        return 'Somalia';
      case Countries.south_africa:
        return 'South Africa';
      case Countries.south_sudan:
        return 'South Sudan';
      case Countries.spain:
        return 'Spain';
      case Countries.sri_lanka:
        return 'Sri Lanka';
      case Countries.sudan:
        return 'Sudan';
      case Countries.suriname:
        return 'Suriname';
      case Countries.sweden:
        return 'Sweden';
      case Countries.switzerland:
        return 'Switzerland';
      case Countries.syria:
        return 'Syria';
      case Countries.taiwan:
        return 'Taiwan';
      case Countries.tajikistan:
        return 'Tajikistan';
      case Countries.tanzania:
        return 'Tanzania';
      case Countries.thailand:
        return 'Thailand';
      case Countries.timor_leste:
        return 'Timor-Leste';
      case Countries.togo:
        return 'Togo';
      case Countries.tonga:
        return 'Tonga';
      case Countries.trinidad_and_tobago:
        return 'Trinidad and Tobago';
      case Countries.tunisia:
        return 'Tunisia';
      case Countries.turkey:
        return 'Turkey';
      case Countries.turkmenistan:
        return 'Turkmenistan';
      case Countries.tuvalu:
        return 'Tuvalu';
      case Countries.uganda:
        return 'Uganda';
      case Countries.ukraine:
        return 'Ukraine';
      case Countries.united_arab_emirates:
        return 'United Arab Emirates';
      case Countries.united_kingdom:
        return 'United Kingdom';
      case Countries.united_states:
        return 'United States';
      case Countries.uruguay:
        return 'Uruguay';
      case Countries.uzbekistan:
        return 'Uzbekistan';
      case Countries.vanuatu:
        return 'Vanuatu';
      case Countries.vatican_city:
        return 'Vatican City';
      case Countries.venezuela:
        return 'Venezuela';
      case Countries.vietnam:
        return 'Vietnam';
      case Countries.yemen:
        return 'Yemen';
      case Countries.zambia:
        return 'Zambia';
      case Countries.zimbabwe:
        return 'Zimbabwe';
    }
  }

  static final Map<String, Countries> _nameToCountryMap = {
    for (var country in Countries.values) country.name.toLowerCase(): country,
  };

  static Countries? fromString(String name) {
    return _nameToCountryMap[name.toLowerCase()];
  }



}
