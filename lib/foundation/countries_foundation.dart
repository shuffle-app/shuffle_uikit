import 'package:countries_flag/countries_flag.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class CountriesFoundation {
  static CountriesFoundation instance = CountriesFoundation._();
  // abkhazia: No ISO code
  // alandIslands: AX
  // albania: AL
  // algeria: DZ
  // americanSamoa: AS
  // andorra: AD
  // angola: AO
  // anguilla: AI
  // antiguaAndBarbuda: AG
  // argentina: AR
  // armenia: AM
  // aruba: AW
  // australia: AU
  // austria: AT
  // azerbaijan: AZ
  // azoresIslands: No ISO code
  // bahamas: BS
  // bahrain: BH
  // balearicIslands: No ISO code
  // bangladesh: BD
  // barbados: BB
  // basqueCountry: No ISO code
  // belarus: BY
  // belgium: BE
  // belize: BZ
  // benin: BJ
  // bermuda: BM
  // bhutan: BT
  // bolivia: BO
  // bonaire: BQ
  // bosniaAndHerzegovina: BA
  // botswana: BW
  // brazil: BR
  // britishColumbia: No ISO code
  // britishIndianOceanTerritory: IO
  // britishVirginIslands: VG
  // brunei: BN
  // bulgaria: BG
  // burkinaFaso: BF
  // burundi: BI
  // cambodia: KH
  // cameroon: CM
  // canada: CA
  // canaryIslands: No ISO code
  // capeVerde: CV
  // caymanIslands: KY
  // centralAfricanRepublic: CF
  // ceuta: No ISO code
  // chad: TD
  // chile: CL
  // china: CN
  // christmasIsland: CX
  // cocosIsland: CC
  // colombia: CO
  // comoros: KM
  // cookIslands: CK
  // corsica: No ISO code
  // costaRica: CR
  // croatia: HR
  // cuba: CU
  // curacao: CW
  // cyprus: CY
  // czechRepublic: CZ
  // democraticRepublicOfCongo: CD
  // denmark: DK
  // djibouti: DJ
  // dominica: DM
  // dominicanRepublic: DO
  // eastTimor: TL
  // ecuador: EC
  // egypt: EG
  // elSalvador: SV
  // england: No ISO code
  // equatorialGuinea: GQ
  // eritrea: ER
  // estonia: EE
  // ethiopia: ET
  // falklandIslands: FK
  // faroeIslands: FO
  // fiji: FJ
  // finland: FI
  // france: FR
  // frenchPolynesia: PF
  // gabon: GA
  // galapagosIslands: No ISO code
  // gambia: GM
  // georgia: GE
  // germany: DE
  // ghana: GH
  // gibraltar: GI
  // greece: GR
  // greenland: GL
  // grenada: GD
  // guam: GU
  // guatemala: GT
  // guernsey: GG
  // guineaBissau: GW
  // guinea: GN
  // haiti: HT
  // hawaii: No ISO code
  // honduras: HN
  // hongKong: HK
  // hungary: HU
  // iceland: IS
  // india: IN
  // indonesia: ID
  // iran: IR
  // iraq: IQ
  // ireland: IE
  // isleOfMan: IM
  // israel: IL
  // italy: IT
  // ivoryCoast: CI
  // jamaica: JM
  // japan: JP
  // jersey: JE
  // jordan: JO
  // kazakhstan: KZ
  // kenya: KE
  // kosovo: XK
  // kuwait: KW
  // kyrgyzstan: KG
  // laos: LA
  // latvia: LV
  // lebanon: LB
  // lesotho: LS
  // liberia: LR
  // libya: LY
  // liechtenstein: LI
  // lithuania: LT
  // luxembourg: LU
  // macao: MO
  // madagascar: MG
  // madeira: No ISO code
  // malawi: MW
  // malaysia: MY
  // maldives: MV
  // mali: ML
  // malta: MT
  // marshallIsland: MH
  // martinique: MQ
  // mauritania: MR
  // mauritius: MU
  // melilla: No ISO code
  // mexico: MX
  // micronesia: FM
  // moldova: MD
  // monaco: MC
  // mongolia: MN
  // montenegro: ME
  // montserrat: MS
  // morocco: MA
  // mozambique: MZ
  // myanmar: MM
  // namibia: NA
  // nauru: NR
  // nepal: NP
  // netherlands: NL
  // newZealand: NZ
  // nicaragua: NI
  // niger: NE
  // nigeria: NG
  // niue: NU
  // norfolkIsland: NF
  // northKorea: KP
  // northenCyprus: No ISO code
  // northernMarianasIslands: MP
  // norway: NO
  // oman: OM
  // orkneyIslands: No ISO code
  // ossetia: No ISO code
  // otan: No ISO code
  // pakistan: PK
  // palau: PW
  // palestine: PS
  // panama: PA
  // papuaNewGuinea: PG
  // paraguay: PY
  // peru: PE
  // philippines: PH
  // pitcairnIslands: PN
  // poland: PL
  // portugal: PT
  // puertoRico: PR
  // qatar: QA
  // republicOfMacedonia: MK
  // republicOfTheCongo: CG
  // romania: RO
  // russia: RU
  // rwanda: RW
  // sabaIsland: No ISO code
  // sahrawiArabDemocraticRepublic: No ISO code
  // saintKittsAndNevis: KN
  // samoa: WS
  // sanMarino: SM
  // saoTomeAndPrincipe: ST
  // sardinia: No ISO code
  // saudiArabia: SA
  // scotland: No ISO code
  // senegal: SN
  // serbia: RS
  // seychelles: SC
  // sicily: No ISO code
  // sierraLeone: SL
  // singapore: SG
  // sintEustatius: No ISO code
  // sintMaarten: SX
  // slovakia: SK
  // slovenia: SI
  // solomonIslands: SB
  // somalia: SO
  // somaliland: No ISO code
  // southAfrica: ZA
  // southKorea: KR
  // southSudan: SS
  // spain: ES
  // sriLanka: LK
  // stBarts: BL
  // stVincentAndTheGrenadines: VC
  // sudan: SD
  // suriname: SR
  // sweden: SE
  // switzerland: CH
  // syria: SY
  // taiwan: TW
  // tajikistan: TJ
  // tanzania: TZ
  // thailand: TH
  // tibet: No ISO code
  // togo: TG
  // tokelau: TK
  // tonga: TO
  // transnistria: No ISO code
  // trinidadAndTobago: TT
  // tubalu: No ISO code
  // tunisia: TN
  // turkey: TR
  // turkmenistan: TM
  // turksAndCaicos: TC
  // uganda: UG
  // ukraine: UA
  // unitedArabEmirates: AE
  // unitedKingdom: GB
  // unitedStatesOfAmerica: US
  // uruguay: UY
  // uzbekistan: UZ
  // vanuatu: VU
  // vaticanCity: VA
  // venezuela: VE
  // vietnam: VN
  // virginIslands: VI
  // wales: No ISO code
  // yemen: YE
  // zambia: ZM
  // zimbabwe: ZW
  //
  //
  final abkhazia = CountryModel(
    countryName: 'abkhazia'.toUpperCase(),
    countryPhoneCode: '+7',
    flag: Flags.abkhazia,
    isoCode: 'RU',
  );

  final afghanistan = CountryModel(
    countryName: 'afghanistan'.toUpperCase(),
    countryPhoneCode: '+93',
    flag: Flags.afghanistan,
    isoCode: 'AF',
  );

  final albania = CountryModel(
    countryName: 'albania'.toUpperCase(),
    countryPhoneCode: '+355',
    flag: Flags.albania,
    isoCode: 'AL',
  );

  final algeria = CountryModel(
    countryName: 'algeria'.toUpperCase(),
    countryPhoneCode: '+213',
    flag: Flags.algeria,
    isoCode: 'DZ',
  );

  final americanSamoa = CountryModel(
    countryName: 'american Samoa'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.americanSamoa,
    isoCode: 'AS',
  );

  final andorra = CountryModel(
    countryName: 'andorra'.toUpperCase(),
    countryPhoneCode: '+376',
    flag: Flags.andorra,
    isoCode: 'AD',
  );

  final angola = CountryModel(
    countryName: 'angola'.toUpperCase(),
    countryPhoneCode: '+244',
    flag: Flags.angola,
    isoCode: 'AO',
  );

  final anguilla = CountryModel(
    countryName: 'anguilla'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.anguilla,
    isoCode: 'AI',
  );

  final antiguaAndBarbuda = CountryModel(
    countryName: 'antigua And Barbuda'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.antiguaAndBarbuda,
    isoCode: 'AG',
  );

  final argentina = CountryModel(
    countryName: 'argentina'.toUpperCase(),
    countryPhoneCode: '+54',
    flag: Flags.argentina,
    isoCode: 'AR',
  );

  final armenia = CountryModel(
    countryName: 'armenia'.toUpperCase(),
    countryPhoneCode: '+374',
    flag: Flags.armenia,
    isoCode: 'AM',
  );

  final australia = CountryModel(
    countryName: 'australia'.toUpperCase(),
    countryPhoneCode: '+61',
    flag: Flags.australia,
    isoCode: 'AU',
  );

  final austria = CountryModel(
    countryName: 'austria'.toUpperCase(),
    countryPhoneCode: '+43',
    flag: Flags.austria,
    isoCode: 'AT',
  );

  final azerbaijan = CountryModel(
    countryName: 'azerbaijan'.toUpperCase(),
    countryPhoneCode: '+994',
    flag: Flags.azerbaijan,
    isoCode: 'AZ',
  );

  final azoresIslands = CountryModel(
    countryName: 'azores Islands'.toUpperCase(),
    countryPhoneCode: '+351',
    flag: Flags.azoresIslands,
    isoCode: 'PT',
  );

  final bahamas = CountryModel(
    countryName: 'bahamas'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.bahamas,
    isoCode: 'BS',
  );

  final bahrain = CountryModel(
    countryName: 'bahrain'.toUpperCase(),
    countryPhoneCode: '+973',
    flag: Flags.bahrain,
    isoCode: 'BH',
  );

  final balearicIslands = CountryModel(
    countryName: 'balearic Islands'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.balearicIslands,
    isoCode: 'ES',
  );

  final bangladesh = CountryModel(
    countryName: 'bangladesh'.toUpperCase(),
    countryPhoneCode: '+880',
    flag: Flags.bangladesh,
    isoCode: 'BD',
  );

  final barbados = CountryModel(
    countryName: 'barbados'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.barbados,
    isoCode: 'BB',
  );

  final basqueCountry = CountryModel(
    countryName: 'basque Country'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.basqueCountry,
    isoCode: 'ES',
  );

  final belarus = CountryModel(
    countryName: 'belarus'.toUpperCase(),
    countryPhoneCode: '+375',
    flag: Flags.belarus,
    isoCode: 'BY',
  );

  final belgium = CountryModel(
    countryName: 'belgium'.toUpperCase(),
    countryPhoneCode: '+32',
    flag: Flags.belgium,
    isoCode: 'BE',
  );

  final belize = CountryModel(
    countryName: 'belize'.toUpperCase(),
    countryPhoneCode: '+501',
    flag: Flags.belize,
    isoCode: 'BZ',
  );

  final benin = CountryModel(
    countryName: 'benin'.toUpperCase(),
    countryPhoneCode: '+229',
    flag: Flags.benin,
    isoCode: 'BJ',
  );

  final bermuda = CountryModel(
    countryName: 'bermuda'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.bermuda,
    isoCode: 'BM',
  );

  final bhutan = CountryModel(
    countryName: 'bhutan'.toUpperCase(),
    countryPhoneCode: '+975',
    flag: Flags.bhutan,
    isoCode: 'BT',
  );

  final bolivia = CountryModel(
    countryName: 'bolivia'.toUpperCase(),
    countryPhoneCode: '+591',
    flag: Flags.bolivia,
    isoCode: 'BO',
  );

  final bonaire = CountryModel(
    countryName: 'bonaire'.toUpperCase(),
    countryPhoneCode: '+599',
    flag: Flags.bonaire,
    isoCode: 'BQ',
  );

  final bosniaAndHerzegovina = CountryModel(
    countryName: 'bosnia And Herzegovina'.toUpperCase(),
    countryPhoneCode: '+387',
    flag: Flags.bosniaAndHerzegovina,
    isoCode: 'BA',
  );

  final botswana = CountryModel(
    countryName: 'botswana'.toUpperCase(),
    countryPhoneCode: '+267',
    flag: Flags.botswana,
    isoCode: 'BW',
  );

  final brazil = CountryModel(
    countryName: 'brazil'.toUpperCase(),
    countryPhoneCode: '+55',
    flag: Flags.brazil,
    isoCode: 'BR',
  );

  final britishColumbia = CountryModel(
    countryName: 'british Columbia'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.britishColumbia,
    isoCode: 'CA',
  );

  final britishVirginIslands = CountryModel(
    countryName: 'british Virgin Islands'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.britishVirginIslands,
    isoCode: 'VG',
  );

  final brunei = CountryModel(
    countryName: 'brunei'.toUpperCase(),
    countryPhoneCode: '+673',
    flag: Flags.brunei,
    isoCode: 'BN',
  );

  final bulgaria = CountryModel(
    countryName: 'bulgaria'.toUpperCase(),
    countryPhoneCode: '+359',
    flag: Flags.bulgaria,
    isoCode: 'BG',
  );

  final burkinaFaso = CountryModel(
    countryName: 'burkina Faso'.toUpperCase(),
    countryPhoneCode: '+226',
    flag: Flags.burkinaFaso,
    isoCode: 'BF',
  );

  final burundi = CountryModel(
    countryName: 'burundi'.toUpperCase(),
    countryPhoneCode: '+257',
    flag: Flags.burundi,
    isoCode: 'BI',
  );

  final cambodia = CountryModel(
    countryName: 'cambodia'.toUpperCase(),
    countryPhoneCode: '+855',
    flag: Flags.cambodia,
    isoCode: 'KH',
  );

  final cameroon = CountryModel(
    countryName: 'cameroon'.toUpperCase(),
    countryPhoneCode: '+237',
    flag: Flags.cameroon,
    isoCode: 'CM',
  );

  final canada = CountryModel(
    countryName: 'canada'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.canada,
    isoCode: 'CA',
  );

  final canaryIslands = CountryModel(
    countryName: 'canary Islands'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.canaryIslands,
    isoCode: 'ES',
  );

  final capeVerde = CountryModel(
    countryName: 'cape Verde'.toUpperCase(),
    countryPhoneCode: '+238',
    flag: Flags.capeVerde,
    isoCode: 'CV',
  );

  final caymanIslands = CountryModel(
    countryName: 'cayman Islands'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.caymanIslands,
    isoCode: 'KY',
  );

  final centralAfricanRepublic = CountryModel(
    countryName: 'central African Republic'.toUpperCase(),
    countryPhoneCode: '+236',
    flag: Flags.centralAfricanRepublic,
    isoCode: 'CF',
  );

  final ceuta = CountryModel(
    countryName: 'ceuta'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.ceuta,
    isoCode: 'ES',
  );

  final chad = CountryModel(
    countryName: 'chad'.toUpperCase(),
    countryPhoneCode: '+235',
    flag: Flags.chad,
    isoCode: 'TD',
  );

  final chile = CountryModel(
    countryName: 'chile'.toUpperCase(),
    countryPhoneCode: '+56',
    flag: Flags.chile,
    isoCode: 'CL',
  );

  final china = CountryModel(
    countryName: 'china'.toUpperCase(),
    countryPhoneCode: '+86',
    flag: Flags.china,
    isoCode: 'CN',
  );

  final christmasIsland = CountryModel(
    countryName: 'christmas Island'.toUpperCase(),
    countryPhoneCode: '+61',
    flag: Flags.christmasIsland,
    isoCode: 'CX',
  );

  final cocosIsland = CountryModel(
    countryName: 'cocos Island'.toUpperCase(),
    countryPhoneCode: '+61',
    flag: Flags.cocosIsland,
    isoCode: 'CC',
  );

  final colombia = CountryModel(
    countryName: 'colombia'.toUpperCase(),
    countryPhoneCode: '+57',
    flag: Flags.colombia,
    isoCode: 'CO',
  );

  final comoros = CountryModel(
    countryName: 'comoros'.toUpperCase(),
    countryPhoneCode: '+269',
    flag: Flags.comoros,
    isoCode: 'KM',
  );

  final corsica = CountryModel(
    countryName: 'corsica'.toUpperCase(),
    countryPhoneCode: '+33',
    flag: Flags.corsica,
    isoCode: 'FR',
  );

  final costaRica = CountryModel(
    countryName: 'costa Rica'.toUpperCase(),
    countryPhoneCode: '+506',
    flag: Flags.costaRica,
    isoCode: 'CR',
  );

  final croatia = CountryModel(
    countryName: 'croatia'.toUpperCase(),
    countryPhoneCode: '+385',
    flag: Flags.croatia,
    isoCode: 'HR',
  );

  final cuba = CountryModel(
    countryName: 'cuba'.toUpperCase(),
    countryPhoneCode: '+53',
    flag: Flags.cuba,
    isoCode: 'CU',
  );

  final curacao = CountryModel(
    countryName: 'curacao'.toUpperCase(),
    countryPhoneCode: '+599',
    flag: Flags.curacao,
    isoCode: 'CW',
  );

  final cyprus = CountryModel(
    countryName: 'cyprus'.toUpperCase(),
    countryPhoneCode: '+357',
    flag: Flags.cyprus,
    isoCode: 'CY',
  );

  final czechRepublic = CountryModel(
    countryName: 'czech Republic'.toUpperCase(),
    countryPhoneCode: '+420',
    flag: Flags.czechRepublic,
    isoCode: 'CZ',
  );

  final democraticRepublicOfCongo = CountryModel(
    countryName: 'democratic Republic Of Congo'.toUpperCase(),
    countryPhoneCode: '+243',
    flag: Flags.democraticRepublicOfCongo,
    isoCode: 'CD',
  );

  final denmark = CountryModel(
    countryName: 'denmark'.toUpperCase(),
    countryPhoneCode: '+45',
    flag: Flags.denmark,
    isoCode: 'DK',
  );

  final djibouti = CountryModel(
    countryName: 'djibouti'.toUpperCase(),
    countryPhoneCode: '+253',
    flag: Flags.djibouti,
    isoCode: 'DJ',
  );

  final dominica = CountryModel(
    countryName: 'dominica'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.dominica,
    isoCode: 'DM',
  );

  final dominicanRepublic = CountryModel(
    countryName: 'dominican Republic'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.dominicanRepublic,
    isoCode: 'DO',
  );

  final eastTimor = CountryModel(
    countryName: 'east Timor'.toUpperCase(),
    countryPhoneCode: '+670',
    flag: Flags.eastTimor,
    isoCode: 'TL',
  );

  final ecuador = CountryModel(
    countryName: 'ecuador'.toUpperCase(),
    countryPhoneCode: '+593',
    flag: Flags.ecuador,
    isoCode: 'EC',
  );

  final egypt = CountryModel(
    countryName: 'egypt'.toUpperCase(),
    countryPhoneCode: '+20',
    flag: Flags.egypt,
    isoCode: 'EG',
  );

  final elSalvador = CountryModel(
    countryName: 'elSalvador'.toUpperCase(),
    countryPhoneCode: '+503',
    flag: Flags.elSalvador,
    isoCode: 'SV',
  );

  final england = CountryModel(
    countryName: 'england'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.england,
    isoCode: 'GB',
  );

  final equatorialGuinea = CountryModel(
    countryName: 'equatorial Guinea'.toUpperCase(),
    countryPhoneCode: '+240',
    flag: Flags.equatorialGuinea,
    isoCode: 'GQ',
  );

  final eritrea = CountryModel(
    countryName: 'eritrea'.toUpperCase(),
    countryPhoneCode: '+291',
    flag: Flags.eritrea,
    isoCode: 'ER',
  );

  final estonia = CountryModel(
    countryName: 'estonia'.toUpperCase(),
    countryPhoneCode: '+372',
    flag: Flags.estonia,
    isoCode: 'EE',
  );

  final ethiopia = CountryModel(
    countryName: 'ethiopia'.toUpperCase(),
    countryPhoneCode: '+251',
    flag: Flags.ethiopia,
    isoCode: 'ET',
  );

  final falklandIslands = CountryModel(
    countryName: 'falkland Islands'.toUpperCase(),
    countryPhoneCode: '+500',
    flag: Flags.falklandIslands,
    isoCode: 'FK',
  );

  final faroeIslands = CountryModel(
    countryName: 'faroe Islands'.toUpperCase(),
    countryPhoneCode: '+45',
    flag: Flags.faroeIslands,
    isoCode: 'FO',
  );

  final fiji = CountryModel(
    countryName: 'fiji'.toUpperCase(),
    countryPhoneCode: '+679',
    flag: Flags.fiji,
    isoCode: 'FJ',
  );

  final finland = CountryModel(
    countryName: 'finland'.toUpperCase(),
    countryPhoneCode: '+358',
    flag: Flags.finland,
    isoCode: 'FI',
  );

  final france = CountryModel(
    countryName: 'france'.toUpperCase(),
    countryPhoneCode: '+33',
    flag: Flags.france,
    isoCode: 'FR',
  );

  final frenchPolynesia = CountryModel(
    countryName: 'french Polynesia'.toUpperCase(),
    countryPhoneCode: '+689',
    flag: Flags.frenchPolynesia,
    isoCode: 'PF',
  );

  final gabon = CountryModel(
    countryName: 'gabon'.toUpperCase(),
    countryPhoneCode: '+241',
    flag: Flags.gabon,
    isoCode: 'GA',
  );

  final galapagosIslands = CountryModel(
    countryName: 'galapagos Islands'.toUpperCase(),
    countryPhoneCode: '+593',
    flag: Flags.galapagosIslands,
    isoCode: 'EC',
  );

  final gambia = CountryModel(
    countryName: 'gambia'.toUpperCase(),
    countryPhoneCode: '+220',
    flag: Flags.gambia,
    isoCode: 'GM',
  );

  final georgia = CountryModel(
    countryName: 'georgia'.toUpperCase(),
    countryPhoneCode: '+995',
    flag: Flags.georgia,
    isoCode: 'GE',
  );

  final germany = CountryModel(
    countryName: 'germany'.toUpperCase(),
    countryPhoneCode: '+49',
    flag: Flags.germany,
    isoCode: 'DE',
  );

  final ghana = CountryModel(
    countryName: 'ghana'.toUpperCase(),
    countryPhoneCode: '+233',
    flag: Flags.ghana,
    isoCode: 'GH',
  );

  final gibraltar = CountryModel(
    countryName: 'gibraltar'.toUpperCase(),
    countryPhoneCode: '+350',
    flag: Flags.gibraltar,
    isoCode: 'GI',
  );

  final greece = CountryModel(
    countryName: 'greece'.toUpperCase(),
    countryPhoneCode: '+30',
    flag: Flags.greece,
    isoCode: 'GR',
  );

  final greenland = CountryModel(
    countryName: 'greenland'.toUpperCase(),
    countryPhoneCode: '+299',
    flag: Flags.greenland,
    isoCode: 'GL',
  );

  final grenada = CountryModel(
    countryName: 'grenada'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.grenada,
    isoCode: 'GD',
  );

  final guam = CountryModel(
    countryName: 'guam'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.guam,
    isoCode: 'GU',
  );

  final guatemala = CountryModel(
    countryName: 'guatemala'.toUpperCase(),
    countryPhoneCode: '+502',
    flag: Flags.guatemala,
    isoCode: 'GT',
  );

  final guernsey = CountryModel(
    countryName: 'guernsey'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.guernsey,
    isoCode: 'GG',
  );

  final guineaBissau = CountryModel(
    countryName: 'guinea Bissau'.toUpperCase(),
    countryPhoneCode: '+245',
    flag: Flags.guineaBissau,
    isoCode: 'GW',
  );

  final guinea = CountryModel(
    countryName: 'guinea'.toUpperCase(),
    countryPhoneCode: '+224',
    flag: Flags.guinea,
    isoCode: 'GN',
  );

  final haiti = CountryModel(
    countryName: 'haiti'.toUpperCase(),
    countryPhoneCode: '+509',
    flag: Flags.haiti,
    isoCode: 'HT',
  );

  final hawaii = CountryModel(
    countryName: 'hawaii'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.hawaii,
    isoCode: 'US',
  );

  final honduras = CountryModel(
    countryName: 'honduras'.toUpperCase(),
    countryPhoneCode: '+504',
    flag: Flags.honduras,
    isoCode: 'HN',
  );

  final hongKong = CountryModel(
    countryName: 'hong Kong'.toUpperCase(),
    countryPhoneCode: '+852',
    flag: Flags.hongKong,
    isoCode: 'HK',
  );

  final hungary = CountryModel(
    countryName: 'hungary'.toUpperCase(),
    countryPhoneCode: '+36',
    flag: Flags.hungary,
    isoCode: 'HU',
  );

  final iceland = CountryModel(
    countryName: 'iceland'.toUpperCase(),
    countryPhoneCode: '+354',
    flag: Flags.iceland,
    isoCode: 'IS',
  );

  final india = CountryModel(
    countryName: 'india'.toUpperCase(),
    countryPhoneCode: '+91',
    flag: Flags.india,
    isoCode: 'IN',
  );

  final indonesia = CountryModel(
    countryName: 'indonesia'.toUpperCase(),
    countryPhoneCode: '+62',
    flag: Flags.indonesia,
    isoCode: 'ID',
  );

  final iran = CountryModel(
    countryName: 'iran'.toUpperCase(),
    countryPhoneCode: '+98',
    flag: Flags.iran,
    isoCode: 'IR',
  );

  final iraq = CountryModel(
    countryName: 'iraq'.toUpperCase(),
    countryPhoneCode: '+964',
    flag: Flags.iraq,
    isoCode: 'IQ',
  );

  final ireland = CountryModel(
    countryName: 'ireland'.toUpperCase(),
    countryPhoneCode: '+353',
    flag: Flags.ireland,
    isoCode: 'IE',
  );

  final isleOfMan = CountryModel(
    countryName: 'isle Of Man'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.isleOfMan,
    isoCode: 'IM',
  );

  final israel = CountryModel(
    countryName: 'israel'.toUpperCase(),
    countryPhoneCode: '+972',
    flag: Flags.israel,
    isoCode: 'IL',
  );

  final italy = CountryModel(
    countryName: 'italy'.toUpperCase(),
    countryPhoneCode: '+39',
    flag: Flags.italy,
    isoCode: 'IT',
  );

  final ivoryCoast = CountryModel(
    countryName: 'ivory Coast'.toUpperCase(),
    countryPhoneCode: '+225',
    flag: Flags.ivoryCoast,
    isoCode: 'CI',
  );

  final jamaica = CountryModel(
    countryName: 'jamaica'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.jamaica,
    isoCode: 'JM',
  );

  final japan = CountryModel(
    countryName: 'japan'.toUpperCase(),
    countryPhoneCode: '+81',
    flag: Flags.japan,
    isoCode: 'JP',
  );

  final jersey = CountryModel(
    countryName: 'jersey'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.jersey,
    isoCode: 'JE',
  );

  final jordan = CountryModel(
    countryName: 'jordan'.toUpperCase(),
    countryPhoneCode: '+962',
    flag: Flags.jordan,
    isoCode: 'JO',
  );

  final kazakhstan = CountryModel(
    countryName: 'kazakhstan'.toUpperCase(),
    countryPhoneCode: '+7',
    flag: Flags.kazakhstan,
    isoCode: 'KZ',
  );

  final kenya = CountryModel(
    countryName: 'kenya'.toUpperCase(),
    countryPhoneCode: '+254',
    flag: Flags.kenya,
    isoCode: 'KE',
  );

  final kosovo = CountryModel(
    countryName: 'kosovo'.toUpperCase(),
    countryPhoneCode: '+383',
    flag: Flags.kosovo,
    isoCode: 'XK',
  );

  final kuwait = CountryModel(
    countryName: 'kuwait'.toUpperCase(),
    countryPhoneCode: '+965',
    flag: Flags.kuwait,
    isoCode: 'KW',
  );

  final kyrgyzstan = CountryModel(
    countryName: 'kyrgyzstan'.toUpperCase(),
    countryPhoneCode: '+996',
    flag: Flags.kyrgyzstan,
    isoCode: 'KG',
  );

  final laos = CountryModel(
    countryName: 'laos'.toUpperCase(),
    countryPhoneCode: '+856',
    flag: Flags.laos,
    isoCode: 'LA',
  );

  final latvia = CountryModel(
    countryName: 'latvia'.toUpperCase(),
    countryPhoneCode: '+371',
    flag: Flags.latvia,
    isoCode: 'LV',
  );

  final lebanon = CountryModel(
    countryName: 'lebanon'.toUpperCase(),
    countryPhoneCode: '+961',
    flag: Flags.lebanon,
    isoCode: 'LB',
  );

  final lesotho = CountryModel(
    countryName: 'lesotho'.toUpperCase(),
    countryPhoneCode: '+266',
    flag: Flags.lesotho,
    isoCode: 'LS',
  );

  final liberia = CountryModel(
    countryName: 'liberia'.toUpperCase(),
    countryPhoneCode: '+231',
    flag: Flags.liberia,
    isoCode: 'LR',
  );

  final libya = CountryModel(
    countryName: 'libya'.toUpperCase(),
    countryPhoneCode: '+218',
    flag: Flags.libya,
    isoCode: 'LY',
  );

  final liechtenstein = CountryModel(
    countryName: 'liechtenstein'.toUpperCase(),
    countryPhoneCode: '+423',
    flag: Flags.liechtenstein,
    isoCode: 'LI',
  );

  final lithuania = CountryModel(
    countryName: 'lithuania'.toUpperCase(),
    countryPhoneCode: '+370',
    flag: Flags.lithuania,
    isoCode: 'LT',
  );

  final luxembourg = CountryModel(
    countryName: 'luxembourg'.toUpperCase(),
    countryPhoneCode: '+352',
    flag: Flags.luxembourg,
    isoCode: 'LU',
  );

  final macao = CountryModel(
    countryName: 'macao'.toUpperCase(),
    countryPhoneCode: '+853',
    flag: Flags.macao,
    isoCode: 'MO',
  );

  final madagascar = CountryModel(
    countryName: 'madagascar'.toUpperCase(),
    countryPhoneCode: '+261',
    flag: Flags.madagascar,
    isoCode: 'MG',
  );

  final madeira = CountryModel(
    countryName: 'madeira'.toUpperCase(),
    countryPhoneCode: '+351',
    flag: Flags.madeira,
    isoCode: 'PT',
  );

  final malawi = CountryModel(
    countryName: 'malawi'.toUpperCase(),
    countryPhoneCode: '+265',
    flag: Flags.malawi,
    isoCode: 'MW',
  );

  final malaysia = CountryModel(
    countryName: 'malaysia'.toUpperCase(),
    countryPhoneCode: '+60',
    flag: Flags.malaysia,
    isoCode: 'MY',
  );

  final maldives = CountryModel(
    countryName: 'maldives'.toUpperCase(),
    countryPhoneCode: '+960',
    flag: Flags.maldives,
    isoCode: 'MV',
  );

  final mali = CountryModel(
    countryName: 'mali'.toUpperCase(),
    countryPhoneCode: '+223',
    flag: Flags.mali,
    isoCode: 'ML',
  );

  final malta = CountryModel(
    countryName: 'malta'.toUpperCase(),
    countryPhoneCode: '+356',
    flag: Flags.malta,
    isoCode: 'MT',
  );

  final marshallIsland = CountryModel(
    countryName: 'marshall Island'.toUpperCase(),
    countryPhoneCode: '+692',
    flag: Flags.marshallIsland,
    isoCode: 'MH',
  );

  final martinique = CountryModel(
    countryName: 'martinique'.toUpperCase(),
    countryPhoneCode: '+596',
    flag: Flags.martinique,
    isoCode: 'MQ',
  );

  final mauritania = CountryModel(
    countryName: 'mauritania'.toUpperCase(),
    countryPhoneCode: '+222',
    flag: Flags.mauritania,
    isoCode: 'MR',
  );

  final mauritius = CountryModel(
    countryName: 'mauritius'.toUpperCase(),
    countryPhoneCode: '+230',
    flag: Flags.mauritius,
    isoCode: 'MU',
  );

  final melilla = CountryModel(
    countryName: 'melilla'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.melilla,
    isoCode: 'ES',
  );

  final mexico = CountryModel(
    countryName: 'mexico'.toUpperCase(),
    countryPhoneCode: '+52',
    flag: Flags.mexico,
    isoCode: 'MX',
  );

  final micronesia = CountryModel(
    countryName: 'micronesia'.toUpperCase(),
    countryPhoneCode: '+691',
    flag: Flags.micronesia,
    isoCode: 'FM',
  );

  final moldova = CountryModel(
    countryName: 'moldova'.toUpperCase(),
    countryPhoneCode: '+373',
    flag: Flags.moldova,
    isoCode: 'MD',
  );

  final monaco = CountryModel(
    countryName: 'monaco'.toUpperCase(),
    countryPhoneCode: '+377',
    flag: Flags.monaco,
    isoCode: 'MC',
  );

  final mongolia = CountryModel(
    countryName: 'mongolia'.toUpperCase(),
    countryPhoneCode: '+976',
    flag: Flags.mongolia,
    isoCode: 'MN',
  );

  final montenegro = CountryModel(
    countryName: 'montenegro'.toUpperCase(),
    countryPhoneCode: '+382',
    flag: Flags.montenegro,
    isoCode: 'ME',
  );

  final montserrat = CountryModel(
    countryName: 'montserrat'.toUpperCase(),
    countryPhoneCode: '+1664',
    flag: Flags.montserrat,
    isoCode: 'MS',
  );

  final morocco = CountryModel(
    countryName: 'morocco'.toUpperCase(),
    countryPhoneCode: '+212',
    flag: Flags.morocco,
    isoCode: 'MA',
  );

  final mozambique = CountryModel(
    countryName: 'mozambique'.toUpperCase(),
    countryPhoneCode: '+258',
    flag: Flags.mozambique,
    isoCode: 'MZ',
  );

  final myanmar = CountryModel(
    countryName: 'myanmar'.toUpperCase(),
    countryPhoneCode: '+95',
    flag: Flags.myanmar,
    isoCode: 'MM',
  );

  final namibia = CountryModel(
    countryName: 'namibia'.toUpperCase(),
    countryPhoneCode: '+264',
    flag: Flags.namibia,
    isoCode: 'NA',
  );

  final nauru = CountryModel(
    countryName: 'nauru'.toUpperCase(),
    countryPhoneCode: '+674',
    flag: Flags.nauru,
    isoCode: 'NR',
  );

  final nepal = CountryModel(
    countryName: 'nepal'.toUpperCase(),
    countryPhoneCode: '+977',
    flag: Flags.nepal,
    isoCode: 'NP',
  );

  final netherlands = CountryModel(
    countryName: 'netherlands'.toUpperCase(),
    countryPhoneCode: '+31',
    flag: Flags.netherlands,
    isoCode: 'NL',
  );

  final newZealand = CountryModel(
    countryName: 'new Zealand'.toUpperCase(),
    countryPhoneCode: '+64',
    flag: Flags.newZealand,
    isoCode: 'NZ',
  );

  final nicaragua = CountryModel(
    countryName: 'nicaragua'.toUpperCase(),
    countryPhoneCode: '+505',
    flag: Flags.nicaragua,
    isoCode: 'NI',
  );

  final niger = CountryModel(
    countryName: 'niger'.toUpperCase(),
    countryPhoneCode: '+227',
    flag: Flags.niger,
    isoCode: 'NE',
  );

  final nigeria = CountryModel(
    countryName: 'nigeria'.toUpperCase(),
    countryPhoneCode: '+234',
    flag: Flags.nigeria,
    isoCode: 'NG',
  );

  final niue = CountryModel(
    countryName: 'niue'.toUpperCase(),
    countryPhoneCode: '+683',
    flag: Flags.niue,
    isoCode: 'NU',
  );

  final norfolkIsland = CountryModel(
    countryName: 'norfolk Island'.toUpperCase(),
    countryPhoneCode: '+672',
    flag: Flags.norfolkIsland,
    isoCode: 'NF',
  );

  final northKorea = CountryModel(
    countryName: 'north Korea'.toUpperCase(),
    countryPhoneCode: '+850',
    flag: Flags.northKorea,
    isoCode: 'KP',
  );

  final northenCyprus = CountryModel(
    countryName: 'northen Cyprus'.toUpperCase(),
    countryPhoneCode: '+90',
    flag: Flags.northenCyprus,
    isoCode: 'CY',
  );

  final northernMarianasIslands = CountryModel(
    countryName: 'northern Marianas Islands'.toUpperCase(),
    countryPhoneCode: '+1670',
    flag: Flags.northernMarianasIslands,
    isoCode: 'MP',
  );

  final norway = CountryModel(
    countryName: 'norway'.toUpperCase(),
    countryPhoneCode: '+47',
    flag: Flags.norway,
    isoCode: 'NO',
  );

  final oman = CountryModel(
    countryName: 'oman'.toUpperCase(),
    countryPhoneCode: '+968',
    flag: Flags.oman,
    isoCode: 'OM',
  );

  final orkneyIslands = CountryModel(
    countryName: 'orkney Islands'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.orkneyIslands,
    isoCode: 'GB',
  );

  final ossetia = CountryModel(
    countryName: 'ossetia'.toUpperCase(),
    countryPhoneCode: '+7',
    flag: Flags.ossetia,
    isoCode: 'RU',
  );

  final otan = CountryModel(
    countryName: 'otan'.toUpperCase(),
    countryPhoneCode: '+7',
    flag: Flags.otan,
    isoCode: 'KZ',
  );

  final pakistan = CountryModel(
    countryName: 'pakistan'.toUpperCase(),
    countryPhoneCode: '+92',
    flag: Flags.pakistan,
    isoCode: 'PK',
  );

  final palau = CountryModel(
    countryName: 'palau'.toUpperCase(),
    countryPhoneCode: '+680',
    flag: Flags.palau,
    isoCode: 'PW',
  );

  final palestine = CountryModel(
    countryName: 'palestine'.toUpperCase(),
    countryPhoneCode: '+970',
    flag: Flags.palestine,
    isoCode: 'PS',
  );

  final panama = CountryModel(
    countryName: 'panama'.toUpperCase(),
    countryPhoneCode: '+507',
    flag: Flags.panama,
    isoCode: 'PA',
  );

  final papuaNewGuinea = CountryModel(
    countryName: 'papua New Guinea'.toUpperCase(),
    countryPhoneCode: '+675',
    flag: Flags.papuaNewGuinea,
    isoCode: 'PG',
  );

  final paraguay = CountryModel(
    countryName: 'paraguay'.toUpperCase(),
    countryPhoneCode: '+595',
    flag: Flags.paraguay,
    isoCode: 'PY',
  );

  final peru = CountryModel(
    countryName: 'peru'.toUpperCase(),
    countryPhoneCode: '+51',
    flag: Flags.peru,
    isoCode: 'PE',
  );

  final philippines = CountryModel(
    countryName: 'philippines'.toUpperCase(),
    countryPhoneCode: '+63',
    flag: Flags.philippines,
    isoCode: 'PH',
  );

  final pitcairnIslands = CountryModel(
    countryName: 'pitcairn Islands'.toUpperCase(),
    countryPhoneCode: '+64',
    flag: Flags.pitcairnIslands,
    isoCode: 'PN',
  );

  final poland = CountryModel(
    countryName: 'poland'.toUpperCase(),
    countryPhoneCode: '+48',
    flag: Flags.poland,
    isoCode: 'PL',
  );

  final portugal = CountryModel(
    countryName: 'portugal'.toUpperCase(),
    countryPhoneCode: '+351',
    flag: Flags.portugal,
    isoCode: 'PT',
  );

  final puertoRico = CountryModel(
    countryName: 'puerto Rico'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.puertoRico,
    isoCode: 'PR',
  );

  final qatar = CountryModel(
    countryName: 'qatar'.toUpperCase(),
    countryPhoneCode: '+974',
    flag: Flags.qatar,
    isoCode: 'QA',
  );

  /// has no flag
  // final rapaNui = CountryModel(
  //   countryName: 'rapaNui'.toUpperCase(),
  //   countryPhoneCode: '+56',
  //   flag: Flags.rapaNui,
  // );

  final republicOfMacedonia = CountryModel(
    countryName: 'republic Of Macedonia'.toUpperCase(),
    countryPhoneCode: '+389',
    flag: Flags.republicOfMacedonia,
    isoCode: 'MK',
  );

  final republicOfTheCongo = CountryModel(
    countryName: 'republic Of The Congo'.toUpperCase(),
    countryPhoneCode: '+242',
    flag: Flags.republicOfTheCongo,
    isoCode: 'CG',
  );

  final romania = CountryModel(
    countryName: 'romania'.toUpperCase(),
    countryPhoneCode: '+40',
    flag: Flags.romania,
    isoCode: 'RO',
  );

  final russia = CountryModel(
    countryName: 'russia'.toUpperCase(),
    countryPhoneCode: '+7',
    flag: Flags.russia,
    isoCode: 'RU',
  );

  final rwanda = CountryModel(
    countryName: 'rwanda'.toUpperCase(),
    countryPhoneCode: '+250',
    flag: Flags.rwanda,
    isoCode: 'RW',
  );

  final sabaIsland = CountryModel(
    countryName: 'saba Island'.toUpperCase(),
    countryPhoneCode: '+599',
    flag: Flags.sabaIsland,
    isoCode: 'BQ',
  );

  final sahrawiArabDemocraticRepublic = CountryModel(
    countryName: 'sahrawi Arab Democratic Republic'.toUpperCase(),
    countryPhoneCode: '+212',
    flag: Flags.sahrawiArabDemocraticRepublic,
    isoCode: 'EH',
  );

  final saintKittsAndNevis = CountryModel(
    countryName: 'saint Kitts And Nevis'.toUpperCase(),
    countryPhoneCode: '+1869',
    flag: Flags.saintKittsAndNevis,
    isoCode: 'KN',
  );

  final samoa = CountryModel(
    countryName: 'samoa'.toUpperCase(),
    countryPhoneCode: '+685',
    flag: Flags.samoa,
    isoCode: 'WS',
  );

  final sanMarino = CountryModel(
    countryName: 'san Marino'.toUpperCase(),
    countryPhoneCode: '+378',
    flag: Flags.sanMarino,
    isoCode: 'SM',
  );

  final saoTomeAndPrincipe = CountryModel(
    countryName: 'sao Tome And Principe'.toUpperCase(),
    countryPhoneCode: '+239',
    flag: Flags.saoTomeAndPrincipe,
    isoCode: 'ST',
  );

  final sardinia = CountryModel(
    countryName: 'sardinia'.toUpperCase(),
    countryPhoneCode: '+39',
    flag: Flags.sardinia,
    isoCode: 'IT',
  );

  final saudiArabia = CountryModel(
    countryName: 'saudi Arabia'.toUpperCase(),
    countryPhoneCode: '+966',
    flag: Flags.saudiArabia,
    isoCode: 'SA',
  );

  final scotland = CountryModel(
    countryName: 'scotland'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.scotland,
    isoCode: 'GB',
  );

  final senegal = CountryModel(
    countryName: 'senegal'.toUpperCase(),
    countryPhoneCode: '+221',
    flag: Flags.senegal,
    isoCode: 'SN',
  );

  final serbia = CountryModel(
    countryName: 'serbia'.toUpperCase(),
    countryPhoneCode: '+381',
    flag: Flags.serbia,
    isoCode: 'RS',
  );

  final seychelles = CountryModel(
    countryName: 'seychelles'.toUpperCase(),
    countryPhoneCode: '+248',
    flag: Flags.seychelles,
    isoCode: 'SC',
  );

  final sicily = CountryModel(
    countryName: 'sicily'.toUpperCase(),
    countryPhoneCode: '+39',
    flag: Flags.sicily,
    isoCode: 'IT',
  );

  final sierraLeone = CountryModel(
    countryName: 'sierra Leone'.toUpperCase(),
    countryPhoneCode: '+232',
    flag: Flags.sierraLeone,
    isoCode: 'SL',
  );

  final singapore = CountryModel(
    countryName: 'singapore'.toUpperCase(),
    countryPhoneCode: '+65',
    flag: Flags.singapore,
    isoCode: 'SG',
  );

  final sintEustatius = CountryModel(
    countryName: 'saint Eustatius'.toUpperCase(),
    countryPhoneCode: '+599',
    flag: Flags.sintEustatius,
    isoCode: 'BQ',
  );

  final sintMaarten = CountryModel(
    countryName: 'saint Maarten'.toUpperCase(),
    countryPhoneCode: '+1721',
    flag: Flags.sintMaarten,
    isoCode: 'SX',
  );

  final slovakia = CountryModel(
    countryName: 'slovakia'.toUpperCase(),
    countryPhoneCode: '+421',
    flag: Flags.slovakia,
    isoCode: 'SK',
  );

  final slovenia = CountryModel(
    countryName: 'slovenia'.toUpperCase(),
    countryPhoneCode: '+386',
    flag: Flags.slovenia,
    isoCode: 'SI',
  );

  final solomonIslands = CountryModel(
    countryName: 'solomon Islands'.toUpperCase(),
    countryPhoneCode: '+677',
    flag: Flags.solomonIslands,
    isoCode: 'SB',
  );

  final somalia = CountryModel(
    countryName: 'somalia'.toUpperCase(),
    countryPhoneCode: '+252',
    flag: Flags.somalia,
    isoCode: 'SO',
  );

  final somaliland = CountryModel(
    countryName: 'somaliland'.toUpperCase(),
    countryPhoneCode: '+252',
    flag: Flags.somaliland,
    isoCode: 'SO',
  );

  final southAfrica = CountryModel(
    countryName: 'south Africa'.toUpperCase(),
    countryPhoneCode: '+27',
    flag: Flags.southAfrica,
    isoCode: 'ZA',
  );

  final southKorea = CountryModel(
    countryName: 'south Korea'.toUpperCase(),
    countryPhoneCode: '+82',
    flag: Flags.southKorea,
    isoCode: 'KR',
  );

  final southSudan = CountryModel(
    countryName: 'south Sudan'.toUpperCase(),
    countryPhoneCode: '+211',
    flag: Flags.southSudan,
    isoCode: 'SS',
  );

  final spain = CountryModel(
    countryName: 'spain'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.spain,
    isoCode: 'ES',
  );

  final sriLanka = CountryModel(
    countryName: 'sri Lanka'.toUpperCase(),
    countryPhoneCode: '+94',
    flag: Flags.sriLanka,
    isoCode: 'LK',
  );

  final stBarts = CountryModel(
    countryName: 'st. Barts'.toUpperCase(),
    countryPhoneCode: '+590',
    flag: Flags.stBarts,
    isoCode: 'BL',
  );

  final stVincentAndTheGrenadines = CountryModel(
    countryName: 'st. Vincent And The Grenadines'.toUpperCase(),
    countryPhoneCode: '+1784',
    flag: Flags.stVincentAndTheGrenadines,
    isoCode: 'VC',
  );

  final sudan = CountryModel(
    countryName: 'sudan'.toUpperCase(),
    countryPhoneCode: '+249',
    flag: Flags.sudan,
    isoCode: 'SD',
  );

  final suriname = CountryModel(
    countryName: 'suriname'.toUpperCase(),
    countryPhoneCode: '+597',
    flag: Flags.suriname,
    isoCode: 'SR',
  );

  final sweden = CountryModel(
    countryName: 'sweden'.toUpperCase(),
    countryPhoneCode: '+46',
    flag: Flags.sweden,
    isoCode: 'SE',
  );

  final switzerland = CountryModel(
    countryName: 'switzerland'.toUpperCase(),
    countryPhoneCode: '+41',
    flag: Flags.switzerland,
    isoCode: 'CH',
  );

  final syria = CountryModel(
    countryName: 'syria'.toUpperCase(),
    countryPhoneCode: '+963',
    flag: Flags.syria,
    isoCode: 'SY',
  );

  final taiwan = CountryModel(
    countryName: 'taiwan'.toUpperCase(),
    countryPhoneCode: '+886',
    flag: Flags.taiwan,
    isoCode: 'TW',
  );

  final tajikistan = CountryModel(
    countryName: 'tajikistan'.toUpperCase(),
    countryPhoneCode: '+992',
    flag: Flags.tajikistan,
    isoCode: 'TJ',
  );

  final tanzania = CountryModel(
    countryName: 'tanzania'.toUpperCase(),
    countryPhoneCode: '+255',
    flag: Flags.tanzania,
    isoCode: 'TZ',
  );

  final thailand = CountryModel(
    countryName: 'thailand'.toUpperCase(),
    countryPhoneCode: '+66',
    flag: Flags.thailand,
    isoCode: 'TH',
  );

  final tibet = CountryModel(
    countryName: 'tibet'.toUpperCase(),
    countryPhoneCode: '+86',
    flag: Flags.tibet,
    isoCode: 'CN',
  );

  final togo = CountryModel(
    countryName: 'togo'.toUpperCase(),
    countryPhoneCode: '+228',
    flag: Flags.togo,
    isoCode: 'TG',
  );

  final tokelau = CountryModel(
    countryName: 'tokelau'.toUpperCase(),
    countryPhoneCode: '+690',
    flag: Flags.tokelau,
    isoCode: 'TK',
  );

  final tonga = CountryModel(
    countryName: 'tonga'.toUpperCase(),
    countryPhoneCode: '+676',
    flag: Flags.tonga,
    isoCode: 'TON',
  );

  final transnistria = CountryModel(
    countryName: 'transnistria'.toUpperCase(),
    countryPhoneCode: '+373',
    flag: Flags.transnistria,
    isoCode: 'MD',
  );

  final trinidadAndTobago = CountryModel(
    countryName: 'trinidad And Tobago'.toUpperCase(),
    countryPhoneCode: '+1868',
    flag: Flags.trinidadAndTobago,
    isoCode: 'TT',
  );

  final tubalu = CountryModel(
    countryName: 'tubalu'.toUpperCase(),
    countryPhoneCode: '+688',
    flag: Flags.tubalu,
    isoCode: 'TV',
  );

  final tunisia = CountryModel(
    countryName: 'tunisia'.toUpperCase(),
    countryPhoneCode: '+216',
    flag: Flags.tunisia,
    isoCode: 'TN',
  );

  final turkey = CountryModel(
    countryName: 'turkey'.toUpperCase(),
    countryPhoneCode: '+90',
    flag: Flags.turkey,
    isoCode: 'TR',
  );

  final turkmenistan = CountryModel(
    countryName: 'turkmenistan'.toUpperCase(),
    countryPhoneCode: '+993',
    flag: Flags.turkmenistan,
    isoCode: 'TM',
  );

  final turksAndCaicos = CountryModel(
    countryName: 'turks And Caicos'.toUpperCase(),
    countryPhoneCode: '+1649',
    flag: Flags.turksAndCaicos,
    isoCode: 'TC',
  );

  final uganda = CountryModel(
    countryName: 'uganda'.toUpperCase(),
    countryPhoneCode: '+256',
    flag: Flags.uganda,
    isoCode: 'UG',
  );

  final ukraine = CountryModel(
    countryName: 'ukraine'.toUpperCase(),
    countryPhoneCode: '+380',
    flag: Flags.ukraine,
    isoCode: 'UA',
  );

  final unitedArabEmirates = CountryModel(
    countryName: 'united Arab Emirates'.toUpperCase(),
    countryPhoneCode: '+971',
    flag: Flags.unitedArabEmirates,
    isoCode: 'AE',
  );

  final unitedKingdom = CountryModel(
    countryName: 'united Kingdom'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.unitedKingdom,
    isoCode: 'GB',
  );

  final unitedStatesOfAmerica = CountryModel(
    countryName: 'united States Of America'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.unitedStatesOfAmerica,
    isoCode: 'US',
  );

  final uruguay = CountryModel(
    countryName: 'uruguay'.toUpperCase(),
    countryPhoneCode: '+598',
    flag: Flags.uruguay,
    isoCode: 'UY',
  );

  final uzbekistan = CountryModel(
    countryName: 'uzbekistan'.toUpperCase(),
    countryPhoneCode: '+998',
    flag: Flags.uzbekistan,
    isoCode: 'UZ',
  );

  final vanuatu = CountryModel(
    countryName: 'vanuatu'.toUpperCase(),
    countryPhoneCode: '+678',
    flag: Flags.vanuatu,
    isoCode: 'VU',
  );

  final vaticanCity = CountryModel(
    countryName: 'vatican City'.toUpperCase(),
    countryPhoneCode: '+39',
    flag: Flags.vaticanCity,
    isoCode: 'VA',
  );

  final venezuela = CountryModel(
    countryName: 'venezuela'.toUpperCase(),
    countryPhoneCode: '+58',
    flag: Flags.venezuela,
    isoCode: 'VE',
  );

  final vietnam = CountryModel(
    countryName: 'vietnam'.toUpperCase(),
    countryPhoneCode: '+84',
    flag: Flags.vietnam,
    isoCode: 'VN',
  );

  final virginIslands = CountryModel(
    countryName: 'virgin Islands'.toUpperCase(),
    countryPhoneCode: '+1284',
    flag: Flags.virginIslands,
    isoCode: 'VG',
  );

  final wales = CountryModel(
    countryName: 'wales'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.wales,
    isoCode: 'GB',
  );

  final yemen = CountryModel(
    countryName: 'yemen'.toUpperCase(),
    countryPhoneCode: '+967',
    flag: Flags.yemen,
    isoCode: 'YE',
  );

  final zambia = CountryModel(
    countryName: 'zambia'.toUpperCase(),
    countryPhoneCode: '+260',
    flag: Flags.zambia,
    isoCode: 'ZM',
  );

  final zimbabwe = CountryModel(
    countryName: 'zimbabwe'.toUpperCase(),
    countryPhoneCode: '+263',
    flag: Flags.zimbabwe,
    isoCode: 'ZW',
  );

  final alandIslands = CountryModel(
    flag: Flags.alandIslands,
    countryPhoneCode: '+358',
    countryName: 'alandIslands'.toUpperCase(),
    isoCode: 'FI',
  );

  final aruba = CountryModel(
    flag: Flags.aruba,
    countryPhoneCode: '+297',
    countryName: 'aruba'.toUpperCase(),
    isoCode: 'AW',
  );

  final britishIndianOceanTerritory = CountryModel(
    flag: Flags.britishIndianOceanTerritory,
    countryPhoneCode: '+246',
    countryName: 'britishIndianOceanTerritory'.toUpperCase(),
    isoCode: 'IO',
  );

  final cookIslands = CountryModel(
    flag: Flags.cookIslands,
    countryPhoneCode: '+682',
    countryName: 'cookIslands'.toUpperCase(),
    isoCode: 'CK',
  );

  List<CountryModel> get countries => [
        abkhazia,
        afghanistan,
        alandIslands,
        albania,
        algeria,
        americanSamoa,
        andorra,
        angola,
        anguilla,
        antiguaAndBarbuda,
        argentina,
        armenia,
        aruba,
        australia,
        austria,
        azerbaijan,
        azoresIslands,
        bahamas,
        bahrain,
        balearicIslands,
        bangladesh,
        barbados,
        basqueCountry,
        belarus,
        belgium,
        belize,
        benin,
        bermuda,
        bhutan,
        bolivia,
        bonaire,
        bosniaAndHerzegovina,
        botswana,
        brazil,
        britishColumbia,
        britishIndianOceanTerritory,
        britishVirginIslands,
        brunei,
        bulgaria,
        burkinaFaso,
        burundi,
        cambodia,
        cameroon,
        canada,
        canaryIslands,
        capeVerde,
        caymanIslands,
        centralAfricanRepublic,
        ceuta,
        chad,
        chile,
        china,
        christmasIsland,
        cocosIsland,
        colombia,
        comoros,
        cookIslands,
        corsica,
        costaRica,
        croatia,
        cuba,
        curacao,
        cyprus,
        czechRepublic,
        democraticRepublicOfCongo,
        denmark,
        djibouti,
        dominica,
        dominicanRepublic,
        eastTimor,
        ecuador,
        egypt,
        elSalvador,
        england,
        equatorialGuinea,
        eritrea,
        estonia,
        ethiopia,
        falklandIslands,
        faroeIslands,
        fiji,
        finland,
        france,
        frenchPolynesia,
        gabon,
        galapagosIslands,
        gambia,
        georgia,
        germany,
        ghana,
        gibraltar,
        greece,
        greenland,
        grenada,
        guam,
        guatemala,
        guernsey,
        guineaBissau,
        guinea,
        haiti,
        hawaii,
        honduras,
        hongKong,
        hungary,
        iceland,
        india,
        indonesia,
        iran,
        iraq,
        ireland,
        isleOfMan,
        israel,
        italy,
        ivoryCoast,
        jamaica,
        japan,
        jersey,
        jordan,
        kazakhstan,
        kenya,
        kosovo,
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
        macao,
        madagascar,
        madeira,
        malawi,
        malaysia,
        maldives,
        mali,
        malta,
        marshallIsland,
        martinique,
        mauritania,
        mauritius,
        melilla,
        mexico,
        micronesia,
        moldova,
        monaco,
        mongolia,
        montenegro,
        montserrat,
        morocco,
        mozambique,
        myanmar,
        namibia,
        nauru,
        nepal,
        netherlands,
        newZealand,
        nicaragua,
        niger,
        nigeria,
        niue,
        norfolkIsland,
        northKorea,
        northenCyprus,
        northernMarianasIslands,
        norway,
        oman,
        orkneyIslands,
        ossetia,
        otan,
        pakistan,
        palau,
        palestine,
        panama,
        papuaNewGuinea,
        paraguay,
        peru,
        philippines,
        pitcairnIslands,
        poland,
        portugal,
        puertoRico,
        qatar,
        republicOfMacedonia,
        republicOfTheCongo,
        romania,
        russia,
        rwanda,
        sabaIsland,
        sahrawiArabDemocraticRepublic,
        saintKittsAndNevis,
        samoa,
        sanMarino,
        saoTomeAndPrincipe,
        sardinia,
        saudiArabia,
        scotland,
        senegal,
        serbia,
        seychelles,
        sicily,
        sierraLeone,
        singapore,
        sintEustatius,
        sintMaarten,
        slovakia,
        slovenia,
        solomonIslands,
        somalia,
        somaliland,
        southAfrica,
        southKorea,
        southSudan,
        spain,
        sriLanka,
        stBarts,
        stVincentAndTheGrenadines,
        sudan,
        suriname,
        sweden,
        switzerland,
        syria,
        taiwan,
        tajikistan,
        tanzania,
        thailand,
        tibet,
        togo,
        tokelau,
        tonga,
        transnistria,
        trinidadAndTobago,
        tubalu,
        tunisia,
        turkey,
        turkmenistan,
        turksAndCaicos,
        uganda,
        ukraine,
        unitedArabEmirates,
        unitedKingdom,
        unitedStatesOfAmerica,
        uruguay,
        uzbekistan,
        vanuatu,
        vaticanCity,
        venezuela,
        vietnam,
        virginIslands,
        wales,
        yemen,
        zambia,
        zimbabwe,
      ];

  CountriesFoundation._();
}

class CountryModel extends UiKitSearchableListBodyItem {
  final String flag;
  final String countryPhoneCode;
  final String countryName;
  final String isoCode;

  bool get isEmpty => flag.isEmpty && countryName.isEmpty && countryName.isEmpty && isoCode.isEmpty;

  CountryModel({
    required this.flag,
    required this.countryPhoneCode,
    required this.countryName,
    required this.isoCode,
  }) : super(
          title: countryName,
          trailingText: countryPhoneCode,
          leadingPath: flag,
        );

  factory CountryModel.empty() => CountryModel(
        flag: '',
        countryPhoneCode: '',
        countryName: '',
        isoCode: '',
      );
}
