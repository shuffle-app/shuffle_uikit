// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(allowValue) => "Allow ${allowValue}";

  static String m1(allowedCharacters) =>
      "Allowed caracters are ${allowedCharacters}";

  static String m2(item) =>
      "${Intl.plural(item, zero: '3 difficulty levels', one: 'visit first to open next', two: 'visit & check in', few: 'pass & be rewarded', other: 'pass & be rewarded')}";

  static String m3(days) =>
      "${Intl.plural(days, zero: 'days', one: 'day', two: 'days', few: 'days', many: 'days', other: 'days')}";

  static String m4(actuallyRaised, goal) =>
      "raised ${actuallyRaised}/\$${goal}\$";

  static String m5(editingType) => "${editingType} place";

  static String m6(inputType) => "Enter ${inputType}";

  static String m7(item) =>
      "${Intl.plural(item, zero: 'your location', one: 'your interests', two: 'weather around', few: 'and other 14 scales', other: 'other')}";

  static String m8(item) =>
      "${Intl.plural(item, zero: 'select the niche', one: 'press', two: 'get selection', few: 'choose & plan', other: 'other')}";

  static String m9(item) =>
      "${Intl.plural(item, zero: 'events & places', one: 'filtering by chips', two: 'choose chip & press', few: 'press & scroll\n', other: 'other')}";

  static String m10(point) =>
      "{point, plural, =0{${point} interests} =1{${point} interest} =2{${point} interests} few{${point} interests} many{${point} interests} other{${point} interests}";

  static String m11(interest) =>
      "{interest, plural, =0{${interest} interests} =1{${interest} interest} =2{${interest} interests} few{${interest} interests} many{${interest} interests} other{${interest} interests}";

  static String m12(formattedPrice) => " For ${formattedPrice}";

  static String m13(helpfulCount) => "Helpful ${helpfulCount}";

  static String m14(days) =>
      "Hint system enabled for ${Intl.plural(days, zero: '${days} days', one: '${days} day', two: '${days} days', few: '${days} days', many: '${days} days', other: '${days} days')}";

  static String m15(invitedPeopleCount) =>
      "Invites ${invitedPeopleCount} people to";

  static String m16(item) =>
      "${Intl.plural(item, zero: 'Участников', one: 'Участник', two: 'Участников', few: 'Участников', other: 'Участники')}";

  static String m17(placeIndex) => "${placeIndex} place";

  static String m18(elements) => "Next ${elements}";

  static String m19(amountOfPeople) => "Next ${amountOfPeople} people";

  static String m20(religionCount) =>
      "Please select at least ${religionCount} religion";

  static String m21(item) =>
      "${Intl.plural(item, zero: 'post a dream request', one: 'write & make video', two: 'be convincing and honest', few: 'donate others', other: 'other')}";

  static String m22(item) =>
      "${Intl.plural(item, zero: 'find companions', one: 'similar preferences', two: 'check point reputation', few: 'no foes', other: 'other')}";

  static String m23(amount) => "Read ${amount}";

  static String m24(item) =>
      "${Intl.plural(item, zero: 'preferences don’t work', one: 'events/places', two: 'type & get result', few: 'use ratings & models', other: 'other')}";

  static String m25(type) => "select ${type}";

  static String m26(item) =>
      "${Intl.plural(item, zero: 'swipe any direction', one: 'swipe place qualities', two: 'like dislike favorite', few: 'teach our system', other: 'other')}";

  static String m27(item) =>
      "${Intl.plural(item, zero: 'for fun', one: 'swipe category', two: 'choose & plan', few: 'search & book', other: 'other')}";

  static String m28(separator) => "Tell us more${separator}about yourself";

  static String m29(amountOfTopDonators, multiplier) =>
      "Top ${amountOfTopDonators} donators receive x${multiplier} points";

  static String m30(separator) => "Top places rated${separator}by";

  static String m31(type) => "To use this function plz upgrade to ${type}";

  static String m32(forNMoney) => "Upgrade ${forNMoney}";

  static String m33(count) =>
      "${Intl.plural(count, zero: '${count} users', one: '${count} user', two: '${count} users', few: '${count} users', many: '${count} users', other: '${count} users')}";

  static String m34(value) => "${value} could not be empty";

  static String m35(title) => "${title} is required";

  static String m36(value) => "${value} successfully updated";

  static String m37(amountOfInvitedPersons) =>
      "You sent an invitation to ${amountOfInvitedPersons} people";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "AcceptDonations": MessageLookupByLibrary.simpleMessage(
            "Accept donations or help others realize their dreams"),
        "Account": MessageLookupByLibrary.simpleMessage("Account"),
        "ActivityType": MessageLookupByLibrary.simpleMessage("Activity type"),
        "AddYourselfToList":
            MessageLookupByLibrary.simpleMessage("Add yourself to list"),
        "Address": MessageLookupByLibrary.simpleMessage("Address"),
        "AllAppNotification":
            MessageLookupByLibrary.simpleMessage("All app notifications"),
        "Allow": MessageLookupByLibrary.simpleMessage("Allow"),
        "AllowAll": MessageLookupByLibrary.simpleMessage("Allow all"),
        "AllowGeolocation":
            MessageLookupByLibrary.simpleMessage("Allow geolocation"),
        "AllowLocationServicesToUseThisFunction":
            MessageLookupByLibrary.simpleMessage(
                "Allow location services to use this function"),
        "AllowX": m0,
        "AllowedCaracters": m1,
        "AndWithWhitespaces": MessageLookupByLibrary.simpleMessage(" And "),
        "Archived": MessageLookupByLibrary.simpleMessage("Archived"),
        "AreYouSureYouWantToDeleteYourAccount":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete your account?"),
        "AreYouSureYouWantToDeleteYourCompanyProfile":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete your company profile?"),
        "AreYouSureYouWantToLogOut": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to log out?"),
        "AskForDonations":
            MessageLookupByLibrary.simpleMessage("Ask for donations"),
        "AskOrSupport": MessageLookupByLibrary.simpleMessage("Ask or support"),
        "AskPeople": MessageLookupByLibrary.simpleMessage("Ask people"),
        "Atheism": MessageLookupByLibrary.simpleMessage("Atheism"),
        "Athlete": MessageLookupByLibrary.simpleMessage("Athlete"),
        "Balance": MessageLookupByLibrary.simpleMessage("Balance"),
        "BaseProperties":
            MessageLookupByLibrary.simpleMessage("Base properties"),
        "BasedOnYourActivityWeDetermineYourCondition":
            MessageLookupByLibrary.simpleMessage(
                "Based on your activity, heart rate and other factors, we determine your condition and try to recommend exactly what you need right now, specifically for you"),
        "BeInSearch": MessageLookupByLibrary.simpleMessage("Be in search"),
        "BookIt": MessageLookupByLibrary.simpleMessage("Book it"),
        "Buddhism": MessageLookupByLibrary.simpleMessage("Buddhism"),
        "BurnedToday": MessageLookupByLibrary.simpleMessage("Burned today"),
        "Business": MessageLookupByLibrary.simpleMessage("Business"),
        "ByContinuingYouAcceptThe": MessageLookupByLibrary.simpleMessage(
            "By continuing you accept the "),
        "Cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "Category": MessageLookupByLibrary.simpleMessage("Category"),
        "ChangePhoto": MessageLookupByLibrary.simpleMessage("Change photo"),
        "CheckIn": MessageLookupByLibrary.simpleMessage("Check in"),
        "CheckInHiwHint": m2,
        "CheckInHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "cure your feeling or enchance it!"),
        "CheckInHiwTitle": MessageLookupByLibrary.simpleMessage(
            "Suitable city content will..."),
        "CheckItOut": MessageLookupByLibrary.simpleMessage("Check it out"),
        "ChooseOption": MessageLookupByLibrary.simpleMessage("Choose option"),
        "ChooseYourself":
            MessageLookupByLibrary.simpleMessage("Choose yourself"),
        "Christianity": MessageLookupByLibrary.simpleMessage("Christianity"),
        "ClickEnterToSearch":
            MessageLookupByLibrary.simpleMessage("Click Enter to search"),
        "Company": MessageLookupByLibrary.simpleMessage("Company"),
        "CompanyAnswered":
            MessageLookupByLibrary.simpleMessage("Сompany answered"),
        "CompanyCredentials":
            MessageLookupByLibrary.simpleMessage("Company credentials"),
        "CompanyName": MessageLookupByLibrary.simpleMessage("Company name"),
        "CompanyPosition":
            MessageLookupByLibrary.simpleMessage("Company position"),
        "Confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "ContactPerson": MessageLookupByLibrary.simpleMessage("Contact person"),
        "Continue": MessageLookupByLibrary.simpleMessage("Continue"),
        "Create": MessageLookupByLibrary.simpleMessage("Create"),
        "CreateEvent": MessageLookupByLibrary.simpleMessage("Create Event"),
        "CreatePlace": MessageLookupByLibrary.simpleMessage("Create place"),
        "CreateYourPlaceAndInvitePeople": MessageLookupByLibrary.simpleMessage(
            "Create your place and invite people"),
        "CredentialsCodeVerificationSubtitle":
            MessageLookupByLibrary.simpleMessage(
                "Please type verification code sent to"),
        "CredentialsVerificationPrompt": MessageLookupByLibrary.simpleMessage(
            "To gain access you must log in first"),
        "CredentialsVerificationTitle":
            MessageLookupByLibrary.simpleMessage("Happy to see you"),
        "Daily": MessageLookupByLibrary.simpleMessage("Daily "),
        "DateOfBirth": MessageLookupByLibrary.simpleMessage("Date of birth"),
        "Dates": MessageLookupByLibrary.simpleMessage("Dates"),
        "Day": MessageLookupByLibrary.simpleMessage("Day"),
        "Days": m3,
        "DaysOfWeek": MessageLookupByLibrary.simpleMessage("Days of week"),
        "DeleteAccount": MessageLookupByLibrary.simpleMessage("Delete account"),
        "DeleteFromList":
            MessageLookupByLibrary.simpleMessage("Delete from list"),
        "DependingOn": MessageLookupByLibrary.simpleMessage("Depending on..."),
        "DescribeYourBusiness":
            MessageLookupByLibrary.simpleMessage("Describe your business"),
        "DescribeYourClaim":
            MessageLookupByLibrary.simpleMessage("Describe your claim"),
        "DescribeYourIssue":
            MessageLookupByLibrary.simpleMessage("Describe your issue"),
        "DescribeYourWishes":
            MessageLookupByLibrary.simpleMessage("Describe your wishes"),
        "DescribeYourself":
            MessageLookupByLibrary.simpleMessage("Describe yourself"),
        "Description": MessageLookupByLibrary.simpleMessage("Description"),
        "Details": MessageLookupByLibrary.simpleMessage("Details"),
        "Directions": MessageLookupByLibrary.simpleMessage("Directions"),
        "DonationHint": MessageLookupByLibrary.simpleMessage(
            "You can create one request per month and spend money only on your dream"),
        "DonationRaised": m4,
        "DontBeAlone": MessageLookupByLibrary.simpleMessage("Don\'t be alone"),
        "DontMissIt": MessageLookupByLibrary.simpleMessage("Don\'t miss it"),
        "Easy": MessageLookupByLibrary.simpleMessage("Easy"),
        "Edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "EditProfile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
        "EditingTypePlace": m5,
        "Email": MessageLookupByLibrary.simpleMessage("Email"),
        "EmailVerification":
            MessageLookupByLibrary.simpleMessage("Email verification"),
        "EnableHintSystem":
            MessageLookupByLibrary.simpleMessage("Enable hint system"),
        "EnterInputType": m6,
        "EnterNewPassword":
            MessageLookupByLibrary.simpleMessage("Enter new password"),
        "EnterPlaceAddressPrompt": MessageLookupByLibrary.simpleMessage(
            "Please enter place’s address"),
        "EnterYourEmailAddress":
            MessageLookupByLibrary.simpleMessage("Enter your e-mail address"),
        "ErrorOccured": MessageLookupByLibrary.simpleMessage("Error occured"),
        "ErrorOccuredWithoutMessage": MessageLookupByLibrary.simpleMessage(
            "Error occured without message"),
        "Event": MessageLookupByLibrary.simpleMessage("Event"),
        "EventType": MessageLookupByLibrary.simpleMessage("Event type"),
        "Events": MessageLookupByLibrary.simpleMessage("Events"),
        "EventsReminders":
            MessageLookupByLibrary.simpleMessage("Events reminders"),
        "Exit": MessageLookupByLibrary.simpleMessage("Exit"),
        "Fair": MessageLookupByLibrary.simpleMessage("Fair"),
        "Faq": MessageLookupByLibrary.simpleMessage("Faq"),
        "FaqUnderDev": MessageLookupByLibrary.simpleMessage(
            "Gathering requests for FAQ. \nUnder development"),
        "Favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "FeaturesEnableGeolocation":
            MessageLookupByLibrary.simpleMessage("Features enable geolocation"),
        "FeedFeelingsHiwItems": m7,
        "FeedFeelingsHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "you get exactly what you need"),
        "FeedFeelingsHiwTitle":
            MessageLookupByLibrary.simpleMessage("Depending on..."),
        "FeedNichesHiwItems": m8,
        "FeedNichesHiwSubtitle":
            MessageLookupByLibrary.simpleMessage("get exactly what you need"),
        "FeedNichesHiwTitle":
            MessageLookupByLibrary.simpleMessage("Great match..."),
        "FeedRandomizerHiwItems": m9,
        "FeedRandomizerHiwSubtitle":
            MessageLookupByLibrary.simpleMessage("you press and get random"),
        "FeedRandomizerHiwTitle":
            MessageLookupByLibrary.simpleMessage("Randomizing..."),
        "Feeling": MessageLookupByLibrary.simpleMessage("Feeling"),
        "Female": MessageLookupByLibrary.simpleMessage("Female"),
        "Filters": MessageLookupByLibrary.simpleMessage("Filters"),
        "FindSomeoneCardPoints": m10,
        "FindSomeoneCardSameInterests": m11,
        "FindSomeoneToHangOutWith": MessageLookupByLibrary.simpleMessage(
            "Find someone to hang out with"),
        "FindSomeoneToNetworkWith": MessageLookupByLibrary.simpleMessage(
            "Find someone to network with"),
        "Follow": MessageLookupByLibrary.simpleMessage("Follow"),
        "Followers": MessageLookupByLibrary.simpleMessage("Followers"),
        "Followings": MessageLookupByLibrary.simpleMessage("Followings"),
        "For": MessageLookupByLibrary.simpleMessage("For"),
        "ForFormattedPrice": m12,
        "ForPeriod": MessageLookupByLibrary.simpleMessage("For"),
        "ForgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password"),
        "FreePlaces": MessageLookupByLibrary.simpleMessage("\nfree places"),
        "FulfillTheDream":
            MessageLookupByLibrary.simpleMessage("Fulfill the dream"),
        "Gender": MessageLookupByLibrary.simpleMessage("Gender"),
        "GetCode": MessageLookupByLibrary.simpleMessage("Get code"),
        "GetReward": MessageLookupByLibrary.simpleMessage("Get reward"),
        "GetStarted": MessageLookupByLibrary.simpleMessage("Get started"),
        "Go": MessageLookupByLibrary.simpleMessage("Go!"),
        "GoToSettings": MessageLookupByLibrary.simpleMessage("Go to settings"),
        "Guess": MessageLookupByLibrary.simpleMessage("Guess"),
        "HallOfFame": MessageLookupByLibrary.simpleMessage("Hall of Fame"),
        "HardToAnswer": MessageLookupByLibrary.simpleMessage("Hard to answer"),
        "Hardcore": MessageLookupByLibrary.simpleMessage("Hardcore"),
        "HealthKit": MessageLookupByLibrary.simpleMessage("Health Kit"),
        "Helpful": MessageLookupByLibrary.simpleMessage("Helpful"),
        "HelpfulNCount": m13,
        "Hindu": MessageLookupByLibrary.simpleMessage("Hindu"),
        "HintSystemDisabled":
            MessageLookupByLibrary.simpleMessage("Hint system disabled"),
        "HintSystemEnabled": m14,
        "HowAreYouFeelingTonight":
            MessageLookupByLibrary.simpleMessage("How’re you feeling tonight?"),
        "HowItWorks": MessageLookupByLibrary.simpleMessage("How it\nworks"),
        "HowMuchDoYouWantToDonate": MessageLookupByLibrary.simpleMessage(
            "How much \$ do you want to donate?"),
        "IncorrectLoginOrPassword":
            MessageLookupByLibrary.simpleMessage("Incorrect login or password"),
        "InvitationsCanBeViewedInPrivateMessages":
            MessageLookupByLibrary.simpleMessage(
                "Invitations can be viewed in private messages"),
        "Invite": MessageLookupByLibrary.simpleMessage("Invite"),
        "InviteList": MessageLookupByLibrary.simpleMessage("Invite list"),
        "InviteMore": MessageLookupByLibrary.simpleMessage("Invite more"),
        "InvitePeople": MessageLookupByLibrary.simpleMessage("Invite people"),
        "InviteToFavoritePlaces": MessageLookupByLibrary.simpleMessage(
            "Invite to your \"Favorites\""),
        "InvitesNPeopleTo": m15,
        "InvitesYouTo": MessageLookupByLibrary.simpleMessage("Invites you to"),
        "IsRecurrent": MessageLookupByLibrary.simpleMessage("Is recurrent"),
        "Islam": MessageLookupByLibrary.simpleMessage("Islam"),
        "Judaism": MessageLookupByLibrary.simpleMessage("Judaism"),
        "Leisure": MessageLookupByLibrary.simpleMessage("Leisure"),
        "Less": MessageLookupByLibrary.simpleMessage("less"),
        "Loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "Location": MessageLookupByLibrary.simpleMessage("Location"),
        "Logo": MessageLookupByLibrary.simpleMessage("Logo"),
        "LogoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Logo (upload Files)"),
        "LovelyTouchAmazingInteraction": MessageLookupByLibrary.simpleMessage(
            "Lovely-touch amazing\ninteraction"),
        "Male": MessageLookupByLibrary.simpleMessage("Male"),
        "Members": m16,
        "Message": MessageLookupByLibrary.simpleMessage("Message"),
        "Messages": MessageLookupByLibrary.simpleMessage("Messages"),
        "Month": MessageLookupByLibrary.simpleMessage("Month"),
        "Monthly": MessageLookupByLibrary.simpleMessage("Monthly"),
        "More": MessageLookupByLibrary.simpleMessage("more"),
        "MyCard": MessageLookupByLibrary.simpleMessage("My card"),
        "MyEvents": MessageLookupByLibrary.simpleMessage("My events"),
        "NPlace": m17,
        "Name": MessageLookupByLibrary.simpleMessage("Name"),
        "NameOrNickname":
            MessageLookupByLibrary.simpleMessage("Name or nickname"),
        "NewDonates": MessageLookupByLibrary.simpleMessage("New donates"),
        "NewFeatures": MessageLookupByLibrary.simpleMessage("New features"),
        "NewFollowers": MessageLookupByLibrary.simpleMessage("New followers"),
        "NewLocationHasOpenedToday": MessageLookupByLibrary.simpleMessage(
            "A new location has opened today. Come! You\'ll like it!"),
        "NewPlace": MessageLookupByLibrary.simpleMessage("New place"),
        "Next": MessageLookupByLibrary.simpleMessage("Next"),
        "NextElements": m18,
        "NextNPeople": m19,
        "NextWithChevrons": MessageLookupByLibrary.simpleMessage("Next >>>"),
        "Nickname": MessageLookupByLibrary.simpleMessage("Nickname"),
        "NicknameIsTakenTryAnotherOne": MessageLookupByLibrary.simpleMessage(
            "Nickname is taken, try another one"),
        "NoConnection": MessageLookupByLibrary.simpleMessage(
            "Sorry, no internet connection"),
        "NoDateSelected":
            MessageLookupByLibrary.simpleMessage("No date selected"),
        "NoFavoritesFound":
            MessageLookupByLibrary.simpleMessage("No favorites found"),
        "NoHealthKitAvailableOnYourDevice": MessageLookupByLibrary.simpleMessage(
            "No health kit available on your device, so the result will be random"),
        "NoPhotoHereYet":
            MessageLookupByLibrary.simpleMessage("No photo here yet!"),
        "NoPreferencesChosen":
            MessageLookupByLibrary.simpleMessage("No preferences chosen"),
        "NoThx": MessageLookupByLibrary.simpleMessage("No, thx"),
        "NotNow": MessageLookupByLibrary.simpleMessage("Not now"),
        "NotOften": MessageLookupByLibrary.simpleMessage("Not often"),
        "NothingFound": MessageLookupByLibrary.simpleMessage("Nothing found"),
        "NothingWasFoundWithEmoji":
            MessageLookupByLibrary.simpleMessage("Nothing was found :c"),
        "Notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "NowLetsGetToKnowEachOther": MessageLookupByLibrary.simpleMessage(
            "Now let\'s get to know each other"),
        "Off": MessageLookupByLibrary.simpleMessage("Off"),
        "Ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "OkayCool": MessageLookupByLibrary.simpleMessage("Okay, cool!"),
        "OnboardingSlide1":
            MessageLookupByLibrary.simpleMessage("to have some fun"),
        "OnboardingSlide2": MessageLookupByLibrary.simpleMessage(
            "to explore\nleisure and\nbusiness"),
        "OnboardingSlide3":
            MessageLookupByLibrary.simpleMessage("to just chill out"),
        "Ooops": MessageLookupByLibrary.simpleMessage("Ooops!"),
        "OopsIWillTryAgain":
            MessageLookupByLibrary.simpleMessage("Oops, I\'ll try again"),
        "OpenFrom": MessageLookupByLibrary.simpleMessage("Open from"),
        "OpenTo": MessageLookupByLibrary.simpleMessage("Open to"),
        "OpeningHours": MessageLookupByLibrary.simpleMessage("Opening hours"),
        "OrDragFilesHere":
            MessageLookupByLibrary.simpleMessage("Or drag files here"),
        "Other": MessageLookupByLibrary.simpleMessage("Other"),
        "OurRecommendationsAboutGeolocation": MessageLookupByLibrary.simpleMessage(
            "Our recommendation system is based on many factors. Geolocation is only part of the system, which will allow us to correctly prioritize, both in terms of distance and the nearest landscape features (mountains, reservoirs, plains, deserts)"),
        "Password": MessageLookupByLibrary.simpleMessage("Password"),
        "PasswordConditions": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one uppercase letter, one lowercase letter, one number and one special character"),
        "PasswordHint": MessageLookupByLibrary.simpleMessage(
            "Letters, numbers, ! “ @ # \$ % & symbols, 8 characters"),
        "PasswordMustBeAtLeast8Characters":
            MessageLookupByLibrary.simpleMessage(
                "Password must be at least 8 characters"),
        "Permissions": MessageLookupByLibrary.simpleMessage("Permissions"),
        "Personal": MessageLookupByLibrary.simpleMessage("Personal"),
        "PersonalCredentials":
            MessageLookupByLibrary.simpleMessage("Personal credentials"),
        "Phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "PhoneVerification":
            MessageLookupByLibrary.simpleMessage("Phone verification"),
        "Photo": MessageLookupByLibrary.simpleMessage("Photo"),
        "PhotoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Photo (upload Files)"),
        "Photos": MessageLookupByLibrary.simpleMessage("Photos"),
        "PickFromMap": MessageLookupByLibrary.simpleMessage("Pick from map"),
        "Place": MessageLookupByLibrary.simpleMessage("Place"),
        "PlaceType": MessageLookupByLibrary.simpleMessage("Place type"),
        "Places": MessageLookupByLibrary.simpleMessage("Places"),
        "PleaseFillOutDate":
            MessageLookupByLibrary.simpleMessage("Please fill out date"),
        "PleaseFillOutYourWishes":
            MessageLookupByLibrary.simpleMessage("Please fill out your wishes"),
        "PleaseSelectANiche":
            MessageLookupByLibrary.simpleMessage("Please select a niche"),
        "PleaseSelectAtLeastNReligion": m20,
        "PleaseSelectAtLeastOneAgeRange": MessageLookupByLibrary.simpleMessage(
            "Please select at least one age range"),
        "PleaseSelectAtLeastOneTargetAudience":
            MessageLookupByLibrary.simpleMessage(
                "Please select at least one target audience"),
        "PleaseSelectGender":
            MessageLookupByLibrary.simpleMessage("Please select a gender"),
        "PleaseSelectOneType":
            MessageLookupByLibrary.simpleMessage("Please select one type"),
        "PointBalance": MessageLookupByLibrary.simpleMessage("Point\nBalance"),
        "Points": MessageLookupByLibrary.simpleMessage("Points"),
        "Position": MessageLookupByLibrary.simpleMessage("Position"),
        "Preferences": MessageLookupByLibrary.simpleMessage("Preferences"),
        "Premium": MessageLookupByLibrary.simpleMessage("Premium"),
        "PremiumAccount":
            MessageLookupByLibrary.simpleMessage("Premium account"),
        "PremiumSubscriptionFeature1": MessageLookupByLibrary.simpleMessage(
            "Unique feature \"Connects\".  Search, communicate, meet someone, networking"),
        "PremiumSubscriptionFeature2":
            MessageLookupByLibrary.simpleMessage("Special profile label"),
        "PremiumSubscriptionFeature3": MessageLookupByLibrary.simpleMessage(
            "Ability to leave reviews, shoot video-reactions about places and events, participate in ratings"),
        "PremiumSubscriptionFeature4": MessageLookupByLibrary.simpleMessage(
            "Ability to add/suggest favorite places"),
        "PremiumSubscriptionFeature5": MessageLookupByLibrary.simpleMessage(
            "Ability to switch dark/light design theme"),
        "PremiumSubscriptionFeature6": MessageLookupByLibrary.simpleMessage(
            "Ability to become an Influencer"),
        "Price": MessageLookupByLibrary.simpleMessage("Price"),
        "Privacy": MessageLookupByLibrary.simpleMessage("Privacy"),
        "PrivacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "Pro": MessageLookupByLibrary.simpleMessage("Pro"),
        "ProAccount": MessageLookupByLibrary.simpleMessage("Pro account"),
        "ProSubscriptionFeature1":
            MessageLookupByLibrary.simpleMessage("Special profile label"),
        "ProSubscriptionFeature2": MessageLookupByLibrary.simpleMessage(
            "Ability to create your own events"),
        "ProSubscriptionFeature3": MessageLookupByLibrary.simpleMessage(
            "Additional motivation of potential audience (clients/visitors) with the help of points system"),
        "ProSubscriptionFeature4": MessageLookupByLibrary.simpleMessage(
            "Ability to sell related services through ticket booking"),
        "ProSubscriptionFeature5":
            MessageLookupByLibrary.simpleMessage("Upsales"),
        "ProSubscriptionFeature6": MessageLookupByLibrary.simpleMessage(
            "Internal targeted promotion of your events, statistics and analytics"),
        "ProSubscriptionFeature7": MessageLookupByLibrary.simpleMessage(
            "Ability to use specialised notifications"),
        "ProfileAskOrSupportHiwHint": m21,
        "ProfileAskOrSupportHiwSubtitle":
            MessageLookupByLibrary.simpleMessage("yours or someone else\'s"),
        "ProfileAskOrSupportHiwTitle":
            MessageLookupByLibrary.simpleMessage("Fulfill the dream..."),
        "ProfileFindSomeoneHiwHint": m22,
        "ProfileFindSomeoneHiwSubtitle":
            MessageLookupByLibrary.simpleMessage("go somewhere together"),
        "ProfileFindSomeoneHiwTitle":
            MessageLookupByLibrary.simpleMessage("Do not be alone..."),
        "Published": MessageLookupByLibrary.simpleMessage("Published"),
        "Read": m23,
        "Recommended": MessageLookupByLibrary.simpleMessage("Recommended"),
        "ResendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
        "ResetFilters": MessageLookupByLibrary.simpleMessage("Reset filters"),
        "ResetPassword": MessageLookupByLibrary.simpleMessage("Reset password"),
        "Save": MessageLookupByLibrary.simpleMessage("Save"),
        "Search": MessageLookupByLibrary.simpleMessage("Search"),
        "SearchHiwHint": m24,
        "SearchHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "search or choose others choice"),
        "SearchHiwTitle":
            MessageLookupByLibrary.simpleMessage("Usual search..."),
        "SeeAll": MessageLookupByLibrary.simpleMessage("See all"),
        "SeeMore": MessageLookupByLibrary.simpleMessage("See more"),
        "SelectDate": MessageLookupByLibrary.simpleMessage("Select date"),
        "SelectDays": MessageLookupByLibrary.simpleMessage("Select days "),
        "SelectLanguage":
            MessageLookupByLibrary.simpleMessage("Please select language"),
        "SelectOption": MessageLookupByLibrary.simpleMessage("Select option"),
        "SelectType": m25,
        "SelectYourReligions":
            MessageLookupByLibrary.simpleMessage("Select your religions"),
        "SelectionOfTheBest":
            MessageLookupByLibrary.simpleMessage("Selection of the best"),
        "Send": MessageLookupByLibrary.simpleMessage("Send"),
        "SendIt": MessageLookupByLibrary.simpleMessage("Send it"),
        "Services": MessageLookupByLibrary.simpleMessage("Services"),
        "Settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "ShowResult": MessageLookupByLibrary.simpleMessage("Show result"),
        "Shuffle": MessageLookupByLibrary.simpleMessage("Shuffle"),
        "ShuffleHiwHint": m26,
        "ShuffleHiwSubtitle":
            MessageLookupByLibrary.simpleMessage("finding personalized places"),
        "ShuffleHiwTitle":
            MessageLookupByLibrary.simpleMessage("Shuffling places..."),
        "ShuffleWithRightWhitespace":
            MessageLookupByLibrary.simpleMessage("Shuffle "),
        "Skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "Small": MessageLookupByLibrary.simpleMessage("Small"),
        "SmartLeisureSelection": MessageLookupByLibrary.simpleMessage(
            "Smart leisure selection for everyone, everywhere."),
        "SocialSubtitle":
            MessageLookupByLibrary.simpleMessage("Useful services and places"),
        "Spent": MessageLookupByLibrary.simpleMessage("Spent"),
        "SpinnerHiwHint": m27,
        "SpinnerHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "you find personalized events"),
        "SpinnerHiwTitle":
            MessageLookupByLibrary.simpleMessage("You spin it..."),
        "SpinnerTitle": MessageLookupByLibrary.simpleMessage(
            "Events you don\'t wanna miss"),
        "StartToExplore":
            MessageLookupByLibrary.simpleMessage("Start to explore"),
        "Sunny": MessageLookupByLibrary.simpleMessage("Sunny"),
        "Support": MessageLookupByLibrary.simpleMessage("Support"),
        "SupportPeopleAroundYou":
            MessageLookupByLibrary.simpleMessage("Support people around you"),
        "SwipeToStart": MessageLookupByLibrary.simpleMessage("Swipe to start"),
        "SwitchAnyTime": MessageLookupByLibrary.simpleMessage(
            "You can switch it at any time in your profile settings"),
        "Tags": MessageLookupByLibrary.simpleMessage("Tags"),
        "TapIt": MessageLookupByLibrary.simpleMessage("Tap it"),
        "TapOnceToChoose":
            MessageLookupByLibrary.simpleMessage("Tap once to choose"),
        "TapToSeeMore": MessageLookupByLibrary.simpleMessage("Tap to see more"),
        "TapToSetAddress":
            MessageLookupByLibrary.simpleMessage("Tap to set address"),
        "TapTwiceToMarkYourFavorites": MessageLookupByLibrary.simpleMessage(
            ". Tap twice to mark your favorites."),
        "TellUsMoreAboutYourself": m28,
        "Terms": MessageLookupByLibrary.simpleMessage("Terms"),
        "TermsOfService":
            MessageLookupByLibrary.simpleMessage("Terms of Service"),
        "ThatsAllForNow":
            MessageLookupByLibrary.simpleMessage("That\'s all for now!"),
        "TheMoreInfoWeAboutYouGetTheBetter":
            MessageLookupByLibrary.simpleMessage(
                "The more info we get about you, the better"),
        "TheMoreInfoWeGetTheBetter": MessageLookupByLibrary.simpleMessage(
            "The more info we get, the better "),
        "ThenCheckThisOut":
            MessageLookupByLibrary.simpleMessage("Then check this out"),
        "ThisIs": MessageLookupByLibrary.simpleMessage("This is"),
        "ThroughANonAggregatorSystem": MessageLookupByLibrary.simpleMessage(
            "Through a non-\naggregator system \nespecially for you"),
        "Time": MessageLookupByLibrary.simpleMessage("Time"),
        "Title": MessageLookupByLibrary.simpleMessage("Title"),
        "ToAccessAll": MessageLookupByLibrary.simpleMessage("To access all"),
        "ToAllowAccessGoToSettings": MessageLookupByLibrary.simpleMessage(
            "To allow access to send push notifications, go to your phone settings"),
        "Today": MessageLookupByLibrary.simpleMessage("Today"),
        "TopNDonatorsReceiveXPoints": m29,
        "TopPlacesRatedBy": m30,
        "TryYourself": MessageLookupByLibrary.simpleMessage("Try\nyourself"),
        "TypeHere": MessageLookupByLibrary.simpleMessage("Type here"),
        "TypeOfContent":
            MessageLookupByLibrary.simpleMessage("Type of content"),
        "Undefined": MessageLookupByLibrary.simpleMessage("Undefined"),
        "UnderDevelopmentMessage":
            MessageLookupByLibrary.simpleMessage("Under development"),
        "UnderService": MessageLookupByLibrary.simpleMessage("Under service"),
        "UniqueProperties":
            MessageLookupByLibrary.simpleMessage("Unique properties"),
        "UpcomingEvent": MessageLookupByLibrary.simpleMessage("Upcoming Event"),
        "UpcomingGlobalEvents":
            MessageLookupByLibrary.simpleMessage("Upcoming globals"),
        "Update": MessageLookupByLibrary.simpleMessage("Update"),
        "UpgradeAccount": m31,
        "UpgradeAccountConfirmation":
            MessageLookupByLibrary.simpleMessage("Upgrade"),
        "UpgradeForNmoney": m32,
        "User": MessageLookupByLibrary.simpleMessage("User"),
        "UserTypeSelectionPrompt": MessageLookupByLibrary.simpleMessage(
            "Select the type of account you would like to create"),
        "Users": m33,
        "UsingHealthKit":
            MessageLookupByLibrary.simpleMessage("Using health kit"),
        "ValueMustBeAtLeast3Characters": MessageLookupByLibrary.simpleMessage(
            "Value must be at least 3 characters long"),
        "Video": MessageLookupByLibrary.simpleMessage("Video"),
        "VideoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Video (upload Files)"),
        "ViewAll": MessageLookupByLibrary.simpleMessage("View all"),
        "VisitFirstToOpenNext":
            MessageLookupByLibrary.simpleMessage("Visit first to open next"),
        "WeDoNotSpamAllKindsOfNotifications": MessageLookupByLibrary.simpleMessage(
            "We do not spam all kinds of notifications and advertisements. Only those notifications that may be important to you and match your preferences"),
        "WeHavePlacesJustForYou":
            MessageLookupByLibrary.simpleMessage("We have places just for you"),
        "WeWillLetKnowResults": MessageLookupByLibrary.simpleMessage(
            "We will let you know the results"),
        "Weather": MessageLookupByLibrary.simpleMessage("Weather"),
        "Website": MessageLookupByLibrary.simpleMessage("Website"),
        "Welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
        "WhatIs": MessageLookupByLibrary.simpleMessage("What is \n"),
        "WhatYouLike": MessageLookupByLibrary.simpleMessage("What you like"),
        "WhiteTheme": MessageLookupByLibrary.simpleMessage("White theme"),
        "WillBe": MessageLookupByLibrary.simpleMessage(" will be."),
        "WillBeImplementedSoon":
            MessageLookupByLibrary.simpleMessage("Will be implemented soon"),
        "WithYourPreferences":
            MessageLookupByLibrary.simpleMessage("With your\npreferences"),
        "WorkHours": MessageLookupByLibrary.simpleMessage("Work hours"),
        "WrongSecurityCode":
            MessageLookupByLibrary.simpleMessage("Wrong security code"),
        "XCouldNotBeEmpty": m34,
        "XIsRequired": m35,
        "XSuccessfullyUpdated": m36,
        "Year": MessageLookupByLibrary.simpleMessage("Year"),
        "Yearly": MessageLookupByLibrary.simpleMessage("Yearly"),
        "Yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "YouBetterCheckThisOut":
            MessageLookupByLibrary.simpleMessage("You better check this out"),
        "YouGetExactlyWhatYouNeed": MessageLookupByLibrary.simpleMessage(
            "You get exactly what you need"),
        "YouSentInvitationToNPeople": m37,
        "YoullFindIt": MessageLookupByLibrary.simpleMessage("You’ll find it"),
        "YourAge": MessageLookupByLibrary.simpleMessage("Your age"),
        "YourAudience": MessageLookupByLibrary.simpleMessage("Your audience"),
        "YourAudienceAge":
            MessageLookupByLibrary.simpleMessage("Your audience age"),
        "YourClaimHasBeenSent":
            MessageLookupByLibrary.simpleMessage("Your claim has been sent"),
        "YourEmail": MessageLookupByLibrary.simpleMessage("Your email"),
        "YourLeisureSelection":
            MessageLookupByLibrary.simpleMessage("Your leisure selection"),
        "YourName": MessageLookupByLibrary.simpleMessage("Your name"),
        "YourNiche": MessageLookupByLibrary.simpleMessage("Your niche"),
        "YourPosition": MessageLookupByLibrary.simpleMessage("Your position"),
        "YourTraffic": MessageLookupByLibrary.simpleMessage("Your traffic"),
        "daynight": MessageLookupByLibrary.simpleMessage("Day and night"),
        "key": MessageLookupByLibrary.simpleMessage("")
      };
}
