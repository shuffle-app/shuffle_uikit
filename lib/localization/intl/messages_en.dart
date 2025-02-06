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

  static String m0(value) => "All ${value} features are now available!";

  static String m1(allowValue) => "Continue to ${allowValue}";

  static String m2(allowedCharacters) =>
      "Allowed caracters are ${allowedCharacters}";

  static String m3(x) => "Are you sure want to archive ${x}?";

  static String m4(x) => "Book it (+${x})";

  static String m5(count) =>
      "${count} ${Intl.plural(count, zero: 'bookings', one: 'booking', two: 'bookings', few: 'bookings', many: 'bookings', other: 'bookings')}";

  static String m6(count) =>
      "${Intl.plural(count, zero: 'bookings', one: 'booking', two: 'bookings', few: 'bookings', many: 'bookings', other: 'bookings')}";

  static String m7(sum, currency) => "Budget ${sum}${currency}";

  static String m8(count) =>
      "${count} ${Intl.plural(count, zero: 'cards', one: 'card', two: 'cards', few: 'cards', many: 'cards', other: 'cards')} ${Intl.plural(count, zero: 'openings', one: 'opening', two: 'openings', few: 'openings', many: 'openings', other: 'openings')}";

  static String m9(creationDate, deletionDate) =>
      "Created on ${creationDate}.\nWill be deleted on ${deletionDate}";

  static String m10(item) =>
      "${Intl.plural(item, zero: '3 difficulty levels', one: 'visit first to open next', two: 'visit & check in', few: 'pass & be rewarded', other: 'pass & be rewarded')}";

  static String m11(x) => "The city is automatically detected as ${x}.";

  static String m12(count) =>
      "${Intl.plural(count, zero: 'comments', one: 'comment', two: 'comments', few: 'comments', many: 'comments', other: 'comments')}";

  static String m13(progress) => "Compressing video ${progress}%";

  static String m14(count) =>
      "${count} ${Intl.plural(count, zero: 'connects', one: 'connect', two: 'connect', few: 'connect', many: 'connect', other: 'connect')}";

  static String m15(count) =>
      "${count} content ${Intl.plural(count, zero: 'offers', one: 'offer', two: 'offers', few: 'offers', many: 'offers', other: 'offers')}";

  static String m16(count) => "${count} Reviews";

  static String m17(count) => "${count} Video-Reaction";

  static String m18(count) => "Create a USP for \$${count} for your clients";

  static String m19(x, y) =>
      "Create a new ${x} for your ${y} and increase attendance";

  static String m20(days) =>
      "${Intl.plural(days, zero: 'days', one: 'day', two: 'days', few: 'days', many: 'days', other: 'days')}";

  static String m21(x) => "Are you sure want to delete ${x} forever?";

  static String m22(actuallyRaised, goal) =>
      "raised ${actuallyRaised}/\$${goal}\$";

  static String m23(editingType) => "${editingType} place";

  static String m24(inputType) => "Enter ${inputType}";

  static String m25(title) => "Enter ${title}";

  static String m26(x) => "Failed to connect to ${x}";

  static String m27(count) =>
      "${Intl.plural(count, zero: 'events', one: 'event', two: 'events', few: 'events', many: 'events', other: 'events')}";

  static String m28(item) =>
      "${Intl.plural(item, zero: 'drag & and drop cards', one: 'create and name stack', two: 'line up stacks order', few: 'share your stacks', other: 'share your stacks')}";

  static String m29(item) =>
      "${Intl.plural(item, zero: 'your location', one: 'your interests', two: 'weather around', few: 'and other 14 scales', other: 'and other 14 scales')}";

  static String m30(item) =>
      "${Intl.plural(item, zero: 'select the niche', one: 'press', two: 'get selection', few: 'choose & plan', other: 'choose & plan')}";

  static String m31(item) =>
      "${Intl.plural(item, zero: 'events & places', one: 'filtering by chips', two: 'choose chip & press', few: 'press & scroll\n', other: 'press & scroll\n')}";

  static String m32(count) =>
      "${count} ${Intl.plural(count, zero: 'Feedback', one: 'Feedback', two: 'Feedbacks', few: 'Feedbacks', many: 'Feedbacks', other: 'Feedbacks')}";

  static String m33(count) =>
      "${count} ${Intl.plural(count, zero: 'feelings', one: 'feeling', two: 'feelings', few: 'feelings', many: 'feelings', other: 'feelings')} guesses";

  static String m34(count) =>
      "${Intl.plural(count, zero: '${count} points', one: '${count} point', two: '${count} points', few: '${count} points', many: '${count} points', other: '${count} points')}";

  static String m35(count) =>
      "${Intl.plural(count, zero: '${count} common interests', one: '${count} common interest', two: '${count} common interests', few: '${count} common interests', many: '${count} common interests', other: '${count} common interests')}";

  static String m36(count) =>
      "${Intl.plural(count, zero: 'followers', one: 'follower', two: 'followers', few: 'followers', many: 'followers', other: 'followers')}";

  static String m37(formattedPrice) => "For ${formattedPrice}";

  static String m38(count) => "Free now, ${count}\$ later";

  static String m39(from, to) =>
      "${from} - ${to} ${Intl.plural(from, zero: 'y.o.', one: 'y.o.', two: 'y.o.', few: 'y.o.', many: 'y.o.', other: 'y.o.')}";

  static String m40(helpfulCount) => "Helpful ${helpfulCount}";

  static String m41(days) =>
      "Hint system enabled for ${Intl.plural(days, zero: '${days} days', one: '${days} day', two: '${days} days', few: '${days} days', many: '${days} days', other: '${days} days')}";

  static String m42(hours) => "${hours}h ago";

  static String m43(count) =>
      "${count} ${Intl.plural(count, zero: 'invites', one: 'invite', two: 'invites', few: 'invites', many: 'invites', other: 'invites')}";

  static String m44(invitedPeopleCount) =>
      "Invites ${Intl.plural(invitedPeopleCount, zero: '${invitedPeopleCount} people', one: '${invitedPeopleCount} person', two: '${invitedPeopleCount} people', few: '${invitedPeopleCount} people', many: '${invitedPeopleCount} people', other: '${invitedPeopleCount} people')}";

  static String m45(invitedPeopleCount) =>
      "Invites ${Intl.plural(invitedPeopleCount, zero: '${invitedPeopleCount} people', one: '${invitedPeopleCount} person', two: '${invitedPeopleCount} people', few: '${invitedPeopleCount} people', many: '${invitedPeopleCount} people', other: '${invitedPeopleCount} people')} to";

  static String m46(count) =>
      "${Intl.plural(count, zero: 'leasure & business events & places', one: 'locked sections & functions', two: 'points, rewards & money', few: 'invites, chats, hang outs', other: 'Premium, PRO & organisation, Influencer accounts (use & create content)')}";

  static String m47(count) =>
      "Login in ${count} ${Intl.plural(count, zero: 'days', one: 'day', two: 'days', few: 'days', many: 'days', other: 'days')} in a row";

  static String m48(provider) => "Continue with ${provider}";

  static String m49(item) =>
      "${Intl.plural(item, zero: 'Members', one: 'Member', two: 'Members', few: 'Members', other: 'Members')}";

  static String m50(count) =>
      "${Intl.plural(count, zero: '${count} members', one: '${count} member', two: '${count} members', few: '${count} members', many: '${count} members', other: '${count} members')}";

  static String m51(minutes) => "${minutes}m ago";

  static String m52(placeIndex) => "${placeIndex} place";

  static String m53(elements) => "Next ${elements}";

  static String m54(amountOfPeople) => "Next ${amountOfPeople} people";

  static String m55(count) => "Offer price ${count}\$";

  static String m56(count) =>
      "${Intl.plural(count, zero: 'visits', one: 'visit', two: 'visits', few: 'visits', many: 'visits', other: 'visits')}";

  static String m57(x) => "Please enter a valid ${x} link";

  static String m58(religionCount) =>
      "Please select at least ${religionCount} religion";

  static String m59(x) =>
      "Please validate ${x} details before sending it to moderation";

  static String m60(count) =>
      "${Intl.plural(count, zero: '+${count} comments', one: '+${count} comment', two: '+${count} comments', few: '+${count} comments', many: '+${count} comments', other: '+${count} comments')}";

  static String m61(count) =>
      "${Intl.plural(count, zero: '+${count} respects', one: '+${count} respect', two: '+${count} respects', few: '+${count} respects', many: '+${count} respects', other: '+${count} respects')}";

  static String m62(count) =>
      "${Intl.plural(count, zero: '+${count} New reviews', one: '+${count} New review', two: '+${count} New reviews', few: '+${count} New reviews', many: '+${count} New reviews', other: '+${count} New reviews')}";

  static String m63(count) =>
      "${Intl.plural(count, zero: '+${count} video-reactions', one: '+${count} video-reaction', two: '+${count} video-reactions', few: '+${count} video-reactions', many: '+${count} video-reactions', other: '+${count} video-reactions')}";

  static String m64(count) =>
      "${Intl.plural(count, zero: '+${count} New voices', one: '+${count} New voice', two: '+${count} New voices', few: '+${count} New voices', many: '+${count} New voices', other: '+${count} New voices')}";

  static String m65(count) =>
      "${Intl.plural(count, zero: '+${count} Photos', one: '+${count} Photo', two: '+${count} Photos', few: '+${count} Photos', many: '+${count} Photos', other: '+${count} Photos')}";

  static String m66(count) =>
      "${Intl.plural(count, zero: 'points', one: 'point', two: 'points', few: 'points', many: 'points', other: 'points')}";

  static String m67(count) =>
      "${Intl.plural(count, zero: 'points', one: 'point', two: 'points', few: 'points', many: 'points', other: 'points')}";

  static String m68(item) =>
      "${Intl.plural(item, zero: 'reputation and currency', one: 'increase rating or spend', two: 'perform actions', few: 'earn points', other: 'earn points')}";

  static String m69(count) =>
      "${Intl.plural(count, zero: 'Points', one: 'Point', two: 'Points', few: 'Points', many: 'Points', other: 'Points')} ";

  static String m70(count) =>
      "${count} ${Intl.plural(count, zero: 'product', one: 'products', two: 'products', few: 'products', many: 'products', other: 'products')}";

  static String m71(item) =>
      "${Intl.plural(item, zero: 'post a dream request', one: 'write & make video', two: 'be convincing and honest', few: 'donate others', other: 'donate others')}";

  static String m72(item) =>
      "${Intl.plural(item, zero: 'find companions', one: 'similar preferences', two: 'check point reputation', few: 'no foes', other: 'no foes')}";

  static String m73(count) =>
      "${count} ${Intl.plural(count, zero: 'reactions', one: 'reaction', two: 'reactions', few: 'reactions', many: 'reactions', other: 'reactions')}";

  static String m74(amount) => "Read ${amount}";

  static String m75(message) => "Replying to ${message}";

  static String m76(count) =>
      "${count} ${Intl.plural(count, zero: 'Reviews', one: 'Review', two: 'Reviews', few: 'Reviews', many: 'Reviews', other: 'Reviews')}";

  static String m77(count) =>
      "${Intl.plural(count, zero: 'reviews', one: 'review', two: 'reviews', few: 'reviews', many: 'reviews', other: 'reviews')}";

  static String m78(count) =>
      "${Intl.plural(count, zero: 'reviews', one: 'review', two: 'reviews', few: 'reviews', many: 'reviews', other: 'reviews')}";

  static String m79(item) =>
      "${Intl.plural(item, zero: 'preferences don’t work', one: 'events/places', two: 'type & get result', few: 'use ratings & models', other: 'use ratings & models')}";

  static String m80(count) =>
      "${Intl.plural(count, zero: 'Content recommendation system especially for you', one: 'Meeting like-minded people using the user matching system', two: 'Every time new places and events that suit you', other: 'It\'s easier to find the right people, and for them to find you')}";

  static String m81(type) => "select ${type}";

  static String m82(count) =>
      "${count} ${Intl.plural(count, zero: 'card', one: 'card', two: 'cards', few: 'cards', many: 'cards', other: 'cards')} ${Intl.plural(count, zero: 'shares', one: 'share', two: 'shares', few: 'shares', many: 'shares', other: 'shares')}";

  static String m83(x) => "Show ${x} in profile";

  static String m84(item) =>
      "${Intl.plural(item, zero: 'swipe any direction', one: 'swipe place qualities', two: 'like dislike favorite', few: 'teach our system', other: 'teach our system')}";

  static String m85(count) =>
      "Spend ${count} ${Intl.plural(count, zero: 'hours', one: 'hour', two: 'hours', few: 'hours', many: 'hours', other: 'hours')} per week";

  static String m86(item) =>
      "${Intl.plural(item, zero: 'for fun', one: 'swipe category', two: 'choose & plan', few: 'search & book', other: 'search & book')}";

  static String m87(count) =>
      "${count} ${Intl.plural(count, zero: 'stacks', one: 'stack', two: 'stacks', few: 'stacks', many: 'stacks', other: 'stacks')} ${Intl.plural(count, zero: 'shares', one: 'share', two: 'shares', few: 'shares', many: 'shares', other: 'shares')}";

  static String m88(x) => "Status: ${x} - Available";

  static String m89(x) =>
      "Status ${x} - Access is restricted or the page is not found";

  static String m90(separator) => "Tell us more${separator}about yourself";

  static String m91(count) =>
      "${count} ${Intl.plural(count, zero: 'tickets', one: 'ticket', two: 'tickets', few: 'tickets', many: 'tickets', other: 'tickets')} form";

  static String m92(count) =>
      "${count} ${Intl.plural(count, zero: 'tickets', one: 'ticket', two: 'tickets', few: 'tickets', many: 'tickets', other: 'tickets')}";

  static String m93(date) => "Top events for ${date}";

  static String m94(amountOfTopDonators, multiplier) =>
      "Top ${amountOfTopDonators} donators receive x${multiplier} points";

  static String m95(separator) => "Top content rated${separator}by";

  static String m96(x) => "You will send ${x} to moderation";

  static String m97(type) => "To use this function plz upgrade to ${type}";

  static String m98(forNMoney) => "Upgrade ${forNMoney}";

  static String m99(count) =>
      "${count} upsales ${Intl.plural(count, zero: 'product', one: 'products', two: 'products', few: 'products', many: 'products', other: 'products')} from";

  static String m100(count) =>
      "${Intl.plural(count, zero: '${count} users', one: '${count} user', two: '${count} users', few: '${count} users', many: '${count} users', other: '${count} users')}";

  static String m101(days) =>
      "in ${days} ${Intl.plural(days, zero: 'days', one: 'day', two: 'days', few: 'days', many: 'days', other: 'days')}";

  static String m102(value) => "${value} could not be empty";

  static String m103(x, y) => "${x} invites ${y}";

  static String m104(title) => "${title} is required";

  static String m105(x) => "${x} successfully activated";

  static String m106(x) => "${x} successfully created";

  static String m107(value) => "${value} successfully updated";

  static String m108(years) =>
      "${years}+ ${Intl.plural(years, zero: 'y.o.', one: 'y.o.', two: 'y.o.', few: 'y.o.', many: 'y.o.', other: 'y.o.')}";

  static String m109(years) =>
      "${years} ${Intl.plural(years, zero: 'y.o.', one: 'y.o.', two: 'y.o.', few: 'y.o.', many: 'y.o.', other: 'y.o.')}";

  static String m110(x) => "You can see your ${x} in the promotion menu";

  static String m111(amountOfInvitedPersons) =>
      "You sent an invitation to ${amountOfInvitedPersons} people";

  static String m112(name) => "Sure you want to delete ${name}?";

  static String m113(name) => "You can no longer send messages to ${name}";

  static String m114(x) => "in ${x} days";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "APeriodOrPartOfPeriodOfTimeCannotBeInPast":
        MessageLookupByLibrary.simpleMessage(
          "A period or part of a period of time cannot be in the past",
        ),
    "AboutUs": MessageLookupByLibrary.simpleMessage("about us"),
    "AcceptDonations": MessageLookupByLibrary.simpleMessage(
      "Accept donations or help others realize their dreams",
    ),
    "Account": MessageLookupByLibrary.simpleMessage("Account"),
    "Accrual": MessageLookupByLibrary.simpleMessage("Accrual"),
    "Activation": MessageLookupByLibrary.simpleMessage("Activation"),
    "ActivityType": MessageLookupByLibrary.simpleMessage("Activity type"),
    "ActivityTypes": MessageLookupByLibrary.simpleMessage("Activity types"),
    "Add": MessageLookupByLibrary.simpleMessage("Add"),
    "AddCategory": MessageLookupByLibrary.simpleMessage("Add category"),
    "AddFeedback": MessageLookupByLibrary.simpleMessage("Add feedback"),
    "AddFeedbackFieldHint": MessageLookupByLibrary.simpleMessage(
      "Tell us what you liked or remember",
    ),
    "AddFeedbackFieldTitle": MessageLookupByLibrary.simpleMessage(
      "Describe your experience",
    ),
    "AddImage": MessageLookupByLibrary.simpleMessage("Add Image"),
    "AddInfluencerFeedbackPopOverText": MessageLookupByLibrary.simpleMessage(
      "Write a detailed review, use all the available characters so that as many people as possible can appreciate it",
    ),
    "AddLink": MessageLookupByLibrary.simpleMessage("Add link"),
    "AddPhotoHere": MessageLookupByLibrary.simpleMessage("Add photo here"),
    "AddPlaceType": MessageLookupByLibrary.simpleMessage("Add place type"),
    "AddPromotion": MessageLookupByLibrary.simpleMessage("Add promotion"),
    "AddProperty": MessageLookupByLibrary.simpleMessage("Add property"),
    "AddReactions": MessageLookupByLibrary.simpleMessage("Add reaction"),
    "AddReview": MessageLookupByLibrary.simpleMessage("Add review"),
    "AddReviewFieldHint": MessageLookupByLibrary.simpleMessage(
      "Write a useful addition",
    ),
    "AddReviewFieldTitle": MessageLookupByLibrary.simpleMessage(
      "Describe your experience",
    ),
    "AddReviewPopOverText": MessageLookupByLibrary.simpleMessage(
      "Write an addition to the review that will be useful for other visitors.",
    ),
    "AddToMyFavorites": MessageLookupByLibrary.simpleMessage(
      "Add to my favorites",
    ),
    "AddToPersonalTop": MessageLookupByLibrary.simpleMessage(
      "Add to personal TOP",
    ),
    "AddToScheduler": MessageLookupByLibrary.simpleMessage("Add to scheduler"),
    "AddYourselfToList": MessageLookupByLibrary.simpleMessage(
      "Add yourself to list",
    ),
    "Address": MessageLookupByLibrary.simpleMessage("Address"),
    "Admin": MessageLookupByLibrary.simpleMessage("Admin"),
    "Age": MessageLookupByLibrary.simpleMessage("Age"),
    "Album": MessageLookupByLibrary.simpleMessage("Album"),
    "Albums": MessageLookupByLibrary.simpleMessage("Albums"),
    "AllAlbums": MessageLookupByLibrary.simpleMessage("All albums"),
    "AllAppNotification": MessageLookupByLibrary.simpleMessage(
      "All app notifications",
    ),
    "AllXFeaturesAvailable": m0,
    "Allow": MessageLookupByLibrary.simpleMessage("Allow"),
    "AllowAll": MessageLookupByLibrary.simpleMessage("Allow all"),
    "AllowGeolocation": MessageLookupByLibrary.simpleMessage(
      "Continue to use geolocation",
    ),
    "AllowLocationServicesToUseThisFunction":
        MessageLookupByLibrary.simpleMessage(
          "Allow location services to use this function",
        ),
    "AllowX": m1,
    "AllowedCaracters": m2,
    "AlreadyHaveActiveReminder": MessageLookupByLibrary.simpleMessage(
      "You have already created one reminder. To create a new one, pause or remove the previous one.",
    ),
    "AlreadyInvited": MessageLookupByLibrary.simpleMessage(
      "Plz respect your choice and others\' feelings",
    ),
    "AndGet": MessageLookupByLibrary.simpleMessage("And get"),
    "AndWithWhitespaces": MessageLookupByLibrary.simpleMessage(" And "),
    "AnotherReason": MessageLookupByLibrary.simpleMessage("Another reason"),
    "Archive": MessageLookupByLibrary.simpleMessage("Archive"),
    "ArchiveXAlert": m3,
    "Archived": MessageLookupByLibrary.simpleMessage("Archived"),
    "AreYouSureYouWantToDeleteYourAccount":
        MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to delete your account?",
        ),
    "AreYouSureYouWantToDeleteYourCompanyProfile":
        MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to delete your company profile?",
        ),
    "AreYouSureYouWantToLogOut": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to log out?",
    ),
    "AskForDonations": MessageLookupByLibrary.simpleMessage(
      "Ask for donations",
    ),
    "AskOrSupport": MessageLookupByLibrary.simpleMessage("Ask or support"),
    "AskPeople": MessageLookupByLibrary.simpleMessage("Ask people"),
    "Atheism": MessageLookupByLibrary.simpleMessage("Atheism"),
    "Athlete": MessageLookupByLibrary.simpleMessage("Athlete"),
    "AvailableSoon": MessageLookupByLibrary.simpleMessage("Available soon"),
    "AverageBill": MessageLookupByLibrary.simpleMessage("Average bill"),
    "AverageContentViewTime": MessageLookupByLibrary.simpleMessage(
      "Average card visit time",
    ),
    "Back": MessageLookupByLibrary.simpleMessage("Back"),
    "Balance": MessageLookupByLibrary.simpleMessage("Balance"),
    "BarcodeAlreadyBeenActivated": MessageLookupByLibrary.simpleMessage(
      "This barcode has already been activated",
    ),
    "BaseProperties": MessageLookupByLibrary.simpleMessage("Base properties"),
    "BasedOnYourActivityWeDetermineYourCondition":
        MessageLookupByLibrary.simpleMessage(
          "Based on your activity, heart rate and other factors, we determine your condition and try to recommend exactly what you need right now, specifically for you",
        ),
    "BeFirstToInvite": MessageLookupByLibrary.simpleMessage("Be the first"),
    "BeInSearch": MessageLookupByLibrary.simpleMessage("Be in search"),
    "BecomePro": MessageLookupByLibrary.simpleMessage("Become pro"),
    "BookIt": MessageLookupByLibrary.simpleMessage("Book it"),
    "BookItX": m4,
    "Bookigns": m5,
    "Booking": MessageLookupByLibrary.simpleMessage("Booking"),
    "BookingLimit": MessageLookupByLibrary.simpleMessage("Booking Limit"),
    "BookingLimitError": MessageLookupByLibrary.simpleMessage(
      "The booking limit for one person has been reached",
    ),
    "BookingLimitPerOne": MessageLookupByLibrary.simpleMessage(
      "Booking Limit per one",
    ),
    "BookingList": MessageLookupByLibrary.simpleMessage("Booking list"),
    "BookingPlural": MessageLookupByLibrary.simpleMessage("Bookings"),
    "Bookings": m6,
    "BookingsAndFavorites": MessageLookupByLibrary.simpleMessage(
      "Bookings and Favorites",
    ),
    "BookingsAndInvites": MessageLookupByLibrary.simpleMessage(
      "Bookings and Invites",
    ),
    "BookingsHeading": MessageLookupByLibrary.simpleMessage("Bookings"),
    "Both": MessageLookupByLibrary.simpleMessage("Both"),
    "Branches": MessageLookupByLibrary.simpleMessage("Branches"),
    "Buddhism": MessageLookupByLibrary.simpleMessage("Buddhism"),
    "Budget": m7,
    "BuildYOurBusiness": MessageLookupByLibrary.simpleMessage(
      "Build your business with",
    ),
    "BuildingNumber": MessageLookupByLibrary.simpleMessage("Building number"),
    "BurnedToday": MessageLookupByLibrary.simpleMessage("Burned today"),
    "Business": MessageLookupByLibrary.simpleMessage("Business"),
    "ByContinuingYouAcceptThe": MessageLookupByLibrary.simpleMessage(
      "By continuing you accept the ",
    ),
    "ByDefaultYourOfferWillDisplay": MessageLookupByLibrary.simpleMessage(
      "By default, your offer will display an image from the uploaded place photos",
    ),
    "ByDefaultYourReminderWillDisplay": MessageLookupByLibrary.simpleMessage(
      "By default, your reminder will display an image from the uploaded place photos",
    ),
    "ByEmail": MessageLookupByLibrary.simpleMessage("by e-mail"),
    "ByMessage": MessageLookupByLibrary.simpleMessage("by message"),
    "CalmAtmosphere": MessageLookupByLibrary.simpleMessage("Calm atmosphere"),
    "Cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "CannotFindThisPlaceOrEvent": MessageLookupByLibrary.simpleMessage(
      "Cannot find this place or event",
    ),
    "CantSeePublicProfileMessage": MessageLookupByLibrary.simpleMessage(
      "You can view this profile once it becomes an influencer",
    ),
    "CardOpening": m8,
    "Categories": MessageLookupByLibrary.simpleMessage("Categories"),
    "Category": MessageLookupByLibrary.simpleMessage("Category"),
    "ChallengeFeelings": MessageLookupByLibrary.simpleMessage(
      "Challenge Feelings",
    ),
    "ChangeInSettings": MessageLookupByLibrary.simpleMessage(
      "You can change it in the settings.",
    ),
    "ChangePhoto": MessageLookupByLibrary.simpleMessage("Change photo"),
    "ChangingScheduleTypeAlert": MessageLookupByLibrary.simpleMessage(
      "Changing schedule type will wipe all data in this form!",
    ),
    "Chat": MessageLookupByLibrary.simpleMessage("Chat"),
    "ChatDeletionAndCreationMessage": m9,
    "ChatName": MessageLookupByLibrary.simpleMessage("Chat name"),
    "CheckIn": MessageLookupByLibrary.simpleMessage("Check in"),
    "CheckInHiwHint": m10,
    "CheckInHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "cure your feeling or enchance it!",
    ),
    "CheckInHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Suitable city content will...",
    ),
    "CheckItOut": MessageLookupByLibrary.simpleMessage("Check it out"),
    "ChooseOption": MessageLookupByLibrary.simpleMessage("Choose option"),
    "ChooseYourself": MessageLookupByLibrary.simpleMessage("Choose yourself"),
    "Christianity": MessageLookupByLibrary.simpleMessage("Christianity"),
    "City": MessageLookupByLibrary.simpleMessage("City"),
    "CityXWasDetected": m11,
    "ClickEnterToSearch": MessageLookupByLibrary.simpleMessage(
      "Click Enter to search",
    ),
    "CodeScanner": MessageLookupByLibrary.simpleMessage("Code scanner"),
    "CollapseThread": MessageLookupByLibrary.simpleMessage("Collapse thread"),
    "Comments": m12,
    "Common": MessageLookupByLibrary.simpleMessage("Common"),
    "Company": MessageLookupByLibrary.simpleMessage("Company"),
    "CompanyAnswered": MessageLookupByLibrary.simpleMessage("Сompany answered"),
    "CompanyCredentials": MessageLookupByLibrary.simpleMessage(
      "Company credentials",
    ),
    "CompanyName": MessageLookupByLibrary.simpleMessage("Company name"),
    "CompanyPosition": MessageLookupByLibrary.simpleMessage("Company position"),
    "CompanyPresentationSlider1": MessageLookupByLibrary.simpleMessage(
      "It is a non-public profile that allows you to post your places, branches, and place\'s events",
    ),
    "CompanyPresentationSlider2": MessageLookupByLibrary.simpleMessage(
      "You can create branches; in a  place card users will see the entire brench network",
    ),
    "CompanyPresentationSlider3": MessageLookupByLibrary.simpleMessage(
      "Your content appears in the app\'s rotation and is recommended to users through the unique Shuffle system, - with user and content properties, behavioral factors, geo, weather, etc",
    ),
    "CompanyPresentationSlider4": MessageLookupByLibrary.simpleMessage(
      "Increase awareness & traffic to your places and events. All app\'s & users features are around your content cards",
    ),
    "CompanyPresentationSlider5": MessageLookupByLibrary.simpleMessage(
      "You attract specialized Shuffle influencers who will elevate the status of your places",
    ),
    "CompanyPresentationSlider6": MessageLookupByLibrary.simpleMessage(
      "You can interact with your audience through the unique functionality of special notifications, reminders, offers and presales",
    ),
    "CompanyPresentationSlider7": MessageLookupByLibrary.simpleMessage(
      "You can use the internal targeted advertising system",
    ),
    "CompanyPresentationSlider8": MessageLookupByLibrary.simpleMessage(
      "You can integrate your booking system into content cards or use the Shuffle booking system in the future",
    ),
    "CompressingVideo": MessageLookupByLibrary.simpleMessage(
      "Compressing video",
    ),
    "CompressingVideoProgress": m13,
    "Confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "Confirmed": MessageLookupByLibrary.simpleMessage("Confirmed"),
    "Congratulations": MessageLookupByLibrary.simpleMessage("Congratulations"),
    "Connected": MessageLookupByLibrary.simpleMessage("Connected"),
    "Connects": m14,
    "Contact": MessageLookupByLibrary.simpleMessage("Contact"),
    "ContactPerson": MessageLookupByLibrary.simpleMessage("Contact person"),
    "ContactWith": MessageLookupByLibrary.simpleMessage("Contact"),
    "Contacts": MessageLookupByLibrary.simpleMessage("Contacts"),
    "ContentIdNotProvidedError": MessageLookupByLibrary.simpleMessage(
      "Content id not provided",
    ),
    "ContentOffers": m15,
    "ContentQualityNotice": MessageLookupByLibrary.simpleMessage(
      "In any case, content will be moderated, please take care of the quality",
    ),
    "ContentThatIsAvailableForYouToViewWillAppearHere":
        MessageLookupByLibrary.simpleMessage(
          "Content that is available for you to view will appear here",
        ),
    "Contest": MessageLookupByLibrary.simpleMessage("Contest"),
    "Continue": MessageLookupByLibrary.simpleMessage("Continue"),
    "Control": MessageLookupByLibrary.simpleMessage("Control"),
    "ConvenientClearAndUseful": MessageLookupByLibrary.simpleMessage(
      "сonvenient, clear and useful",
    ),
    "CopyrightInfringement": MessageLookupByLibrary.simpleMessage(
      "Copyright infringement",
    ),
    "CouldNotFindThisReview": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find this review",
    ),
    "CouldNotFindThisTicket": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find this ticket",
    ),
    "CouldntFindInvite": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find invite",
    ),
    "CountReviews": m16,
    "CountVideoReaction": m17,
    "Cover": MessageLookupByLibrary.simpleMessage("Cover"),
    "Coverage": MessageLookupByLibrary.simpleMessage("Coverage"),
    "Create": MessageLookupByLibrary.simpleMessage("Create"),
    "CreateAUSP": m18,
    "CreateBooking": MessageLookupByLibrary.simpleMessage("Create booking"),
    "CreateEvent": MessageLookupByLibrary.simpleMessage("Create Event"),
    "CreateNewXForYourY": m19,
    "CreatePlace": MessageLookupByLibrary.simpleMessage("Create place"),
    "CreateReminderDescription": MessageLookupByLibrary.simpleMessage(
      "Create free reminder for your clients",
    ),
    "CreateSubs": MessageLookupByLibrary.simpleMessage("Create subs"),
    "CreateUpsales": MessageLookupByLibrary.simpleMessage("Create upsales"),
    "CreateYourEventAndInvitePeople": MessageLookupByLibrary.simpleMessage(
      "Create your event and invite people",
    ),
    "CreateYourPlaceAndInvitePeople": MessageLookupByLibrary.simpleMessage(
      "Create your place and invite people",
    ),
    "CredentialsCodeVerificationSubtitle": MessageLookupByLibrary.simpleMessage(
      "Please type verification code sent to",
    ),
    "CredentialsVerificationPrompt": MessageLookupByLibrary.simpleMessage(
      "To gain access you must log in first",
    ),
    "CredentialsVerificationTitle": MessageLookupByLibrary.simpleMessage(
      "Happy to see you",
    ),
    "CropHorizontal": MessageLookupByLibrary.simpleMessage(
      "Crop to horizontal",
    ),
    "CropVertical": MessageLookupByLibrary.simpleMessage("Crop to vertical"),
    "CuisineType": MessageLookupByLibrary.simpleMessage("Cuisine type"),
    "CurrentLocation": MessageLookupByLibrary.simpleMessage(
      "Current location: ",
    ),
    "CuttingVideo": MessageLookupByLibrary.simpleMessage("Cutting video"),
    "Daily": MessageLookupByLibrary.simpleMessage("Daily "),
    "Date": MessageLookupByLibrary.simpleMessage("Date"),
    "DateOfBirth": MessageLookupByLibrary.simpleMessage("Date of birth"),
    "DateRange": MessageLookupByLibrary.simpleMessage("Date Range"),
    "Dates": MessageLookupByLibrary.simpleMessage("Dates"),
    "Day": MessageLookupByLibrary.simpleMessage("Day"),
    "Days": m20,
    "DaysOfWeek": MessageLookupByLibrary.simpleMessage("Days of week"),
    "Delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "DeleteAccount": MessageLookupByLibrary.simpleMessage("Delete account"),
    "DeleteCompany": MessageLookupByLibrary.simpleMessage("Delete company"),
    "DeleteFolderAlert": MessageLookupByLibrary.simpleMessage(
      "Sure you want to delete stack?",
    ),
    "DeleteFromList": MessageLookupByLibrary.simpleMessage("Delete from list"),
    "DeleteXAlert": m21,
    "DependingOn": MessageLookupByLibrary.simpleMessage("Depending on..."),
    "DescribeYourBusiness": MessageLookupByLibrary.simpleMessage(
      "Describe your business",
    ),
    "DescribeYourClaim": MessageLookupByLibrary.simpleMessage(
      "Describe your claim",
    ),
    "DescribeYourIssue": MessageLookupByLibrary.simpleMessage(
      "Describe your issue",
    ),
    "DescribeYourWishes": MessageLookupByLibrary.simpleMessage(
      "Describe your wishes",
    ),
    "DescribeYourself": MessageLookupByLibrary.simpleMessage(
      "Describe yourself",
    ),
    "Description": MessageLookupByLibrary.simpleMessage("Description"),
    "Details": MessageLookupByLibrary.simpleMessage("Details"),
    "DifferentNumberOfPoints": MessageLookupByLibrary.simpleMessage(
      "Different number of points",
    ),
    "Directions": MessageLookupByLibrary.simpleMessage("Directions"),
    "DistributeInformation": MessageLookupByLibrary.simpleMessage(
      "We distribute information",
    ),
    "DonationHint": MessageLookupByLibrary.simpleMessage(
      "You can create one request per month and spend money only on your dream",
    ),
    "DonationRaised": m22,
    "DontBeAlone": MessageLookupByLibrary.simpleMessage("Don\'t be alone"),
    "DontLiveAlone": MessageLookupByLibrary.simpleMessage(
      "Don\'t live alone, subscribe to people you like",
    ),
    "DontMissIt": MessageLookupByLibrary.simpleMessage("Don\'t miss it"),
    "DownloadPdf": MessageLookupByLibrary.simpleMessage("Download PDF"),
    "DubaiEventTicket": MessageLookupByLibrary.simpleMessage(
      "Dubai Event Ticket",
    ),
    "Easy": MessageLookupByLibrary.simpleMessage("Eazy"),
    "Edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "EditProfile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
    "EditingTypePlace": m23,
    "Email": MessageLookupByLibrary.simpleMessage("Email"),
    "EmailVerification": MessageLookupByLibrary.simpleMessage(
      "Email verification",
    ),
    "EnableHintSystem": MessageLookupByLibrary.simpleMessage(
      "Enable hint system",
    ),
    "EnterExternalLink": MessageLookupByLibrary.simpleMessage(
      "Enter external link",
    ),
    "EnterInputType": m24,
    "EnterLocation": MessageLookupByLibrary.simpleMessage("Enter location"),
    "EnterNewPassword": MessageLookupByLibrary.simpleMessage(
      "Enter new password",
    ),
    "EnterPlaceAddressPrompt": MessageLookupByLibrary.simpleMessage(
      "Please enter place’s address",
    ),
    "EnterPrice": MessageLookupByLibrary.simpleMessage("Enter price"),
    "EnterTitle": MessageLookupByLibrary.simpleMessage("Enter title"),
    "EnterX": m25,
    "EnterYourEmailAddress": MessageLookupByLibrary.simpleMessage(
      "Enter your e-mail address",
    ),
    "Entertainment": MessageLookupByLibrary.simpleMessage("Entertainment"),
    "EntertainmentSpecialist": MessageLookupByLibrary.simpleMessage(
      "Entertainment specialist",
    ),
    "ErrorFailedConnectToX": m26,
    "ErrorOccured": MessageLookupByLibrary.simpleMessage("Error occured"),
    "ErrorOccuredWithoutMessage": MessageLookupByLibrary.simpleMessage(
      "Error occured without message",
    ),
    "Event": MessageLookupByLibrary.simpleMessage("Event"),
    "EventRatingByFeedback": MessageLookupByLibrary.simpleMessage(
      "Event rating (by feedback)",
    ),
    "EventType": MessageLookupByLibrary.simpleMessage("Event type"),
    "Events": MessageLookupByLibrary.simpleMessage("Events"),
    "EventsCount": m27,
    "EventsReminders": MessageLookupByLibrary.simpleMessage("Events reminders"),
    "Exit": MessageLookupByLibrary.simpleMessage("Exit"),
    "ExpandThread": MessageLookupByLibrary.simpleMessage("Expand thread"),
    "Expired": MessageLookupByLibrary.simpleMessage("Expired"),
    "Fair": MessageLookupByLibrary.simpleMessage("Fair"),
    "Faq": MessageLookupByLibrary.simpleMessage("Faq"),
    "FaqUnderDev": MessageLookupByLibrary.simpleMessage(
      "Gathering requests for FAQ. \nUnder development",
    ),
    "Favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
    "FeaturesEnableGeolocation": MessageLookupByLibrary.simpleMessage(
      "Features enable geolocation",
    ),
    "FeedFavoritesHiwItems": m28,
    "FeedFeelingsHiwItems": m29,
    "FeedFeelingsHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "you get exactly what you need",
    ),
    "FeedFeelingsHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Depending on...",
    ),
    "FeedNichesHiwItems": m30,
    "FeedNichesHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "get exactly what you need",
    ),
    "FeedNichesHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Great match...",
    ),
    "FeedRandomizerHiwItems": m31,
    "FeedRandomizerHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "you press and get random",
    ),
    "FeedRandomizerHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Randomizing...",
    ),
    "Feedback": MessageLookupByLibrary.simpleMessage("Feedback"),
    "FeedbackAddedSuccessfullyMessage": MessageLookupByLibrary.simpleMessage(
      "Your feedback has been successfully added",
    ),
    "FeedbackPluralNoNumber": MessageLookupByLibrary.simpleMessage("Feedbacks"),
    "Feedbacks": m32,
    "Feeling": MessageLookupByLibrary.simpleMessage("Feeling"),
    "FeelingsGuesses": m33,
    "Female": MessageLookupByLibrary.simpleMessage("Female"),
    "FileNotExistsMessage": MessageLookupByLibrary.simpleMessage(
      "File does not exist",
    ),
    "FillTheAirWithFreshPaint": MessageLookupByLibrary.simpleMessage(
      "Fill the air with fresh paint",
    ),
    "Filters": MessageLookupByLibrary.simpleMessage("Filters"),
    "FindSomeoneCardPoints": m34,
    "FindSomeoneCardSameInterests": m35,
    "FindSomeoneToHangOutWith": MessageLookupByLibrary.simpleMessage(
      "Find someone to hang out with",
    ),
    "FindSomeoneToNetworkWith": MessageLookupByLibrary.simpleMessage(
      "Find someone to network with",
    ),
    "FocusOfLight": MessageLookupByLibrary.simpleMessage("Focus of Light"),
    "FocusOfLightDescription": MessageLookupByLibrary.simpleMessage(
      "The Light of the universe is contained here. If it gets darker in your soul, the light is with you. Look and be filled with peace.",
    ),
    "Follow": MessageLookupByLibrary.simpleMessage("Follow"),
    "Followers": MessageLookupByLibrary.simpleMessage("Followers"),
    "FollowersCount": m36,
    "Followings": MessageLookupByLibrary.simpleMessage("Followings"),
    "For": MessageLookupByLibrary.simpleMessage("For"),
    "ForFormattedPrice": m37,
    "ForPeriod": MessageLookupByLibrary.simpleMessage("For"),
    "ForgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password"),
    "Free": MessageLookupByLibrary.simpleMessage("Free"),
    "FreeNowXLater": m38,
    "FreePlaces": MessageLookupByLibrary.simpleMessage("\nfree places"),
    "Friday": MessageLookupByLibrary.simpleMessage("Friday"),
    "FridayShort": MessageLookupByLibrary.simpleMessage("Fri"),
    "FromGallery": MessageLookupByLibrary.simpleMessage("From gallery"),
    "FromToYearsOld": m39,
    "FulfillTheDream": MessageLookupByLibrary.simpleMessage(
      "Fulfill the dream",
    ),
    "Full": MessageLookupByLibrary.simpleMessage("full"),
    "FullRefund": MessageLookupByLibrary.simpleMessage("Full refund"),
    "GalleryType": MessageLookupByLibrary.simpleMessage("Gallery type"),
    "Gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "GenderAndAge": MessageLookupByLibrary.simpleMessage("Gender and Age"),
    "GeneraFem": MessageLookupByLibrary.simpleMessage("General"),
    "GeneralMas": MessageLookupByLibrary.simpleMessage("General"),
    "GetCode": MessageLookupByLibrary.simpleMessage("Get code"),
    "GetReward": MessageLookupByLibrary.simpleMessage("Get reward"),
    "GetStarted": MessageLookupByLibrary.simpleMessage("Get started"),
    "Global": MessageLookupByLibrary.simpleMessage("Global"),
    "GlobalAlertText": MessageLookupByLibrary.simpleMessage(
      "Only published can be made global",
    ),
    "Go": MessageLookupByLibrary.simpleMessage("Go!"),
    "GoAhead": MessageLookupByLibrary.simpleMessage("Go ahead"),
    "GoAheadAndGrowYourBusiness": MessageLookupByLibrary.simpleMessage(
      "Go ahead and grow your business",
    ),
    "GoNoExclamation": MessageLookupByLibrary.simpleMessage("Go"),
    "GoPremium": MessageLookupByLibrary.simpleMessage("Go premium"),
    "GoPro": MessageLookupByLibrary.simpleMessage("GO pro"),
    "GoToPayment": MessageLookupByLibrary.simpleMessage("Go to payment"),
    "GoToSettings": MessageLookupByLibrary.simpleMessage("Go to settings"),
    "GreatInterviewWithOwner": MessageLookupByLibrary.simpleMessage(
      "Great interview with the owner",
    ),
    "Guess": MessageLookupByLibrary.simpleMessage("Guess"),
    "HallOfFame": MessageLookupByLibrary.simpleMessage("Hall of Fame"),
    "HardToAnswer": MessageLookupByLibrary.simpleMessage("Hard to answer"),
    "Hardcore": MessageLookupByLibrary.simpleMessage("Hardcore"),
    "HealthKit": MessageLookupByLibrary.simpleMessage("Health Kit"),
    "HealthRandomAlert": MessageLookupByLibrary.simpleMessage(
      "Give access to health kit usage otherwise the result will be random",
    ),
    "Helpful": MessageLookupByLibrary.simpleMessage("Helpful"),
    "HelpfulNCount": m40,
    "HiHereTicket": MessageLookupByLibrary.simpleMessage(
      "Hi, here\'s a ticket",
    ),
    "Hindu": MessageLookupByLibrary.simpleMessage("Hindu"),
    "HintAverageBill": MessageLookupByLibrary.simpleMessage(
      "Select price or price range",
    ),
    "HintNumberEventsForPro": MessageLookupByLibrary.simpleMessage(
      "3 events available & add more for extra price",
    ),
    "HintSystemDisabled": MessageLookupByLibrary.simpleMessage(
      "Hint system disabled",
    ),
    "HintSystemEnabled": m41,
    "HorizontalFormat": MessageLookupByLibrary.simpleMessage(
      "Horizontal format",
    ),
    "HoursAgo": m42,
    "HowAreYouFeelingThisMorning": MessageLookupByLibrary.simpleMessage(
      "How’re you feeling this morning?",
    ),
    "HowAreYouFeelingToday": MessageLookupByLibrary.simpleMessage(
      "How’re you feeling today?",
    ),
    "HowAreYouFeelingTonight": MessageLookupByLibrary.simpleMessage(
      "How’re you feeling tonight?",
    ),
    "HowItWorks": MessageLookupByLibrary.simpleMessage("How it\nworks"),
    "HowMuchDoYouWantToDonate": MessageLookupByLibrary.simpleMessage(
      "How much \$ do you want to donate?",
    ),
    "IChangedMyMind": MessageLookupByLibrary.simpleMessage("I changed my mind"),
    "Icon": MessageLookupByLibrary.simpleMessage("Icon"),
    "Icons": MessageLookupByLibrary.simpleMessage("Icons"),
    "IdealRoute": MessageLookupByLibrary.simpleMessage("Ideal route"),
    "IfPlaceAlreadyExistsIn": MessageLookupByLibrary.simpleMessage(
      "If a place already exists in",
    ),
    "IncorrectLoginOrPassword": MessageLookupByLibrary.simpleMessage(
      "Incorrect login or password",
    ),
    "Influencer": MessageLookupByLibrary.simpleMessage("Influencer"),
    "InfluencerSubscriptionFeature1": MessageLookupByLibrary.simpleMessage(
      "You can declare yourself and show your expertise in one of the areas of social life of the city or the world",
    ),
    "InfluencerSubscriptionFeature2": MessageLookupByLibrary.simpleMessage(
      "You can gather your own new or supplement an existing audience",
    ),
    "InfluencerSubscriptionFeature3": MessageLookupByLibrary.simpleMessage(
      "Get a set of tools for working with ",
    ),
    "InfluencerSubscriptionFeature3v1": MessageLookupByLibrary.simpleMessage(
      " content and interacting with your audience",
    ),
    "InfluencerSubscriptionFeature4": MessageLookupByLibrary.simpleMessage(
      "Become a thought leader in your field and earn a reputation",
    ),
    "InfluencerSubscriptionFeature5": MessageLookupByLibrary.simpleMessage(
      "Influence people\\\'s choices and enhance the significance of places and events",
    ),
    "InfluencerSubscriptionFeature6": MessageLookupByLibrary.simpleMessage(
      "Monetization",
    ),
    "Info": MessageLookupByLibrary.simpleMessage("Info"),
    "InstallingCurtains": MessageLookupByLibrary.simpleMessage(
      "Installing curtains",
    ),
    "InstructionsToEnableHealthKit": MessageLookupByLibrary.simpleMessage(
      "To enable health kit please go to Privacy & Security section in Settings, then go to Health section and select Shuffle App there",
    ),
    "Interests": MessageLookupByLibrary.simpleMessage("Interests"),
    "Interview": MessageLookupByLibrary.simpleMessage("Interview"),
    "InventoryItems": MessageLookupByLibrary.simpleMessage("Inventory items"),
    "Invitations": MessageLookupByLibrary.simpleMessage("Invitations"),
    "InvitationsCanBeViewedInPrivateMessages":
        MessageLookupByLibrary.simpleMessage(
          "Invitations can be viewed in private messages",
        ),
    "Invite": MessageLookupByLibrary.simpleMessage("Invite"),
    "InviteList": MessageLookupByLibrary.simpleMessage("Invite list"),
    "InviteMore": MessageLookupByLibrary.simpleMessage("Invite more"),
    "InvitePeople": MessageLookupByLibrary.simpleMessage("Invite people"),
    "InviteToFavoritePlaces": MessageLookupByLibrary.simpleMessage(
      "Invite to your \"Favorites\"",
    ),
    "InvitedPeople": MessageLookupByLibrary.simpleMessage("Invited people"),
    "Invites": MessageLookupByLibrary.simpleMessage("Invites"),
    "InvitesCount": m43,
    "InvitesNPeopleInfo": m44,
    "InvitesNPeopleTo": m45,
    "InvitesTo": MessageLookupByLibrary.simpleMessage("To"),
    "InvitesVerb": MessageLookupByLibrary.simpleMessage("Invites"),
    "InvitesYouTo": MessageLookupByLibrary.simpleMessage("Invites you to"),
    "IsRecurrent": MessageLookupByLibrary.simpleMessage("Is recurrent"),
    "Islam": MessageLookupByLibrary.simpleMessage("Islam"),
    "ItNecessaryToChooseADay": MessageLookupByLibrary.simpleMessage(
      "It is necessary to choose a day",
    ),
    "Judaism": MessageLookupByLibrary.simpleMessage("Judaism"),
    "JustConfirmIt": MessageLookupByLibrary.simpleMessage("just confirm it"),
    "Latest": MessageLookupByLibrary.simpleMessage("Latest"),
    "Launched": MessageLookupByLibrary.simpleMessage("Launched"),
    "LeaveFeedback": MessageLookupByLibrary.simpleMessage("Leave feedback"),
    "Leisure": MessageLookupByLibrary.simpleMessage("Leisure"),
    "Less": MessageLookupByLibrary.simpleMessage("less"),
    "LightingUpTimeTableau": MessageLookupByLibrary.simpleMessage(
      "Lighting up the time tableau",
    ),
    "Limit": MessageLookupByLibrary.simpleMessage("Limit"),
    "LimitLessSumLimitsSubs": MessageLookupByLibrary.simpleMessage(
      "Limit less than sum of limits for subs",
    ),
    "LimitLessTotalLimit": MessageLookupByLibrary.simpleMessage(
      "Limit for one must be less than total limit",
    ),
    "LimitMustBeGreaterThanZero": MessageLookupByLibrary.simpleMessage(
      "The limit must be greater than zero",
    ),
    "Links": MessageLookupByLibrary.simpleMessage("Links"),
    "Loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "Location": MessageLookupByLibrary.simpleMessage("Location"),
    "LocationIsRequired": MessageLookupByLibrary.simpleMessage(
      "Location is required to procceed check in",
    ),
    "Locked": MessageLookupByLibrary.simpleMessage("Locked"),
    "LogIn": MessageLookupByLibrary.simpleMessage("Log in"),
    "LogInTo": MessageLookupByLibrary.simpleMessage("Log in"),
    "LogInWithEmail": MessageLookupByLibrary.simpleMessage("Login with email"),
    "LoginBenefits": m46,
    "LoginInAppDaysInARow": m47,
    "LoginWith": m48,
    "Logo": MessageLookupByLibrary.simpleMessage("Logo"),
    "LogoUploadFiles": MessageLookupByLibrary.simpleMessage(
      "Logo (upload Files)",
    ),
    "LongTapCardEdit": MessageLookupByLibrary.simpleMessage(
      "Long tap card to edit",
    ),
    "LovelyTouchAmazingInteraction": MessageLookupByLibrary.simpleMessage(
      "Lovely-touch amazing\ninteraction",
    ),
    "LuckyCoin": MessageLookupByLibrary.simpleMessage("Lucky Coin"),
    "LuckyCoinDescription": MessageLookupByLibrary.simpleMessage(
      "As long as you have it in your inventory, good luck is with you. Twist it, turn it, touch it to be filled with the energy of good luck.",
    ),
    "MakeSureYouAreCloseToMakeCheckIn": MessageLookupByLibrary.simpleMessage(
      "Make sure you are close and try check in again",
    ),
    "Male": MessageLookupByLibrary.simpleMessage("Male"),
    "MaxNumberOfEvents": MessageLookupByLibrary.simpleMessage(
      "You\'ve reached the maximum number of created events",
    ),
    "Members": m49,
    "MembersCount": m50,
    "Message": MessageLookupByLibrary.simpleMessage("Message"),
    "MessageNotFound": MessageLookupByLibrary.simpleMessage(
      "Message not found",
    ),
    "Messages": MessageLookupByLibrary.simpleMessage("Messages"),
    "Min": MessageLookupByLibrary.simpleMessage("min"),
    "MinutesAgo": m51,
    "MinutesShort": MessageLookupByLibrary.simpleMessage("min"),
    "Misleading": MessageLookupByLibrary.simpleMessage("Misleading"),
    "Moderated": MessageLookupByLibrary.simpleMessage("Moderated"),
    "Monday": MessageLookupByLibrary.simpleMessage("Monday"),
    "MondayShort": MessageLookupByLibrary.simpleMessage("Mon"),
    "Month": MessageLookupByLibrary.simpleMessage("Month"),
    "Monthly": MessageLookupByLibrary.simpleMessage("Monthly"),
    "More": MessageLookupByLibrary.simpleMessage("more"),
    "MoreAboutThisEvent": MessageLookupByLibrary.simpleMessage(
      "More about this event",
    ),
    "MoreAboutThisPlace": MessageLookupByLibrary.simpleMessage(
      "More about this place",
    ),
    "MostActiveAgeSegment": MessageLookupByLibrary.simpleMessage(
      "Portrait of the most active segment",
    ),
    "MuseumType": MessageLookupByLibrary.simpleMessage("Museum type"),
    "MusicType": MessageLookupByLibrary.simpleMessage("Music type"),
    "MustSelectVideo": MessageLookupByLibrary.simpleMessage(
      "You must select at least one video",
    ),
    "MustVisitTechnologyConf": MessageLookupByLibrary.simpleMessage(
      "Must visit technology conf",
    ),
    "My": MessageLookupByLibrary.simpleMessage("My"),
    "MyBooking": MessageLookupByLibrary.simpleMessage("My booking"),
    "MyCard": MessageLookupByLibrary.simpleMessage("My card"),
    "MyEvents": MessageLookupByLibrary.simpleMessage("My events"),
    "MyFeedback": MessageLookupByLibrary.simpleMessage("My feedback"),
    "MyReactions": MessageLookupByLibrary.simpleMessage("My reactions"),
    "NFT": MessageLookupByLibrary.simpleMessage("NFT"),
    "NPlace": m52,
    "Name": MessageLookupByLibrary.simpleMessage("Name"),
    "NameOrNickname": MessageLookupByLibrary.simpleMessage("Name or nickname"),
    "NeedEmailVerification": MessageLookupByLibrary.simpleMessage(
      "Need email verification",
    ),
    "New": MessageLookupByLibrary.simpleMessage("New"),
    "NewDonates": MessageLookupByLibrary.simpleMessage("New donates"),
    "NewFeatures": MessageLookupByLibrary.simpleMessage("New features"),
    "NewFollowers": MessageLookupByLibrary.simpleMessage("New followers"),
    "NewLocationHasOpenedToday": MessageLookupByLibrary.simpleMessage(
      "A new location has opened today. Come! You\'ll like it!",
    ),
    "NewPlace": MessageLookupByLibrary.simpleMessage("New place"),
    "News": MessageLookupByLibrary.simpleMessage("News"),
    "Next": MessageLookupByLibrary.simpleMessage("Next"),
    "NextElements": m53,
    "NextNPeople": m54,
    "NextWithChevrons": MessageLookupByLibrary.simpleMessage("Next >>>"),
    "Niche": MessageLookupByLibrary.simpleMessage("Niche"),
    "Nickname": MessageLookupByLibrary.simpleMessage("Nickname"),
    "NicknameIsTakenTryAnotherOne": MessageLookupByLibrary.simpleMessage(
      "Nickname is taken, try another one",
    ),
    "NoBookingsYet": MessageLookupByLibrary.simpleMessage("No bookings yet"),
    "NoConnection": MessageLookupByLibrary.simpleMessage(
      "Sorry, no internet connection",
    ),
    "NoDateSelected": MessageLookupByLibrary.simpleMessage("No date selected"),
    "NoEndTime": MessageLookupByLibrary.simpleMessage("No end time"),
    "NoFavoritesFound": MessageLookupByLibrary.simpleMessage(
      "No favorites found",
    ),
    "NoFeedbacksYet": MessageLookupByLibrary.simpleMessage(
      "Visit places and events in Shuffle and share your impressions",
    ),
    "NoHealthKitAvailableOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "No health kit available on your device, so the result will be random",
    ),
    "NoMessagesYet": MessageLookupByLibrary.simpleMessage("No messages yet"),
    "NoPastBookings": MessageLookupByLibrary.simpleMessage("No past bookings"),
    "NoPeopleAvailableToInvite": MessageLookupByLibrary.simpleMessage(
      "No people available to invite",
    ),
    "NoPhotoHereYet": MessageLookupByLibrary.simpleMessage(
      "No photo here yet!",
    ),
    "NoPreferencesChosen": MessageLookupByLibrary.simpleMessage(
      "No preferences chosen",
    ),
    "NoReactionsMessage": MessageLookupByLibrary.simpleMessage(
      "There are no reactions yet, be the first",
    ),
    "NoReviewsMessage": MessageLookupByLibrary.simpleMessage(
      "Be the first to review",
    ),
    "NoThx": MessageLookupByLibrary.simpleMessage("No, thx"),
    "NoVideoReactionsYet": MessageLookupByLibrary.simpleMessage(
      "Visit places and events in Shuffle and make amazing video-reactions",
    ),
    "NotNow": MessageLookupByLibrary.simpleMessage("Not now"),
    "NotOften": MessageLookupByLibrary.simpleMessage("Not often"),
    "NotSet": MessageLookupByLibrary.simpleMessage("Not set"),
    "NothingFound": MessageLookupByLibrary.simpleMessage("Nothing found"),
    "NothingWasFoundWithEmoji": MessageLookupByLibrary.simpleMessage(
      "Nothing was found :c",
    ),
    "Notification": MessageLookupByLibrary.simpleMessage("Notification"),
    "NotificationText": MessageLookupByLibrary.simpleMessage(
      "Notification text",
    ),
    "Notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "NotifyTheAudience": MessageLookupByLibrary.simpleMessage(
      "Notify the audience",
    ),
    "NowLetsGetToKnowEachOther": MessageLookupByLibrary.simpleMessage(
      "Now let\'s get to know each other",
    ),
    "NowWeKnowYouBetter": MessageLookupByLibrary.simpleMessage(
      "Thanks!\nNow we know you better",
    ),
    "Off": MessageLookupByLibrary.simpleMessage("Off"),
    "Offer": MessageLookupByLibrary.simpleMessage("Offer"),
    "OfferContent": MessageLookupByLibrary.simpleMessage("Offer content"),
    "OfferInfo": MessageLookupByLibrary.simpleMessage("Offer info"),
    "OfferPrice": m55,
    "Offers": MessageLookupByLibrary.simpleMessage("Offers"),
    "OfficeAppartmentNumber": MessageLookupByLibrary.simpleMessage(
      "Office or appt number",
    ),
    "OhYeahSure": MessageLookupByLibrary.simpleMessage("Oh yeah, sure!"),
    "Ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "Okay": MessageLookupByLibrary.simpleMessage("Okay"),
    "OkayCool": MessageLookupByLibrary.simpleMessage("Okay, cool!"),
    "OnboardingSlide1": MessageLookupByLibrary.simpleMessage(
      "to have some fun",
    ),
    "OnboardingSlide2": MessageLookupByLibrary.simpleMessage(
      "to explore\nleisure and\nbusiness",
    ),
    "OnboardingSlide3": MessageLookupByLibrary.simpleMessage(
      "to just chill out",
    ),
    "Ooops": MessageLookupByLibrary.simpleMessage("Ooops!"),
    "Oops": MessageLookupByLibrary.simpleMessage("Oops"),
    "OopsIWillTryAgain": MessageLookupByLibrary.simpleMessage(
      "Oops, I\'ll try again",
    ),
    "Open": MessageLookupByLibrary.simpleMessage("Open"),
    "OpenEvent": MessageLookupByLibrary.simpleMessage("Open event"),
    "OpenFrom": MessageLookupByLibrary.simpleMessage("Open from"),
    "OpenNow": MessageLookupByLibrary.simpleMessage("Open now"),
    "OpenPlace": MessageLookupByLibrary.simpleMessage("Open place"),
    "OpenTo": MessageLookupByLibrary.simpleMessage("Open to"),
    "OpenedUpcomingEvents": MessageLookupByLibrary.simpleMessage(
      "Opened \"Upcoming events\" block",
    ),
    "OpeningHours": MessageLookupByLibrary.simpleMessage("Opening hours"),
    "OrDragFilesHere": MessageLookupByLibrary.simpleMessage(
      "Or drag files here",
    ),
    "Organic": MessageLookupByLibrary.simpleMessage("Organic"),
    "OrganicStatistics": MessageLookupByLibrary.simpleMessage("Organic"),
    "Original": MessageLookupByLibrary.simpleMessage("Original"),
    "Other": MessageLookupByLibrary.simpleMessage("Other"),
    "OurRecommendationsAboutGeolocation": MessageLookupByLibrary.simpleMessage(
      "Our recommendation system is based on many factors. Geolocation is only part of the system, which will allow us to correctly prioritize, both in terms of distance and the nearest landscape features (mountains, reservoirs, plains, deserts)",
    ),
    "OverallRatingOfInterest": MessageLookupByLibrary.simpleMessage(
      "Overall rating of interest",
    ),
    "Partial": MessageLookupByLibrary.simpleMessage("partial"),
    "PartialRefund": MessageLookupByLibrary.simpleMessage("Partial refund"),
    "Password": MessageLookupByLibrary.simpleMessage("Password"),
    "PasswordConditions": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one uppercase letter, one lowercase letter, one number and one special character",
    ),
    "PasswordHint": MessageLookupByLibrary.simpleMessage(
      "Letters, numbers, ! “ @ # \$ % & symbols, 8 characters",
    ),
    "PasswordMustBeAtLeast8Characters": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters",
    ),
    "Past": MessageLookupByLibrary.simpleMessage("Past"),
    "Paused": MessageLookupByLibrary.simpleMessage("Paused"),
    "Pay": MessageLookupByLibrary.simpleMessage("Pay"),
    "PayForTheBonusOffer": MessageLookupByLibrary.simpleMessage(
      "Pay for the bonus offer",
    ),
    "PayForTheNotification": MessageLookupByLibrary.simpleMessage(
      "Pay for the notification",
    ),
    "PeopleStartingToTalkAboutYou": MessageLookupByLibrary.simpleMessage(
      "People are starting to talk about you",
    ),
    "Permissions": MessageLookupByLibrary.simpleMessage("Permissions"),
    "Personal": MessageLookupByLibrary.simpleMessage("Personal"),
    "PersonalCredentials": MessageLookupByLibrary.simpleMessage(
      "Personal credentials",
    ),
    "PersonalRespect": MessageLookupByLibrary.simpleMessage("Personal respect"),
    "PersonalTop": MessageLookupByLibrary.simpleMessage("Personal TOP"),
    "PersonalizeYourOffer": MessageLookupByLibrary.simpleMessage(
      "Personalize your offer",
    ),
    "PersonalizeYourReminder": MessageLookupByLibrary.simpleMessage(
      "Personalize your reminder",
    ),
    "Phone": MessageLookupByLibrary.simpleMessage("Phone"),
    "PhoneVerification": MessageLookupByLibrary.simpleMessage(
      "Phone verification",
    ),
    "Photo": MessageLookupByLibrary.simpleMessage("Photo"),
    "PhotoUploadFiles": MessageLookupByLibrary.simpleMessage(
      "Photo (upload Files)",
    ),
    "Photos": MessageLookupByLibrary.simpleMessage("Photos"),
    "PickFromMap": MessageLookupByLibrary.simpleMessage("Pick from map"),
    "Place": MessageLookupByLibrary.simpleMessage("Place"),
    "PlaceCompanyInfo": MessageLookupByLibrary.simpleMessage(
      "If your subscription is terminated, your content will be removed from rotation until your subscription is renewed",
    ),
    "PlaceRatingByFeedback": MessageLookupByLibrary.simpleMessage(
      "Place rating (by feedback)",
    ),
    "PlaceSubmittedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Place submitted successfully",
    ),
    "PlaceType": MessageLookupByLibrary.simpleMessage("Place type"),
    "Places": MessageLookupByLibrary.simpleMessage("Places"),
    "PlacesVisited": m56,
    "PleaseAddDatePeriod": MessageLookupByLibrary.simpleMessage(
      "Please add a date(-s)",
    ),
    "PleaseAddPhoto": MessageLookupByLibrary.simpleMessage("Please add photo"),
    "PleaseEnterCurrentLimit": MessageLookupByLibrary.simpleMessage(
      "Please enter current limit",
    ),
    "PleaseEnterLimit": MessageLookupByLibrary.simpleMessage(
      "Please enter limit",
    ),
    "PleaseEnterLink": MessageLookupByLibrary.simpleMessage(
      "Please enter a link",
    ),
    "PleaseEnterValidDescription": MessageLookupByLibrary.simpleMessage(
      "Please enter a description",
    ),
    "PleaseEnterValidTitle": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid title",
    ),
    "PleaseEnterValidXLink": m57,
    "PleaseFillOutDate": MessageLookupByLibrary.simpleMessage(
      "Please fill out date",
    ),
    "PleaseFillOutYourWishes": MessageLookupByLibrary.simpleMessage(
      "Please fill out your wishes",
    ),
    "PleaseFillOutYourWishesAndSelectDate":
        MessageLookupByLibrary.simpleMessage(
          "Please fill out your wishes and select date",
        ),
    "PleaseSelectANiche": MessageLookupByLibrary.simpleMessage(
      "Please select a niche",
    ),
    "PleaseSelectAtLeastNReligion": m58,
    "PleaseSelectAtLeastOneAgeRange": MessageLookupByLibrary.simpleMessage(
      "Please select at least one age range",
    ),
    "PleaseSelectAtLeastOnePriceSegment": MessageLookupByLibrary.simpleMessage(
      "Please select at least one price segment",
    ),
    "PleaseSelectGender": MessageLookupByLibrary.simpleMessage(
      "Please select a gender",
    ),
    "PleaseSelectOneType": MessageLookupByLibrary.simpleMessage(
      "Please select one type",
    ),
    "PleaseValidateXDetailsBeforeModeration": m59,
    "PlusXNewChatComments": m60,
    "PlusXNewContests": MessageLookupByLibrary.simpleMessage(
      "+ New assignment",
    ),
    "PlusXNewInterviews": MessageLookupByLibrary.simpleMessage(
      "+ New interview",
    ),
    "PlusXNewRespects": m61,
    "PlusXNewReviews": m62,
    "PlusXNewRoutes": MessageLookupByLibrary.simpleMessage("+ New route"),
    "PlusXNewVideoReactions": m63,
    "PlusXNewVideos": MessageLookupByLibrary.simpleMessage("+ New video"),
    "PlusXNewVoices": m64,
    "PlusXPhotos": m65,
    "PlzEnterName": MessageLookupByLibrary.simpleMessage(
      "Plz, enter your name & nickname",
    ),
    "PointBalance": MessageLookupByLibrary.simpleMessage("Point\nBalance"),
    "Points": MessageLookupByLibrary.simpleMessage("Points"),
    "PointsAre": MessageLookupByLibrary.simpleMessage("Points are..."),
    "PointsCount": m66,
    "PointsEarned": m67,
    "PointsHiwItems": m68,
    "PointsInOffer": m69,
    "Position": MessageLookupByLibrary.simpleMessage("Position"),
    "Preferences": MessageLookupByLibrary.simpleMessage("Preferences"),
    "Premium": MessageLookupByLibrary.simpleMessage("Premium"),
    "PremiumAccount": MessageLookupByLibrary.simpleMessage("Premium account"),
    "PremiumSubscriptionFeature1": MessageLookupByLibrary.simpleMessage(
      "Unique feature \"Connects\".  Search, communicate, meet someone, networking",
    ),
    "PremiumSubscriptionFeature2": MessageLookupByLibrary.simpleMessage(
      "Special profile label",
    ),
    "PremiumSubscriptionFeature3": MessageLookupByLibrary.simpleMessage(
      "Ability to leave reviews, shoot video-reactions about places and events, participate in ratings",
    ),
    "PremiumSubscriptionFeature4": MessageLookupByLibrary.simpleMessage(
      "Ability to add/suggest favorite places",
    ),
    "PremiumSubscriptionFeature5": MessageLookupByLibrary.simpleMessage(
      "Ability to switch dark/light design theme",
    ),
    "PremiumSubscriptionFeature6": MessageLookupByLibrary.simpleMessage(
      "Ability to become an Influencer",
    ),
    "PremiumSubscriptionFeature7": MessageLookupByLibrary.simpleMessage(
      "Ability to create and share convenient stacks of favorites",
    ),
    "PremiumSubscriptionFeature8": MessageLookupByLibrary.simpleMessage(
      "Have your own event scheduler",
    ),
    "Price": MessageLookupByLibrary.simpleMessage("Price"),
    "PriceRange": MessageLookupByLibrary.simpleMessage("Price range"),
    "PrintingCalendar": MessageLookupByLibrary.simpleMessage(
      "Printing a calendar",
    ),
    "Privacy": MessageLookupByLibrary.simpleMessage("Privacy"),
    "PrivacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "PrivateChatApply": MessageLookupByLibrary.simpleMessage(
      "Private chat. Please apply by pressing",
    ),
    "Pro": MessageLookupByLibrary.simpleMessage("Pro"),
    "ProAccount": MessageLookupByLibrary.simpleMessage("Pro account"),
    "ProSubscriptionFeature1": MessageLookupByLibrary.simpleMessage(
      "Special profile label",
    ),
    "ProSubscriptionFeature2": MessageLookupByLibrary.simpleMessage(
      "Ability to create your own events",
    ),
    "ProSubscriptionFeature3": MessageLookupByLibrary.simpleMessage(
      "Additional motivation of potential audience (clients/visitors) with the help of points system",
    ),
    "ProSubscriptionFeature4": MessageLookupByLibrary.simpleMessage(
      "Ability to sell related services through ticket booking",
    ),
    "ProSubscriptionFeature5": MessageLookupByLibrary.simpleMessage("Upsales"),
    "ProSubscriptionFeature6": MessageLookupByLibrary.simpleMessage(
      "Internal targeted promotion of your events, statistics and analytics",
    ),
    "ProSubscriptionFeature7": MessageLookupByLibrary.simpleMessage(
      "Ability to use specialised notifications",
    ),
    "ProTools": MessageLookupByLibrary.simpleMessage("Pro tools"),
    "Product": MessageLookupByLibrary.simpleMessage("Product"),
    "Products": m70,
    "ProfileAskOrSupportHiwHint": m71,
    "ProfileAskOrSupportHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "yours or someone else\'s",
    ),
    "ProfileAskOrSupportHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Fulfill the dream...",
    ),
    "ProfileFindSomeoneHiwHint": m72,
    "ProfileFindSomeoneHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "go somewhere together",
    ),
    "ProfileFindSomeoneHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Do not be alone...",
    ),
    "Promotion": MessageLookupByLibrary.simpleMessage("Promo"),
    "Properties": MessageLookupByLibrary.simpleMessage("Properties"),
    "Published": MessageLookupByLibrary.simpleMessage("Published"),
    "PushUpYourBusiness": MessageLookupByLibrary.simpleMessage(
      "Push up your business",
    ),
    "PutItInRotation": MessageLookupByLibrary.simpleMessage(
      "We put it in rotation",
    ),
    "PuttingUpPoster": MessageLookupByLibrary.simpleMessage(
      "We are putting up a poster",
    ),
    "RangeEndValueIsLessThanBeginingOne": MessageLookupByLibrary.simpleMessage(
      "Range end value is less than begining one",
    ),
    "Rating": MessageLookupByLibrary.simpleMessage("Rating"),
    "Reactions": m73,
    "ReactionsBy": MessageLookupByLibrary.simpleMessage("Reactions\nby"),
    "ReactionsByCritics": MessageLookupByLibrary.simpleMessage(
      "Reactions by critics",
    ),
    "Read": m74,
    "RealMoney": MessageLookupByLibrary.simpleMessage("Real money"),
    "RecentlyAdded": MessageLookupByLibrary.simpleMessage("Recently added"),
    "Recommended": MessageLookupByLibrary.simpleMessage("Recommended"),
    "Refund": MessageLookupByLibrary.simpleMessage("refund"),
    "RefundEveryone": MessageLookupByLibrary.simpleMessage("Refund everyone"),
    "RelatedPersonalProperties": MessageLookupByLibrary.simpleMessage(
      "Related personal properties",
    ),
    "RelatedProperties": MessageLookupByLibrary.simpleMessage(
      "Related properties",
    ),
    "Religion": MessageLookupByLibrary.simpleMessage("Religion"),
    "RemainsToCreate": MessageLookupByLibrary.simpleMessage(
      "Remains to create",
    ),
    "Reminder": MessageLookupByLibrary.simpleMessage("Reminder"),
    "Reminders": MessageLookupByLibrary.simpleMessage("Reminders"),
    "Remove": MessageLookupByLibrary.simpleMessage("Remove"),
    "Rename": MessageLookupByLibrary.simpleMessage("Rename"),
    "Reply": MessageLookupByLibrary.simpleMessage("Reply"),
    "ReplyingTo": m75,
    "Requests": MessageLookupByLibrary.simpleMessage("requests"),
    "ResendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
    "Reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "ResetFilters": MessageLookupByLibrary.simpleMessage("Reset filters"),
    "ResetPassword": MessageLookupByLibrary.simpleMessage("Reset password"),
    "Respect": MessageLookupByLibrary.simpleMessage("Respect"),
    "Restaurant": MessageLookupByLibrary.simpleMessage("Restaurant"),
    "RestorePurchase": MessageLookupByLibrary.simpleMessage(
      "Restore purchases",
    ),
    "ReviewWasSuccessfullyEdited": MessageLookupByLibrary.simpleMessage(
      "Review was successfully edited",
    ),
    "Reviews": MessageLookupByLibrary.simpleMessage("Reviews"),
    "ReviewsByCritics": MessageLookupByLibrary.simpleMessage(
      "Reviews by critics",
    ),
    "ReviewsCount": m76,
    "ReviewsPosted": m77,
    "ReviewsReceived": m78,
    "Routes": MessageLookupByLibrary.simpleMessage("Routes"),
    "Saturday": MessageLookupByLibrary.simpleMessage("Saturday"),
    "SaturdayShort": MessageLookupByLibrary.simpleMessage("Sat"),
    "Save": MessageLookupByLibrary.simpleMessage("Save"),
    "SaveAndPay": MessageLookupByLibrary.simpleMessage("Save and pay"),
    "SaveTemplate": MessageLookupByLibrary.simpleMessage("Save template"),
    "ScanControllerNotReady": MessageLookupByLibrary.simpleMessage(
      "Controller not ready",
    ),
    "ScanGenericError": MessageLookupByLibrary.simpleMessage("Generic Error"),
    "ScanPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Permission denied",
    ),
    "Scanner": MessageLookupByLibrary.simpleMessage("Scanner"),
    "ScanningIsUnsupported": MessageLookupByLibrary.simpleMessage(
      "Scanning is unsupported on this device",
    ),
    "Schedule": MessageLookupByLibrary.simpleMessage("Schedule"),
    "Scheduler": MessageLookupByLibrary.simpleMessage("Scheduler"),
    "Search": MessageLookupByLibrary.simpleMessage("Search"),
    "SearchBusinessChooseYourself1": MessageLookupByLibrary.simpleMessage(
      "Business clubs",
    ),
    "SearchBusinessChooseYourself2": MessageLookupByLibrary.simpleMessage(
      "Digital & IT conferences",
    ),
    "SearchBusinessChooseYourself3": MessageLookupByLibrary.simpleMessage(
      "Pitch sessions",
    ),
    "SearchBusinessChooseYourself4": MessageLookupByLibrary.simpleMessage(
      "Business games",
    ),
    "SearchBusinessChooseYourself5": MessageLookupByLibrary.simpleMessage(
      "Forums (industry exhibitions)",
    ),
    "SearchBusinessChooseYourself6": MessageLookupByLibrary.simpleMessage(
      "Networking",
    ),
    "SearchBusinessChooseYourself7": MessageLookupByLibrary.simpleMessage(
      "Seminars and trainings",
    ),
    "SearchChooseYourself1": MessageLookupByLibrary.simpleMessage(
      "Happiness for children and family",
    ),
    "SearchChooseYourself2": MessageLookupByLibrary.simpleMessage(
      "Thirst for adventure",
    ),
    "SearchChooseYourself3": MessageLookupByLibrary.simpleMessage(
      "Parties and dancing",
    ),
    "SearchChooseYourself4": MessageLookupByLibrary.simpleMessage(
      "Extremes and thrills",
    ),
    "SearchChooseYourself5": MessageLookupByLibrary.simpleMessage(
      "Age of enlightenment",
    ),
    "SearchChooseYourself6": MessageLookupByLibrary.simpleMessage(
      "Fine dining",
    ),
    "SearchChooseYourself7": MessageLookupByLibrary.simpleMessage(
      "Bliss and chill",
    ),
    "SearchChooseYourself8": MessageLookupByLibrary.simpleMessage(
      "Sporty movements",
    ),
    "SearchChooseYourself9": MessageLookupByLibrary.simpleMessage(
      "Self-care (Health and beauty/self-love)",
    ),
    "SearchHiwHint": m79,
    "SearchHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "search or choose others choice",
    ),
    "SearchHiwTitle": MessageLookupByLibrary.simpleMessage("Usual search..."),
    "SearchOrAddTag": MessageLookupByLibrary.simpleMessage("Search or add tag"),
    "SearchProperty": MessageLookupByLibrary.simpleMessage("Search property"),
    "SeeAll": MessageLookupByLibrary.simpleMessage("See all"),
    "SeeList": MessageLookupByLibrary.simpleMessage("See list"),
    "SeeMore": MessageLookupByLibrary.simpleMessage("See more"),
    "SeekingWandererMen": MessageLookupByLibrary.simpleMessage(
      "Seeking wanderer",
    ),
    "SeekingWandererWom": MessageLookupByLibrary.simpleMessage(
      "Seeking wanderer",
    ),
    "SelectCity": MessageLookupByLibrary.simpleMessage("Select city"),
    "SelectCurrency": MessageLookupByLibrary.simpleMessage("Select currency"),
    "SelectDate": MessageLookupByLibrary.simpleMessage("Select date"),
    "SelectDateRange": MessageLookupByLibrary.simpleMessage(
      "Select Date Range",
    ),
    "SelectDateTime": MessageLookupByLibrary.simpleMessage(
      "Select date and time",
    ),
    "SelectDays": MessageLookupByLibrary.simpleMessage("Select days "),
    "SelectEndTime": MessageLookupByLibrary.simpleMessage(
      "Select an ending time",
    ),
    "SelectGender": MessageLookupByLibrary.simpleMessage("Select gender"),
    "SelectLanguage": MessageLookupByLibrary.simpleMessage(
      "Please select language",
    ),
    "SelectLocation": MessageLookupByLibrary.simpleMessage("Select location"),
    "SelectMindsetInvitation": m80,
    "SelectOption": MessageLookupByLibrary.simpleMessage("Select option"),
    "SelectOptionSchedule": MessageLookupByLibrary.simpleMessage(
      "Select option",
    ),
    "SelectPeriodOfValid": MessageLookupByLibrary.simpleMessage(
      "Select period of valid",
    ),
    "SelectPriceAndCurrency": MessageLookupByLibrary.simpleMessage(
      "Select price and currency",
    ),
    "SelectStartTime": MessageLookupByLibrary.simpleMessage(
      "Select a starting time",
    ),
    "SelectSubs": MessageLookupByLibrary.simpleMessage("Select subs"),
    "SelectTemplate": MessageLookupByLibrary.simpleMessage("Select template"),
    "SelectTimeCorrespondingToContentCard":
        MessageLookupByLibrary.simpleMessage(
          "Select the time corresponding to the content card",
        ),
    "SelectToSetPreview": MessageLookupByLibrary.simpleMessage(
      "Select a photo to set preview",
    ),
    "SelectType": m81,
    "SelectYourBooking": MessageLookupByLibrary.simpleMessage(
      "Select your booking",
    ),
    "SelectYourFavoriteProduct": MessageLookupByLibrary.simpleMessage(
      "Select your favorite product",
    ),
    "SelectYourReligions": MessageLookupByLibrary.simpleMessage(
      "Select your religions",
    ),
    "SelectYourSpecialty": MessageLookupByLibrary.simpleMessage(
      "Select your specialty",
    ),
    "SelectionOfTheBest": MessageLookupByLibrary.simpleMessage(
      "Selection of the best",
    ),
    "Send": MessageLookupByLibrary.simpleMessage("Send"),
    "SendIt": MessageLookupByLibrary.simpleMessage("Send it"),
    "SendingGeologistToPoint": MessageLookupByLibrary.simpleMessage(
      "We are sending a geologist to the point",
    ),
    "SendingGoogleCarForVerification": MessageLookupByLibrary.simpleMessage(
      "We are sending a Google car for verification",
    ),
    "Services": MessageLookupByLibrary.simpleMessage("Services"),
    "SetWorkHours": MessageLookupByLibrary.simpleMessage("Set work schedule"),
    "SettingUpAlarmClocks": MessageLookupByLibrary.simpleMessage(
      "Setting up alarm clocks",
    ),
    "Settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "SexualContent": MessageLookupByLibrary.simpleMessage("Sexual content"),
    "Share": MessageLookupByLibrary.simpleMessage("Share"),
    "ShareCard": m82,
    "SharedWithYou": MessageLookupByLibrary.simpleMessage("shared with you"),
    "ShockingContent": MessageLookupByLibrary.simpleMessage("Shocking content"),
    "ShowDeleted": MessageLookupByLibrary.simpleMessage("Show deleted"),
    "ShowInContentCard": MessageLookupByLibrary.simpleMessage(
      "Show in content card",
    ),
    "ShowMore": MessageLookupByLibrary.simpleMessage("Show\nmore"),
    "ShowResult": MessageLookupByLibrary.simpleMessage("Show result"),
    "ShowTheBarcode": MessageLookupByLibrary.simpleMessage(
      "Show the barcode at the checkout when paying",
    ),
    "ShowTheBarcodeCheckout": MessageLookupByLibrary.simpleMessage(
      "Show the barcode at the checkout",
    ),
    "ShowXInProfile": m83,
    "ShraziidGoblet": MessageLookupByLibrary.simpleMessage("Shraziid goblet"),
    "ShraziidGobletDescription": MessageLookupByLibrary.simpleMessage(
      "An ancient goblet found in the desert sands. They say that Shraziid himself, the ruler of the great Sand Kingdom, drank from it.",
    ),
    "Shuffle": MessageLookupByLibrary.simpleMessage("Shuffle"),
    "ShuffleDigest": MessageLookupByLibrary.simpleMessage("Shuffle digest"),
    "ShuffleExchangeSystem": MessageLookupByLibrary.simpleMessage(
      "...Shuffle exchange system",
    ),
    "ShuffleHiwHint": m84,
    "ShuffleHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "finding personalized places",
    ),
    "ShuffleHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Shuffling places...",
    ),
    "ShuffleWithRightWhitespace": MessageLookupByLibrary.simpleMessage(
      "Shuffle ",
    ),
    "Skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "SkipIt": MessageLookupByLibrary.simpleMessage("Skip it"),
    "Small": MessageLookupByLibrary.simpleMessage("Small"),
    "SmartLeisureSelection": MessageLookupByLibrary.simpleMessage(
      "Smart leisure selection for everyone, everywhere",
    ),
    "SocialSubtitle": MessageLookupByLibrary.simpleMessage(
      "Useful services and places",
    ),
    "SomethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong. Please try again.",
    ),
    "Soon": MessageLookupByLibrary.simpleMessage("Soon"),
    "Spend": MessageLookupByLibrary.simpleMessage("Spend"),
    "SpendHoursPerWeek": m85,
    "SpendIt": MessageLookupByLibrary.simpleMessage("Spend it"),
    "Spent": MessageLookupByLibrary.simpleMessage("Spent"),
    "SpentMyPoints": MessageLookupByLibrary.simpleMessage("Spent my points"),
    "SpinnerHiwHint": m86,
    "SpinnerHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "you find personalized events",
    ),
    "SpinnerHiwTitle": MessageLookupByLibrary.simpleMessage("You spin it..."),
    "SpinnerTitle": MessageLookupByLibrary.simpleMessage(
      "Events you don\'t wanna miss",
    ),
    "StacksAndSomethingElseAreAvailableForYou":
        MessageLookupByLibrary.simpleMessage(
          "Stacks and something else are available for you...",
        ),
    "StacksAreOn": MessageLookupByLibrary.simpleMessage("Stacks are on"),
    "StacksShares": m87,
    "StartBookingCreation": MessageLookupByLibrary.simpleMessage(
      "Start booking creation",
    ),
    "StartTimeShouldBeEarlierThanEndTime": MessageLookupByLibrary.simpleMessage(
      "The start time should be earlier than the end time",
    ),
    "StartToExplore": MessageLookupByLibrary.simpleMessage("Start to explore"),
    "Statistics": MessageLookupByLibrary.simpleMessage("Statistics"),
    "StatusXAvailable": m88,
    "StatusXIsNotAvailable": m89,
    "Submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "SubmitContent": MessageLookupByLibrary.simpleMessage("Submit content"),
    "Subs": MessageLookupByLibrary.simpleMessage("Subs"),
    "SubscribeToProfile": MessageLookupByLibrary.simpleMessage("Follow"),
    "Success": MessageLookupByLibrary.simpleMessage("Success"),
    "SuccessfullyAnswered": MessageLookupByLibrary.simpleMessage(
      "Successfully answered",
    ),
    "Sunday": MessageLookupByLibrary.simpleMessage("Sunday"),
    "SundayShort": MessageLookupByLibrary.simpleMessage("Sun"),
    "Sunny": MessageLookupByLibrary.simpleMessage("Sunny"),
    "Support": MessageLookupByLibrary.simpleMessage("Support"),
    "SupportPeopleAroundYou": MessageLookupByLibrary.simpleMessage(
      "Support people around you",
    ),
    "SupportedFormatsBooking": MessageLookupByLibrary.simpleMessage(
      "Supported formats: JPEG/JPG/PNG.\nMax size - 10 MB.\nMax resolution - 3840 x 2200 px",
    ),
    "SureYouWantToDeleteChat": MessageLookupByLibrary.simpleMessage(
      "Sure you want to delete chat?",
    ),
    "SureYouWantToExit": MessageLookupByLibrary.simpleMessage(
      "Sure you want to exit?",
    ),
    "SwipeToStart": MessageLookupByLibrary.simpleMessage("Swipe to start"),
    "SwitchAnyTime": MessageLookupByLibrary.simpleMessage(
      "You can switch it at any time in your profile settings",
    ),
    "Tags": MessageLookupByLibrary.simpleMessage("Tags"),
    "TapIt": MessageLookupByLibrary.simpleMessage("Tap it"),
    "TapOnceToChoose": MessageLookupByLibrary.simpleMessage(
      "Tap once to choose",
    ),
    "TapToSeeMore": MessageLookupByLibrary.simpleMessage("Tap to see more"),
    "TapToSetAddress": MessageLookupByLibrary.simpleMessage(
      "Tap to set address",
    ),
    "TapTwiceToMarkYourFavorites": MessageLookupByLibrary.simpleMessage(
      ". Tap twice to mark your favorites.",
    ),
    "TastyCoffee": MessageLookupByLibrary.simpleMessage("Tasty coffee"),
    "Taxi": MessageLookupByLibrary.simpleMessage("Taxi"),
    "TeaList": MessageLookupByLibrary.simpleMessage("Tea list"),
    "TellUsAbout": MessageLookupByLibrary.simpleMessage("Tell us about"),
    "TellUsMore": MessageLookupByLibrary.simpleMessage("Tell us more"),
    "TellUsMoreAboutYourself": m90,
    "TemplateName": MessageLookupByLibrary.simpleMessage("Template name"),
    "Terms": MessageLookupByLibrary.simpleMessage("Terms"),
    "TermsOfService": MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "ThatsAllForNow": MessageLookupByLibrary.simpleMessage(
      "That\'s all for now!",
    ),
    "TheBestParties": MessageLookupByLibrary.simpleMessage("The best parties"),
    "TheBestTechConf": MessageLookupByLibrary.simpleMessage(
      "The best tech conf",
    ),
    "TheBestTechListSuccessfullyAdded": MessageLookupByLibrary.simpleMessage(
      "List “The best technologies conf” successfully added",
    ),
    "TheBestTechnologiesConf": MessageLookupByLibrary.simpleMessage(
      "The best technologies conf",
    ),
    "TheMoreInfoWeAboutYouGetTheBetter": MessageLookupByLibrary.simpleMessage(
      "The more info we get about you, the better",
    ),
    "TheMoreInfoWeGetTheBetter": MessageLookupByLibrary.simpleMessage(
      "The more info we get, the better ",
    ),
    "TheOfferWillBeAddedToPersonal": MessageLookupByLibrary.simpleMessage(
      "The offer will be added to the personal profile of users who view your content or make a booking",
    ),
    "TheSelectedTimeCannotBeElapsed": MessageLookupByLibrary.simpleMessage(
      "The selected time cannot be elapsed",
    ),
    "ThenCheckThisOut": MessageLookupByLibrary.simpleMessage(
      "Then check this out",
    ),
    "ThereNoEventsYet": MessageLookupByLibrary.simpleMessage(
      "There are no events yet",
    ),
    "ThereNoPlacesYet": MessageLookupByLibrary.simpleMessage(
      "There are no places yet",
    ),
    "ThereNoUsersWhoHaveBoughtOfferYet": MessageLookupByLibrary.simpleMessage(
      "There are no users who have bought the offer yet",
    ),
    "TheseContentIsOnYourOtherLists": MessageLookupByLibrary.simpleMessage(
      "These content is on your other lists. When added, it will be removed from the current.",
    ),
    "ThisIs": MessageLookupByLibrary.simpleMessage("This is"),
    "ThisIsEmptyNowBook": MessageLookupByLibrary.simpleMessage(
      "This is empty now, book your visit and it will appear here",
    ),
    "ThroughANonAggregatorSystem": MessageLookupByLibrary.simpleMessage(
      "Through a non-\naggregator system \nespecially for you",
    ),
    "Thursday": MessageLookupByLibrary.simpleMessage("Thursday"),
    "ThursdayShort": MessageLookupByLibrary.simpleMessage("Thu"),
    "Ticket": MessageLookupByLibrary.simpleMessage("Ticket"),
    "TicketFrom": m91,
    "TicketPrice": MessageLookupByLibrary.simpleMessage("Ticket price"),
    "TicketSuccessfullyActivated": MessageLookupByLibrary.simpleMessage(
      "The ticket has been successfully activated",
    ),
    "Tickets": m92,
    "Time": MessageLookupByLibrary.simpleMessage("Time"),
    "TimeRange": MessageLookupByLibrary.simpleMessage("Time Range"),
    "TimeRangeError": MessageLookupByLibrary.simpleMessage(
      "End time could not be before start time",
    ),
    "Title": MessageLookupByLibrary.simpleMessage("Title"),
    "TitleYourTop": MessageLookupByLibrary.simpleMessage("Title your TOP"),
    "ToAccessAll": MessageLookupByLibrary.simpleMessage("To access all"),
    "ToAllowAccessGoToSettings": MessageLookupByLibrary.simpleMessage(
      "To allow access to send push notifications, go to your phone settings",
    ),
    "ToBecomeAnInfluencerYouNeedToDo": MessageLookupByLibrary.simpleMessage(
      "To become an influencer you need to do",
    ),
    "ToExtendYourUseSelectPayment": MessageLookupByLibrary.simpleMessage(
      "To extend your use, select payment",
    ),
    "ToFavorites": MessageLookupByLibrary.simpleMessage("To favorites"),
    "ToOpen": MessageLookupByLibrary.simpleMessage("To open"),
    "ToOpenTheNextSetOfToolsYouNeedToDo": MessageLookupByLibrary.simpleMessage(
      "To open the next set of tools you need to do",
    ),
    "ToPlan": MessageLookupByLibrary.simpleMessage("To plan"),
    "ToUnlock": MessageLookupByLibrary.simpleMessage("To unlock"),
    "Today": MessageLookupByLibrary.simpleMessage("Today"),
    "Top": MessageLookupByLibrary.simpleMessage("Top"),
    "TopEventsFor": m93,
    "TopNDonatorsReceiveXPoints": m94,
    "TopPlacesRatedBy": m95,
    "TopographingLocation": MessageLookupByLibrary.simpleMessage(
      "Topographing the location",
    ),
    "Total": MessageLookupByLibrary.simpleMessage("Total"),
    "Translate": MessageLookupByLibrary.simpleMessage("Translate"),
    "TravelerMen": MessageLookupByLibrary.simpleMessage("Traveler"),
    "TravelerWom": MessageLookupByLibrary.simpleMessage("Traveler"),
    "TrialPeriod": MessageLookupByLibrary.simpleMessage("Trial period"),
    "TryYourself": MessageLookupByLibrary.simpleMessage("Try\nyourself"),
    "Tuesday": MessageLookupByLibrary.simpleMessage("Tuesday"),
    "TuesdayShort": MessageLookupByLibrary.simpleMessage("Tue"),
    "TypeHere": MessageLookupByLibrary.simpleMessage("Type here"),
    "TypeOfContent": MessageLookupByLibrary.simpleMessage("Type of content"),
    "UnArchive": MessageLookupByLibrary.simpleMessage("Unarchive"),
    "UnArchiveXAlert": m96,
    "Undefined": MessageLookupByLibrary.simpleMessage("Undefined"),
    "UnderDevelopmentMessage": MessageLookupByLibrary.simpleMessage(
      "Under development",
    ),
    "UnderService": MessageLookupByLibrary.simpleMessage("Under service"),
    "Unfollow": MessageLookupByLibrary.simpleMessage("Unfollow"),
    "UniqueProperties": MessageLookupByLibrary.simpleMessage(
      "Unique properties",
    ),
    "UniqueStatistics": MessageLookupByLibrary.simpleMessage(
      "Unique statistics",
    ),
    "UnknownRing": MessageLookupByLibrary.simpleMessage("Unknown Ring"),
    "UnknownRingDescription": MessageLookupByLibrary.simpleMessage(
      "Strange ring. We don\'t know why it is here...",
    ),
    "UnloadingTheCanvases": MessageLookupByLibrary.simpleMessage(
      "Unloading the canvases",
    ),
    "Unread": MessageLookupByLibrary.simpleMessage("Unread"),
    "UnsubscribeFromProfile": MessageLookupByLibrary.simpleMessage("Unfollow"),
    "Upcoming": MessageLookupByLibrary.simpleMessage("Upcoming"),
    "UpcomingEvent": MessageLookupByLibrary.simpleMessage("Upcoming Event"),
    "UpcomingGlobalEvents": MessageLookupByLibrary.simpleMessage(
      "Upcoming globals",
    ),
    "Update": MessageLookupByLibrary.simpleMessage("Update"),
    "UpdateAppMessage": MessageLookupByLibrary.simpleMessage(
      "It\'s been a while since you\'ve updated our app, and we\'ve added a lot of handy stuff in the meantime",
    ),
    "UpdateAppMessageTitle": MessageLookupByLibrary.simpleMessage(
      "Time for update",
    ),
    "UpgradeAccount": m97,
    "UpgradeAccountConfirmation": MessageLookupByLibrary.simpleMessage(
      "Upgrade",
    ),
    "UpgradeForFree": MessageLookupByLibrary.simpleMessage("upgrade for free"),
    "UpgradeForNmoney": m98,
    "UploadingVideo": MessageLookupByLibrary.simpleMessage("Uploading video"),
    "Upsales": MessageLookupByLibrary.simpleMessage("Upsales"),
    "UpsalesAvailable": MessageLookupByLibrary.simpleMessage(
      "Upsales available",
    ),
    "UpsalesAvailableHint": MessageLookupByLibrary.simpleMessage(
      "t-shirt, hat,yoga mat, mug",
    ),
    "UpsalesProductsFrom": m99,
    "User": MessageLookupByLibrary.simpleMessage("User"),
    "UserHasNoPublicProfileEnd": MessageLookupByLibrary.simpleMessage(
      "doesn\'t have public profile",
    ),
    "UserHasNoPublicProfileStart": MessageLookupByLibrary.simpleMessage("User"),
    "UserTypeSelectionPrompt": MessageLookupByLibrary.simpleMessage(
      "Select the type of account you would like to create",
    ),
    "Users": m100,
    "UsingHealthKit": MessageLookupByLibrary.simpleMessage("Use health data"),
    "UsingNotifications": MessageLookupByLibrary.simpleMessage(
      "Use notifications",
    ),
    "ValueMustBeAtLeast3Characters": MessageLookupByLibrary.simpleMessage(
      "Value must be at least 3 characters long",
    ),
    "VerticalFormat": MessageLookupByLibrary.simpleMessage("Vertical format"),
    "VeryOften": MessageLookupByLibrary.simpleMessage("Very often"),
    "Video": MessageLookupByLibrary.simpleMessage("Video"),
    "VideoFileNotCut": MessageLookupByLibrary.simpleMessage(
      "Video file not cut",
    ),
    "VideoReactionAdded": MessageLookupByLibrary.simpleMessage(
      "Your reaction has been successfully added",
    ),
    "VideoReactionUploadedMessage": MessageLookupByLibrary.simpleMessage(
      "Reaction successfully added",
    ),
    "VideoReactions": MessageLookupByLibrary.simpleMessage("Video-reactions"),
    "VideoUploadFiles": MessageLookupByLibrary.simpleMessage(
      "Video (upload Files)",
    ),
    "ViewAll": MessageLookupByLibrary.simpleMessage("View all"),
    "ViewHistory": MessageLookupByLibrary.simpleMessage("View history"),
    "ViewSources": MessageLookupByLibrary.simpleMessage("View sources"),
    "Views": MessageLookupByLibrary.simpleMessage("Views"),
    "VisitFirstToOpenNext": MessageLookupByLibrary.simpleMessage(
      "Visit first to open next",
    ),
    "Visitors": MessageLookupByLibrary.simpleMessage("Visitors"),
    "Voice": MessageLookupByLibrary.simpleMessage("Voice"),
    "Voices": MessageLookupByLibrary.simpleMessage("Voices"),
    "WaitAdminResponse": MessageLookupByLibrary.simpleMessage(
      "Wait for the admin\'s response",
    ),
    "WantToChange": MessageLookupByLibrary.simpleMessage("Want to change?"),
    "WantToJoin": MessageLookupByLibrary.simpleMessage("wants to join"),
    "WeBringStillLifes": MessageLookupByLibrary.simpleMessage(
      "We bring still lifes",
    ),
    "WeDoNotSpamAllKindsOfNotifications": MessageLookupByLibrary.simpleMessage(
      "We do not spam all kinds of notifications and advertisements. Only those notifications that may be important to you and match your preferences",
    ),
    "WeHavePlacesJustForYou": MessageLookupByLibrary.simpleMessage(
      "We have solution just for you",
    ),
    "WeInstallAndWashShowcase": MessageLookupByLibrary.simpleMessage(
      "We install and wash the showcase",
    ),
    "WeWillLetKnowResults": MessageLookupByLibrary.simpleMessage(
      "We will let you know the results",
    ),
    "Weather": MessageLookupByLibrary.simpleMessage("Weather"),
    "Website": MessageLookupByLibrary.simpleMessage("Website"),
    "Wednesday": MessageLookupByLibrary.simpleMessage("Wednesday"),
    "WednesdayShort": MessageLookupByLibrary.simpleMessage("Wed"),
    "WeekAgo": MessageLookupByLibrary.simpleMessage("a week ago"),
    "Welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
    "WhatIs": MessageLookupByLibrary.simpleMessage("What is \n"),
    "WhatYouLike": MessageLookupByLibrary.simpleMessage("What you like"),
    "WheresTheActivity": MessageLookupByLibrary.simpleMessage(
      "Where\'s the activity?",
    ),
    "WhiteTheme": MessageLookupByLibrary.simpleMessage("White theme"),
    "WhyDoYouLoveIt": MessageLookupByLibrary.simpleMessage(
      "Why do you love it?",
    ),
    "WillBe": MessageLookupByLibrary.simpleMessage(" will be."),
    "WillBeImplementedSoon": MessageLookupByLibrary.simpleMessage(
      "Will be implemented soon",
    ),
    "WiseacreLadyOfSands": MessageLookupByLibrary.simpleMessage(
      "Wiseacre lady of sands",
    ),
    "WiseacreOfSands": MessageLookupByLibrary.simpleMessage(
      "Wiseacre of sands",
    ),
    "WithInDays": m101,
    "WithYourPreferences": MessageLookupByLibrary.simpleMessage(
      "With your\npreferences",
    ),
    "WorkHours": MessageLookupByLibrary.simpleMessage("Work hours"),
    "WriteTheAnswer": MessageLookupByLibrary.simpleMessage("Write the answer"),
    "WrongSecurityCode": MessageLookupByLibrary.simpleMessage(
      "Wrong security code",
    ),
    "XCouldNotBeEmpty": m102,
    "XInvitesY": m103,
    "XIsRequired": m104,
    "XSuccessfullyActivated": m105,
    "XSuccessfullyCreated": m106,
    "XSuccessfullyUpdated": m107,
    "XYearsPlus": m108,
    "Year": MessageLookupByLibrary.simpleMessage("Year"),
    "Yearly": MessageLookupByLibrary.simpleMessage("Yearly"),
    "YearsOld": m109,
    "YearsOldShort": MessageLookupByLibrary.simpleMessage("y.o"),
    "Yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "Yesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
    "You": MessageLookupByLibrary.simpleMessage("You"),
    "YouAskedToBeAddedToTheChat": MessageLookupByLibrary.simpleMessage(
      "You asked to be added to the chat",
    ),
    "YouBetterCheckThisOut": MessageLookupByLibrary.simpleMessage(
      "You better check this out",
    ),
    "YouCanGet": MessageLookupByLibrary.simpleMessage("You can get"),
    "YouCanSeeYourXPromotionMenu": m110,
    "YouCanStillRequestRefundYourComplaint":
        MessageLookupByLibrary.simpleMessage(
          "You can still request a refund on your complaint",
        ),
    "YouCannotCreateOfferDate": MessageLookupByLibrary.simpleMessage(
      "You cannot create an offer because the event or venue has already been completed",
    ),
    "YouGetAccessToTrial": MessageLookupByLibrary.simpleMessage(
      "You get access to all benefits free of charge for",
    ),
    "YouGetExactlyWhatYouNeed": MessageLookupByLibrary.simpleMessage(
      "You get exactly what you need",
    ),
    "YouMissedALot": MessageLookupByLibrary.simpleMessage("You missed a lot"),
    "YouProgressed": MessageLookupByLibrary.simpleMessage("You progressed!"),
    "YouReceived": MessageLookupByLibrary.simpleMessage("You received"),
    "YouSentInvitationToNPeople": m111,
    "YouSharedTicket": MessageLookupByLibrary.simpleMessage(
      "You shared a ticket",
    ),
    "YouSureToDeleteX": m112,
    "YouWillNoLongerSendMessagesTo": m113,
    "YouWillNoLongerSendMessagesToChat": MessageLookupByLibrary.simpleMessage(
      "You can no longer send messages to chat",
    ),
    "YouWillReceiveNewTools": MessageLookupByLibrary.simpleMessage(
      "You will receive new tools",
    ),
    "YoullFindIt": MessageLookupByLibrary.simpleMessage("You’ll find it"),
    "YourAge": MessageLookupByLibrary.simpleMessage("Your age"),
    "YourAudienceAge": MessageLookupByLibrary.simpleMessage(
      "Your audience age",
    ),
    "YourClaim": MessageLookupByLibrary.simpleMessage("Your claim"),
    "YourClaimHasBeenSent": MessageLookupByLibrary.simpleMessage(
      "Your claim has been sent",
    ),
    "YourEmail": MessageLookupByLibrary.simpleMessage("Your email"),
    "YourEvent": MessageLookupByLibrary.simpleMessage("Your event"),
    "YourLeisureSelection": MessageLookupByLibrary.simpleMessage(
      "Your leisure selection",
    ),
    "YourName": MessageLookupByLibrary.simpleMessage("Your name"),
    "YourNewTools": MessageLookupByLibrary.simpleMessage("Your new tools"),
    "YourNiche": MessageLookupByLibrary.simpleMessage("Your niche"),
    "YourNotificationWillBeShown": MessageLookupByLibrary.simpleMessage(
      "Your notification will be shown 3 times a week during the specified period of valid, no more than 1 show per person.",
    ),
    "YourOfferHasAlreadyBeenPublishedToYourAudience":
        MessageLookupByLibrary.simpleMessage(
          "Your offer has already been published to your audience, by changing or deleting it you are responsible for their potential negative attitude.",
        ),
    "YourOfferWillShown1Time": MessageLookupByLibrary.simpleMessage(
      "Your offer will be shown 1 time and included in the list of offers of your audience. It will disappear after the end of the event.",
    ),
    "YourPosition": MessageLookupByLibrary.simpleMessage("Your position"),
    "YourPriceSegment": MessageLookupByLibrary.simpleMessage(
      "Your price segment",
    ),
    "YourProgress": MessageLookupByLibrary.simpleMessage("Your progress"),
    "YourReminderIsShown1Time": MessageLookupByLibrary.simpleMessage(
      "Your reminder is shown 1 time on the specified date.",
    ),
    "YourReminderIsShown1TimeMax3": MessageLookupByLibrary.simpleMessage(
      "Your reminder is shown 1 time on the specified date. You have a maximum of 3 attempts to be reminded.",
    ),
    "YourReminderShown1TimeOnTheSpecifiedDate":
        MessageLookupByLibrary.simpleMessage(
          "Your reminder is shown 1 time on the specified date.",
        ),
    "YourTraffic": MessageLookupByLibrary.simpleMessage("Your traffic"),
    "Yourself": MessageLookupByLibrary.simpleMessage("Yourself"),
    "daynight": MessageLookupByLibrary.simpleMessage("Day and night"),
    "inXDays": m114,
    "key": MessageLookupByLibrary.simpleMessage(""),
  };
}
