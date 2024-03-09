// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(allowValue) => "Разрешить ${allowValue}";

  static String m1(allowedCharacters) =>
      "Допустимые символы ${allowedCharacters}";

  static String m2(item) =>
      "${Intl.plural(item, zero: '3 уровня сложности', one: 'посещай и открывай новое', two: 'посети и зачекинься', few: 'пройди и получи награду', other: 'другое')}";

  static String m3(days) =>
      "${Intl.plural(days, zero: 'дней', one: 'день', two: 'дня', few: 'дня', many: 'дней', other: 'дней')}";

  static String m4(actuallyRaised, goal) =>
      "собрано ${actuallyRaised}/\$${goal}\$";

  static String m5(editingType) => "${editingType} место";

  static String m6(inputType) => "Ввести ${inputType}";

  static String m7(item) =>
      "${Intl.plural(item, zero: 'гео', one: 'интересы', two: 'погода вокруг', few: 'и еще 14 свойств', other: 'другое')}";

  static String m8(item) =>
      "${Intl.plural(item, zero: 'выбераешь нишу', one: 'жмешь', two: 'получаешь подборку', few: 'выбираешь и планируешь', other: 'другое')}";

  static String m9(item) =>
      "${Intl.plural(item, zero: 'события и места', one: 'фильтруется тэгами', two: 'выбирай и жми', few: 'прокручивай\n', other: 'другое')}";

  static String m10(count) =>
      "${Intl.plural(count, zero: '${count} поинтов', one: '${count} поинт', two: '${count} поинта', few: '${count} поинтов', many: '${count} поинтов', other: '${count} поинтов')}";

  static String m11(count) =>
      "${Intl.plural(count, zero: '${count} общих интересов', one: '${count} общий интерес', two: '${count} общих интереса', few: '${count} общих интересов', many: '${count} общих интересов', other: '${count} общих интересов')}";

  static String m12(formattedPrice) => " За ${formattedPrice}";

  static String m13(helpfulCount) => "Полезно ${helpfulCount}";

  static String m14(days) =>
      "Система подсказок активирована на ${Intl.plural(days, zero: '${days} дней', one: '${days} день', two: '${days} дня', few: '${days} дня', many: '${days} дней', other: '${days} дней')}";

  static String m15(invitedPeopleCount) =>
      "Приглашает ${invitedPeopleCount} людей на";

  static String m16(provider) => "Продолжить с ${provider}";

  static String m17(item) =>
      "${Intl.plural(item, zero: 'Участников', one: 'Участник', two: 'Участников', few: 'Участников', many: 'Участниками', other: 'Участники')}";

  static String m18(placeIndex) => "${placeIndex} место";

  static String m19(elements) => "Следующие ${elements}";

  static String m20(amountOfPeople) => "Следующие ${amountOfPeople}";

  static String m21(religionCount) =>
      "Пожалуйста, выберите из списка ${religionCount} религию";

  static String m22(item) =>
      "${Intl.plural(item, zero: 'размести запрос', one: 'напиши и сделай видео', two: 'будь убедителен и честен', few: 'помогай другим', other: 'другое')}";

  static String m23(item) =>
      "${Intl.plural(item, zero: 'найти компаньонов', one: 'похожие предпочтения', two: 'поинты = репутация', few: 'никаких неприятелей', other: 'другое')}";

  static String m24(amount) => "Читать ${amount}";

  static String m25(item) =>
      "${Intl.plural(item, zero: 'предпочтения не работают', one: 'события/места', two: 'введи и получай', few: 'смотри на рейтинги', other: 'другой')}";

  static String m26(type) => "Выбрать ${type}";

  static String m27(item) =>
      "${Intl.plural(item, zero: 'свайпай карточки', one: 'листай свойства места', two: 'ок/не ок/в избранное', few: 'учи нашу систему', other: 'другое')}";

  static String m28(item) =>
      "${Intl.plural(item, zero: 'ради забавы', one: 'можно листать категорию', two: 'выбирай и планируй', few: 'ищи и бронируй', other: 'другое')}";

  static String m29(separator) => "Расскажи${separator}о себе";

  static String m30(amountOfTopDonators, multiplier) =>
      "Топовые ${amountOfTopDonators} донаторы получают x${multiplier} очков";

  static String m31(separator) => "Топовые места,${separator}от";

  static String m32(type) => "Чтобы пользоваться этим нужен ${type} аккаунт";

  static String m33(forNMoney) => "Купить ${forNMoney}";

  static String m34(count) =>
      "${Intl.plural(count, zero: '${count} человек', one: '${count} человек', two: '${count} человека', few: '${count} людей', many: '${count} человек', other: '${count} человек')}";

  static String m35(days) =>
      "через ${days} ${Intl.plural(days, zero: 'дней', one: 'день', two: 'дня', few: 'дня', many: 'дней', other: 'дней')}";

  static String m36(value) => "${value} не может быть пустым";

  static String m37(title) => "${title} требуется";

  static String m38(value) => "${value} успешно обновлено";

  static String m39(amountOfInvitedPersons) =>
      "Вы отправили приглашение ${amountOfInvitedPersons} людям";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "AcceptDonations": MessageLookupByLibrary.simpleMessage(
            "Принимать донаты или помогать другим воплотить мечты"),
        "Account": MessageLookupByLibrary.simpleMessage("Аккаунт"),
        "ActivityType": MessageLookupByLibrary.simpleMessage("Тип активности"),
        "AddFeedback": MessageLookupByLibrary.simpleMessage("Поставить оценку"),
        "AddFeedbackFieldHint": MessageLookupByLibrary.simpleMessage(
            "Расскажите что вам понравилось или запомнилось"),
        "AddFeedbackFieldTitle":
            MessageLookupByLibrary.simpleMessage("Опишите ваш опыт"),
        "AddInfluencerFeedbackPopOverText": MessageLookupByLibrary.simpleMessage(
            "Напишите подробный отзыв, используйте все доступные символы, чтобы как можно больше людей могли его оценить"),
        "AddPromotion": MessageLookupByLibrary.simpleMessage("Добавить промо"),
        "AddReview": MessageLookupByLibrary.simpleMessage("Оставить отзыв"),
        "AddReviewFieldHint": MessageLookupByLibrary.simpleMessage(
            "Напишите полезное дополнение"),
        "AddReviewFieldTitle":
            MessageLookupByLibrary.simpleMessage("Опишите ваш опыт"),
        "AddReviewPopOverText": MessageLookupByLibrary.simpleMessage(
            "Напишите дополнение к отзыву, которое будет полезно для других посетителей"),
        "AddToPersonalTop":
            MessageLookupByLibrary.simpleMessage("Добавить в личный ТОП"),
        "AddYourselfToList":
            MessageLookupByLibrary.simpleMessage("Добавиться в список"),
        "Address": MessageLookupByLibrary.simpleMessage("Адрес"),
        "AllAppNotification":
            MessageLookupByLibrary.simpleMessage("Все уведомления"),
        "Allow": MessageLookupByLibrary.simpleMessage("Разрешить"),
        "AllowAll": MessageLookupByLibrary.simpleMessage("Разрешить всё"),
        "AllowGeolocation":
            MessageLookupByLibrary.simpleMessage("Разрешить гео"),
        "AllowLocationServicesToUseThisFunction":
            MessageLookupByLibrary.simpleMessage(
                "Разрешить гео для этой функции"),
        "AllowX": m0,
        "AllowedCaracters": m1,
        "AndWithWhitespaces": MessageLookupByLibrary.simpleMessage(" И "),
        "Archive": MessageLookupByLibrary.simpleMessage("Архив"),
        "Archived": MessageLookupByLibrary.simpleMessage("Архив"),
        "AreYouSureYouWantToDeleteYourAccount":
            MessageLookupByLibrary.simpleMessage(
                "Уверены, что хотите удалить аккаунт?"),
        "AreYouSureYouWantToDeleteYourCompanyProfile":
            MessageLookupByLibrary.simpleMessage(
                "Уверены, что хотите удалить аккаунт компании?"),
        "AreYouSureYouWantToLogOut":
            MessageLookupByLibrary.simpleMessage("Уверены, что хотите выйти?"),
        "AskForDonations":
            MessageLookupByLibrary.simpleMessage("Попросить донат"),
        "AskOrSupport":
            MessageLookupByLibrary.simpleMessage("Попросить или помочь"),
        "AskPeople": MessageLookupByLibrary.simpleMessage("Спросить"),
        "Atheism": MessageLookupByLibrary.simpleMessage("Атеизм"),
        "Athlete": MessageLookupByLibrary.simpleMessage("Спортсмен"),
        "Balance": MessageLookupByLibrary.simpleMessage("Баланс "),
        "BaseProperties":
            MessageLookupByLibrary.simpleMessage("Базовые свойства"),
        "BasedOnYourActivityWeDetermineYourCondition":
            MessageLookupByLibrary.simpleMessage(
                "На основании вашей активности, пульса и других факторов мы определяем ваше состояние и стараемся рекомендовать то, что вам нужно прямо сейчас, конкретно для вас."),
        "BeInSearch": MessageLookupByLibrary.simpleMessage("Быть в поиске"),
        "BookIt": MessageLookupByLibrary.simpleMessage("Букинг"),
        "Buddhism": MessageLookupByLibrary.simpleMessage("Буддизм"),
        "BurnedToday": MessageLookupByLibrary.simpleMessage("Сожжено сегодя"),
        "Business": MessageLookupByLibrary.simpleMessage("Бизнес"),
        "ByContinuingYouAcceptThe":
            MessageLookupByLibrary.simpleMessage("Продолжая, вы принимаете"),
        "Cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "Category": MessageLookupByLibrary.simpleMessage("категория"),
        "ChangePhoto": MessageLookupByLibrary.simpleMessage("Изменить фото"),
        "CheckIn": MessageLookupByLibrary.simpleMessage("Check in"),
        "CheckInHiwHint": m2,
        "CheckInHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "излечит ваше чувство или усилит!"),
        "CheckInHiwTitle":
            MessageLookupByLibrary.simpleMessage("Подходящий контент..."),
        "CheckItOut": MessageLookupByLibrary.simpleMessage("Зацени"),
        "ChooseOption": MessageLookupByLibrary.simpleMessage("Выбери"),
        "ChooseYourself": MessageLookupByLibrary.simpleMessage("Выбери себя"),
        "Christianity": MessageLookupByLibrary.simpleMessage("Христианство"),
        "ClickEnterToSearch":
            MessageLookupByLibrary.simpleMessage("Нажмите Ввод для поиска"),
        "Company": MessageLookupByLibrary.simpleMessage("Компания"),
        "CompanyAnswered":
            MessageLookupByLibrary.simpleMessage("Ответ компании"),
        "CompanyCredentials":
            MessageLookupByLibrary.simpleMessage("Данные компании"),
        "CompanyName":
            MessageLookupByLibrary.simpleMessage("Название компании"),
        "CompanyPosition":
            MessageLookupByLibrary.simpleMessage("Позиция компания"),
        "Confirm": MessageLookupByLibrary.simpleMessage("Подтвердить"),
        "ContactPerson":
            MessageLookupByLibrary.simpleMessage("Контактное лицо"),
        "Continue": MessageLookupByLibrary.simpleMessage("Продолжить"),
        "Control": MessageLookupByLibrary.simpleMessage("Контроль"),
        "Create": MessageLookupByLibrary.simpleMessage("Создать"),
        "CreateEvent": MessageLookupByLibrary.simpleMessage("Создать событие"),
        "CreatePlace": MessageLookupByLibrary.simpleMessage("Создать место"),
        "CreateYourPlaceAndInvitePeople": MessageLookupByLibrary.simpleMessage(
            "Создайте своё место и пригласите людей"),
        "CredentialsCodeVerificationSubtitle":
            MessageLookupByLibrary.simpleMessage(
                "Пожалуйста, введите код, отправленный на"),
        "CredentialsVerificationPrompt": MessageLookupByLibrary.simpleMessage(
            "Чтобы продолжить, сначала пройдите регистрацию"),
        "CredentialsVerificationTitle":
            MessageLookupByLibrary.simpleMessage("Мы рады вас видеть"),
        "Daily": MessageLookupByLibrary.simpleMessage("Ежедневно "),
        "DateOfBirth": MessageLookupByLibrary.simpleMessage("Дата рождения"),
        "Dates": MessageLookupByLibrary.simpleMessage("Даты"),
        "Day": MessageLookupByLibrary.simpleMessage("День"),
        "Days": m3,
        "DaysOfWeek": MessageLookupByLibrary.simpleMessage("Дни недели"),
        "DeleteAccount":
            MessageLookupByLibrary.simpleMessage("Удалить аккаунт"),
        "DeleteCompany":
            MessageLookupByLibrary.simpleMessage("Удалить компанию"),
        "DeleteFromList":
            MessageLookupByLibrary.simpleMessage("Удалить из списка"),
        "DependingOn": MessageLookupByLibrary.simpleMessage("Зависит от..."),
        "DescribeYourBusiness":
            MessageLookupByLibrary.simpleMessage("Опишите ваш бизнес"),
        "DescribeYourClaim":
            MessageLookupByLibrary.simpleMessage("Рассказывайте"),
        "DescribeYourIssue":
            MessageLookupByLibrary.simpleMessage("Опишите проблему"),
        "DescribeYourWishes":
            MessageLookupByLibrary.simpleMessage("Опишите пожелания"),
        "DescribeYourself":
            MessageLookupByLibrary.simpleMessage("Опишите себя"),
        "Description": MessageLookupByLibrary.simpleMessage("Описание"),
        "Details": MessageLookupByLibrary.simpleMessage("Детали"),
        "Directions": MessageLookupByLibrary.simpleMessage("Направления"),
        "DonationHint": MessageLookupByLibrary.simpleMessage(
            "Вы можете создавать один запрос в месяц и потратить деньги только на свою мечту "),
        "DonationRaised": m4,
        "DontBeAlone":
            MessageLookupByLibrary.simpleMessage("Не будьте одиноки"),
        "DontMissIt": MessageLookupByLibrary.simpleMessage("Не пропустите"),
        "Easy": MessageLookupByLibrary.simpleMessage("Изи"),
        "Edit": MessageLookupByLibrary.simpleMessage("Редактировать"),
        "EditProfile": MessageLookupByLibrary.simpleMessage("Редактировать"),
        "EditingTypePlace": m5,
        "Email": MessageLookupByLibrary.simpleMessage("Email"),
        "EmailVerification":
            MessageLookupByLibrary.simpleMessage("Подтверждение email"),
        "EnableHintSystem":
            MessageLookupByLibrary.simpleMessage("Включить подсказки"),
        "EnterInputType": m6,
        "EnterNewPassword":
            MessageLookupByLibrary.simpleMessage("Новый пароль"),
        "EnterPlaceAddressPrompt": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, введите адрес места"),
        "EnterYourEmailAddress":
            MessageLookupByLibrary.simpleMessage("Введите адрес эл. почты"),
        "ErrorOccured": MessageLookupByLibrary.simpleMessage("Возникла ошибка"),
        "ErrorOccuredWithoutMessage":
            MessageLookupByLibrary.simpleMessage("Ошибка без сообщения"),
        "Event": MessageLookupByLibrary.simpleMessage("Событие"),
        "EventType": MessageLookupByLibrary.simpleMessage("Тип события"),
        "Events": MessageLookupByLibrary.simpleMessage("События"),
        "EventsReminders":
            MessageLookupByLibrary.simpleMessage("Напоминания о событиях"),
        "Exit": MessageLookupByLibrary.simpleMessage("Выход"),
        "Fair": MessageLookupByLibrary.simpleMessage("Средне"),
        "Faq": MessageLookupByLibrary.simpleMessage("ЧаВО"),
        "FaqUnderDev": MessageLookupByLibrary.simpleMessage(
            "Сбор запросов для FAQ. \nРаздел находится в разработке"),
        "Favorites": MessageLookupByLibrary.simpleMessage("Избранное"),
        "FeaturesEnableGeolocation":
            MessageLookupByLibrary.simpleMessage("Функции включают геолокацию"),
        "FeedFeelingsHiwItems": m7,
        "FeedFeelingsHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "получаешь то, что нужно конкретно тебе"),
        "FeedFeelingsHiwTitle":
            MessageLookupByLibrary.simpleMessage("Полагаясь на..."),
        "FeedNichesHiwItems": m8,
        "FeedNichesHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "получаешь то, что есть в твоей нише"),
        "FeedNichesHiwTitle":
            MessageLookupByLibrary.simpleMessage("Отличное совпадение..."),
        "FeedRandomizerHiwItems": m9,
        "FeedRandomizerHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "нажимаешь и случайная выдача"),
        "FeedRandomizerHiwTitle":
            MessageLookupByLibrary.simpleMessage("Его величество случай..."),
        "FeedbackAddedSuccessfullyMessage":
            MessageLookupByLibrary.simpleMessage("Ваш отзыв успешно добавлен"),
        "Feeling": MessageLookupByLibrary.simpleMessage("Чувство"),
        "Female": MessageLookupByLibrary.simpleMessage("Женщина"),
        "Filters": MessageLookupByLibrary.simpleMessage("Фильтры"),
        "FindSomeoneCardPoints": m10,
        "FindSomeoneCardSameInterests": m11,
        "FindSomeoneToHangOutWith":
            MessageLookupByLibrary.simpleMessage("Найти с кем затусить"),
        "FindSomeoneToNetworkWith": MessageLookupByLibrary.simpleMessage(
            "Найти кого-то для нетворкинга"),
        "Follow": MessageLookupByLibrary.simpleMessage("Следовать"),
        "Followers": MessageLookupByLibrary.simpleMessage("Подписчики"),
        "Followings": MessageLookupByLibrary.simpleMessage("Подписки"),
        "For": MessageLookupByLibrary.simpleMessage("Для"),
        "ForFormattedPrice": m12,
        "ForPeriod": MessageLookupByLibrary.simpleMessage("на"),
        "ForgotPassword": MessageLookupByLibrary.simpleMessage("Забыл пароль"),
        "FreePlaces": MessageLookupByLibrary.simpleMessage("\nбесплатных мест"),
        "FulfillTheDream":
            MessageLookupByLibrary.simpleMessage("Исполнить мечту"),
        "Gender": MessageLookupByLibrary.simpleMessage("Пол"),
        "GetCode": MessageLookupByLibrary.simpleMessage("Получить код"),
        "GetReward": MessageLookupByLibrary.simpleMessage("Забрать награду"),
        "GetStarted": MessageLookupByLibrary.simpleMessage("Начать"),
        "Go": MessageLookupByLibrary.simpleMessage("Go!"),
        "GoToSettings":
            MessageLookupByLibrary.simpleMessage("Перейти в настройки"),
        "Guess": MessageLookupByLibrary.simpleMessage("Угадать"),
        "HallOfFame": MessageLookupByLibrary.simpleMessage("Зал славы"),
        "HardToAnswer": MessageLookupByLibrary.simpleMessage("Сложно ответить"),
        "Hardcore": MessageLookupByLibrary.simpleMessage("Хардкор"),
        "HealthKit": MessageLookupByLibrary.simpleMessage("Данные здоровья"),
        "Helpful": MessageLookupByLibrary.simpleMessage("Полезно"),
        "HelpfulNCount": m13,
        "Hindu": MessageLookupByLibrary.simpleMessage("Индуизм"),
        "HintSystemDisabled": MessageLookupByLibrary.simpleMessage(
            "Система подсказок деактивирована"),
        "HintSystemEnabled": m14,
        "HowAreYouFeelingThisMorning": MessageLookupByLibrary.simpleMessage(
            "Как вы себя чувствуете этим утром?"),
        "HowAreYouFeelingToday": MessageLookupByLibrary.simpleMessage(
            "Как вы себя чувствуете в течение дня?"),
        "HowAreYouFeelingTonight": MessageLookupByLibrary.simpleMessage(
            "Как вы себя чувствуете этим вечером?"),
        "HowItWorks": MessageLookupByLibrary.simpleMessage("Как\nэто?"),
        "HowMuchDoYouWantToDonate": MessageLookupByLibrary.simpleMessage(
            "Сколько \$ хочешь задонатить?"),
        "IncorrectLoginOrPassword":
            MessageLookupByLibrary.simpleMessage("Не тот логин или пароль"),
        "InvitationsCanBeViewedInPrivateMessages":
            MessageLookupByLibrary.simpleMessage(
                "Приглашения можно посмотреть в сообщениях"),
        "Invite": MessageLookupByLibrary.simpleMessage("Пригласить"),
        "InviteList":
            MessageLookupByLibrary.simpleMessage("Cписок\nприглашений"),
        "InviteMore": MessageLookupByLibrary.simpleMessage("Пригласить ещё"),
        "InvitePeople": MessageLookupByLibrary.simpleMessage("Пригласить"),
        "InviteToFavoritePlaces": MessageLookupByLibrary.simpleMessage(
            "Пригласить в избранные места"),
        "InvitesNPeopleTo": m15,
        "InvitesYouTo":
            MessageLookupByLibrary.simpleMessage("Приглашает вас на"),
        "IsRecurrent": MessageLookupByLibrary.simpleMessage("Повторяется"),
        "Islam": MessageLookupByLibrary.simpleMessage("Ислам"),
        "Judaism": MessageLookupByLibrary.simpleMessage("Иудаизм"),
        "Leisure": MessageLookupByLibrary.simpleMessage("Досуг"),
        "Less": MessageLookupByLibrary.simpleMessage("меньше"),
        "Loading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
        "Location": MessageLookupByLibrary.simpleMessage("Локация"),
        "LoginWith": m16,
        "Logo": MessageLookupByLibrary.simpleMessage("Лого"),
        "LogoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Лого (загрузить)"),
        "LovelyTouchAmazingInteraction":
            MessageLookupByLibrary.simpleMessage("Приятный на ощупь интерфейс"),
        "Male": MessageLookupByLibrary.simpleMessage("Мужчина"),
        "Members": m17,
        "Message": MessageLookupByLibrary.simpleMessage("Сообщение"),
        "Messages": MessageLookupByLibrary.simpleMessage("Сообщения"),
        "Month": MessageLookupByLibrary.simpleMessage("Месяц"),
        "Monthly": MessageLookupByLibrary.simpleMessage("Месячный"),
        "More": MessageLookupByLibrary.simpleMessage("больше"),
        "MyCard": MessageLookupByLibrary.simpleMessage("Профиль"),
        "MyEvents": MessageLookupByLibrary.simpleMessage("Мои события"),
        "NPlace": m18,
        "Name": MessageLookupByLibrary.simpleMessage("Имя"),
        "NameOrNickname": MessageLookupByLibrary.simpleMessage("Имя или ник"),
        "NewDonates": MessageLookupByLibrary.simpleMessage("Новые донаты"),
        "NewFeatures": MessageLookupByLibrary.simpleMessage("Новые функции"),
        "NewFollowers":
            MessageLookupByLibrary.simpleMessage("Новые подписчики"),
        "NewLocationHasOpenedToday": MessageLookupByLibrary.simpleMessage(
            "Сегодня открылось новое место. Приходи! Понравится!"),
        "NewPlace": MessageLookupByLibrary.simpleMessage("Новое место"),
        "Next": MessageLookupByLibrary.simpleMessage("Далее"),
        "NextElements": m19,
        "NextNPeople": m20,
        "NextWithChevrons": MessageLookupByLibrary.simpleMessage("Далее >>>"),
        "Nickname": MessageLookupByLibrary.simpleMessage("Ник"),
        "NicknameIsTakenTryAnotherOne": MessageLookupByLibrary.simpleMessage(
            "Ник занят, попробуйте другой"),
        "NoConnection": MessageLookupByLibrary.simpleMessage(
            "Потеряно соединение с интернетом"),
        "NoDateSelected":
            MessageLookupByLibrary.simpleMessage("Дата не выбрана"),
        "NoFavoritesFound":
            MessageLookupByLibrary.simpleMessage("Нет избранных"),
        "NoHealthKitAvailableOnYourDevice":
            MessageLookupByLibrary.simpleMessage(
                "Не доступны данные здоровья, результат будет случайным"),
        "NoPhotoHereYet":
            MessageLookupByLibrary.simpleMessage("Тут пока нет фото!"),
        "NoPreferencesChosen":
            MessageLookupByLibrary.simpleMessage("Предпочтения не выбраны"),
        "NoThx": MessageLookupByLibrary.simpleMessage("Нет, спс"),
        "NotNow": MessageLookupByLibrary.simpleMessage("Не сейчас"),
        "NotOften": MessageLookupByLibrary.simpleMessage("Не часто"),
        "NothingFound":
            MessageLookupByLibrary.simpleMessage("Ничего не найдено"),
        "NothingWasFoundWithEmoji":
            MessageLookupByLibrary.simpleMessage("Ничего не найдено :c"),
        "Notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
        "NowLetsGetToKnowEachOther": MessageLookupByLibrary.simpleMessage(
            "Теперь давай узнаем друг друга поближе"),
        "NowWeKnowYouBetter": MessageLookupByLibrary.simpleMessage(
            "Спасибо!\nТеперь мы знаем тебя лучше"),
        "Off": MessageLookupByLibrary.simpleMessage("Выкл"),
        "Ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "OkayCool": MessageLookupByLibrary.simpleMessage("Ок, круто!"),
        "OnboardingSlide1": MessageLookupByLibrary.simpleMessage("веселиться"),
        "OnboardingSlide2":
            MessageLookupByLibrary.simpleMessage("развлечения\nи бизнес"),
        "OnboardingSlide3":
            MessageLookupByLibrary.simpleMessage("просто чилить"),
        "Ooops": MessageLookupByLibrary.simpleMessage("Ууупс!"),
        "OopsIWillTryAgain":
            MessageLookupByLibrary.simpleMessage("Уупс, попробую ещё"),
        "OpenFrom": MessageLookupByLibrary.simpleMessage("С"),
        "OpenTo": MessageLookupByLibrary.simpleMessage("До"),
        "OpeningHours": MessageLookupByLibrary.simpleMessage("Часы работы"),
        "OrDragFilesHere":
            MessageLookupByLibrary.simpleMessage("Или перетащите файлы"),
        "Other": MessageLookupByLibrary.simpleMessage("Другое"),
        "OurRecommendationsAboutGeolocation": MessageLookupByLibrary.simpleMessage(
            "Система рекомендаций основана на многих факторах. Геолокация – лишь часть системы, которая позволит правильно расставить приоритеты, по расстоянию, по ближайшим особенностям ландшафта (горы, водоемы, равнины, пустыни)"),
        "Password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "PasswordConditions": MessageLookupByLibrary.simpleMessage(
            "Пароль должен содержать хотя бы одну заглавную букву, одну строчную, одну цифру и один специальный символ"),
        "PasswordHint": MessageLookupByLibrary.simpleMessage(
            "Буквы, цифры, ! “ @ # \$ % &, не менее 8 символов"),
        "PasswordMustBeAtLeast8Characters":
            MessageLookupByLibrary.simpleMessage("Пароль не менее 8 символов"),
        "Permissions": MessageLookupByLibrary.simpleMessage("Разрешения"),
        "Personal": MessageLookupByLibrary.simpleMessage("Личный"),
        "PersonalCredentials":
            MessageLookupByLibrary.simpleMessage("Личные данные"),
        "PersonalRespect":
            MessageLookupByLibrary.simpleMessage("Личное уважение"),
        "Phone": MessageLookupByLibrary.simpleMessage("Телефон"),
        "PhoneVerification": MessageLookupByLibrary.simpleMessage(
            "Подтверждение номера телефона"),
        "Photo": MessageLookupByLibrary.simpleMessage("Фото"),
        "PhotoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Фото (загрузить)"),
        "Photos": MessageLookupByLibrary.simpleMessage("Фото"),
        "PickFromMap": MessageLookupByLibrary.simpleMessage("Выбрать на карте"),
        "Place": MessageLookupByLibrary.simpleMessage("Место"),
        "PlaceType": MessageLookupByLibrary.simpleMessage("Тип места"),
        "Places": MessageLookupByLibrary.simpleMessage("Места"),
        "PleaseFillOutDate":
            MessageLookupByLibrary.simpleMessage("Заполните дату, пожалуйста"),
        "PleaseFillOutYourWishes": MessageLookupByLibrary.simpleMessage(
            "Заполните пожелания, пожалуйста"),
        "PleaseSelectANiche":
            MessageLookupByLibrary.simpleMessage("Выберите нишу, пожалуйста"),
        "PleaseSelectAtLeastNReligion": m21,
        "PleaseSelectAtLeastOneAgeRange": MessageLookupByLibrary.simpleMessage(
            "Выберите хотя бы одну возрастную группу"),
        "PleaseSelectAtLeastOnePriceSegment":
            MessageLookupByLibrary.simpleMessage(
                "Please select at least one price segment"),
        "PleaseSelectGender":
            MessageLookupByLibrary.simpleMessage("Пожалуйста, укажите пол"),
        "PleaseSelectOneType": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, выберите один тип"),
        "PointBalance": MessageLookupByLibrary.simpleMessage("Баланс\nочков"),
        "Points": MessageLookupByLibrary.simpleMessage("Очки"),
        "Position": MessageLookupByLibrary.simpleMessage("Позиция"),
        "Preferences": MessageLookupByLibrary.simpleMessage("Предпочтения"),
        "Premium": MessageLookupByLibrary.simpleMessage("Premium"),
        "PremiumAccount":
            MessageLookupByLibrary.simpleMessage("Premium аккаунт"),
        "PremiumSubscriptionFeature1": MessageLookupByLibrary.simpleMessage(
            "Уникальная функция “Connects”. Поиск, общение, встречи с компаньонами, нетворкинг"),
        "PremiumSubscriptionFeature2":
            MessageLookupByLibrary.simpleMessage("Специальный бейдж в профиле"),
        "PremiumSubscriptionFeature3": MessageLookupByLibrary.simpleMessage(
            "Возможность оставлять отзывы, видео-реакции о местах и событиях, участвовать в рейтинге"),
        "PremiumSubscriptionFeature4": MessageLookupByLibrary.simpleMessage(
            "Предлагать приложению любимые места"),
        "PremiumSubscriptionFeature5": MessageLookupByLibrary.simpleMessage(
            "Переключать темную и светлую темы"),
        "PremiumSubscriptionFeature6": MessageLookupByLibrary.simpleMessage(
            "Возможность стать Инфлюенсером"),
        "Price": MessageLookupByLibrary.simpleMessage("цена"),
        "Privacy": MessageLookupByLibrary.simpleMessage("Конфиденциальность"),
        "PrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Политика конфиденциальности"),
        "Pro": MessageLookupByLibrary.simpleMessage("Pro"),
        "ProAccount": MessageLookupByLibrary.simpleMessage("Pro аккаунт"),
        "ProSubscriptionFeature1":
            MessageLookupByLibrary.simpleMessage("Специальный бейдж в профиле"),
        "ProSubscriptionFeature2": MessageLookupByLibrary.simpleMessage(
            "Возможность создавать свои собственные события"),
        "ProSubscriptionFeature3": MessageLookupByLibrary.simpleMessage(
            "Дополнительная мотивация потенциальной аудитории (клиентов/посетителей) с помощью системы баллов"),
        "ProSubscriptionFeature4": MessageLookupByLibrary.simpleMessage(
            "Возможность продавать дополнительный сервис через систему бронирования"),
        "ProSubscriptionFeature5":
            MessageLookupByLibrary.simpleMessage("Допродажи"),
        "ProSubscriptionFeature6": MessageLookupByLibrary.simpleMessage(
            "Внутренняя таргетированная реклама ваших событий, статистика и аналитика"),
        "ProSubscriptionFeature7": MessageLookupByLibrary.simpleMessage(
            "Возможность использовать специальные уведомления"),
        "ProfileAskOrSupportHiwHint": m22,
        "ProfileAskOrSupportHiwSubtitle":
            MessageLookupByLibrary.simpleMessage("свою или чью-то"),
        "ProfileAskOrSupportHiwTitle":
            MessageLookupByLibrary.simpleMessage("Исполни мечту..."),
        "ProfileFindSomeoneHiwHint": m23,
        "ProfileFindSomeoneHiwSubtitle":
            MessageLookupByLibrary.simpleMessage("пойти куда-нибудь вместе"),
        "ProfileFindSomeoneHiwTitle":
            MessageLookupByLibrary.simpleMessage("Не будь один..."),
        "Published": MessageLookupByLibrary.simpleMessage("Опубликовано"),
        "Rating": MessageLookupByLibrary.simpleMessage("Рейтинг"),
        "Read": m24,
        "Recommended": MessageLookupByLibrary.simpleMessage("Рекомендуем"),
        "ResendCode":
            MessageLookupByLibrary.simpleMessage("Отправить код еще раз"),
        "Reset": MessageLookupByLibrary.simpleMessage("Сбросить"),
        "ResetFilters":
            MessageLookupByLibrary.simpleMessage("Сбросить фильтры"),
        "ResetPassword":
            MessageLookupByLibrary.simpleMessage("Сбросить пароль"),
        "Save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "Search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "SearchBusinessChooseYourself1":
            MessageLookupByLibrary.simpleMessage("Бизнес-клубы"),
        "SearchBusinessChooseYourself2":
            MessageLookupByLibrary.simpleMessage("Digital & IT конференции"),
        "SearchBusinessChooseYourself3":
            MessageLookupByLibrary.simpleMessage("Питч сессии"),
        "SearchBusinessChooseYourself4":
            MessageLookupByLibrary.simpleMessage("Бизнес игры"),
        "SearchBusinessChooseYourself5": MessageLookupByLibrary.simpleMessage(
            "Форумы (отраслевые выставки)"),
        "SearchBusinessChooseYourself6":
            MessageLookupByLibrary.simpleMessage("Нетворкинг"),
        "SearchBusinessChooseYourself7":
            MessageLookupByLibrary.simpleMessage("Семинары и тренинги"),
        "SearchChooseYourself1":
            MessageLookupByLibrary.simpleMessage("Счастье детям и семье"),
        "SearchChooseYourself2":
            MessageLookupByLibrary.simpleMessage("Жажда приключений"),
        "SearchChooseYourself3":
            MessageLookupByLibrary.simpleMessage("Вечеринки и танцы"),
        "SearchChooseYourself4":
            MessageLookupByLibrary.simpleMessage("Экстрим и острые ощущения"),
        "SearchChooseYourself5":
            MessageLookupByLibrary.simpleMessage("Эпоха просвещения"),
        "SearchChooseYourself6":
            MessageLookupByLibrary.simpleMessage("Изысканная кухня"),
        "SearchChooseYourself7":
            MessageLookupByLibrary.simpleMessage("Блаженство и чилл"),
        "SearchChooseYourself8":
            MessageLookupByLibrary.simpleMessage("Спортивные движения"),
        "SearchChooseYourself9":
            MessageLookupByLibrary.simpleMessage("Забота о себе любимом"),
        "SearchHiwHint": m25,
        "SearchHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "поиск или выбрать другие варианты"),
        "SearchHiwTitle":
            MessageLookupByLibrary.simpleMessage("Обычный поиск..."),
        "SeeAll": MessageLookupByLibrary.simpleMessage("Посмотреть всё"),
        "SeeMore": MessageLookupByLibrary.simpleMessage("Ещё"),
        "SelectDate": MessageLookupByLibrary.simpleMessage("Выберите дату"),
        "SelectDateRange":
            MessageLookupByLibrary.simpleMessage("Выберите диапазон дат"),
        "SelectDays": MessageLookupByLibrary.simpleMessage("Выбрать дни "),
        "SelectLanguage":
            MessageLookupByLibrary.simpleMessage("Пожалуйста выберите язык"),
        "SelectOption": MessageLookupByLibrary.simpleMessage("Выбирай"),
        "SelectType": m26,
        "SelectYourReligions":
            MessageLookupByLibrary.simpleMessage("Укажите свою религию"),
        "SelectionOfTheBest":
            MessageLookupByLibrary.simpleMessage("Выбор лучших"),
        "Send": MessageLookupByLibrary.simpleMessage("Отправить"),
        "SendIt": MessageLookupByLibrary.simpleMessage("Отправить"),
        "Services": MessageLookupByLibrary.simpleMessage("Услуги"),
        "Settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "ShowResult":
            MessageLookupByLibrary.simpleMessage("Показать результат"),
        "Shuffle": MessageLookupByLibrary.simpleMessage("Shuffle"),
        "ShuffleHiwHint": m27,
        "ShuffleHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "поиск персонализированных мест"),
        "ShuffleHiwTitle":
            MessageLookupByLibrary.simpleMessage("Перетасовка мест..."),
        "ShuffleWithRightWhitespace":
            MessageLookupByLibrary.simpleMessage("Shuffle "),
        "Skip": MessageLookupByLibrary.simpleMessage("Пропустить"),
        "Small": MessageLookupByLibrary.simpleMessage("Небольшой"),
        "SmartLeisureSelection": MessageLookupByLibrary.simpleMessage(
            "Умный подбор досуга каждому, везде."),
        "SocialSubtitle":
            MessageLookupByLibrary.simpleMessage("Полезные сервисы и места"),
        "Spent": MessageLookupByLibrary.simpleMessage("Потрачено"),
        "SpinnerHiwHint": m28,
        "SpinnerHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "ты найдешь персонализированные мероприятия"),
        "SpinnerHiwTitle":
            MessageLookupByLibrary.simpleMessage("Ты крутишь его..."),
        "SpinnerTitle": MessageLookupByLibrary.simpleMessage(
            "События, которые нельзя пропускать"),
        "StartToExplore":
            MessageLookupByLibrary.simpleMessage("Начать изучать"),
        "Sunny": MessageLookupByLibrary.simpleMessage("Солнечно"),
        "Support": MessageLookupByLibrary.simpleMessage("Помощь"),
        "SupportPeopleAroundYou":
            MessageLookupByLibrary.simpleMessage("Помочь людям вокруг"),
        "SwipeToStart":
            MessageLookupByLibrary.simpleMessage("Свайп чтобы начать"),
        "SwitchAnyTime": MessageLookupByLibrary.simpleMessage(
            "Можно переключить в любое время в настройках профиля"),
        "Tags": MessageLookupByLibrary.simpleMessage("Ярлыки"),
        "TapIt": MessageLookupByLibrary.simpleMessage("Нажми"),
        "TapOnceToChoose":
            MessageLookupByLibrary.simpleMessage("Нажми, чтобы выбрать"),
        "TapToSeeMore":
            MessageLookupByLibrary.simpleMessage("Нажми увидеть больше"),
        "TapToSetAddress":
            MessageLookupByLibrary.simpleMessage("Нажмите, чтобы ввести адрес"),
        "TapTwiceToMarkYourFavorites": MessageLookupByLibrary.simpleMessage(
            ". Нажми дважды, чтобы отметить избранное."),
        "TellUsMore": MessageLookupByLibrary.simpleMessage("Расскажи еще"),
        "TellUsMoreAboutYourself": m29,
        "Terms": MessageLookupByLibrary.simpleMessage("Условия"),
        "TermsOfService": MessageLookupByLibrary.simpleMessage(
            "Условия использования и оказания услуг"),
        "ThatsAllForNow": MessageLookupByLibrary.simpleMessage("Пока это всё!"),
        "TheMoreInfoWeAboutYouGetTheBetter":
            MessageLookupByLibrary.simpleMessage(
                "Чем больше мы узнаем о тебе, тем лучше"),
        "TheMoreInfoWeGetTheBetter": MessageLookupByLibrary.simpleMessage(
            "Чем больше инфы мы получим, тем лучше"),
        "ThenCheckThisOut":
            MessageLookupByLibrary.simpleMessage("Тогда зацените это"),
        "ThisIs": MessageLookupByLibrary.simpleMessage("Это"),
        "ThroughANonAggregatorSystem": MessageLookupByLibrary.simpleMessage(
            "Неагрегаторная система специально для вас"),
        "Time": MessageLookupByLibrary.simpleMessage("Время"),
        "Title": MessageLookupByLibrary.simpleMessage("Название"),
        "TitleYourTop":
            MessageLookupByLibrary.simpleMessage("Назовите ваш ТОП"),
        "ToAccessAll": MessageLookupByLibrary.simpleMessage("Полный доступ"),
        "ToAllowAccessGoToSettings": MessageLookupByLibrary.simpleMessage(
            "Чтобы разрешить доступ push-уведомлений, зайдите в настройки телефона"),
        "Today": MessageLookupByLibrary.simpleMessage("Сегодня"),
        "TopNDonatorsReceiveXPoints": m30,
        "TopPlacesRatedBy": m31,
        "TryYourself": MessageLookupByLibrary.simpleMessage("Попробуйте\nсами"),
        "TypeHere": MessageLookupByLibrary.simpleMessage("Напишите тут"),
        "TypeOfContent": MessageLookupByLibrary.simpleMessage("Тип контента"),
        "Undefined": MessageLookupByLibrary.simpleMessage("Неопределено"),
        "UnderDevelopmentMessage":
            MessageLookupByLibrary.simpleMessage("В разработке"),
        "UnderService": MessageLookupByLibrary.simpleMessage("В разработке"),
        "UniqueProperties":
            MessageLookupByLibrary.simpleMessage("Уникальные свойства"),
        "UpcomingEvent":
            MessageLookupByLibrary.simpleMessage("Предостоящее событие"),
        "UpcomingGlobalEvents":
            MessageLookupByLibrary.simpleMessage("Грядущие глобальные"),
        "Update": MessageLookupByLibrary.simpleMessage("Обновить"),
        "UpdateAppMessage": MessageLookupByLibrary.simpleMessage(
            "Вы давно не обновляли наше приложение, а мы за это время добавили много удобных штук"),
        "UpdateAppMessageTitle":
            MessageLookupByLibrary.simpleMessage("Пора обновиться"),
        "UpgradeAccount": m32,
        "UpgradeAccountConfirmation":
            MessageLookupByLibrary.simpleMessage("Оформить"),
        "UpgradeForNmoney": m33,
        "User": MessageLookupByLibrary.simpleMessage("Юзер"),
        "UserTypeSelectionPrompt": MessageLookupByLibrary.simpleMessage(
            "Выберите тип аккаунта, который хотите создать или войти"),
        "Users": m34,
        "UsingHealthKit":
            MessageLookupByLibrary.simpleMessage("Данные здоровья"),
        "ValueMustBeAtLeast3Characters": MessageLookupByLibrary.simpleMessage(
            "Значение не менее 3 символов"),
        "VeryOften": MessageLookupByLibrary.simpleMessage("Часто"),
        "Video": MessageLookupByLibrary.simpleMessage("Видео"),
        "VideoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Видео (загрузить)"),
        "ViewAll": MessageLookupByLibrary.simpleMessage("Все"),
        "VisitFirstToOpenNext": MessageLookupByLibrary.simpleMessage(
            "Посети первое, открой следующее"),
        "WeDoNotSpamAllKindsOfNotifications": MessageLookupByLibrary.simpleMessage(
            "Мы не спамим уведомлениями и рекламой. Только то, что важно для вас и соответствуют вашим предпочтениям."),
        "WeHavePlacesJustForYou":
            MessageLookupByLibrary.simpleMessage("Есть места именно для тебя"),
        "WeWillLetKnowResults": MessageLookupByLibrary.simpleMessage(
            "Мы оповестим вас о результатах"),
        "Weather": MessageLookupByLibrary.simpleMessage("Погода"),
        "Website": MessageLookupByLibrary.simpleMessage("Сайт"),
        "Welcome": MessageLookupByLibrary.simpleMessage("Велкам"),
        "WhatIs": MessageLookupByLibrary.simpleMessage("Зачем нужен"),
        "WhatYouLike":
            MessageLookupByLibrary.simpleMessage("Что тебе нравится"),
        "WhiteTheme": MessageLookupByLibrary.simpleMessage("Светлая тема"),
        "WillBe": MessageLookupByLibrary.simpleMessage(" будет."),
        "WillBeImplementedSoon":
            MessageLookupByLibrary.simpleMessage("Скоро будет реализовано"),
        "WithInDays": m35,
        "WithYourPreferences":
            MessageLookupByLibrary.simpleMessage("С учетом ваших предпочтений"),
        "WorkHours": MessageLookupByLibrary.simpleMessage("Часы работы"),
        "WrongSecurityCode":
            MessageLookupByLibrary.simpleMessage("Неверный код"),
        "XCouldNotBeEmpty": m36,
        "XIsRequired": m37,
        "XSuccessfullyUpdated": m38,
        "Year": MessageLookupByLibrary.simpleMessage("Год"),
        "Yearly": MessageLookupByLibrary.simpleMessage("Годовой"),
        "Yes": MessageLookupByLibrary.simpleMessage("Да"),
        "YouBetterCheckThisOut":
            MessageLookupByLibrary.simpleMessage("Вам лучше взглянуть"),
        "YouGetExactlyWhatYouNeed": MessageLookupByLibrary.simpleMessage(
            "Вы получаете точно то, что нужно"),
        "YouSentInvitationToNPeople": m39,
        "YoullFindIt": MessageLookupByLibrary.simpleMessage("Вы найдёте"),
        "YourAge": MessageLookupByLibrary.simpleMessage("Твой возраст"),
        "YourAudienceAge":
            MessageLookupByLibrary.simpleMessage("Возраст аудитории"),
        "YourClaimHasBeenSent":
            MessageLookupByLibrary.simpleMessage("Ваше заявление отправлено"),
        "YourEmail": MessageLookupByLibrary.simpleMessage("Ваша почта"),
        "YourLeisureSelection":
            MessageLookupByLibrary.simpleMessage("твой выбор досуга"),
        "YourName": MessageLookupByLibrary.simpleMessage("Ваше имя"),
        "YourNiche": MessageLookupByLibrary.simpleMessage("Ваша ниша"),
        "YourPosition": MessageLookupByLibrary.simpleMessage("Ваша позиция"),
        "YourPriceSegment":
            MessageLookupByLibrary.simpleMessage("Your price segment"),
        "YourTraffic": MessageLookupByLibrary.simpleMessage("Ваш трафик"),
        "daynight": MessageLookupByLibrary.simpleMessage("Днем и ночью"),
        "key": MessageLookupByLibrary.simpleMessage("")
      };
}
