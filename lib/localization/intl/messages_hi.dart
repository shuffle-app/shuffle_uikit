// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'hi';

  static String m0(allowValue) => "अनुमति दें  ${allowValue}";

  static String m1(allowedCharacters) => "अनुमत वर्ण ${allowedCharacters} हैं";

  static String m2(days) =>
      "${Intl.plural(days, zero: '${days} दिन', one: '${days} दिन', two: '${days} दिन', few: '${days} दिन', many: '${days} दिन', other: '${days} दिन')}";

  static String m3(editingType) => "${editingType}  जगह";

  static String m4(inputType) => "${inputType} दर्ज करें";

  static String m5(formattedPrice) => "${formattedPrice} लिए";

  static String m6(helpfulCount) => "उपयोगी ${helpfulCount}";

  static String m7(days) => "${days} दिनों के लिए संकेत प्रणाली सक्षम है";

  static String m8(invitedPeopleCount) =>
      "${invitedPeopleCount} लोगों को आमंत्रित करता है";

  static String m9(placeIndex) => "${placeIndex} स्थान";

  static String m10(amountOfPeople) => "अगले ${amountOfPeople} लोग";

  static String m11(religionCount) =>
      "कृपया कम से कम ${religionCount} धर्म का चयन करें";

  static String m12(type) => "चुनना ${type}";

  static String m13(separator) => "हमें अपने बारे में और अधिक बताएं";

  static String m14(amountOfTopDonators, multiplier) =>
      "शीर्ष ${amountOfTopDonators} दानदाताओं को x{गुणक} अंक प्राप्त होते हैं";

  static String m15(type) => "To use this function plz upgrade to ${type}";

  static String m16(forNMoney) => "अपग्रेड  ${forNMoney}";

  static String m17(count) =>
      "${Intl.plural(count, zero: '${count} users', one: '${count} user', two: '${count} users', few: '${count} users', many: '${count} users', other: '${count} users')}";

  static String m18(value) => "${value}  खाली नहीं हो सका";

  static String m19(title) => "{शीर्षक} आवश्यक है";

  static String m20(value) => "${value}  सफलतापूर्वक अद्यतन";

  static String m21(amountOfInvitedPersons) =>
      "आपने ${amountOfInvitedPersons} लोगों को निमंत्रण भेजा है";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "AcceptDonations": MessageLookupByLibrary.simpleMessage(
            "Accept donations or help others realize their dreams"),
        "ActivityType":
            MessageLookupByLibrary.simpleMessage("क्रिया के प्रकार"),
        "AddYourselfToList":
            MessageLookupByLibrary.simpleMessage("स्वयं को सूची में जोड़ें"),
        "Address": MessageLookupByLibrary.simpleMessage("पता"),
        "AllAppNotification":
            MessageLookupByLibrary.simpleMessage("All app notifications"),
        "Allow": MessageLookupByLibrary.simpleMessage("अनुमति दें"),
        "AllowAll": MessageLookupByLibrary.simpleMessage("सभी को अनुमति दें"),
        "AllowGeolocation":
            MessageLookupByLibrary.simpleMessage("जियोलोकेशन की अनुमति दें"),
        "AllowLocationServicesToUseThisFunction":
            MessageLookupByLibrary.simpleMessage(
                "स्थान सेवाओं को इस फ़ंक्शन का उपयोग करने दें"),
        "AllowX": m0,
        "AllowedCaracters": m1,
        "AndWithWhitespaces": MessageLookupByLibrary.simpleMessage("और"),
        "Archived": MessageLookupByLibrary.simpleMessage("संग्रहीत"),
        "AreYouSureYouWantToDeleteYourAccount":
            MessageLookupByLibrary.simpleMessage(
                "क्या आप वाकई अपना खाता हटाना चाहते हैं?"),
        "AreYouSureYouWantToDeleteYourCompanyProfile":
            MessageLookupByLibrary.simpleMessage(
                "क्या आप वाकई अपनी कंपनी प्रोफ़ाइल हटाना चाहते हैं?"),
        "AreYouSureYouWantToLogOut": MessageLookupByLibrary.simpleMessage(
            "क्या आप वाकई लॉग आउट करना चाहते हैं?"),
        "AskForDonations": MessageLookupByLibrary.simpleMessage("दान माँगें"),
        "AskOrSupport":
            MessageLookupByLibrary.simpleMessage("पूछें या समर्थन करें"),
        "AskPeople": MessageLookupByLibrary.simpleMessage("लोगों से पूछें"),
        "Athlete": MessageLookupByLibrary.simpleMessage("एथलीट"),
        "Balance": MessageLookupByLibrary.simpleMessage("शेष राशि"),
        "BaseProperties": MessageLookupByLibrary.simpleMessage("आधार गुण"),
        "BasedOnYourActivityWeDetermineYourCondition":
            MessageLookupByLibrary.simpleMessage(
                "आपकी गतिविधि, हृदय गति और अन्य कारकों के आधार पर, हम आपकी स्थिति निर्धारित करते हैं और यह अनुशंसा करने का प्रयास करते हैं कि आपको अभी क्या चाहिए, विशेष रूप से आपके लिए"),
        "BeInSearch": MessageLookupByLibrary.simpleMessage("खोज में रहो"),
        "BookIt": MessageLookupByLibrary.simpleMessage("बुक करें"),
        "BurnedToday": MessageLookupByLibrary.simpleMessage("आज जला दिया"),
        "ByContinuingYouAcceptThe": MessageLookupByLibrary.simpleMessage(
            "जारी रखकर आप स्वीकार करते हैं"),
        "Cancel": MessageLookupByLibrary.simpleMessage("रद्द करें"),
        "Category": MessageLookupByLibrary.simpleMessage("Category"),
        "ChangePhoto": MessageLookupByLibrary.simpleMessage("छवि बदलो"),
        "CheckIn": MessageLookupByLibrary.simpleMessage("चेक इन करें"),
        "ChooseOption": MessageLookupByLibrary.simpleMessage("विकल्प चुनें"),
        "ClickEnterToSearch": MessageLookupByLibrary.simpleMessage(
            "क्लिक करें दर्ज खोज करने के लिए"),
        "CompanyAnswered":
            MessageLookupByLibrary.simpleMessage("कंपनी ने उत्तर दिया"),
        "CompanyCredentials":
            MessageLookupByLibrary.simpleMessage("कंपनी क्रेडेंशियल्स"),
        "CompanyName": MessageLookupByLibrary.simpleMessage("कंपनी का नाम"),
        "CompanyPosition":
            MessageLookupByLibrary.simpleMessage("कंपनी की स्थिति"),
        "Confirm": MessageLookupByLibrary.simpleMessage("पुष्टि करना"),
        "ContactPerson": MessageLookupByLibrary.simpleMessage("संपर्क व्यक्ति"),
        "Continue": MessageLookupByLibrary.simpleMessage("जारी रखें"),
        "Create": MessageLookupByLibrary.simpleMessage("बनाएँ"),
        "CreateEvent": MessageLookupByLibrary.simpleMessage("कार्यक्रम बनाएँ"),
        "CreatePlace": MessageLookupByLibrary.simpleMessage("जगह बनाएं"),
        "CreateYourPlaceAndInvitePeople": MessageLookupByLibrary.simpleMessage(
            "अपना स्थान बनाएं और लोगों को आमंत्रित करें"),
        "Daily": MessageLookupByLibrary.simpleMessage("दैनिक"),
        "DateOfBirth": MessageLookupByLibrary.simpleMessage("जन्म की तारीख"),
        "Dates": MessageLookupByLibrary.simpleMessage("तिथियां"),
        "Day": MessageLookupByLibrary.simpleMessage("दिन"),
        "Days": m2,
        "DaysOfWeek": MessageLookupByLibrary.simpleMessage("सप्ताह के दिन"),
        "DeleteFromList": MessageLookupByLibrary.simpleMessage("सूची से हटाएँ"),
        "DependingOn":
            MessageLookupByLibrary.simpleMessage("पर निर्भर करता है"),
        "DescribeYourClaim":
            MessageLookupByLibrary.simpleMessage("अपने दावे का वर्णन करें"),
        "DescribeYourIssue":
            MessageLookupByLibrary.simpleMessage("अपने मामले का वर्णन करें"),
        "DescribeYourWishes":
            MessageLookupByLibrary.simpleMessage("अपनी इच्छाओं का वर्णन करें"),
        "DescribeYourself":
            MessageLookupByLibrary.simpleMessage("स्वयं का विवरण दें"),
        "Description": MessageLookupByLibrary.simpleMessage("विवरण"),
        "Details": MessageLookupByLibrary.simpleMessage("विवरण"),
        "Directions": MessageLookupByLibrary.simpleMessage("दिशा-निर्देश"),
        "DonationHint": MessageLookupByLibrary.simpleMessage(
            "आप केवल अपने सपने पर खर्च कर सकते हैं, अन्यथा पैसा दाताओं को वापस जाएगा। एक महीने में एक अनुरोध।"),
        "DontBeAlone": MessageLookupByLibrary.simpleMessage("अकेले मत रहो"),
        "DontMissIt": MessageLookupByLibrary.simpleMessage("इसे मत चूकिए"),
        "Edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "EditProfile":
            MessageLookupByLibrary.simpleMessage("प्रोफ़ाइल संपादित करें"),
        "EditingTypePlace": m3,
        "Email": MessageLookupByLibrary.simpleMessage("ईमेल"),
        "EnableHintSystem":
            MessageLookupByLibrary.simpleMessage("संकेत प्रणाली सक्षम करें"),
        "EnterInputType": m4,
        "EnterPlaceAddressPrompt": MessageLookupByLibrary.simpleMessage(
            "कृपया स्थान का पता दर्ज करें"),
        "EnterYourEmailAddress":
            MessageLookupByLibrary.simpleMessage("अपना ईमेल पता दर्ज करें"),
        "ErrorOccured": MessageLookupByLibrary.simpleMessage("त्रुटि हुई"),
        "ErrorOccuredWithoutMessage":
            MessageLookupByLibrary.simpleMessage("संदेश के बिना त्रुटि हुई"),
        "Event": MessageLookupByLibrary.simpleMessage("घटना"),
        "EventType": MessageLookupByLibrary.simpleMessage("घटना प्रकार"),
        "Events": MessageLookupByLibrary.simpleMessage("Events"),
        "EventsReminders":
            MessageLookupByLibrary.simpleMessage("Events reminders"),
        "Faq": MessageLookupByLibrary.simpleMessage("सामान्य प्रश्न"),
        "FaqUnderDev": MessageLookupByLibrary.simpleMessage(
            "Gathering requests for FAQ. \nUnder development"),
        "Favorites": MessageLookupByLibrary.simpleMessage("पसंदीदा"),
        "FeaturesEnableGeolocation": MessageLookupByLibrary.simpleMessage(
            "सुविधाएँ जियोलोकेशन सक्षम करती हैं"),
        "Feeling": MessageLookupByLibrary.simpleMessage("लग रहा है"),
        "Filters": MessageLookupByLibrary.simpleMessage("फ़िल्टर"),
        "FindSomeoneToHangOutWith": MessageLookupByLibrary.simpleMessage(
            "किसी के साथ घूमने के लिए खोजें"),
        "FindSomeoneToNetworkWith": MessageLookupByLibrary.simpleMessage(
            "नेटवर्किंग करने के लिए किसी को खोजें"),
        "Follow": MessageLookupByLibrary.simpleMessage("फ़ॉलो करें"),
        "Followers": MessageLookupByLibrary.simpleMessage("समर्थक"),
        "Followings": MessageLookupByLibrary.simpleMessage("निम्नलिखित"),
        "For": MessageLookupByLibrary.simpleMessage("के लिए"),
        "ForFormattedPrice": m5,
        "ForPeriod": MessageLookupByLibrary.simpleMessage("For"),
        "ForgotPassword":
            MessageLookupByLibrary.simpleMessage("पासवर्ड भूल गए"),
        "FreePlaces": MessageLookupByLibrary.simpleMessage("निःशुल्क स्थान"),
        "FulfillTheDream":
            MessageLookupByLibrary.simpleMessage("सपना पूरा करो"),
        "Gender": MessageLookupByLibrary.simpleMessage("लिंग"),
        "GetCode": MessageLookupByLibrary.simpleMessage("कोड प्राप्त करें"),
        "GetReward": MessageLookupByLibrary.simpleMessage("इनाम मिलना"),
        "GetStarted": MessageLookupByLibrary.simpleMessage("शुरू हो जाओ"),
        "Go": MessageLookupByLibrary.simpleMessage("आगे बढ़ो"),
        "GoToSettings":
            MessageLookupByLibrary.simpleMessage("सेटिंग्स में जाओ"),
        "Guess": MessageLookupByLibrary.simpleMessage("अनुमान"),
        "HallOfFame": MessageLookupByLibrary.simpleMessage("Hall of Fame"),
        "HardToAnswer":
            MessageLookupByLibrary.simpleMessage("जवाब देना मुश्किल"),
        "HealthKit": MessageLookupByLibrary.simpleMessage("स्वास्थ्य किट"),
        "Helpful": MessageLookupByLibrary.simpleMessage("उपयोगी"),
        "HelpfulNCount": m6,
        "HintSystemDisabled":
            MessageLookupByLibrary.simpleMessage("संकेत प्रणाली अक्षम है"),
        "HintSystemEnabled": m7,
        "HowAreYouFeelingTonight": MessageLookupByLibrary.simpleMessage(
            "आज रात आप कैसा महसूस कर रहे हैं?"),
        "HowItWorks":
            MessageLookupByLibrary.simpleMessage("यह कैसे\nकाम करता है"),
        "HowMuchDoYouWantToDonate": MessageLookupByLibrary.simpleMessage(
            "आप कितना \$ दान करना चाहते हैं?"),
        "IncorrectLoginOrPassword":
            MessageLookupByLibrary.simpleMessage("गलत लॉगिन या पासवर्ड"),
        "InvitationsCanBeViewedInPrivateMessages":
            MessageLookupByLibrary.simpleMessage(
                "निमंत्रण निजी संदेशों में देखे जा सकते हैं"),
        "Invite": MessageLookupByLibrary.simpleMessage("आमंत्रित करना"),
        "InviteList": MessageLookupByLibrary.simpleMessage("Invite list"),
        "InviteMore":
            MessageLookupByLibrary.simpleMessage("और अधिक को आमंत्रित करें"),
        "InvitePeople":
            MessageLookupByLibrary.simpleMessage("लोगो को निमंत्रण भेजो"),
        "InviteToFavoritePlaces": MessageLookupByLibrary.simpleMessage(
            "पसंदीदा स्थानों पर आमंत्रित करें"),
        "InvitesNPeopleTo": m8,
        "InvitesYouTo":
            MessageLookupByLibrary.simpleMessage("आपको आमंत्रित करता है"),
        "IsRecurrent": MessageLookupByLibrary.simpleMessage("आवर्तक है"),
        "Loading": MessageLookupByLibrary.simpleMessage("लोड हो रहा है..."),
        "Location": MessageLookupByLibrary.simpleMessage("जगह"),
        "Logo": MessageLookupByLibrary.simpleMessage("प्रतीक चिन्ह"),
        "LogoUploadFiles":
            MessageLookupByLibrary.simpleMessage("लोगो (फ़ाइलें अपलोड करें)"),
        "LovelyTouchAmazingInteraction": MessageLookupByLibrary.simpleMessage(
            "प्यारा-स्पर्श अद्भुत\nइंटरैक्शन"),
        "Members": MessageLookupByLibrary.simpleMessage("सदस्यों"),
        "Message": MessageLookupByLibrary.simpleMessage("Message"),
        "Messages": MessageLookupByLibrary.simpleMessage("Messages"),
        "Month": MessageLookupByLibrary.simpleMessage("महीना"),
        "MyCard": MessageLookupByLibrary.simpleMessage("मेरा कार्ड"),
        "MyEvents": MessageLookupByLibrary.simpleMessage("मेरी घटनाएँ"),
        "NPlace": m9,
        "Name": MessageLookupByLibrary.simpleMessage("Name"),
        "NameOrNickname": MessageLookupByLibrary.simpleMessage("नाम या उपनाम"),
        "NewDonates": MessageLookupByLibrary.simpleMessage("New donates"),
        "NewFeatures": MessageLookupByLibrary.simpleMessage("New features"),
        "NewFollowers": MessageLookupByLibrary.simpleMessage("New followers"),
        "NewLocationHasOpenedToday": MessageLookupByLibrary.simpleMessage(
            "आज एक नया स्थान खुल गया है ।  आओ! आप इसे पसंद करेंगे!"),
        "NewPlace": MessageLookupByLibrary.simpleMessage("नयी जगह"),
        "Next": MessageLookupByLibrary.simpleMessage("अगला"),
        "NextNPeople": m10,
        "NextWithChevrons": MessageLookupByLibrary.simpleMessage("अगला >>>"),
        "Nickname": MessageLookupByLibrary.simpleMessage("उपनाम"),
        "NicknameIsTakenTryAnotherOne": MessageLookupByLibrary.simpleMessage(
            "उपनाम लिया जाता है, एक और प्रयास करें"),
        "NoConnection": MessageLookupByLibrary.simpleMessage(
            "Sorry, no internet connection"),
        "NoDateSelected":
            MessageLookupByLibrary.simpleMessage("कोई दिनांक चयनित नहीं"),
        "NoFavoritesFound":
            MessageLookupByLibrary.simpleMessage("No favorites found"),
        "NoHealthKitAvailableOnYourDevice": MessageLookupByLibrary.simpleMessage(
            "आपके डिवाइस पर कोई स्वास्थ्य किट उपलब्ध नहीं है, इसलिए परिणाम यादृच्छिक होगा"),
        "NoPhotoHereYet": MessageLookupByLibrary.simpleMessage(
            "अभी तक यहां कोई फोटो नहीं है!"),
        "NoPreferencesChosen":
            MessageLookupByLibrary.simpleMessage("कोई प्राथमिकता नहीं चुनी गई"),
        "NoThx": MessageLookupByLibrary.simpleMessage("धन्यवाद"),
        "NotNow": MessageLookupByLibrary.simpleMessage("अभी नहीं"),
        "NotOften": MessageLookupByLibrary.simpleMessage("अक्सर नहीं"),
        "NothingFound":
            MessageLookupByLibrary.simpleMessage("कुछ भी नहीं मिला"),
        "NothingWasFoundWithEmoji":
            MessageLookupByLibrary.simpleMessage("कुछ नहीं मिला"),
        "Notifications": MessageLookupByLibrary.simpleMessage("सूचनाएं"),
        "NowLetsGetToKnowEachOther":
            MessageLookupByLibrary.simpleMessage("आइए अब एक-दूसरे को जानें"),
        "Off": MessageLookupByLibrary.simpleMessage("बंद"),
        "Ok": MessageLookupByLibrary.simpleMessage("ठीक है"),
        "OkayCool": MessageLookupByLibrary.simpleMessage("ठीक है अद्भुत"),
        "Ooops": MessageLookupByLibrary.simpleMessage("उफ़!"),
        "OopsIWillTryAgain":
            MessageLookupByLibrary.simpleMessage("उफ़, मैं फिर कोशिश करूँगा"),
        "OpenFrom": MessageLookupByLibrary.simpleMessage("से खोलें"),
        "OpenTo": MessageLookupByLibrary.simpleMessage("के लिए खुला"),
        "OpeningHours": MessageLookupByLibrary.simpleMessage("खुलने का समय"),
        "OrDragFilesHere":
            MessageLookupByLibrary.simpleMessage("या फ़ाइलों को यहां खींचें"),
        "OurRecommendationsAboutGeolocation": MessageLookupByLibrary.simpleMessage(
            "हमारी सिफारिश प्रणाली कई कारकों पर आधारित है ।  जियोलोकेशन सिस्टम का केवल एक हिस्सा है, जो हमें दूरी और निकटतम परिदृश्य सुविधाओं (पहाड़ों, जलाशयों, मैदानों, रेगिस्तान) दोनों के संदर्भ में सही ढंग से प्राथमिकता देने की अनुमति देगा।"),
        "Password": MessageLookupByLibrary.simpleMessage("पासवर्ड"),
        "PasswordConditions": MessageLookupByLibrary.simpleMessage(
            "पासवर्ड में कम से कम एक अपरकेस अक्षर, एक लोअरकेस अक्षर, एक नंबर और एक विशेष वर्ण होना चाहिए"),
        "PasswordMustBeAtLeast8Characters":
            MessageLookupByLibrary.simpleMessage(
                "पासवर्ड कम से कम 8 अक्षर होना चाहिए"),
        "Permissions": MessageLookupByLibrary.simpleMessage("अनुमतियाँ"),
        "PersonalCredentials":
            MessageLookupByLibrary.simpleMessage("व्यक्तिगत क्रेडेंशियल्स"),
        "Phone": MessageLookupByLibrary.simpleMessage("फ़ोन"),
        "Photo": MessageLookupByLibrary.simpleMessage("फोटो"),
        "PhotoUploadFiles":
            MessageLookupByLibrary.simpleMessage("फोटो (फाइल अपलोड)"),
        "Photos": MessageLookupByLibrary.simpleMessage("तस्वीरें"),
        "Place": MessageLookupByLibrary.simpleMessage("जगह"),
        "PlaceType": MessageLookupByLibrary.simpleMessage("जगह प्रकार"),
        "Places": MessageLookupByLibrary.simpleMessage("स्थानों"),
        "PleaseFillOutDate":
            MessageLookupByLibrary.simpleMessage("कृपया दिनांक भरें"),
        "PleaseFillOutYourWishes": MessageLookupByLibrary.simpleMessage(
            "कृपया अपनी इच्छाएं पूरी करें"),
        "PleaseSelectANiche":
            MessageLookupByLibrary.simpleMessage("कृपया एक आला चुनें"),
        "PleaseSelectAtLeastNReligion": m11,
        "PleaseSelectAtLeastOneAgeRange": MessageLookupByLibrary.simpleMessage(
            "कृपया कम से कम एक आयु सीमा चुनें"),
        "PleaseSelectAtLeastOneTargetAudience":
            MessageLookupByLibrary.simpleMessage(
                "कृपया कम से कम एक लक्षित दर्शक चुनें"),
        "PleaseSelectGender":
            MessageLookupByLibrary.simpleMessage("कृपया एक लिंग चुनें"),
        "PleaseSelectOneType":
            MessageLookupByLibrary.simpleMessage("कृपया एक प्रकार चुनें"),
        "PointBalance": MessageLookupByLibrary.simpleMessage("अंक गिनती"),
        "Points": MessageLookupByLibrary.simpleMessage("अंक"),
        "Position": MessageLookupByLibrary.simpleMessage("पद"),
        "Preferences": MessageLookupByLibrary.simpleMessage("पसंद"),
        "Premium": MessageLookupByLibrary.simpleMessage("अधिमूल्य"),
        "PremiumAccount": MessageLookupByLibrary.simpleMessage("प्रीमियम खाता"),
        "Price": MessageLookupByLibrary.simpleMessage("Price"),
        "Privacy": MessageLookupByLibrary.simpleMessage("गोपनीयता"),
        "Pro": MessageLookupByLibrary.simpleMessage("प्रो"),
        "ProAccount": MessageLookupByLibrary.simpleMessage("प्रो खाता"),
        "Published": MessageLookupByLibrary.simpleMessage("प्रकाशित"),
        "Recommended": MessageLookupByLibrary.simpleMessage("अनुशंसित"),
        "ResetFilters": MessageLookupByLibrary.simpleMessage("रीसेट फ़िल्टर"),
        "ResetPassword": MessageLookupByLibrary.simpleMessage("पासवर्ड रीसेट"),
        "Save": MessageLookupByLibrary.simpleMessage("सहेजें"),
        "Search": MessageLookupByLibrary.simpleMessage("खोजें"),
        "SeeAll": MessageLookupByLibrary.simpleMessage("सभी देखें"),
        "SeeMore": MessageLookupByLibrary.simpleMessage("और देखें"),
        "SelectDate": MessageLookupByLibrary.simpleMessage("तारीख़ चुनें"),
        "SelectDays": MessageLookupByLibrary.simpleMessage("दिन चुनें"),
        "SelectLanguage": MessageLookupByLibrary.simpleMessage("भाषा चुने"),
        "SelectOption": MessageLookupByLibrary.simpleMessage("विकल्प चुनें"),
        "SelectType": m12,
        "SelectYourReligions":
            MessageLookupByLibrary.simpleMessage("अपने धर्म चुनें"),
        "SelectionOfTheBest":
            MessageLookupByLibrary.simpleMessage("सर्वश्रेष्ठ का चयन"),
        "Send": MessageLookupByLibrary.simpleMessage("भेजना"),
        "SendIt": MessageLookupByLibrary.simpleMessage("इसे भेजो"),
        "Services": MessageLookupByLibrary.simpleMessage("सेवाएं"),
        "ShowResult": MessageLookupByLibrary.simpleMessage("परिणाम दिखाओ"),
        "Shuffle": MessageLookupByLibrary.simpleMessage("मिश्रण"),
        "ShuffleWithRightWhitespace":
            MessageLookupByLibrary.simpleMessage("मिश्रण"),
        "Skip": MessageLookupByLibrary.simpleMessage("छोड़ें"),
        "Small": MessageLookupByLibrary.simpleMessage("छोटा"),
        "SmartLeisureSelection": MessageLookupByLibrary.simpleMessage(
            "हर जगह, हर किसी के लिए स्मार्ट अवकाश चयन।"),
        "Spent": MessageLookupByLibrary.simpleMessage("खर्च किया"),
        "StartToExplore":
            MessageLookupByLibrary.simpleMessage("अन्वेषण करना प्रारंभ करें"),
        "Sunny": MessageLookupByLibrary.simpleMessage("सनी"),
        "Support": MessageLookupByLibrary.simpleMessage("सहायता"),
        "SupportPeopleAroundYou": MessageLookupByLibrary.simpleMessage(
            "अपने आसपास के लोगों का समर्थन करें"),
        "SwipeToStart": MessageLookupByLibrary.simpleMessage("Swipe to start"),
        "SwitchAnyTime": MessageLookupByLibrary.simpleMessage(
            "You can switch it at any time in your profile settings"),
        "Tags": MessageLookupByLibrary.simpleMessage("टैग"),
        "TapIt": MessageLookupByLibrary.simpleMessage("इसे टैप करें"),
        "TapOnceToChoose": MessageLookupByLibrary.simpleMessage(
            "चुनने के लिए एक बार टैप करें"),
        "TapToSeeMore":
            MessageLookupByLibrary.simpleMessage("अधिक देखने के लिए टैप करें"),
        "TapToSetAddress": MessageLookupByLibrary.simpleMessage(
            "पता सेट करने के लिए टैप करें"),
        "TapTwiceToMarkYourFavorites": MessageLookupByLibrary.simpleMessage(
            "अपने पसंदीदा को चिह्नित करने के लिए दो बार टैप करें।"),
        "TellUsMoreAboutYourself": m13,
        "Terms": MessageLookupByLibrary.simpleMessage("शर्तें"),
        "ThatsAllForNow":
            MessageLookupByLibrary.simpleMessage("अभी के लिए इतना ही!"),
        "TheMoreInfoWeAboutYouGetTheBetter":
            MessageLookupByLibrary.simpleMessage(
                "हमें आपके बारे में जितनी अधिक जानकारी मिलेगी, उतना बेहतर होगा"),
        "TheMoreInfoWeGetTheBetter": MessageLookupByLibrary.simpleMessage(
            "हमें जितनी अधिक जानकारी मिलेगी, उतना बेहतर होगा"),
        "ThenCheckThisOut":
            MessageLookupByLibrary.simpleMessage("फिर इसे जांचें"),
        "ThisIs": MessageLookupByLibrary.simpleMessage("यह है"),
        "ThroughANonAggregatorSystem": MessageLookupByLibrary.simpleMessage(
            "एक गैर के माध्यम से-\nएग्रीगेटर प्रणाली\nविशेष रूप से आप के लिए"),
        "Time": MessageLookupByLibrary.simpleMessage("समय"),
        "Title": MessageLookupByLibrary.simpleMessage("शीर्षक"),
        "ToAccessAll":
            MessageLookupByLibrary.simpleMessage("सभी तक पहुँचने के लिए"),
        "ToAllowAccessGoToSettings": MessageLookupByLibrary.simpleMessage(
            "पुश सूचनाएँ भेजने की अनुमति देने के लिए, अपने फ़ोन की सेटिंग पर जाएँ"),
        "Today": MessageLookupByLibrary.simpleMessage("आज"),
        "TopNDonatorsReceiveXPoints": m14,
        "TopPlacesRatedBy": MessageLookupByLibrary.simpleMessage(
            "सर्वोच्च स्थानों का मूल्यांकन किया गया\nद्वारा"),
        "TryYourself":
            MessageLookupByLibrary.simpleMessage("स्वयं प्रयास करें"),
        "TypeHere": MessageLookupByLibrary.simpleMessage("यहाँ टाइप करें"),
        "Undefined": MessageLookupByLibrary.simpleMessage("अपरिभाषित"),
        "UniqueProperties":
            MessageLookupByLibrary.simpleMessage("अद्वितीय गुण"),
        "UpcomingEvent":
            MessageLookupByLibrary.simpleMessage("आगामी कार्यक्रम"),
        "Update": MessageLookupByLibrary.simpleMessage("अद्यतन करें"),
        "UpgradeAccount": m15,
        "UpgradeAccountConfirmation":
            MessageLookupByLibrary.simpleMessage("Upgrade"),
        "UpgradeForNmoney": m16,
        "User": MessageLookupByLibrary.simpleMessage("उपयोगकर्ता"),
        "Users": m17,
        "UsingHealthKit":
            MessageLookupByLibrary.simpleMessage("हेल्थकिट का उपयोग करना"),
        "ValueMustBeAtLeast3Characters": MessageLookupByLibrary.simpleMessage(
            "मान कम से कम 3 वर्ण लंबा होना चाहिए"),
        "Video": MessageLookupByLibrary.simpleMessage("वीडियो"),
        "VideoUploadFiles":
            MessageLookupByLibrary.simpleMessage("वीडियो (फ़ाइलें अपलोड करें)"),
        "ViewAll": MessageLookupByLibrary.simpleMessage("View all"),
        "VisitFirstToOpenNext":
            MessageLookupByLibrary.simpleMessage("अगला खोलने के लिए पहले जाएँ"),
        "WeDoNotSpamAllKindsOfNotifications": MessageLookupByLibrary.simpleMessage(
            "हम सभी प्रकार की सूचनाओं और विज्ञापनों को स्पैम नहीं करते हैं ।  केवल वे सूचनाएं जो आपके लिए महत्वपूर्ण हो सकती हैं और आपकी प्राथमिकताओं से मेल खाती हैं"),
        "WeHavePlacesJustForYou": MessageLookupByLibrary.simpleMessage(
            "हमारे पास सिर्फ आपके लिए जगहें हैं"),
        "WeWillLetKnowResults":
            MessageLookupByLibrary.simpleMessage("हम आपको नतीजे बताएंगे"),
        "Weather": MessageLookupByLibrary.simpleMessage("मौसम"),
        "Website": MessageLookupByLibrary.simpleMessage("वेबसाइट"),
        "Welcome": MessageLookupByLibrary.simpleMessage("स्वागत"),
        "WhatIs": MessageLookupByLibrary.simpleMessage("क्या है"),
        "WhatYouLike":
            MessageLookupByLibrary.simpleMessage("आप को क्या पसंद है"),
        "WhiteTheme": MessageLookupByLibrary.simpleMessage("White theme"),
        "WillBe": MessageLookupByLibrary.simpleMessage("होगा।"),
        "WillBeImplementedSoon":
            MessageLookupByLibrary.simpleMessage("जल्द ही लागू किया जाएगा"),
        "WithYourPreferences":
            MessageLookupByLibrary.simpleMessage("आपका\nप्राथमिकताएं के साथ"),
        "WorkHours": MessageLookupByLibrary.simpleMessage("काम के घंटे"),
        "WrongSecurityCode":
            MessageLookupByLibrary.simpleMessage("गलत सुरक्षा कोड"),
        "XCouldNotBeEmpty": m18,
        "XIsRequired": m19,
        "XSuccessfullyUpdated": m20,
        "Year": MessageLookupByLibrary.simpleMessage("वर्ष"),
        "Yes": MessageLookupByLibrary.simpleMessage("हाँ"),
        "YouBetterCheckThisOut": MessageLookupByLibrary.simpleMessage(
            "बेहतर होगा कि आप इसकी जांच कर लें"),
        "YouGetExactlyWhatYouNeed": MessageLookupByLibrary.simpleMessage(
            "आपको वही मिलता है जो आपको चाहि"),
        "YouSentInvitationToNPeople": m21,
        "YoullFindIt": MessageLookupByLibrary.simpleMessage("आप उसे खोज लोगे"),
        "YourAge": MessageLookupByLibrary.simpleMessage("आपकी उम्र"),
        "YourAudience": MessageLookupByLibrary.simpleMessage("आपके दर्शक"),
        "YourAudienceAge":
            MessageLookupByLibrary.simpleMessage("आपके दर्शकों की उम्र"),
        "YourClaimHasBeenSent":
            MessageLookupByLibrary.simpleMessage("आपका दावा भेज दिया गया है"),
        "YourEmail": MessageLookupByLibrary.simpleMessage("आपका ईमेल"),
        "YourLeisureSelection":
            MessageLookupByLibrary.simpleMessage("आपका अवकाश चयन"),
        "YourName": MessageLookupByLibrary.simpleMessage("आपका नाम"),
        "YourNiche": MessageLookupByLibrary.simpleMessage("आपका आला"),
        "YourPosition": MessageLookupByLibrary.simpleMessage("आपका मत"),
        "YourTraffic": MessageLookupByLibrary.simpleMessage("आपका ट्रैफ़िक"),
        "daynight": MessageLookupByLibrary.simpleMessage("Day and night"),
        "key": MessageLookupByLibrary.simpleMessage("")
      };
}
