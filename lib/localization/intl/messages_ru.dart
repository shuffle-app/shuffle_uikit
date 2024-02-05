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

  static String m2(editingType) => "${editingType} место";

  static String m3(inputType) => "Ввести ${inputType}";

  static String m4(formattedPrice) => " За ${formattedPrice}";

  static String m5(helpfulCount) => "Полезно ${helpfulCount}";

  static String m6(days) =>
      "Система подсказок активирована на ${Intl.plural(days, zero: '${days} дней', one: '${days} день', two: '${days} дня', few: '${days} дня', many: '${days} дней', other: '${days} дней')}";

  static String m7(invitedPeopleCount) =>
      "Приглашает ${invitedPeopleCount} людей на";

  static String m8(placeIndex) => "${placeIndex} место";

  static String m9(amountOfPeople) => "Следующие ${amountOfPeople}";

  static String m10(religionCount) =>
      "Пожалуйста, выберите из списка ${religionCount} религию";

  static String m11(type) => "Выбрать ${type}";

  static String m12(separator) => "Расскажите${separator}о себе";

  static String m13(amountOfTopDonators, multiplier) =>
      "Топовые ${amountOfTopDonators} донаторы получают x${multiplier} очков";

  static String m14(forNMoney) => "Upgrade ${forNMoney}";

  static String m15(count) =>
      "${Intl.plural(count, zero: '${count} человек', one: '${count} человек', two: '${count} человека', few: '${count} людей', many: '${count} человек', other: '${count} человек')}";

  static String m16(value) => "${value} не может быть пустым";

  static String m17(title) => "${title} требуется";

  static String m18(value) => "${value} успешно обновлено";

  static String m19(amountOfInvitedPersons) =>
      "Вы отправили приглашение ${amountOfInvitedPersons} людям";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "AcceptDonations": MessageLookupByLibrary.simpleMessage(
            "Accept donations or help others realize their dreams"),
        "ActivityType": MessageLookupByLibrary.simpleMessage("Тип активности"),
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
            MessageLookupByLibrary.simpleMessage("Попросить задонатить"),
        "AskOrSupport":
            MessageLookupByLibrary.simpleMessage("Попросить или помочь"),
        "AskPeople": MessageLookupByLibrary.simpleMessage("Спросить"),
        "Athlete": MessageLookupByLibrary.simpleMessage("Спортсмен"),
        "Balance": MessageLookupByLibrary.simpleMessage("Баланс "),
        "BaseProperties":
            MessageLookupByLibrary.simpleMessage("Базовые свойства"),
        "BasedOnYourActivityWeDetermineYourCondition":
            MessageLookupByLibrary.simpleMessage(
                "На основании вашей активности, пульса и других факторов мы определяем ваше состояние и стараемся рекомендовать то, что вам нужно прямо сейчас, конкретно для вас."),
        "BeInSearch": MessageLookupByLibrary.simpleMessage("Быть в поиске"),
        "BookIt": MessageLookupByLibrary.simpleMessage("Букинг"),
        "BurnedToday": MessageLookupByLibrary.simpleMessage("Сожжено сегодя"),
        "ByContinuingYouAcceptThe":
            MessageLookupByLibrary.simpleMessage("Продолжая, вы принимаете"),
        "Cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "Category": MessageLookupByLibrary.simpleMessage("Category"),
        "ChangePhoto": MessageLookupByLibrary.simpleMessage("Изменить фото"),
        "CheckIn": MessageLookupByLibrary.simpleMessage("Check in"),
        "ChooseOption": MessageLookupByLibrary.simpleMessage("Выбери"),
        "ClickEnterToSearch":
            MessageLookupByLibrary.simpleMessage("Нажмите Ввод для поиска"),
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
        "Create": MessageLookupByLibrary.simpleMessage("Создать"),
        "CreateEvent": MessageLookupByLibrary.simpleMessage("Создать событие"),
        "CreatePlace": MessageLookupByLibrary.simpleMessage("Создать место"),
        "CreateYourPlaceAndInvitePeople": MessageLookupByLibrary.simpleMessage(
            "Создайте своё место и пригласи людей"),
        "Daily": MessageLookupByLibrary.simpleMessage("Ежедневно "),
        "DateOfBirth": MessageLookupByLibrary.simpleMessage("Дата рождения"),
        "Dates": MessageLookupByLibrary.simpleMessage("Даты"),
        "Day": MessageLookupByLibrary.simpleMessage("День"),
        "DaysOfWeek": MessageLookupByLibrary.simpleMessage("Дни недели"),
        "DeleteFromList":
            MessageLookupByLibrary.simpleMessage("Удалить из списка"),
        "DependingOn": MessageLookupByLibrary.simpleMessage("Зависит от..."),
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
            "Вы можете тратить только на свою мечту, иначе деньги вернутся донатерам. Разрешен только один запрос в месяц."),
        "DontBeAlone":
            MessageLookupByLibrary.simpleMessage("Не будете одиноки"),
        "DontMissIt": MessageLookupByLibrary.simpleMessage("Не пропустите"),
        "Edit": MessageLookupByLibrary.simpleMessage("Редактировать"),
        "EditProfile": MessageLookupByLibrary.simpleMessage("Редактировать"),
        "EditingTypePlace": m2,
        "Email": MessageLookupByLibrary.simpleMessage("Почта"),
        "EnableHintSystem":
            MessageLookupByLibrary.simpleMessage("Включить подсказки"),
        "EnterInputType": m3,
        "EnterPlaceAddressPrompt": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, введите адрес места"),
        "EnterYourEmailAddress":
            MessageLookupByLibrary.simpleMessage("Введите адрес почты"),
        "ErrorOccured": MessageLookupByLibrary.simpleMessage("Возникла ошибка"),
        "ErrorOccuredWithoutMessage":
            MessageLookupByLibrary.simpleMessage("Ошибка без сообщения"),
        "Event": MessageLookupByLibrary.simpleMessage("Событие"),
        "EventType": MessageLookupByLibrary.simpleMessage("Тип события"),
        "Events": MessageLookupByLibrary.simpleMessage("Events"),
        "EventsReminders":
            MessageLookupByLibrary.simpleMessage("Напоминания о событиях"),
        "Faq": MessageLookupByLibrary.simpleMessage("ФАК"),
        "Favorites": MessageLookupByLibrary.simpleMessage("Избранное"),
        "FeaturesEnableGeolocation":
            MessageLookupByLibrary.simpleMessage("Функции включают геолокацию"),
        "Feeling": MessageLookupByLibrary.simpleMessage("Чувство"),
        "Filters": MessageLookupByLibrary.simpleMessage("Фильтры"),
        "FindSomeoneToHangOutWith":
            MessageLookupByLibrary.simpleMessage("Найти с кем затусить"),
        "FindSomeoneToNetworkWith": MessageLookupByLibrary.simpleMessage(
            "Найти кого-то для нетворкинга"),
        "Follow": MessageLookupByLibrary.simpleMessage("Следовать"),
        "Followers": MessageLookupByLibrary.simpleMessage("Подписчики"),
        "Followings": MessageLookupByLibrary.simpleMessage("Подписки"),
        "For": MessageLookupByLibrary.simpleMessage("Для"),
        "ForFormattedPrice": m4,
        "ForgotPassword": MessageLookupByLibrary.simpleMessage("Забыт пароль"),
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
        "HealthKit": MessageLookupByLibrary.simpleMessage("Данные здоровья"),
        "Helpful": MessageLookupByLibrary.simpleMessage("Полезно"),
        "HelpfulNCount": m5,
        "HintSystemDisabled": MessageLookupByLibrary.simpleMessage(
            "Система подсказок деактивирована"),
        "HintSystemEnabled": m6,
        "HowAreYouFeelingTonight":
            MessageLookupByLibrary.simpleMessage("Как вы себя чувствуете?"),
        "HowItWorks": MessageLookupByLibrary.simpleMessage("Как\nэто?"),
        "HowMuchDoYouWantToDonate": MessageLookupByLibrary.simpleMessage(
            "Сколько \$ хочешь задонатить?"),
        "IncorrectLoginOrPassword":
            MessageLookupByLibrary.simpleMessage("Не тот логин или пароль"),
        "InvitationsCanBeViewedInPrivateMessages":
            MessageLookupByLibrary.simpleMessage(
                "Приглашения можно посмотреть в сообщениях"),
        "Invite": MessageLookupByLibrary.simpleMessage("Пригласить"),
        "InviteList": MessageLookupByLibrary.simpleMessage("Invite list"),
        "InviteMore": MessageLookupByLibrary.simpleMessage("Пригласить ещё"),
        "InvitePeople": MessageLookupByLibrary.simpleMessage("Пригласить"),
        "InviteToFavoritePlaces": MessageLookupByLibrary.simpleMessage(
            "Пригласить в избранные места"),
        "InvitesNPeopleTo": m7,
        "InvitesYouTo":
            MessageLookupByLibrary.simpleMessage("Приглашает вас на"),
        "IsRecurrent": MessageLookupByLibrary.simpleMessage("Повторяется"),
        "Loading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
        "Location": MessageLookupByLibrary.simpleMessage("Локация"),
        "Logo": MessageLookupByLibrary.simpleMessage("Лого"),
        "LogoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Лого (загрузить)"),
        "LovelyTouchAmazingInteraction": MessageLookupByLibrary.simpleMessage(
            "Потрясающее интерактивное\nвзаимодействие"),
        "Members": MessageLookupByLibrary.simpleMessage("Участники"),
        "Message": MessageLookupByLibrary.simpleMessage("Сообщение"),
        "Messages": MessageLookupByLibrary.simpleMessage("Сообщения"),
        "Month": MessageLookupByLibrary.simpleMessage("Месяц"),
        "MyCard": MessageLookupByLibrary.simpleMessage("Профиль"),
        "MyEvents": MessageLookupByLibrary.simpleMessage("Мои события"),
        "NPlace": m8,
        "Name": MessageLookupByLibrary.simpleMessage("Name"),
        "NameOrNickname": MessageLookupByLibrary.simpleMessage("Имя или ник"),
        "NewDonates": MessageLookupByLibrary.simpleMessage("Новые донаты"),
        "NewFeatures": MessageLookupByLibrary.simpleMessage("Новые функции"),
        "NewFollowers":
            MessageLookupByLibrary.simpleMessage("Новые подписчики"),
        "NewLocationHasOpenedToday": MessageLookupByLibrary.simpleMessage(
            "Сегодня открылось новое место. Приходи! Понравится!"),
        "NewPlace": MessageLookupByLibrary.simpleMessage("Новое место"),
        "Next": MessageLookupByLibrary.simpleMessage("Далее"),
        "NextNPeople": m9,
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
            "Теперь давайите узнаем друг друга"),
        "Off": MessageLookupByLibrary.simpleMessage("Выкл"),
        "Ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "OkayCool": MessageLookupByLibrary.simpleMessage("Ок, круто!"),
        "Ooops": MessageLookupByLibrary.simpleMessage("Ууупс!"),
        "OopsIWillTryAgain":
            MessageLookupByLibrary.simpleMessage("Уупс, попробую ещё"),
        "OpenFrom": MessageLookupByLibrary.simpleMessage("С"),
        "OpenTo": MessageLookupByLibrary.simpleMessage("До"),
        "OpeningHours": MessageLookupByLibrary.simpleMessage("Часы работы"),
        "OrDragFilesHere":
            MessageLookupByLibrary.simpleMessage("Или перетащите файлы"),
        "OurRecommendationsAboutGeolocation": MessageLookupByLibrary.simpleMessage(
            "Система рекомендаций основана на многих факторах. Геолокация – лишь часть системы, которая позволит правильно расставить приоритеты, по расстоянию, по ближайшим особенностям ландшафта (горы, водоемы, равнины, пустыни)"),
        "Password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "PasswordConditions": MessageLookupByLibrary.simpleMessage(
            "Пароль должен содержать хотя бы одну заглавную букву, одну строчную, одну цифру и один специальный символ"),
        "PasswordMustBeAtLeast8Characters":
            MessageLookupByLibrary.simpleMessage("Пароль не менее 8 символов"),
        "Permissions": MessageLookupByLibrary.simpleMessage("Разрешения"),
        "PersonalCredentials":
            MessageLookupByLibrary.simpleMessage("Личные данные"),
        "Phone": MessageLookupByLibrary.simpleMessage("Телефон"),
        "Photo": MessageLookupByLibrary.simpleMessage("Фото"),
        "PhotoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Фото (загрузить)"),
        "Photos": MessageLookupByLibrary.simpleMessage("Фото"),
        "Place": MessageLookupByLibrary.simpleMessage("Место"),
        "PlaceType": MessageLookupByLibrary.simpleMessage("Тип места"),
        "Places": MessageLookupByLibrary.simpleMessage("Места"),
        "PleaseFillOutDate":
            MessageLookupByLibrary.simpleMessage("Заполните дату, пожалуйста"),
        "PleaseFillOutYourWishes": MessageLookupByLibrary.simpleMessage(
            "Заполните пожелания, пожалуйста"),
        "PleaseSelectANiche":
            MessageLookupByLibrary.simpleMessage("Выберите нишу, пожалуйста"),
        "PleaseSelectAtLeastNReligion": m10,
        "PleaseSelectAtLeastOneAgeRange": MessageLookupByLibrary.simpleMessage(
            "Выберите хотя бы одну возрастную группу"),
        "PleaseSelectAtLeastOneTargetAudience":
            MessageLookupByLibrary.simpleMessage(
                "Выберите хотя бы одну ЦА, пожалуйста"),
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
        "Price": MessageLookupByLibrary.simpleMessage("Price"),
        "Privacy": MessageLookupByLibrary.simpleMessage("Конфиденциальность"),
        "Pro": MessageLookupByLibrary.simpleMessage("Pro"),
        "ProAccount": MessageLookupByLibrary.simpleMessage("Pro аккаунт"),
        "Published": MessageLookupByLibrary.simpleMessage("Опубликовано"),
        "Recommended": MessageLookupByLibrary.simpleMessage("Рекомендуем"),
        "ResetFilters":
            MessageLookupByLibrary.simpleMessage("Сбросить фильтры"),
        "ResetPassword":
            MessageLookupByLibrary.simpleMessage("Сбросить пароль"),
        "Save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "Search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "SeeAll": MessageLookupByLibrary.simpleMessage("Посмотреть всё"),
        "SeeMore": MessageLookupByLibrary.simpleMessage("Ещё"),
        "SelectDate": MessageLookupByLibrary.simpleMessage("Выберите дату"),
        "SelectDays": MessageLookupByLibrary.simpleMessage("Выбрать дни "),
        "SelectLanguage":
            MessageLookupByLibrary.simpleMessage("Пожалуйста выберите язык"),
        "SelectOption": MessageLookupByLibrary.simpleMessage("Выбирай"),
        "SelectType": m11,
        "SelectYourReligions":
            MessageLookupByLibrary.simpleMessage("Укажите свою религию"),
        "SelectionOfTheBest":
            MessageLookupByLibrary.simpleMessage("Выбор лучших"),
        "Send": MessageLookupByLibrary.simpleMessage("Отправить"),
        "SendIt": MessageLookupByLibrary.simpleMessage("Отправить"),
        "Services": MessageLookupByLibrary.simpleMessage("Услуги"),
        "ShowResult":
            MessageLookupByLibrary.simpleMessage("Показать результат"),
        "Shuffle": MessageLookupByLibrary.simpleMessage("Shuffle"),
        "ShuffleWithRightWhitespace":
            MessageLookupByLibrary.simpleMessage("Shuffle "),
        "Skip": MessageLookupByLibrary.simpleMessage("Пропустить"),
        "Small": MessageLookupByLibrary.simpleMessage("Небольшой"),
        "SmartLeisureSelection": MessageLookupByLibrary.simpleMessage(
            "Умный подбор досуга каждому, везде."),
        "Spent": MessageLookupByLibrary.simpleMessage("Потрачено"),
        "StartToExplore":
            MessageLookupByLibrary.simpleMessage("Начать изучать"),
        "Sunny": MessageLookupByLibrary.simpleMessage("Солнечно"),
        "Support": MessageLookupByLibrary.simpleMessage("Помочь"),
        "SupportPeopleAroundYou":
            MessageLookupByLibrary.simpleMessage("Помочь людям вокруг"),
        "SwipeToStart": MessageLookupByLibrary.simpleMessage("Swipe to start"),
        "SwitchAnyTime": MessageLookupByLibrary.simpleMessage(
            "You can switch it at any time in your profile settings"),
        "Tags": MessageLookupByLibrary.simpleMessage("Ярлыки"),
        "TapIt": MessageLookupByLibrary.simpleMessage("Нажми"),
        "TapOnceToChoose":
            MessageLookupByLibrary.simpleMessage("Нажмите, чтобы выбрать"),
        "TapToSeeMore":
            MessageLookupByLibrary.simpleMessage("Нажми увидеть больше"),
        "TapToSetAddress":
            MessageLookupByLibrary.simpleMessage("Нажмите, чтобы ввести адрес"),
        "TapTwiceToMarkYourFavorites": MessageLookupByLibrary.simpleMessage(
            ". Нажмите дважды, чтобы отметить избранное."),
        "TellUsMoreAboutYourself": m12,
        "Terms": MessageLookupByLibrary.simpleMessage("Условия"),
        "ThatsAllForNow": MessageLookupByLibrary.simpleMessage("Пока это всё!"),
        "TheMoreInfoWeAboutYouGetTheBetter":
            MessageLookupByLibrary.simpleMessage(
                "Чем больше мы узнаем о вас, тем лучше"),
        "TheMoreInfoWeGetTheBetter": MessageLookupByLibrary.simpleMessage(
            "Чем больше инфы мы получим, тем лучше"),
        "ThenCheckThisOut":
            MessageLookupByLibrary.simpleMessage("Тогда зацените это"),
        "ThisIs": MessageLookupByLibrary.simpleMessage("Это"),
        "ThroughANonAggregatorSystem": MessageLookupByLibrary.simpleMessage(
            "Через систему\nНЕагрегатор\nспециально для вас"),
        "Time": MessageLookupByLibrary.simpleMessage("Время"),
        "Title": MessageLookupByLibrary.simpleMessage("Название"),
        "ToAccessAll": MessageLookupByLibrary.simpleMessage("Полный доступ"),
        "ToAllowAccessGoToSettings": MessageLookupByLibrary.simpleMessage(
            "Чтобы разрешить доступ push-уведомлений, зайдите в настройки телефона"),
        "Today": MessageLookupByLibrary.simpleMessage("Сегодня"),
        "TopNDonatorsReceiveXPoints": m13,
        "TopPlacesRatedBy":
            MessageLookupByLibrary.simpleMessage("Топовые места,\nвыбранные"),
        "TryYourself": MessageLookupByLibrary.simpleMessage("Попробуйте\nсами"),
        "TypeHere": MessageLookupByLibrary.simpleMessage("Напишите тут"),
        "Undefined": MessageLookupByLibrary.simpleMessage("Неопределено"),
        "UniqueProperties":
            MessageLookupByLibrary.simpleMessage("Уникальные свойства"),
        "UpcomingEvent":
            MessageLookupByLibrary.simpleMessage("Предостоящее событие"),
        "Update": MessageLookupByLibrary.simpleMessage("Обновить"),
        "UpgradeForNmoney": m14,
        "User": MessageLookupByLibrary.simpleMessage("Юзер"),
        "Users": m15,
        "UsingHealthKit":
            MessageLookupByLibrary.simpleMessage("Данные здоровья"),
        "ValueMustBeAtLeast3Characters": MessageLookupByLibrary.simpleMessage(
            "Значение не менее 3 символов"),
        "Video": MessageLookupByLibrary.simpleMessage("Видео"),
        "VideoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Видео (загрузить)"),
        "ViewAll": MessageLookupByLibrary.simpleMessage("View all"),
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
        "WhatIs": MessageLookupByLibrary.simpleMessage("Что"),
        "WhatYouLike": MessageLookupByLibrary.simpleMessage("Что вам нравится"),
        "WhiteTheme": MessageLookupByLibrary.simpleMessage("White theme"),
        "WillBe": MessageLookupByLibrary.simpleMessage(" Будет."),
        "WillBeImplementedSoon":
            MessageLookupByLibrary.simpleMessage("Скоро будет реализовано"),
        "WithYourPreferences":
            MessageLookupByLibrary.simpleMessage("Под ваши\nпредпочтения"),
        "WorkHours": MessageLookupByLibrary.simpleMessage("Часы работы"),
        "WrongSecurityCode":
            MessageLookupByLibrary.simpleMessage("Неверный код"),
        "XCouldNotBeEmpty": m16,
        "XIsRequired": m17,
        "XSuccessfullyUpdated": m18,
        "Year": MessageLookupByLibrary.simpleMessage("Год"),
        "Yes": MessageLookupByLibrary.simpleMessage("Да"),
        "YouBetterCheckThisOut":
            MessageLookupByLibrary.simpleMessage("Вам лучше взглянуть"),
        "YouGetExactlyWhatYouNeed": MessageLookupByLibrary.simpleMessage(
            "Вы получаете точно то, что нужно"),
        "YouSentInvitationToNPeople": m19,
        "YoullFindIt": MessageLookupByLibrary.simpleMessage("Вы найдёте"),
        "YourAge": MessageLookupByLibrary.simpleMessage("Твой возраст"),
        "YourAudience": MessageLookupByLibrary.simpleMessage("Ваша аудитория"),
        "YourAudienceAge":
            MessageLookupByLibrary.simpleMessage("Возраст аудитории"),
        "YourClaimHasBeenSent":
            MessageLookupByLibrary.simpleMessage("Ваше заявление отправлено"),
        "YourEmail": MessageLookupByLibrary.simpleMessage("Ваша почта"),
        "YourLeisureSelection":
            MessageLookupByLibrary.simpleMessage("Ваш выбор досуга"),
        "YourName": MessageLookupByLibrary.simpleMessage("Ваше имя"),
        "YourNiche": MessageLookupByLibrary.simpleMessage("Ваша ниша"),
        "YourPosition": MessageLookupByLibrary.simpleMessage("Ваша позиция"),
        "YourTraffic": MessageLookupByLibrary.simpleMessage("Ваш трафик"),
        "daynight": MessageLookupByLibrary.simpleMessage("Day and night"),
        "key": MessageLookupByLibrary.simpleMessage("")
      };
}
