import 'package:countries_flag/countries_flag.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class CountriesFoundation {
  static final _filter = {'_': RegExp(r'[0-9]')};

  static CountriesFoundation instance = CountriesFoundation._();

  final abkhazia = CountryModel(
    countryName: 'abkhazia'.toUpperCase(),
    countryPhoneCode: '+7',
    flag: Flags.abkhazia,
  );

  final afghanistan = CountryModel(
    countryName: 'afghanistan'.toUpperCase(),
    countryPhoneCode: '+93',
    flag: Flags.afghanistan,
  );

  final albania = CountryModel(
    countryName: 'albania'.toUpperCase(),
    countryPhoneCode: '+355',
    flag: Flags.albania,
  );

  final algeria = CountryModel(
    countryName: 'algeria'.toUpperCase(),
    countryPhoneCode: '+213',
    flag: Flags.algeria,
  );

  final americanSamoa = CountryModel(
    countryName: 'american Samoa'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.americanSamoa,
  );

  final andorra = CountryModel(
    countryName: 'andorra'.toUpperCase(),
    countryPhoneCode: '+376',
    flag: Flags.andorra,
  );

  final angola = CountryModel(
    countryName: 'angola'.toUpperCase(),
    countryPhoneCode: '+244',
    flag: Flags.angola,
  );

  final anguilla = CountryModel(
    countryName: 'anguilla'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.anguilla,
  );

  final antiguaAndBarbuda = CountryModel(
    countryName: 'antigua And Barbuda'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.antiguaAndBarbuda,
  );

  final argentina = CountryModel(
    countryName: 'argentina'.toUpperCase(),
    countryPhoneCode: '+54',
    flag: Flags.argentina,
  );

  final armenia = CountryModel(
    countryName: 'armenia'.toUpperCase(),
    countryPhoneCode: '+374',
    flag: Flags.armenia,
  );

  final australia = CountryModel(
    countryName: 'australia'.toUpperCase(),
    countryPhoneCode: '+61',
    flag: Flags.australia,
  );

  final austria = CountryModel(
    countryName: 'austria'.toUpperCase(),
    countryPhoneCode: '+43',
    flag: Flags.austria,
  );

  final azerbaijan = CountryModel(
    countryName: 'azerbaijan'.toUpperCase(),
    countryPhoneCode: '+994',
    flag: Flags.azerbaijan,
  );

  final azoresIslands = CountryModel(
    countryName: 'azores Islands'.toUpperCase(),
    countryPhoneCode: '+351',
    flag: Flags.azoresIslands,
  );

  final bahamas = CountryModel(
    countryName: 'bahamas'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.bahamas,
  );

  final bahrain = CountryModel(
    countryName: 'bahrain'.toUpperCase(),
    countryPhoneCode: '+973',
    flag: Flags.bahrain,
  );

  final balearicIslands = CountryModel(
    countryName: 'balearic Islands'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.balearicIslands,
  );

  final bangladesh = CountryModel(
    countryName: 'bangladesh'.toUpperCase(),
    countryPhoneCode: '+880',
    flag: Flags.bangladesh,
  );

  final barbados = CountryModel(
    countryName: 'barbados'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.barbados,
  );

  final basqueCountry = CountryModel(
    countryName: 'basque Country'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.basqueCountry,
  );

  final belarus = CountryModel(
    countryName: 'belarus'.toUpperCase(),
    countryPhoneCode: '+375',
    flag: Flags.belarus,
  );

  final belgium = CountryModel(
    countryName: 'belgium'.toUpperCase(),
    countryPhoneCode: '+32',
    flag: Flags.belgium,
  );

  final belize = CountryModel(
    countryName: 'belize'.toUpperCase(),
    countryPhoneCode: '+501',
    flag: Flags.belize,
  );

  final benin = CountryModel(
    countryName: 'benin'.toUpperCase(),
    countryPhoneCode: '+229',
    flag: Flags.benin,
  );

  final bermuda = CountryModel(
    countryName: 'bermuda'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.bermuda,
  );

  final bhutan = CountryModel(
    countryName: 'bhutan'.toUpperCase(),
    countryPhoneCode: '+975',
    flag: Flags.bhutan,
  );

  final bolivia = CountryModel(
    countryName: 'bolivia'.toUpperCase(),
    countryPhoneCode: '+591',
    flag: Flags.bolivia,
  );

  final bonaire = CountryModel(
    countryName: 'bonaire'.toUpperCase(),
    countryPhoneCode: '+599',
    flag: Flags.bonaire,
  );

  final bosniaAndHerzegovina = CountryModel(
    countryName: 'bosnia And Herzegovina'.toUpperCase(),
    countryPhoneCode: '+387',
    flag: Flags.bosniaAndHerzegovina,
  );

  final botswana = CountryModel(
    countryName: 'botswana'.toUpperCase(),
    countryPhoneCode: '+267',
    flag: Flags.botswana,
  );

  final brazil = CountryModel(
    countryName: 'brazil'.toUpperCase(),
    countryPhoneCode: '+55',
    flag: Flags.brazil,
  );

  final britishColumbia = CountryModel(
    countryName: 'british Columbia'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.britishColumbia,
  );

  final britishVirginIslands = CountryModel(
    countryName: 'british Virgin Islands'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.britishVirginIslands,
  );

  final brunei = CountryModel(
    countryName: 'brunei'.toUpperCase(),
    countryPhoneCode: '+673',
    flag: Flags.brunei,
  );

  final bulgaria = CountryModel(
    countryName: 'bulgaria'.toUpperCase(),
    countryPhoneCode: '+359',
    flag: Flags.bulgaria,
  );

  final burkinaFaso = CountryModel(
    countryName: 'burkina-Faso'.toUpperCase(),
    countryPhoneCode: '+226',
    flag: Flags.burkinaFaso,
  );

  final burundi = CountryModel(
    countryName: 'burundi'.toUpperCase(),
    countryPhoneCode: '+257',
    flag: Flags.burundi,
  );

  final cambodia = CountryModel(
    countryName: 'cambodia'.toUpperCase(),
    countryPhoneCode: '+855',
    flag: Flags.cambodia,
  );

  final cameroon = CountryModel(
    countryName: 'cameroon'.toUpperCase(),
    countryPhoneCode: '+237',
    flag: Flags.cameroon,
  );

  final canada = CountryModel(
    countryName: 'canada'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.canada,
  );

  final canaryIslands = CountryModel(
    countryName: 'canary Islands'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.canaryIslands,
  );

  final capeVerde = CountryModel(
    countryName: 'cape Verde'.toUpperCase(),
    countryPhoneCode: '+238',
    flag: Flags.capeVerde,
  );

  final caymanIslands = CountryModel(
    countryName: 'cayman Islands'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.caymanIslands,
  );

  final centralAfricanRepublic = CountryModel(
    countryName: 'central African Republic'.toUpperCase(),
    countryPhoneCode: '+236',
    flag: Flags.centralAfricanRepublic,
  );

  final ceuta = CountryModel(
    countryName: 'ceuta'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.ceuta,
  );

  final chad = CountryModel(
    countryName: 'chad'.toUpperCase(),
    countryPhoneCode: '+235',
    flag: Flags.chad,
  );

  final chile = CountryModel(
    countryName: 'chile'.toUpperCase(),
    countryPhoneCode: '+56',
    flag: Flags.chile,
  );

  final china = CountryModel(
    countryName: 'china'.toUpperCase(),
    countryPhoneCode: '+86',
    flag: Flags.china,
  );

  final christmasIsland = CountryModel(
    countryName: 'christmas Island'.toUpperCase(),
    countryPhoneCode: '+61',
    flag: Flags.christmasIsland,
  );

  final cocosIsland = CountryModel(
    countryName: 'cocos Island'.toUpperCase(),
    countryPhoneCode: '+61',
    flag: Flags.cocosIsland,
  );

  final colombia = CountryModel(
    countryName: 'colombia'.toUpperCase(),
    countryPhoneCode: '+57',
    flag: Flags.colombia,
  );

  final comoros = CountryModel(
    countryName: 'comoros'.toUpperCase(),
    countryPhoneCode: '+269',
    flag: Flags.comoros,
  );

  final corsica = CountryModel(
    countryName: 'corsica'.toUpperCase(),
    countryPhoneCode: '+33',
    flag: Flags.corsica,
  );

  final costaRica = CountryModel(
    countryName: 'costa-Rica'.toUpperCase(),
    countryPhoneCode: '+506',
    flag: Flags.costaRica,
  );

  final croatia = CountryModel(
    countryName: 'croatia'.toUpperCase(),
    countryPhoneCode: '+385',
    flag: Flags.croatia,
  );

  final cuba = CountryModel(
    countryName: 'cuba'.toUpperCase(),
    countryPhoneCode: '+53',
    flag: Flags.cuba,
  );

  final curacao = CountryModel(
    countryName: 'curacao'.toUpperCase(),
    countryPhoneCode: '+599',
    flag: Flags.curacao,
  );

  final cyprus = CountryModel(
    countryName: 'cyprus'.toUpperCase(),
    countryPhoneCode: '+357',
    flag: Flags.cyprus,
  );

  final czechRepublic = CountryModel(
    countryName: 'czech Republic'.toUpperCase(),
    countryPhoneCode: '+420',
    flag: Flags.czechRepublic,
  );

  final democraticRepublicOfCongo = CountryModel(
    countryName: 'democratic Republic Of Congo'.toUpperCase(),
    countryPhoneCode: '+243',
    flag: Flags.democraticRepublicOfCongo,
  );

  final denmark = CountryModel(
    countryName: 'denmark'.toUpperCase(),
    countryPhoneCode: '+45',
    flag: Flags.denmark,
  );

  final djibouti = CountryModel(
    countryName: 'djibouti'.toUpperCase(),
    countryPhoneCode: '+253',
    flag: Flags.djibouti,
  );

  final dominica = CountryModel(
    countryName: 'dominica'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.dominica,
  );

  final dominicanRepublic = CountryModel(
    countryName: 'dominican Republic'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.dominicanRepublic,
  );

  final eastTimor = CountryModel(
    countryName: 'east Timor'.toUpperCase(),
    countryPhoneCode: '+670',
    flag: Flags.eastTimor,
  );

  final ecuador = CountryModel(
    countryName: 'ecuador'.toUpperCase(),
    countryPhoneCode: '+593',
    flag: Flags.ecuador,
  );

  final egypt = CountryModel(
    countryName: 'egypt'.toUpperCase(),
    countryPhoneCode: '+20',
    flag: Flags.egypt,
  );

  final elSalvador = CountryModel(
    countryName: 'elSalvador'.toUpperCase(),
    countryPhoneCode: '+503',
    flag: Flags.elSalvador,
  );

  final england = CountryModel(
    countryName: 'england'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.england,
  );

  final equatorialGuinea = CountryModel(
    countryName: 'equatorial Guinea'.toUpperCase(),
    countryPhoneCode: '+240',
    flag: Flags.equatorialGuinea,
  );

  final eritrea = CountryModel(
    countryName: 'eritrea'.toUpperCase(),
    countryPhoneCode: '+291',
    flag: Flags.eritrea,
  );

  final estonia = CountryModel(
    countryName: 'estonia'.toUpperCase(),
    countryPhoneCode: '+372',
    flag: Flags.estonia,
  );

  final ethiopia = CountryModel(
    countryName: 'ethiopia'.toUpperCase(),
    countryPhoneCode: '+251',
    flag: Flags.ethiopia,
  );

  final falklandIslands = CountryModel(
    countryName: 'falkland Islands'.toUpperCase(),
    countryPhoneCode: '+500',
    flag: Flags.falklandIslands,
  );

  final faroeIslands = CountryModel(
    countryName: 'faroe Islands'.toUpperCase(),
    countryPhoneCode: '+45',
    flag: Flags.faroeIslands,
  );

  final fiji = CountryModel(
    countryName: 'fiji'.toUpperCase(),
    countryPhoneCode: '+679',
    flag: Flags.fiji,
  );

  final finland = CountryModel(
    countryName: 'finland'.toUpperCase(),
    countryPhoneCode: '+358',
    flag: Flags.finland,
  );

  final france = CountryModel(
    countryName: 'france'.toUpperCase(),
    countryPhoneCode: '+33',
    flag: Flags.france,
  );

  final frenchPolynesia = CountryModel(
    countryName: 'french Polynesia'.toUpperCase(),
    countryPhoneCode: '+689',
    flag: Flags.frenchPolynesia,
  );

  final gabon = CountryModel(
    countryName: 'gabon'.toUpperCase(),
    countryPhoneCode: '+241',
    flag: Flags.gabon,
  );

  final galapagosIslands = CountryModel(
    countryName: 'galapagos Islands'.toUpperCase(),
    countryPhoneCode: '+593',
    flag: Flags.galapagosIslands,
  );

  final gambia = CountryModel(
    countryName: 'gambia'.toUpperCase(),
    countryPhoneCode: '+220',
    flag: Flags.gambia,
  );

  final georgia = CountryModel(
    countryName: 'georgia'.toUpperCase(),
    countryPhoneCode: '+995',
    flag: Flags.georgia,
  );

  final germany = CountryModel(
    countryName: 'germany'.toUpperCase(),
    countryPhoneCode: '+49',
    flag: Flags.germany,
  );

  final ghana = CountryModel(
    countryName: 'ghana'.toUpperCase(),
    countryPhoneCode: '+233',
    flag: Flags.ghana,
  );

  final gibraltar = CountryModel(
    countryName: 'gibraltar'.toUpperCase(),
    countryPhoneCode: '+350',
    flag: Flags.gibraltar,
  );

  final greece = CountryModel(
    countryName: 'greece'.toUpperCase(),
    countryPhoneCode: '+30',
    flag: Flags.greece,
  );

  final greenland = CountryModel(
    countryName: 'greenland'.toUpperCase(),
    countryPhoneCode: '+299',
    flag: Flags.greenland,
  );

  final grenada = CountryModel(
    countryName: 'grenada'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.grenada,
  );

  final guam = CountryModel(
    countryName: 'guam'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.guam,
  );

  final guatemala = CountryModel(
    countryName: 'guatemala'.toUpperCase(),
    countryPhoneCode: '+502',
    flag: Flags.guatemala,
  );

  final guernsey = CountryModel(
    countryName: 'guernsey'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.guernsey,
  );

  final guineaBissau = CountryModel(
    countryName: 'guinea Bissau'.toUpperCase(),
    countryPhoneCode: '+245',
    flag: Flags.guineaBissau,
  );

  final guinea = CountryModel(
    countryName: 'guinea'.toUpperCase(),
    countryPhoneCode: '+224',
    flag: Flags.guinea,
  );

  final haiti = CountryModel(
    countryName: 'haiti'.toUpperCase(),
    countryPhoneCode: '+509',
    flag: Flags.haiti,
  );

  final hawaii = CountryModel(
    countryName: 'hawaii'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.hawaii,
  );

  final honduras = CountryModel(
    countryName: 'honduras'.toUpperCase(),
    countryPhoneCode: '+504',
    flag: Flags.honduras,
  );

  final hongKong = CountryModel(
    countryName: 'hong-Kong'.toUpperCase(),
    countryPhoneCode: '+852',
    flag: Flags.hongKong,
  );

  final hungary = CountryModel(
    countryName: 'hungary'.toUpperCase(),
    countryPhoneCode: '+36',
    flag: Flags.hungary,
  );

  final iceland = CountryModel(
    countryName: 'iceland'.toUpperCase(),
    countryPhoneCode: '+354',
    flag: Flags.iceland,
  );

  final india = CountryModel(
    countryName: 'india'.toUpperCase(),
    countryPhoneCode: '+91',
    flag: Flags.india,
  );

  final indonesia = CountryModel(
    countryName: 'indonesia'.toUpperCase(),
    countryPhoneCode: '+62',
    flag: Flags.indonesia,
  );

  final iran = CountryModel(
    countryName: 'iran'.toUpperCase(),
    countryPhoneCode: '+98',
    flag: Flags.iran,
  );

  final iraq = CountryModel(
    countryName: 'iraq'.toUpperCase(),
    countryPhoneCode: '+964',
    flag: Flags.iraq,
  );

  final ireland = CountryModel(
    countryName: 'ireland'.toUpperCase(),
    countryPhoneCode: '+353',
    flag: Flags.ireland,
  );

  final isleOfMan = CountryModel(
    countryName: 'isle Of Man'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.isleOfMan,
  );

  final israel = CountryModel(
    countryName: 'israel'.toUpperCase(),
    countryPhoneCode: '+972',
    flag: Flags.israel,
  );

  final italy = CountryModel(
    countryName: 'italy'.toUpperCase(),
    countryPhoneCode: '+39',
    flag: Flags.italy,
  );

  final ivoryCoast = CountryModel(
    countryName: 'ivory Coast'.toUpperCase(),
    countryPhoneCode: '+225',
    flag: Flags.ivoryCoast,
  );

  final jamaica = CountryModel(
    countryName: 'jamaica'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.jamaica,
  );

  final japan = CountryModel(
    countryName: 'japan'.toUpperCase(),
    countryPhoneCode: '+81',
    flag: Flags.japan,
  );

  final jersey = CountryModel(
    countryName: 'jersey'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.jersey,
  );

  final jordan = CountryModel(
    countryName: 'jordan'.toUpperCase(),
    countryPhoneCode: '+962',
    flag: Flags.jordan,
  );

  final kazakhstan = CountryModel(
    countryName: 'kazakhstan'.toUpperCase(),
    countryPhoneCode: '+7',
    flag: Flags.kazakhstan,
  );

  final kenya = CountryModel(
    countryName: 'kenya'.toUpperCase(),
    countryPhoneCode: '+254',
    flag: Flags.kenya,
  );

  final kosovo = CountryModel(
    countryName: 'kosovo'.toUpperCase(),
    countryPhoneCode: '+383',
    flag: Flags.kosovo,
  );

  final kuwait = CountryModel(
    countryName: 'kuwait'.toUpperCase(),
    countryPhoneCode: '+965',
    flag: Flags.kuwait,
  );

  final kyrgyzstan = CountryModel(
    countryName: 'kyrgyzstan'.toUpperCase(),
    countryPhoneCode: '+996',
    flag: Flags.kyrgyzstan,
  );

  final laos = CountryModel(
    countryName: 'laos'.toUpperCase(),
    countryPhoneCode: '+856',
    flag: Flags.laos,
  );

  final latvia = CountryModel(
    countryName: 'latvia'.toUpperCase(),
    countryPhoneCode: '+371',
    flag: Flags.latvia,
  );

  final lebanon = CountryModel(
    countryName: 'lebanon'.toUpperCase(),
    countryPhoneCode: '+961',
    flag: Flags.lebanon,
  );

  final lesotho = CountryModel(
    countryName: 'lesotho'.toUpperCase(),
    countryPhoneCode: '+266',
    flag: Flags.lesotho,
  );

  final liberia = CountryModel(
    countryName: 'liberia'.toUpperCase(),
    countryPhoneCode: '+231',
    flag: Flags.liberia,
  );

  final libya = CountryModel(
    countryName: 'libya'.toUpperCase(),
    countryPhoneCode: '+218',
    flag: Flags.libya,
  );

  final liechtenstein = CountryModel(
    countryName: 'liechtenstein'.toUpperCase(),
    countryPhoneCode: '+423',
    flag: Flags.liechtenstein,
  );

  final lithuania = CountryModel(
    countryName: 'lithuania'.toUpperCase(),
    countryPhoneCode: '+370',
    flag: Flags.lithuania,
  );

  final luxembourg = CountryModel(
    countryName: 'luxembourg'.toUpperCase(),
    countryPhoneCode: '+352',
    flag: Flags.luxembourg,
  );

  final macao = CountryModel(
    countryName: 'macao'.toUpperCase(),
    countryPhoneCode: '+853',
    flag: Flags.macao,
  );

  final madagascar = CountryModel(
    countryName: 'madagascar'.toUpperCase(),
    countryPhoneCode: '+261',
    flag: Flags.madagascar,
  );

  final madeira = CountryModel(
    countryName: 'madeira'.toUpperCase(),
    countryPhoneCode: '+351',
    flag: Flags.madeira,
  );

  final malawi = CountryModel(
    countryName: 'malawi'.toUpperCase(),
    countryPhoneCode: '+265',
    flag: Flags.malawi,
  );

  final malaysia = CountryModel(
    countryName: 'malaysia'.toUpperCase(),
    countryPhoneCode: '+60',
    flag: Flags.malaysia,
  );

  final maldives = CountryModel(
    countryName: 'maldives'.toUpperCase(),
    countryPhoneCode: '+960',
    flag: Flags.maldives,
  );

  final mali = CountryModel(
    countryName: 'mali'.toUpperCase(),
    countryPhoneCode: '+223',
    flag: Flags.mali,
  );

  final malta = CountryModel(
    countryName: 'malta'.toUpperCase(),
    countryPhoneCode: '+356',
    flag: Flags.malta,
  );

  final marshallIsland = CountryModel(
    countryName: 'marshall Island'.toUpperCase(),
    countryPhoneCode: '+692',
    flag: Flags.marshallIsland,
  );

  final martinique = CountryModel(
    countryName: 'martinique'.toUpperCase(),
    countryPhoneCode: '+596',
    flag: Flags.martinique,
  );

  final mauritania = CountryModel(
    countryName: 'mauritania'.toUpperCase(),
    countryPhoneCode: '+222',
    flag: Flags.mauritania,
  );

  final mauritius = CountryModel(
    countryName: 'mauritius'.toUpperCase(),
    countryPhoneCode: '+230',
    flag: Flags.mauritius,
  );

  final melilla = CountryModel(
    countryName: 'melilla'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.melilla,
  );

  final mexico = CountryModel(
    countryName: 'mexico'.toUpperCase(),
    countryPhoneCode: '+52',
    flag: Flags.mexico,
  );

  final micronesia = CountryModel(
    countryName: 'micronesia'.toUpperCase(),
    countryPhoneCode: '+691',
    flag: Flags.micronesia,
  );

  final moldova = CountryModel(
    countryName: 'moldova'.toUpperCase(),
    countryPhoneCode: '+373',
    flag: Flags.moldova,
  );

  final monaco = CountryModel(
    countryName: 'monaco'.toUpperCase(),
    countryPhoneCode: '+377',
    flag: Flags.monaco,
  );

  final mongolia = CountryModel(
    countryName: 'mongolia'.toUpperCase(),
    countryPhoneCode: '+976',
    flag: Flags.mongolia,
  );

  final montenegro = CountryModel(
    countryName: 'montenegro'.toUpperCase(),
    countryPhoneCode: '+382',
    flag: Flags.montenegro,
  );

  final montserrat = CountryModel(
    countryName: 'montserrat'.toUpperCase(),
    countryPhoneCode: '+1664',
    flag: Flags.montserrat,
  );

  final morocco = CountryModel(
    countryName: 'morocco'.toUpperCase(),
    countryPhoneCode: '+212',
    flag: Flags.morocco,
  );

  final mozambique = CountryModel(
    countryName: 'mozambique'.toUpperCase(),
    countryPhoneCode: '+258',
    flag: Flags.mozambique,
  );

  final myanmar = CountryModel(
    countryName: 'myanmar'.toUpperCase(),
    countryPhoneCode: '+95',
    flag: Flags.myanmar,
  );

  final namibia = CountryModel(
    countryName: 'namibia'.toUpperCase(),
    countryPhoneCode: '+264',
    flag: Flags.namibia,
  );

  final nauru = CountryModel(
    countryName: 'nauru'.toUpperCase(),
    countryPhoneCode: '+674',
    flag: Flags.nauru,
  );

  final nepal = CountryModel(
    countryName: 'nepal'.toUpperCase(),
    countryPhoneCode: '+977',
    flag: Flags.nepal,
  );

  final netherlands = CountryModel(
    countryName: 'netherlands'.toUpperCase(),
    countryPhoneCode: '+31',
    flag: Flags.netherlands,
  );

  final newZealand = CountryModel(
    countryName: 'new Zealand'.toUpperCase(),
    countryPhoneCode: '+64',
    flag: Flags.newZealand,
  );

  final nicaragua = CountryModel(
    countryName: 'nicaragua'.toUpperCase(),
    countryPhoneCode: '+505',
    flag: Flags.nicaragua,
  );

  final niger = CountryModel(
    countryName: 'niger'.toUpperCase(),
    countryPhoneCode: '+227',
    flag: Flags.niger,
  );

  final nigeria = CountryModel(
    countryName: 'nigeria'.toUpperCase(),
    countryPhoneCode: '+234',
    flag: Flags.nigeria,
  );

  final niue = CountryModel(
    countryName: 'niue'.toUpperCase(),
    countryPhoneCode: '+683',
    flag: Flags.niue,
  );

  final norfolkIsland = CountryModel(
    countryName: 'norfolk Island'.toUpperCase(),
    countryPhoneCode: '+672',
    flag: Flags.norfolkIsland,
  );

  final northKorea = CountryModel(
    countryName: 'north Korea'.toUpperCase(),
    countryPhoneCode: '+850',
    flag: Flags.northKorea,
  );

  final northenCyprus = CountryModel(
    countryName: 'northen Cyprus'.toUpperCase(),
    countryPhoneCode: '+90',
    flag: Flags.northenCyprus,
  );

  final northernMarianasIslands = CountryModel(
    countryName: 'northern Marianas Islands'.toUpperCase(),
    countryPhoneCode: '+1670',
    flag: Flags.northernMarianasIslands,
  );

  final norway = CountryModel(
    countryName: 'norway'.toUpperCase(),
    countryPhoneCode: '+47',
    flag: Flags.norway,
  );

  final oman = CountryModel(
    countryName: 'oman'.toUpperCase(),
    countryPhoneCode: '+968',
    flag: Flags.oman,
  );

  final orkneyIslands = CountryModel(
    countryName: 'orkney Islands'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.orkneyIslands,
  );

  final ossetia = CountryModel(
    countryName: 'ossetia'.toUpperCase(),
    countryPhoneCode: '+7',
    flag: Flags.ossetia,
  );

  final otan = CountryModel(
    countryName: 'otan'.toUpperCase(),
    countryPhoneCode: '+7',
    flag: Flags.otan,
  );

  final pakistan = CountryModel(
    countryName: 'pakistan'.toUpperCase(),
    countryPhoneCode: '+92',
    flag: Flags.pakistan,
  );

  final palau = CountryModel(
    countryName: 'palau'.toUpperCase(),
    countryPhoneCode: '+680',
    flag: Flags.palau,
  );

  final palestine = CountryModel(
    countryName: 'palestine'.toUpperCase(),
    countryPhoneCode: '+970',
    flag: Flags.palestine,
  );

  final panama = CountryModel(
    countryName: 'panama'.toUpperCase(),
    countryPhoneCode: '+507',
    flag: Flags.panama,
  );

  final papuaNewGuinea = CountryModel(
    countryName: 'papua New Guinea'.toUpperCase(),
    countryPhoneCode: '+675',
    flag: Flags.papuaNewGuinea,
  );

  final paraguay = CountryModel(
    countryName: 'paraguay'.toUpperCase(),
    countryPhoneCode: '+595',
    flag: Flags.paraguay,
  );

  final peru = CountryModel(
    countryName: 'peru'.toUpperCase(),
    countryPhoneCode: '+51',
    flag: Flags.peru,
  );

  final philippines = CountryModel(
    countryName: 'philippines'.toUpperCase(),
    countryPhoneCode: '+63',
    flag: Flags.philippines,
  );

  final pitcairnIslands = CountryModel(
    countryName: 'pitcairn Islands'.toUpperCase(),
    countryPhoneCode: '+64',
    flag: Flags.pitcairnIslands,
  );

  final poland = CountryModel(
    countryName: 'poland'.toUpperCase(),
    countryPhoneCode: '+48',
    flag: Flags.poland,
  );

  final portugal = CountryModel(
    countryName: 'portugal'.toUpperCase(),
    countryPhoneCode: '+351',
    flag: Flags.portugal,
  );

  final puertoRico = CountryModel(
    countryName: 'puerto-Rico'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.puertoRico,
  );

  final qatar = CountryModel(
    countryName: 'qatar'.toUpperCase(),
    countryPhoneCode: '+974',
    flag: Flags.qatar,
  );

  final rapaNui = CountryModel(
    countryName: 'rapaNui'.toUpperCase(),
    countryPhoneCode: '+56',
    flag: Flags.rapaNui,
  );

  final republicOfMacedonia = CountryModel(
    countryName: 'republic Of Macedonia'.toUpperCase(),
    countryPhoneCode: '+389',
    flag: Flags.republicOfMacedonia,
  );

  final republicOfTheCongo = CountryModel(
    countryName: 'republic Of The Congo'.toUpperCase(),
    countryPhoneCode: '+242',
    flag: Flags.republicOfTheCongo,
  );

  final romania = CountryModel(
    countryName: 'romania'.toUpperCase(),
    countryPhoneCode: '+40',
    flag: Flags.romania,
  );

  final russia = CountryModel(
    countryName: 'russia'.toUpperCase(),
    countryPhoneCode: '+7',
    flag: Flags.russia,
  );

  final rwanda = CountryModel(
    countryName: 'rwanda'.toUpperCase(),
    countryPhoneCode: '+250',
    flag: Flags.rwanda,
  );

  final sabaIsland = CountryModel(
    countryName: 'saba Island'.toUpperCase(),
    countryPhoneCode: '+599',
    flag: Flags.sabaIsland,
  );

  final sahrawiArabDemocraticRepublic = CountryModel(
    countryName: 'sahrawi Arab Democratic Republic'.toUpperCase(),
    countryPhoneCode: '+212',
    flag: Flags.sahrawiArabDemocraticRepublic,
  );

  final saintKittsAndNevis = CountryModel(
    countryName: 'saint Kitts And Nevis'.toUpperCase(),
    countryPhoneCode: '+1869',
    flag: Flags.saintKittsAndNevis,
  );

  final samoa = CountryModel(
    countryName: 'samoa'.toUpperCase(),
    countryPhoneCode: '+685',
    flag: Flags.samoa,
  );

  final sanMarino = CountryModel(
    countryName: 'san-Marino'.toUpperCase(),
    countryPhoneCode: '+378',
    flag: Flags.sanMarino,
  );

  final saoTomeAndPrincipe = CountryModel(
    countryName: 'sao-Tome And Principe'.toUpperCase(),
    countryPhoneCode: '+239',
    flag: Flags.saoTomeAndPrincipe,
  );

  final sardinia = CountryModel(
    countryName: 'sardinia'.toUpperCase(),
    countryPhoneCode: '+39',
    flag: Flags.sardinia,
  );

  final saudiArabia = CountryModel(
    countryName: 'saudi Arabia'.toUpperCase(),
    countryPhoneCode: '+966',
    flag: Flags.saudiArabia,
  );

  final scotland = CountryModel(
    countryName: 'scotland'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.scotland,
  );

  final senegal = CountryModel(
    countryName: 'senegal'.toUpperCase(),
    countryPhoneCode: '+221',
    flag: Flags.senegal,
  );

  final serbia = CountryModel(
    countryName: 'serbia'.toUpperCase(),
    countryPhoneCode: '+381',
    flag: Flags.serbia,
  );

  final seychelles = CountryModel(
    countryName: 'seychelles'.toUpperCase(),
    countryPhoneCode: '+248',
    flag: Flags.seychelles,
  );

  final sicily = CountryModel(
    countryName: 'sicily'.toUpperCase(),
    countryPhoneCode: '+39',
    flag: Flags.sicily,
  );

  final sierraLeone = CountryModel(
    countryName: 'sierra-Leone'.toUpperCase(),
    countryPhoneCode: '+232',
    flag: Flags.sierraLeone,
  );

  final singapore = CountryModel(
    countryName: 'singapore'.toUpperCase(),
    countryPhoneCode: '+65',
    flag: Flags.singapore,
  );

  final sintEustatius = CountryModel(
    countryName: 'saint Eustatius'.toUpperCase(),
    countryPhoneCode: '+599',
    flag: Flags.sintEustatius,
  );

  final sintMaarten = CountryModel(
    countryName: 'saint Maarten'.toUpperCase(),
    countryPhoneCode: '+1721',
    flag: Flags.sintMaarten,
  );

  final slovakia = CountryModel(
    countryName: 'slovakia'.toUpperCase(),
    countryPhoneCode: '+421',
    flag: Flags.slovakia,
  );

  final slovenia = CountryModel(
    countryName: 'slovenia'.toUpperCase(),
    countryPhoneCode: '+386',
    flag: Flags.slovenia,
  );

  final solomonIslands = CountryModel(
    countryName: 'solomon Islands'.toUpperCase(),
    countryPhoneCode: '+677',
    flag: Flags.solomonIslands,
  );

  final somalia = CountryModel(
    countryName: 'somalia'.toUpperCase(),
    countryPhoneCode: '+252',
    flag: Flags.somalia,
  );

  final somaliland = CountryModel(
    countryName: 'somaliland'.toUpperCase(),
    countryPhoneCode: '+252',
    flag: Flags.somaliland,
  );

  final southAfrica = CountryModel(
    countryName: 'south Africa'.toUpperCase(),
    countryPhoneCode: '+27',
    flag: Flags.southAfrica,
  );

  final southKorea = CountryModel(
    countryName: 'south Korea'.toUpperCase(),
    countryPhoneCode: '+82',
    flag: Flags.southKorea,
  );

  final southSudan = CountryModel(
    countryName: 'south Sudan'.toUpperCase(),
    countryPhoneCode: '+211',
    flag: Flags.southSudan,
  );

  final spain = CountryModel(
    countryName: 'spain'.toUpperCase(),
    countryPhoneCode: '+34',
    flag: Flags.spain,
  );

  final sriLanka = CountryModel(
    countryName: 'sri-Lanka'.toUpperCase(),
    countryPhoneCode: '+94',
    flag: Flags.sriLanka,
  );

  final stBarts = CountryModel(
    countryName: 'st. Barts'.toUpperCase(),
    countryPhoneCode: '+590',
    flag: Flags.stBarts,
  );

  final stVincentAndTheGrenadines = CountryModel(
    countryName: 'st. Vincent And The Grenadines'.toUpperCase(),
    countryPhoneCode: '+1784',
    flag: Flags.stVincentAndTheGrenadines,
  );

  final sudan = CountryModel(
    countryName: 'sudan'.toUpperCase(),
    countryPhoneCode: '+249',
    flag: Flags.sudan,
  );

  final suriname = CountryModel(
    countryName: 'suriname'.toUpperCase(),
    countryPhoneCode: '+597',
    flag: Flags.suriname,
  );

  final sweden = CountryModel(
    countryName: 'sweden'.toUpperCase(),
    countryPhoneCode: '+46',
    flag: Flags.sweden,
  );

  final switzerland = CountryModel(
    countryName: 'switzerland'.toUpperCase(),
    countryPhoneCode: '+41',
    flag: Flags.switzerland,
  );

  final syria = CountryModel(
    countryName: 'syria'.toUpperCase(),
    countryPhoneCode: '+963',
    flag: Flags.syria,
  );

  final taiwan = CountryModel(
    countryName: 'taiwan'.toUpperCase(),
    countryPhoneCode: '+886',
    flag: Flags.taiwan,
  );

  final tajikistan = CountryModel(
    countryName: 'tajikistan'.toUpperCase(),
    countryPhoneCode: '+992',
    flag: Flags.tajikistan,
  );

  final tanzania = CountryModel(
    countryName: 'tanzania'.toUpperCase(),
    countryPhoneCode: '+255',
    flag: Flags.tanzania,
  );

  final thailand = CountryModel(
    countryName: 'thailand'.toUpperCase(),
    countryPhoneCode: '+66',
    flag: Flags.thailand,
  );

  final tibet = CountryModel(
    countryName: 'tibet'.toUpperCase(),
    countryPhoneCode: '+86',
    flag: Flags.tibet,
  );

  final togo = CountryModel(
    countryName: 'togo'.toUpperCase(),
    countryPhoneCode: '+228',
    flag: Flags.togo,
  );

  final tokelau = CountryModel(
    countryName: 'tokelau'.toUpperCase(),
    countryPhoneCode: '+690',
    flag: Flags.tokelau,
  );

  final tonga = CountryModel(
    countryName: 'tonga'.toUpperCase(),
    countryPhoneCode: '+676',
    flag: Flags.tonga,
  );

  final transnistria = CountryModel(
    countryName: 'transnistria'.toUpperCase(),
    countryPhoneCode: '+373',
    flag: Flags.transnistria,
  );

  final trinidadAndTobago = CountryModel(
    countryName: 'trinidad And Tobago'.toUpperCase(),
    countryPhoneCode: '+1868',
    flag: Flags.trinidadAndTobago,
  );

  final tubalu = CountryModel(
    countryName: 'tubalu'.toUpperCase(),
    countryPhoneCode: '+688',
    flag: Flags.tubalu,
  );

  final tunisia = CountryModel(
    countryName: 'tunisia'.toUpperCase(),
    countryPhoneCode: '+216',
    flag: Flags.tunisia,
  );

  final turkey = CountryModel(
    countryName: 'turkey'.toUpperCase(),
    countryPhoneCode: '+90',
    flag: Flags.turkey,
  );

  final turkmenistan = CountryModel(
    countryName: 'turkmenistan'.toUpperCase(),
    countryPhoneCode: '+993',
    flag: Flags.turkmenistan,
  );

  final turksAndCaicos = CountryModel(
    countryName: 'turks And Caicos'.toUpperCase(),
    countryPhoneCode: '+1649',
    flag: Flags.turksAndCaicos,
  );

  final uganda = CountryModel(
    countryName: 'uganda'.toUpperCase(),
    countryPhoneCode: '+256',
    flag: Flags.uganda,
  );

  final ukraine = CountryModel(
    countryName: 'ukraine'.toUpperCase(),
    countryPhoneCode: '+380',
    flag: Flags.ukraine,
  );

  final unitedArabEmirates = CountryModel(
    countryName: 'united Arab Emirates'.toUpperCase(),
    countryPhoneCode: '+971',
    flag: Flags.unitedArabEmirates,
  );

  final unitedKingdom = CountryModel(
    countryName: 'united Kingdom'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.unitedKingdom,
  );

  final unitedStatesOfAmerica = CountryModel(
    countryName: 'united States Of America'.toUpperCase(),
    countryPhoneCode: '+1',
    flag: Flags.unitedStatesOfAmerica,
  );

  final uruguay = CountryModel(
    countryName: 'uruguay'.toUpperCase(),
    countryPhoneCode: '+598',
    flag: Flags.uruguay,
  );

  final uzbekistan = CountryModel(
    countryName: 'uzbekistan'.toUpperCase(),
    countryPhoneCode: '+998',
    flag: Flags.uzbekistan,
  );

  final vanuatu = CountryModel(
    countryName: 'vanuatu'.toUpperCase(),
    countryPhoneCode: '+678',
    flag: Flags.vanuatu,
  );

  final vaticanCity = CountryModel(
    countryName: 'vatican City'.toUpperCase(),
    countryPhoneCode: '+39',
    flag: Flags.vaticanCity,
  );

  final venezuela = CountryModel(
    countryName: 'venezuela'.toUpperCase(),
    countryPhoneCode: '+58',
    flag: Flags.venezuela,
  );

  final vietnam = CountryModel(
    countryName: 'vietnam'.toUpperCase(),
    countryPhoneCode: '+84',
    flag: Flags.vietnam,
  );

  final virginIslands = CountryModel(
    countryName: 'virgin Islands'.toUpperCase(),
    countryPhoneCode: '+1284',
    flag: Flags.virginIslands,
  );

  final wales = CountryModel(
    countryName: 'wales'.toUpperCase(),
    countryPhoneCode: '+44',
    flag: Flags.wales,
  );

  final yemen = CountryModel(
    countryName: 'yemen'.toUpperCase(),
    countryPhoneCode: '+967',
    flag: Flags.yemen,
  );

  final zambia = CountryModel(
    countryName: 'zambia'.toUpperCase(),
    countryPhoneCode: '+260',
    flag: Flags.zambia,
  );

  final zimbabwe = CountryModel(
    countryName: 'zimbabwe'.toUpperCase(),
    countryPhoneCode: '+263',
    flag: Flags.zimbabwe,
  );

  final alandIslands = CountryModel(
    flag: Flags.alandIslands,
    countryPhoneCode: '+358',
    countryName: 'alandIslands'.toUpperCase(),
  );

  final aruba = CountryModel(
    flag: Flags.aruba,
    countryPhoneCode: '+297',
    countryName: 'aruba'.toUpperCase(),
  );

  final britishIndianOceanTerritory = CountryModel(
    flag: Flags.britishIndianOceanTerritory,
    countryPhoneCode: '+246',
    countryName: 'britishIndianOceanTerritory'.toUpperCase(),
  );

  final cookIslands = CountryModel(
    flag: Flags.cookIslands,
    countryPhoneCode: '+682',
    countryName: 'cookIslands'.toUpperCase(),
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
        rapaNui,
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

  CountryModel({
    required this.flag,
    required this.countryPhoneCode,
    required this.countryName,
  }) : super(
          title: countryName,
          trailingText: countryPhoneCode,
          leadingPath: flag,
        );
}
