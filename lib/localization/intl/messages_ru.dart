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

  static String m0(value) => "Все ${value} фичи доступны!";

  static String m1(allowValue) => "Использовать ${allowValue}";

  static String m2(allowedCharacters) =>
      "Допустимые символы ${allowedCharacters}";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'броней', one: 'бронь', two: 'брони', few: 'броней', many: 'броней', other: 'броней')}";

  static String m4(count) =>
      "${count} ${Intl.plural(count, zero: 'открытий карточек', one: 'открытие карточки', two: 'открытия карточек', few: 'открытия карточек', many: 'открытий карточек', other: 'открытий карточек')}";

  static String m5(creationDate, deletionDate) =>
      "Создан ${creationDate}.\nУдалится ${deletionDate}";

  static String m6(item) =>
      "${Intl.plural(item, zero: '3 уровня сложности', one: 'посещай и открывай новое', two: 'посети и зачекинься', few: 'пройди и получи награду', other: 'пройди и получи награду')}";

  static String m7(count) =>
      "${Intl.plural(count, zero: 'комментариев', one: 'комментарий', two: 'комментария', few: 'комментариев', many: 'комментариев', other: 'комментариев')}";

  static String m8(progress) => "Сжатие видео ${progress}%";

  static String m9(count) => "${count} Отзывов";

  static String m10(count) => "${count} Видео-Реакций";

  static String m11(days) =>
      "${Intl.plural(days, zero: 'дней', one: 'день', two: 'дня', few: 'дня', many: 'дней', other: 'дней')}";

  static String m12(actuallyRaised, goal) =>
      "собрано ${actuallyRaised}/\$${goal}\$";

  static String m13(editingType) => "${editingType} место";

  static String m14(inputType) => "Ввести ${inputType}";

  static String m15(count) =>
      "${Intl.plural(count, zero: 'событий', one: 'событие', two: 'события', few: 'событий', many: 'событий', other: 'событий')}";

  static String m16(item) =>
      "${Intl.plural(item, zero: 'зажми и перетяни карточку', one: 'создай стопку и назови', two: 'выстрой порядок стопок', few: 'поделись стопкой', other: 'поделись стопкой')}";

  static String m17(item) =>
      "${Intl.plural(item, zero: 'гео', one: 'интересы', two: 'погода вокруг', few: 'и еще 14 свойств', other: 'и еще 14 свойств')}";

  static String m18(item) =>
      "${Intl.plural(item, zero: 'выбераешь нишу', one: 'жмешь', two: 'получаешь подборку', few: 'выбираешь и планируешь', other: 'выбираешь и планируешь')}";

  static String m19(item) =>
      "${Intl.plural(item, zero: 'события и места', one: 'фильтруй по тэгам', two: 'выбирай и жми', few: 'прокрути\n', other: 'прокрути\n')}";

  static String m20(count) =>
      "${count} ${Intl.plural(count, zero: 'обратных связей', one: 'обратная связь', two: 'обратные связи', few: 'обратных связей', many: 'обратных связей', other: 'обратных связей')}";

  static String m21(count) =>
      "${Intl.plural(count, zero: '${count} поинтов', one: '${count} поинт', two: '${count} поинта', few: '${count} поинтов', many: '${count} поинтов', other: '${count} поинтов')}";

  static String m22(count) =>
      "${Intl.plural(count, zero: '${count} общих интересов', one: '${count} общий интерес', two: '${count} общих интереса', few: '${count} общих интересов', many: '${count} общих интересов', other: '${count} общих интересов')}";

  static String m23(count) =>
      "${Intl.plural(count, zero: 'подписчиков', one: 'подписчик', two: 'подписчика', few: 'подписчиков', many: 'подписчиков', other: 'подписчиков')}";

  static String m24(formattedPrice) => "За ${formattedPrice}";

  static String m25(helpfulCount) => "Полезно ${helpfulCount}";

  static String m26(days) =>
      "Система подсказок активирована на ${Intl.plural(days, zero: '${days} дней', one: '${days} день', two: '${days} дня', few: '${days} дня', many: '${days} дней', other: '${days} дней')}";

  static String m27(hours) => "${hours}ч назад";

  static String m28(invitedPeopleCount) =>
      "Приглашает ${Intl.plural(invitedPeopleCount, zero: '${invitedPeopleCount} людей', one: '${invitedPeopleCount}-о', two: '${invitedPeopleCount}-х', few: '${invitedPeopleCount}-х', many: '${invitedPeopleCount}-х', other: '${invitedPeopleCount}-х')} на";

  static String m29(count) =>
      "Входите в приложение ${count} ${Intl.plural(count, zero: 'дней', one: 'день', two: 'дня', few: 'дня', many: 'дня', other: 'дней')} подряд";

  static String m30(provider) => "Продолжить с ${provider}";

  static String m31(item) =>
      "${Intl.plural(item, zero: 'Участников', one: 'Участник', two: 'Участников', few: 'Участников', many: 'Участниками', other: 'Участники')}";

  static String m32(count) =>
      "${Intl.plural(count, zero: '${count} участников', one: '${count} участник', two: '${count} участника', few: '${count} участников', many: '${count} участников', other: '${count} участников')}";

  static String m33(minutes) => "${minutes}м назад";

  static String m34(placeIndex) => "${placeIndex} место";

  static String m35(elements) => "Ещё ${elements}";

  static String m36(amountOfPeople) => "Следующие ${amountOfPeople}";

  static String m37(count) =>
      "${Intl.plural(count, zero: 'визитов', one: 'визит', two: 'визитов', few: 'визитов', many: 'визитов', other: 'визитов')}";

  static String m38(religionCount) =>
      "Пожалуйста, выбери из списка ${religionCount} религию";

  static String m39(count) =>
      "${Intl.plural(count, zero: 'поинтов', one: 'поинт', two: 'поинта', few: 'поинта', many: 'поинтов', other: 'поинтов')}";

  static String m40(count) =>
      "${Intl.plural(count, zero: 'поинтов', one: 'поинт', two: 'поинтов', few: 'поинтов', many: 'поинтов', other: 'поинтов')}";

  static String m41(item) =>
      "${Intl.plural(item, zero: 'размести запрос', one: 'напиши и сделай видео', two: 'будь убедителен и честен', few: 'помогай другим', other: 'помогай другим')}";

  static String m42(item) =>
      "${Intl.plural(item, zero: 'найти компаньонов', one: 'похожие предпочтения', two: 'поинты = репутация', few: 'никаких неприятелей', other: 'никаких неприятелей')}";

  static String m43(amount) => "Читать ${amount}";

  static String m44(message) => "Ответ на ${message}";

  static String m45(count) =>
      "${count} ${Intl.plural(count, zero: 'Обзоров', one: 'Обзор', two: 'Обзора', few: 'Обзора', many: 'Обзоров', other: 'Обзоров')}";

  static String m46(count) =>
      "${Intl.plural(count, zero: 'отзывов', one: 'отзыва', two: 'отзывов', few: 'отзывов', many: 'отзывов', other: 'отзывов')}";

  static String m47(count) =>
      "${Intl.plural(count, zero: 'отзывов', one: 'отзыв', two: 'отзыва', few: 'отзывов', many: 'отзывов', other: 'отзывов')}";

  static String m48(item) =>
      "${Intl.plural(item, zero: 'предпочтения не работают', one: 'события/места', two: 'введи и получай', few: 'смотри на рейтинги', other: 'смотри на рейтинги')}";

  static String m49(type) => "Выбрать ${type}";

  static String m50(count) =>
      "Поделитесь ${count} ${Intl.plural(count, zero: 'карточек', one: 'карточкой', two: 'карточками', few: 'карточками', many: 'карточками', other: 'карточками')}";

  static String m51(item) =>
      "${Intl.plural(item, zero: 'свайпай карточки', one: 'листай свойства места', two: 'ок/не ок/в избранное', few: 'учи нашу систему', other: 'учи нашу систему')}";

  static String m52(count) =>
      "Проводите ${count} ${Intl.plural(count, zero: 'часов', one: 'час', two: 'часа', few: 'часа', many: 'часа', other: 'часов')} в неделю";

  static String m53(item) =>
      "${Intl.plural(item, zero: 'ради забавы', one: 'можно листать категорию', two: 'выбирай и планируй', few: 'ищи и бронируй', other: 'ищи и бронируй')}";

  static String m54(separator) => "Расскажи${separator}о себе";

  static String m55(amountOfTopDonators, multiplier) =>
      "Топовые ${amountOfTopDonators} донаторы получают x${multiplier} поинтов";

  static String m56(separator) => "Топовые места,${separator}от";

  static String m57(type) => "Чтобы пользоваться этим нужен ${type} аккаунт";

  static String m58(forNMoney) => "Купить ${forNMoney}";

  static String m59(count) =>
      "${Intl.plural(count, zero: '${count} человек', one: '${count} человек', two: '${count} человека', few: '${count} людей', many: '${count} человек', other: '${count} человек')}";

  static String m60(days) =>
      "через ${days} ${Intl.plural(days, zero: 'дней', one: 'день', two: 'дня', few: 'дня', many: 'дней', other: 'дней')}";

  static String m61(value) => "${value} не может быть пустым";

  static String m62(title) => "${title} требуется";

  static String m63(value) => "${value} успешно обновлено";

  static String m64(amountOfInvitedPersons) =>
      "Вы отправили приглашение ${amountOfInvitedPersons} людям";

  static String m65(name) => "Ты уверен, что хочешь удалить ${name}?";

  static String m66(name) =>
      "Ты больше не сможешь отправлять сообщения ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "AboutUs": MessageLookupByLibrary.simpleMessage("о нас"),
        "AcceptDonations": MessageLookupByLibrary.simpleMessage(
            "Принимать донаты или помогать другим воплотить мечты"),
        "Account": MessageLookupByLibrary.simpleMessage("Аккаунт"),
        "Accrual": MessageLookupByLibrary.simpleMessage("Начисление"),
        "Activation": MessageLookupByLibrary.simpleMessage("Активация"),
        "ActivityType": MessageLookupByLibrary.simpleMessage("Тип активности"),
        "ActivityTypes":
            MessageLookupByLibrary.simpleMessage("Типы активности"),
        "AddCategory":
            MessageLookupByLibrary.simpleMessage("Добавить категорию"),
        "AddFeedback": MessageLookupByLibrary.simpleMessage("Поставить оценку"),
        "AddFeedbackFieldHint": MessageLookupByLibrary.simpleMessage(
            "Расскажи что тебе понравилось или запомнилось"),
        "AddFeedbackFieldTitle":
            MessageLookupByLibrary.simpleMessage("Опиши свой опыт"),
        "AddInfluencerFeedbackPopOverText": MessageLookupByLibrary.simpleMessage(
            "Напиши подробный отзыв, используй все доступные символы, чтобы как можно больше людей могли его оценить"),
        "AddPlaceType":
            MessageLookupByLibrary.simpleMessage("Добавить тип места"),
        "AddPromotion": MessageLookupByLibrary.simpleMessage("Добавить промо"),
        "AddProperty":
            MessageLookupByLibrary.simpleMessage("Добавить свойство"),
        "AddReactions": MessageLookupByLibrary.simpleMessage("Добавить рекцию"),
        "AddReview": MessageLookupByLibrary.simpleMessage("Оставить отзыв"),
        "AddReviewFieldHint":
            MessageLookupByLibrary.simpleMessage("Напиши полезное дополнение"),
        "AddReviewFieldTitle":
            MessageLookupByLibrary.simpleMessage("Опиши свой опыт"),
        "AddReviewPopOverText": MessageLookupByLibrary.simpleMessage(
            "Напиши дополнение к отзыву, которое будет полезно для других посетителей"),
        "AddToMyFavorites":
            MessageLookupByLibrary.simpleMessage("Добавить в избранное"),
        "AddToPersonalTop":
            MessageLookupByLibrary.simpleMessage("Добавить в личный ТОП"),
        "AddYourselfToList":
            MessageLookupByLibrary.simpleMessage("Добавиться в список"),
        "Address": MessageLookupByLibrary.simpleMessage("Адрес"),
        "Album": MessageLookupByLibrary.simpleMessage("Альбом"),
        "Albums": MessageLookupByLibrary.simpleMessage("Альбомы"),
        "AllAlbums": MessageLookupByLibrary.simpleMessage("Все альбомы"),
        "AllAppNotification":
            MessageLookupByLibrary.simpleMessage("Все уведомления"),
        "AllXFeaturesAvailable": m0,
        "Allow": MessageLookupByLibrary.simpleMessage("Продолжить"),
        "AllowAll": MessageLookupByLibrary.simpleMessage("Продолжить"),
        "AllowGeolocation":
            MessageLookupByLibrary.simpleMessage("Использовать геолокацию"),
        "AllowLocationServicesToUseThisFunction":
            MessageLookupByLibrary.simpleMessage(
                "Разрешить гео для этой функции"),
        "AllowX": m1,
        "AllowedCaracters": m2,
        "AlreadyInvited": MessageLookupByLibrary.simpleMessage(
            "Плз уважай свой выбор и чувства других"),
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
        "AverageBill": MessageLookupByLibrary.simpleMessage("Средний чек"),
        "Back": MessageLookupByLibrary.simpleMessage("Назад"),
        "Balance": MessageLookupByLibrary.simpleMessage("Баланс "),
        "BaseProperties":
            MessageLookupByLibrary.simpleMessage("Базовые свойства"),
        "BasedOnYourActivityWeDetermineYourCondition":
            MessageLookupByLibrary.simpleMessage(
                "На основании вашей активности, пульса и других факторов мы определяем ваше состояние и стараемся рекомендовать то, что вам нужно прямо сейчас, конкретно для вас."),
        "BeFirstToInvite": MessageLookupByLibrary.simpleMessage("Будь первым"),
        "BeInSearch": MessageLookupByLibrary.simpleMessage("Быть в поиске"),
        "BookIt": MessageLookupByLibrary.simpleMessage("Букинг"),
        "Bookigns": MessageLookupByLibrary.simpleMessage("Забронировать"),
        "Bookings": m3,
        "BookingsAndInvites":
            MessageLookupByLibrary.simpleMessage("Брони и Приглашения"),
        "Both": MessageLookupByLibrary.simpleMessage("Оба"),
        "Branches": MessageLookupByLibrary.simpleMessage("Сеть"),
        "Buddhism": MessageLookupByLibrary.simpleMessage("Буддизм"),
        "BuildYOurBusiness":
            MessageLookupByLibrary.simpleMessage("Построй свой бизнес c"),
        "BuildingNumber": MessageLookupByLibrary.simpleMessage("Номер дома"),
        "BurnedToday": MessageLookupByLibrary.simpleMessage("Сожжено сегодя"),
        "Business": MessageLookupByLibrary.simpleMessage("Бизнес"),
        "ByContinuingYouAcceptThe":
            MessageLookupByLibrary.simpleMessage("Продолжая, ты принимаешь"),
        "CalmAtmosphere":
            MessageLookupByLibrary.simpleMessage("Спокойная атмосфера"),
        "Cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "CantSeePublicProfileMessage": MessageLookupByLibrary.simpleMessage(
            "Ты сможешь увидеть этот профиль, когда он станет инфлюенсером"),
        "CardOpening": m4,
        "Categories": MessageLookupByLibrary.simpleMessage("Категории"),
        "Category": MessageLookupByLibrary.simpleMessage("категория"),
        "ChallengeFeelings":
            MessageLookupByLibrary.simpleMessage("Бросьте вызов чувствам"),
        "ChangePhoto": MessageLookupByLibrary.simpleMessage("Изменить фото"),
        "Chat": MessageLookupByLibrary.simpleMessage("Чат"),
        "ChatDeletionAndCreationMessage": m5,
        "CheckIn": MessageLookupByLibrary.simpleMessage("Check in"),
        "CheckInHiwHint": m6,
        "CheckInHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "излечит ваше чувство или усилит!"),
        "CheckInHiwTitle":
            MessageLookupByLibrary.simpleMessage("Подходящий контент..."),
        "CheckItOut": MessageLookupByLibrary.simpleMessage("Зацени"),
        "ChooseOption": MessageLookupByLibrary.simpleMessage("Выбери"),
        "ChooseYourself": MessageLookupByLibrary.simpleMessage("Выбери себя"),
        "Christianity": MessageLookupByLibrary.simpleMessage("Христианство"),
        "ClickEnterToSearch":
            MessageLookupByLibrary.simpleMessage("Нажми Ввод для поиска"),
        "CollapseThread":
            MessageLookupByLibrary.simpleMessage("Свернуть ветку"),
        "Comments": m7,
        "Company": MessageLookupByLibrary.simpleMessage("Компания"),
        "CompanyAnswered":
            MessageLookupByLibrary.simpleMessage("Ответ компании"),
        "CompanyCredentials":
            MessageLookupByLibrary.simpleMessage("Данные компании"),
        "CompanyName":
            MessageLookupByLibrary.simpleMessage("Название компании"),
        "CompanyPosition":
            MessageLookupByLibrary.simpleMessage("Позиция компания"),
        "CompanyPresentationSlider1": MessageLookupByLibrary.simpleMessage(
            "Это закрытый профиль, который позволяет вам публиковать свои места, филиалы и события"),
        "CompanyPresentationSlider2": MessageLookupByLibrary.simpleMessage(
            "Вы можете создавать филиалы; в карточке места пользователи увидят всю сеть"),
        "CompanyPresentationSlider3": MessageLookupByLibrary.simpleMessage(
            "Ваш контент появляется в ротации приложения и рекомендуется пользователям через уникальную систему Shuffle."),
        "CompanyPresentationSlider4": MessageLookupByLibrary.simpleMessage(
            "Повысьте узнаваемость и посещаемость ваших мест и событий. Все функции приложения и пользователей находятся в вашем контенте"),
        "CompanyPresentationSlider5": MessageLookupByLibrary.simpleMessage(
            "Вы привлекаете специализированных инфлюенсеров Shuffle, которые повысят статус ваших мест"),
        "CompanyPresentationSlider6": MessageLookupByLibrary.simpleMessage(
            "Вы можете взаимодействовать со своей аудиторией через уникальный функционал специальных уведомлений, напоминаний, предложений и пресейлов"),
        "CompanyPresentationSlider7": MessageLookupByLibrary.simpleMessage(
            "Вы можете использовать внутреннюю систему таргетированной рекламы"),
        "CompanyPresentationSlider8": MessageLookupByLibrary.simpleMessage(
            "Вы можете интегрировать свою систему бронирования в контент или использовать систему бронирования Shuffle в будущем"),
        "CompressingVideo":
            MessageLookupByLibrary.simpleMessage("Сжатие видео"),
        "CompressingVideoProgress": m8,
        "Confirm": MessageLookupByLibrary.simpleMessage("Подтвердить"),
        "Congratulations": MessageLookupByLibrary.simpleMessage("Поздравляем"),
        "Connects": MessageLookupByLibrary.simpleMessage("Объедениться"),
        "ContactPerson":
            MessageLookupByLibrary.simpleMessage("Контактное лицо"),
        "Contacts": MessageLookupByLibrary.simpleMessage("Контакты"),
        "ContentIdNotProvidedError":
            MessageLookupByLibrary.simpleMessage("Не предоставлен ID контента"),
        "ContentQualityNotice": MessageLookupByLibrary.simpleMessage(
            "Контент будет проходить модерацию, ожидаем высокое качество контента"),
        "ContentThatIsAvailableForYouToViewWillAppearHere":
            MessageLookupByLibrary.simpleMessage(
                "Контент, доступный вам для просмотра, появится здесь"),
        "Contest": MessageLookupByLibrary.simpleMessage("Конкурс"),
        "Continue": MessageLookupByLibrary.simpleMessage("Продолжить"),
        "Control": MessageLookupByLibrary.simpleMessage("Контроль"),
        "ConvenientClearAndUseful":
            MessageLookupByLibrary.simpleMessage("удобно, чётко и полезно"),
        "CountReviews": m9,
        "CountVideoReaction": m10,
        "Create": MessageLookupByLibrary.simpleMessage("Создать"),
        "CreateEvent": MessageLookupByLibrary.simpleMessage("Создать событие"),
        "CreatePlace": MessageLookupByLibrary.simpleMessage("Создать место"),
        "CreateYourEventAndInvitePeople": MessageLookupByLibrary.simpleMessage(
            "Создай своё событие и пригласи людей"),
        "CreateYourPlaceAndInvitePeople": MessageLookupByLibrary.simpleMessage(
            "Создай своё место и пригласи людей"),
        "CredentialsCodeVerificationSubtitle":
            MessageLookupByLibrary.simpleMessage(
                "Пожалуйста, введи код, отправленный на"),
        "CredentialsVerificationPrompt": MessageLookupByLibrary.simpleMessage(
            "Чтобы продолжить, сначала пройди регистрацию"),
        "CredentialsVerificationTitle":
            MessageLookupByLibrary.simpleMessage("Мы рады тебя видеть"),
        "CuttingVideo": MessageLookupByLibrary.simpleMessage("Обрезка видео"),
        "Daily": MessageLookupByLibrary.simpleMessage("Ежедневно "),
        "Date": MessageLookupByLibrary.simpleMessage("Дата"),
        "DateOfBirth": MessageLookupByLibrary.simpleMessage("Дата рождения"),
        "Dates": MessageLookupByLibrary.simpleMessage("Даты"),
        "Day": MessageLookupByLibrary.simpleMessage("День"),
        "Days": m11,
        "DaysOfWeek": MessageLookupByLibrary.simpleMessage("Дни недели"),
        "DeleteAccount":
            MessageLookupByLibrary.simpleMessage("Удалить аккаунт"),
        "DeleteCompany":
            MessageLookupByLibrary.simpleMessage("Удалить компанию"),
        "DeleteFromList":
            MessageLookupByLibrary.simpleMessage("Удалить из списка"),
        "DependingOn": MessageLookupByLibrary.simpleMessage("Зависит от..."),
        "DescribeYourBusiness":
            MessageLookupByLibrary.simpleMessage("Опиши свой бизнес"),
        "DescribeYourClaim":
            MessageLookupByLibrary.simpleMessage("Рассказывай"),
        "DescribeYourIssue":
            MessageLookupByLibrary.simpleMessage("Опиши проблему"),
        "DescribeYourWishes":
            MessageLookupByLibrary.simpleMessage("Опиши пожелания"),
        "DescribeYourself": MessageLookupByLibrary.simpleMessage("Опиши себя"),
        "Description": MessageLookupByLibrary.simpleMessage("Описание"),
        "Details": MessageLookupByLibrary.simpleMessage("Детали"),
        "DifferentNumberOfPoints":
            MessageLookupByLibrary.simpleMessage("Разное количество поинтов"),
        "Directions": MessageLookupByLibrary.simpleMessage("Направления"),
        "DonationHint": MessageLookupByLibrary.simpleMessage(
            "Ты можешь создавать один запрос в месяц и потратить деньги только на свою мечту "),
        "DonationRaised": m12,
        "DontBeAlone":
            MessageLookupByLibrary.simpleMessage("Не будьте одиноки"),
        "DontMissIt": MessageLookupByLibrary.simpleMessage("Не пропусти"),
        "DubaiEventTicket":
            MessageLookupByLibrary.simpleMessage("Билет на события в Дубае"),
        "Easy": MessageLookupByLibrary.simpleMessage("Изи"),
        "Edit": MessageLookupByLibrary.simpleMessage("Редактировать"),
        "EditProfile": MessageLookupByLibrary.simpleMessage("Редактировать"),
        "EditingTypePlace": m13,
        "Email": MessageLookupByLibrary.simpleMessage("Email"),
        "EmailVerification":
            MessageLookupByLibrary.simpleMessage("Подтверждение email"),
        "EnableHintSystem":
            MessageLookupByLibrary.simpleMessage("Включить подсказки"),
        "EnterInputType": m14,
        "EnterLocation":
            MessageLookupByLibrary.simpleMessage("Введите местоположение"),
        "EnterNewPassword":
            MessageLookupByLibrary.simpleMessage("Новый пароль"),
        "EnterPlaceAddressPrompt": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, введи адрес места"),
        "EnterPrice": MessageLookupByLibrary.simpleMessage("Введи цену"),
        "EnterTitle": MessageLookupByLibrary.simpleMessage("Введите название"),
        "EnterYourEmailAddress":
            MessageLookupByLibrary.simpleMessage("Введи адрес эл. почты"),
        "Entertainment": MessageLookupByLibrary.simpleMessage("Развлечения"),
        "EntertainmentSpecialist":
            MessageLookupByLibrary.simpleMessage("Специалист развлечений"),
        "ErrorOccured": MessageLookupByLibrary.simpleMessage("Возникла ошибка"),
        "ErrorOccuredWithoutMessage":
            MessageLookupByLibrary.simpleMessage("Ошибка без сообщения"),
        "Event": MessageLookupByLibrary.simpleMessage("Событие"),
        "EventType": MessageLookupByLibrary.simpleMessage("Тип события"),
        "Events": MessageLookupByLibrary.simpleMessage("События"),
        "EventsCount": m15,
        "EventsReminders":
            MessageLookupByLibrary.simpleMessage("Напоминания о событиях"),
        "Exit": MessageLookupByLibrary.simpleMessage("Выход"),
        "ExpandThread":
            MessageLookupByLibrary.simpleMessage("Развернуть ветку"),
        "Fair": MessageLookupByLibrary.simpleMessage("Средне"),
        "Faq": MessageLookupByLibrary.simpleMessage("ЧаВО"),
        "FaqUnderDev": MessageLookupByLibrary.simpleMessage(
            "Сбор запросов для FAQ. \nРаздел находится в разработке"),
        "Favorites": MessageLookupByLibrary.simpleMessage("Избранное"),
        "FeaturesEnableGeolocation":
            MessageLookupByLibrary.simpleMessage("Функции включают геолокацию"),
        "FeedFavoritesHiwItems": m16,
        "FeedFeelingsHiwItems": m17,
        "FeedFeelingsHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "получаешь то, что нужно конкретно тебе"),
        "FeedFeelingsHiwTitle":
            MessageLookupByLibrary.simpleMessage("Полагаясь на..."),
        "FeedNichesHiwItems": m18,
        "FeedNichesHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "получаешь то, что есть в твоей нише"),
        "FeedNichesHiwTitle":
            MessageLookupByLibrary.simpleMessage("Отличное совпадение..."),
        "FeedRandomizerHiwItems": m19,
        "FeedRandomizerHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "нажимаешь и случайная выдача"),
        "FeedRandomizerHiwTitle":
            MessageLookupByLibrary.simpleMessage("Его величество случай..."),
        "Feedback": MessageLookupByLibrary.simpleMessage("Отзыв"),
        "FeedbackAddedSuccessfullyMessage":
            MessageLookupByLibrary.simpleMessage("Твой отзыв успешно добавлен"),
        "Feedbacks": m20,
        "Feeling": MessageLookupByLibrary.simpleMessage("Чувство"),
        "Female": MessageLookupByLibrary.simpleMessage("Женщина"),
        "FileNotExistsMessage":
            MessageLookupByLibrary.simpleMessage("Файл не существует"),
        "Filters": MessageLookupByLibrary.simpleMessage("Фильтры"),
        "FindSomeoneCardPoints": m21,
        "FindSomeoneCardSameInterests": m22,
        "FindSomeoneToHangOutWith":
            MessageLookupByLibrary.simpleMessage("Найти с кем затусить"),
        "FindSomeoneToNetworkWith": MessageLookupByLibrary.simpleMessage(
            "Найти кого-то для нетворкинга"),
        "FocusOfLight":
            MessageLookupByLibrary.simpleMessage("Средоточие Света"),
        "FocusOfLightDescription": MessageLookupByLibrary.simpleMessage(
            "Свет вселенной заключён здесь. Если потемнеет в душе - свет с тобой. Посмотри и преисполнись покоем."),
        "Follow": MessageLookupByLibrary.simpleMessage("Следовать"),
        "Followers": MessageLookupByLibrary.simpleMessage("Подписчики"),
        "FollowersCount": m23,
        "Followings": MessageLookupByLibrary.simpleMessage("Подписки"),
        "For": MessageLookupByLibrary.simpleMessage("Для"),
        "ForFormattedPrice": m24,
        "ForPeriod": MessageLookupByLibrary.simpleMessage("на"),
        "ForgotPassword": MessageLookupByLibrary.simpleMessage("Забыл пароль"),
        "Free": MessageLookupByLibrary.simpleMessage("Бесплатно"),
        "FreePlaces": MessageLookupByLibrary.simpleMessage("\nбесплатных мест"),
        "FridayShort": MessageLookupByLibrary.simpleMessage("Пт"),
        "FulfillTheDream":
            MessageLookupByLibrary.simpleMessage("Исполнить мечту"),
        "Gender": MessageLookupByLibrary.simpleMessage("Пол"),
        "GetCode": MessageLookupByLibrary.simpleMessage("Получить код"),
        "GetReward": MessageLookupByLibrary.simpleMessage("Забрать награду"),
        "GetStarted": MessageLookupByLibrary.simpleMessage("Начать"),
        "Go": MessageLookupByLibrary.simpleMessage("Go!"),
        "GoAheadAndGrowYourBusiness": MessageLookupByLibrary.simpleMessage(
            "Продолжай и позволь бизнесу расти"),
        "GoNoExclamation": MessageLookupByLibrary.simpleMessage("Go"),
        "GoPremium": MessageLookupByLibrary.simpleMessage("Перейти на премиум"),
        "GoProFree":
            MessageLookupByLibrary.simpleMessage("Перейти на про бесплатно"),
        "GoToSettings":
            MessageLookupByLibrary.simpleMessage("Перейти в настройки"),
        "GreatInterviewWithOwner": MessageLookupByLibrary.simpleMessage(
            "Отличное интервью с владельцем"),
        "Guess": MessageLookupByLibrary.simpleMessage("Угадать"),
        "HallOfFame": MessageLookupByLibrary.simpleMessage("Зал славы"),
        "HardToAnswer": MessageLookupByLibrary.simpleMessage("Сложно ответить"),
        "Hardcore": MessageLookupByLibrary.simpleMessage("Хардкор"),
        "HealthKit": MessageLookupByLibrary.simpleMessage("Данные здоровья"),
        "HealthRandomAlert": MessageLookupByLibrary.simpleMessage(
            "Предоставь доступ к хэлс киту иначе результат будет рандомным"),
        "Helpful": MessageLookupByLibrary.simpleMessage("Полезно"),
        "HelpfulNCount": m25,
        "Hindu": MessageLookupByLibrary.simpleMessage("Индуизм"),
        "HintAverageBill": MessageLookupByLibrary.simpleMessage(
            "Выбери цену или диапазон цен"),
        "HintNumberEventsForPro": MessageLookupByLibrary.simpleMessage(
            "3 события доступны & добавь больше за отдельную цену"),
        "HintSystemDisabled": MessageLookupByLibrary.simpleMessage(
            "Система подсказок деактивирована"),
        "HintSystemEnabled": m26,
        "HoursAgo": m27,
        "HowAreYouFeelingThisMorning": MessageLookupByLibrary.simpleMessage(
            "Как себя чувствуешь этим утром?"),
        "HowAreYouFeelingToday": MessageLookupByLibrary.simpleMessage(
            "Как себя чувствуешь этим днём?"),
        "HowAreYouFeelingTonight": MessageLookupByLibrary.simpleMessage(
            "Как себя чувствуешь этим вечером?"),
        "HowItWorks": MessageLookupByLibrary.simpleMessage("Как\nэто?"),
        "HowMuchDoYouWantToDonate": MessageLookupByLibrary.simpleMessage(
            "Сколько \$ хочешь задонатить?"),
        "Icon": MessageLookupByLibrary.simpleMessage("Иконка"),
        "Icons": MessageLookupByLibrary.simpleMessage("Иконки"),
        "IdealRoute": MessageLookupByLibrary.simpleMessage("Идеальный маршрут"),
        "IncorrectLoginOrPassword":
            MessageLookupByLibrary.simpleMessage("Не тот логин или пароль"),
        "Influencer": MessageLookupByLibrary.simpleMessage("Инфлюенсер"),
        "InfluencerSubscriptionFeature1": MessageLookupByLibrary.simpleMessage(
            "Заяви о себе показав свою экспертизу в одной из сфер жизни города или мира"),
        "InfluencerSubscriptionFeature2": MessageLookupByLibrary.simpleMessage(
            "Собери свою аудиторию или дополни существующую"),
        "InfluencerSubscriptionFeature3": MessageLookupByLibrary.simpleMessage(
            "Используй набор инструментов для работы с "),
        "InfluencerSubscriptionFeature3v1":
            MessageLookupByLibrary.simpleMessage(
                " контентом и своей аудиторией"),
        "InfluencerSubscriptionFeature4": MessageLookupByLibrary.simpleMessage(
            "Стань лидером и зарабатывай репутацию в совей сфере"),
        "InfluencerSubscriptionFeature5": MessageLookupByLibrary.simpleMessage(
            "Влияй на выбор людей и усиливай значимость мест и событий"),
        "InfluencerSubscriptionFeature6":
            MessageLookupByLibrary.simpleMessage("Монетизация"),
        "Info": MessageLookupByLibrary.simpleMessage("Информация"),
        "InstructionsToEnableHealthKit": MessageLookupByLibrary.simpleMessage(
            "Чтобы включить кит здоровья, перейдите в раздел «Конфиденциальность и безопасность» в настройках, затем перейдите в раздел «Здоровье» и выберите там «Shuffle app»."),
        "Interview": MessageLookupByLibrary.simpleMessage("Интервью"),
        "InventoryItems":
            MessageLookupByLibrary.simpleMessage("Предметы инвентаря"),
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
        "InvitedPeople": MessageLookupByLibrary.simpleMessage("Участники"),
        "Invites": MessageLookupByLibrary.simpleMessage("Приглашения"),
        "InvitesNPeopleTo": m28,
        "InvitesTo": MessageLookupByLibrary.simpleMessage("на"),
        "InvitesVerb": MessageLookupByLibrary.simpleMessage("Приглашает"),
        "InvitesYouTo":
            MessageLookupByLibrary.simpleMessage("Приглашает вас на"),
        "IsRecurrent": MessageLookupByLibrary.simpleMessage("Повторяется"),
        "Islam": MessageLookupByLibrary.simpleMessage("Ислам"),
        "Judaism": MessageLookupByLibrary.simpleMessage("Иудаизм"),
        "Leisure": MessageLookupByLibrary.simpleMessage("Досуг"),
        "Less": MessageLookupByLibrary.simpleMessage("меньше"),
        "Loading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
        "Location": MessageLookupByLibrary.simpleMessage("Локация"),
        "LocationIsRequired": MessageLookupByLibrary.simpleMessage(
            "Локация необходима для использования функции"),
        "LoginToAppDaysInARow": m29,
        "LoginWith": m30,
        "Logo": MessageLookupByLibrary.simpleMessage("Лого"),
        "LogoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Лого (загрузить)"),
        "LovelyTouchAmazingInteraction":
            MessageLookupByLibrary.simpleMessage("Приятный на ощупь интерфейс"),
        "LuckyCoin": MessageLookupByLibrary.simpleMessage("Монета удачи"),
        "LuckyCoinDescription": MessageLookupByLibrary.simpleMessage(
            "Пока она у тебя в инвентаре - удача с тобой. Покрути, поверти её, прикоснись к ней, чтобы наполниться энергией удачи."),
        "MakeSureYouAreCloseToMakeCheckIn":
            MessageLookupByLibrary.simpleMessage(
                "Убедись что ты близко и повтори"),
        "Male": MessageLookupByLibrary.simpleMessage("Мужчина"),
        "Members": m31,
        "MembersCount": m32,
        "Message": MessageLookupByLibrary.simpleMessage("Сообщение"),
        "Messages": MessageLookupByLibrary.simpleMessage("Сообщения"),
        "Min": MessageLookupByLibrary.simpleMessage("мин"),
        "MinutesAgo": m33,
        "MondayShort": MessageLookupByLibrary.simpleMessage("Пн"),
        "Month": MessageLookupByLibrary.simpleMessage("Месяц"),
        "Monthly": MessageLookupByLibrary.simpleMessage("Месячный"),
        "More": MessageLookupByLibrary.simpleMessage("больше"),
        "MoreAboutThisEvent":
            MessageLookupByLibrary.simpleMessage("Больше об этом событии"),
        "MoreAboutThisPlace":
            MessageLookupByLibrary.simpleMessage("Больше об этом месте"),
        "MustSelectVideo": MessageLookupByLibrary.simpleMessage(
            "Вы должны выбрать хотя бы одно видео"),
        "MustVisitTechnologyConf": MessageLookupByLibrary.simpleMessage(
            "Обязательно посетите технологическую конференцию"),
        "MyCard": MessageLookupByLibrary.simpleMessage("Профиль"),
        "MyEvents": MessageLookupByLibrary.simpleMessage("Мои события"),
        "MyFeedback": MessageLookupByLibrary.simpleMessage("Мои отзывы"),
        "MyReactions": MessageLookupByLibrary.simpleMessage("Мои реакции"),
        "NFT": MessageLookupByLibrary.simpleMessage("NFT"),
        "NPlace": m34,
        "Name": MessageLookupByLibrary.simpleMessage("Имя"),
        "NameOrNickname": MessageLookupByLibrary.simpleMessage("Имя или ник"),
        "New": MessageLookupByLibrary.simpleMessage("Новое"),
        "NewDonates": MessageLookupByLibrary.simpleMessage("Новые донаты"),
        "NewFeatures": MessageLookupByLibrary.simpleMessage("Новые функции"),
        "NewFollowers":
            MessageLookupByLibrary.simpleMessage("Новые подписчики"),
        "NewLocationHasOpenedToday": MessageLookupByLibrary.simpleMessage(
            "Сегодня открылось новое место. Приходи! Понравится!"),
        "NewPlace": MessageLookupByLibrary.simpleMessage("Новое место"),
        "News": MessageLookupByLibrary.simpleMessage("Новости"),
        "Next": MessageLookupByLibrary.simpleMessage("Далее"),
        "NextElements": m35,
        "NextNPeople": m36,
        "NextWithChevrons": MessageLookupByLibrary.simpleMessage("Далее >>>"),
        "Niche": MessageLookupByLibrary.simpleMessage("Ниша"),
        "Nickname": MessageLookupByLibrary.simpleMessage("Ник"),
        "NicknameIsTakenTryAnotherOne":
            MessageLookupByLibrary.simpleMessage("Ник занят, попробуй другой"),
        "NoConnection": MessageLookupByLibrary.simpleMessage(
            "Потеряно соединение с интернетом"),
        "NoDateSelected":
            MessageLookupByLibrary.simpleMessage("Дата не выбрана"),
        "NoFavoritesFound":
            MessageLookupByLibrary.simpleMessage("Нет избранных"),
        "NoFeedbacksYet": MessageLookupByLibrary.simpleMessage(
            "Посещайте места и события в Shuffle и делитесь впечатлениями"),
        "NoHealthKitAvailableOnYourDevice":
            MessageLookupByLibrary.simpleMessage(
                "Не доступны данные здоровья, результат будет случайным"),
        "NoMessagesYet":
            MessageLookupByLibrary.simpleMessage("Пока нет сообщений"),
        "NoPeopleAvailableToInvite": MessageLookupByLibrary.simpleMessage(
            "Нет пользователей для инвайта"),
        "NoPhotoHereYet":
            MessageLookupByLibrary.simpleMessage("Тут пока нет фото!"),
        "NoPreferencesChosen":
            MessageLookupByLibrary.simpleMessage("Предпочтения не выбраны"),
        "NoReactionsMessage": MessageLookupByLibrary.simpleMessage(
            "Здесь пока нет реакций, будь первым"),
        "NoReviewsMessage":
            MessageLookupByLibrary.simpleMessage("Оставь отзыв первым"),
        "NoThx": MessageLookupByLibrary.simpleMessage("Нет, спс"),
        "NoVideoReactionsYet": MessageLookupByLibrary.simpleMessage(
            "Посещайте места и события в Shuffle и делитесь видеореакциями"),
        "NotNow": MessageLookupByLibrary.simpleMessage("Не сейчас"),
        "NotOften": MessageLookupByLibrary.simpleMessage("Не часто"),
        "NotSet": MessageLookupByLibrary.simpleMessage("Не указано"),
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
        "OfferContent":
            MessageLookupByLibrary.simpleMessage("Предложить контент"),
        "OfferSuccessfullyActivated": MessageLookupByLibrary.simpleMessage(
            "Предложение успешно активировано"),
        "OfficeAppartmentNumber":
            MessageLookupByLibrary.simpleMessage("Номер офиса"),
        "Ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "Okay": MessageLookupByLibrary.simpleMessage("Окей"),
        "OkayCool": MessageLookupByLibrary.simpleMessage("Ок, круто!"),
        "OnboardingSlide1": MessageLookupByLibrary.simpleMessage("веселиться"),
        "OnboardingSlide2":
            MessageLookupByLibrary.simpleMessage("развлечения\nи бизнес"),
        "OnboardingSlide3":
            MessageLookupByLibrary.simpleMessage("просто чилить"),
        "Ooops": MessageLookupByLibrary.simpleMessage("Ууупс!"),
        "Oops": MessageLookupByLibrary.simpleMessage("Уупс"),
        "OopsIWillTryAgain":
            MessageLookupByLibrary.simpleMessage("Уупс, попробую ещё"),
        "Open": MessageLookupByLibrary.simpleMessage("Открыто"),
        "OpenFrom": MessageLookupByLibrary.simpleMessage("С"),
        "OpenNow": MessageLookupByLibrary.simpleMessage("Часы работы"),
        "OpenTo": MessageLookupByLibrary.simpleMessage("До"),
        "OpeningHours": MessageLookupByLibrary.simpleMessage("Часы работы"),
        "OrDragFilesHere":
            MessageLookupByLibrary.simpleMessage("Или перетащи файлы"),
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
            MessageLookupByLibrary.simpleMessage("Персональный респект"),
        "PersonalTop": MessageLookupByLibrary.simpleMessage("Личный ТОП"),
        "Phone": MessageLookupByLibrary.simpleMessage("Телефон"),
        "PhoneVerification": MessageLookupByLibrary.simpleMessage(
            "Подтверждение номера телефона"),
        "Photo": MessageLookupByLibrary.simpleMessage("Фото"),
        "PhotoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Фото (загрузить)"),
        "Photos": MessageLookupByLibrary.simpleMessage("Фото"),
        "PickFromMap": MessageLookupByLibrary.simpleMessage("Выбрать на карте"),
        "Place": MessageLookupByLibrary.simpleMessage("Место"),
        "PlaceSubmittedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Предложение успешно отправлено"),
        "PlaceType": MessageLookupByLibrary.simpleMessage("Тип места"),
        "Places": MessageLookupByLibrary.simpleMessage("Места"),
        "PlacesVisited": m37,
        "PleaseFillOutDate":
            MessageLookupByLibrary.simpleMessage("Заполни дату, пожалуйста"),
        "PleaseFillOutYourWishes": MessageLookupByLibrary.simpleMessage(
            "Заполни пожелания, пожалуйста"),
        "PleaseSelectANiche":
            MessageLookupByLibrary.simpleMessage("Выбери нишу, пожалуйста"),
        "PleaseSelectAtLeastNReligion": m38,
        "PleaseSelectAtLeastOneAgeRange": MessageLookupByLibrary.simpleMessage(
            "Выбери хотя бы одну возрастную группу"),
        "PleaseSelectAtLeastOnePriceSegment":
            MessageLookupByLibrary.simpleMessage(
                "Выбери хотя бы один ценовой сегмент"),
        "PleaseSelectGender":
            MessageLookupByLibrary.simpleMessage("Пожалуйста, укажи пол"),
        "PleaseSelectOneType":
            MessageLookupByLibrary.simpleMessage("Пожалуйста, выбери один тип"),
        "PointBalance": MessageLookupByLibrary.simpleMessage("Баланс\nпоинтов"),
        "Points": MessageLookupByLibrary.simpleMessage("Поинты"),
        "PointsCount": m39,
        "PointsEarned": m40,
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
        "PremiumSubscriptionFeature7": MessageLookupByLibrary.simpleMessage(
            "Возможность создавать удобные стпоки избранного и делиться ими"),
        "PremiumSubscriptionFeature8": MessageLookupByLibrary.simpleMessage(
            "Свой собственный планировщик событий"),
        "Price": MessageLookupByLibrary.simpleMessage("Цена"),
        "PriceRange": MessageLookupByLibrary.simpleMessage("Диапазон цен"),
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
        "ProTools": MessageLookupByLibrary.simpleMessage("Pro tools"),
        "ProfileAskOrSupportHiwHint": m41,
        "ProfileAskOrSupportHiwSubtitle":
            MessageLookupByLibrary.simpleMessage("свою или чью-то"),
        "ProfileAskOrSupportHiwTitle":
            MessageLookupByLibrary.simpleMessage("Исполни мечту..."),
        "ProfileFindSomeoneHiwHint": m42,
        "ProfileFindSomeoneHiwSubtitle":
            MessageLookupByLibrary.simpleMessage("пойти куда-нибудь вместе"),
        "ProfileFindSomeoneHiwTitle":
            MessageLookupByLibrary.simpleMessage("Не будь один..."),
        "Properties": MessageLookupByLibrary.simpleMessage("Свойства"),
        "Published": MessageLookupByLibrary.simpleMessage("Опубликовано"),
        "PushUpYourBusiness":
            MessageLookupByLibrary.simpleMessage("Прокачай свой бизнес"),
        "RangeEndValueIsLessThanBeginingOne":
            MessageLookupByLibrary.simpleMessage(
                "Конечное значение диапазона меньше начального"),
        "Rating": MessageLookupByLibrary.simpleMessage("Рейтинг"),
        "ReactionsBy": MessageLookupByLibrary.simpleMessage("Реакции\nот"),
        "ReactionsByCritics":
            MessageLookupByLibrary.simpleMessage("Отзывы от критиков"),
        "Read": m43,
        "RealMoney": MessageLookupByLibrary.simpleMessage("Реальные деньги"),
        "RecentlyAdded":
            MessageLookupByLibrary.simpleMessage("Недавно добавлено"),
        "Recommended": MessageLookupByLibrary.simpleMessage("Рекомендуем"),
        "RelatedPersonalProperties": MessageLookupByLibrary.simpleMessage(
            "Относительные личные свойства"),
        "RelatedProperties":
            MessageLookupByLibrary.simpleMessage("Связанные свойства"),
        "Religion": MessageLookupByLibrary.simpleMessage("Религия"),
        "Reply": MessageLookupByLibrary.simpleMessage("Ответить"),
        "ReplyingTo": m44,
        "ResendCode":
            MessageLookupByLibrary.simpleMessage("Отправить код еще раз"),
        "Reset": MessageLookupByLibrary.simpleMessage("Сбросить"),
        "ResetFilters":
            MessageLookupByLibrary.simpleMessage("Сбросить фильтры"),
        "ResetPassword":
            MessageLookupByLibrary.simpleMessage("Сбросить пароль"),
        "Respect": MessageLookupByLibrary.simpleMessage("Респект"),
        "Restaurant": MessageLookupByLibrary.simpleMessage("Рестораны"),
        "RestorePurchase":
            MessageLookupByLibrary.simpleMessage("Восстановить покупки"),
        "Reviews": MessageLookupByLibrary.simpleMessage("Отзывы"),
        "ReviewsByCritics":
            MessageLookupByLibrary.simpleMessage("Отзывы критиков"),
        "ReviewsCount": m45,
        "ReviewsPosted": m46,
        "ReviewsReceived": m47,
        "SaturdayShort": MessageLookupByLibrary.simpleMessage("Сб"),
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
        "SearchHiwHint": m48,
        "SearchHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "поиск или выбрать другие варианты"),
        "SearchHiwTitle":
            MessageLookupByLibrary.simpleMessage("Обычный поиск..."),
        "SearchOrAddTag":
            MessageLookupByLibrary.simpleMessage("Поиск или добавить тег"),
        "SearchProperty": MessageLookupByLibrary.simpleMessage("Поиск свойств"),
        "SeeAll": MessageLookupByLibrary.simpleMessage("Посмотреть всё"),
        "SeeMore": MessageLookupByLibrary.simpleMessage("Ещё"),
        "SelectCurrency": MessageLookupByLibrary.simpleMessage("Выбери валюту"),
        "SelectDate": MessageLookupByLibrary.simpleMessage("Выбери дату"),
        "SelectDateRange":
            MessageLookupByLibrary.simpleMessage("Выбери диапазон дат"),
        "SelectDays": MessageLookupByLibrary.simpleMessage("Выбрать дни "),
        "SelectGender": MessageLookupByLibrary.simpleMessage("Выберите пол"),
        "SelectLanguage":
            MessageLookupByLibrary.simpleMessage("Пожалуйста выбери язык"),
        "SelectOption": MessageLookupByLibrary.simpleMessage("Выбирай"),
        "SelectPriceAndCurrency":
            MessageLookupByLibrary.simpleMessage("Выберите цену и валюту"),
        "SelectType": m49,
        "SelectYourReligions":
            MessageLookupByLibrary.simpleMessage("Укажи свою религию"),
        "SelectYourSpecialty":
            MessageLookupByLibrary.simpleMessage("Выберите свою специальность"),
        "SelectionOfTheBest":
            MessageLookupByLibrary.simpleMessage("Выбор лучших"),
        "Send": MessageLookupByLibrary.simpleMessage("Отправить"),
        "SendIt": MessageLookupByLibrary.simpleMessage("Отправить"),
        "Services": MessageLookupByLibrary.simpleMessage("Услуги"),
        "SetWorkHours": MessageLookupByLibrary.simpleMessage("Часы работы"),
        "Settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "ShareCard": m50,
        "SharedWithYou":
            MessageLookupByLibrary.simpleMessage("поделилась с вами"),
        "ShowDeleted":
            MessageLookupByLibrary.simpleMessage("Показать удаленные"),
        "ShowMore": MessageLookupByLibrary.simpleMessage("Показать\nбольше"),
        "ShowResult":
            MessageLookupByLibrary.simpleMessage("Показать результат"),
        "ShowTheBarcode": MessageLookupByLibrary.simpleMessage(
            "Показывайте штрих-код при оплате"),
        "ShraziidGoblet":
            MessageLookupByLibrary.simpleMessage("Кубок Шразиида"),
        "ShraziidGobletDescription": MessageLookupByLibrary.simpleMessage(
            "Древний кубок, найденный в песках пустыни. Говорят, что из него пил сам Шразиид, правитель великого Песчаного царства."),
        "Shuffle": MessageLookupByLibrary.simpleMessage("Shuffle"),
        "ShuffleHiwHint": m51,
        "ShuffleHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "поиск персонализированных мест"),
        "ShuffleHiwTitle":
            MessageLookupByLibrary.simpleMessage("Перетасовка мест..."),
        "ShuffleWithRightWhitespace":
            MessageLookupByLibrary.simpleMessage("Shuffle "),
        "Skip": MessageLookupByLibrary.simpleMessage("Пропустить"),
        "Small": MessageLookupByLibrary.simpleMessage("Небольшой"),
        "SmartLeisureSelection": MessageLookupByLibrary.simpleMessage(
            "Умный подбор досуга каждому, везде"),
        "SocialSubtitle":
            MessageLookupByLibrary.simpleMessage("Полезные сервисы и места"),
        "SomethingWentWrong": MessageLookupByLibrary.simpleMessage(
            "Что-то пошло не так. Попробуй еще раз."),
        "Spend": MessageLookupByLibrary.simpleMessage("Потратить"),
        "SpendHoursPerWeek": m52,
        "SpendIt": MessageLookupByLibrary.simpleMessage("Потратить"),
        "Spent": MessageLookupByLibrary.simpleMessage("Потрачено"),
        "SpentMyPoints":
            MessageLookupByLibrary.simpleMessage("Потратил мои баллы"),
        "SpinnerHiwHint": m53,
        "SpinnerHiwSubtitle": MessageLookupByLibrary.simpleMessage(
            "ты найдешь персонализированные мероприятия"),
        "SpinnerHiwTitle":
            MessageLookupByLibrary.simpleMessage("Ты крутишь его..."),
        "SpinnerTitle":
            MessageLookupByLibrary.simpleMessage("События. Не пропусти!"),
        "StacksAndSomethingElseAreAvailableForYou":
            MessageLookupByLibrary.simpleMessage(
                "Для вас доступны стопки и кое-что еще..."),
        "StacksAreOn":
            MessageLookupByLibrary.simpleMessage("Для пользователей"),
        "StartToExplore":
            MessageLookupByLibrary.simpleMessage("Начать изучать"),
        "Submit": MessageLookupByLibrary.simpleMessage("Отправить"),
        "SubmitContent":
            MessageLookupByLibrary.simpleMessage("Предложить контент"),
        "SubscribeToProfile":
            MessageLookupByLibrary.simpleMessage("Подписаться"),
        "Success": MessageLookupByLibrary.simpleMessage("Success"),
        "SuccessfullyAnswered":
            MessageLookupByLibrary.simpleMessage("Успешно отправлен ответ"),
        "SundayShort": MessageLookupByLibrary.simpleMessage("Вс"),
        "Sunny": MessageLookupByLibrary.simpleMessage("Солнечно"),
        "Support": MessageLookupByLibrary.simpleMessage("Помощь"),
        "SupportPeopleAroundYou":
            MessageLookupByLibrary.simpleMessage("Помочь людям вокруг"),
        "SureYouWantToExit":
            MessageLookupByLibrary.simpleMessage("Точно хочешь выйти?"),
        "SwipeToStart":
            MessageLookupByLibrary.simpleMessage("Свайп чтобы начать"),
        "SwitchAnyTime": MessageLookupByLibrary.simpleMessage(
            "Можно переключить в любое время в настройках профиля"),
        "Tags": MessageLookupByLibrary.simpleMessage("Ярлыки"),
        "TapIt": MessageLookupByLibrary.simpleMessage("Нажми"),
        "TapOnceToChoose":
            MessageLookupByLibrary.simpleMessage("Нажми, чтобы выбрать"),
        "TapToSeeMore": MessageLookupByLibrary.simpleMessage("Увидеть больше"),
        "TapToSetAddress":
            MessageLookupByLibrary.simpleMessage("Нажми, чтобы ввести адрес"),
        "TapTwiceToMarkYourFavorites": MessageLookupByLibrary.simpleMessage(
            ". Нажми дважды, чтобы отметить избранное."),
        "TastyCoffee": MessageLookupByLibrary.simpleMessage("Вкусный кофе"),
        "Taxi": MessageLookupByLibrary.simpleMessage("Taxi"),
        "TeaList": MessageLookupByLibrary.simpleMessage("Чайная карта"),
        "TellUsMore": MessageLookupByLibrary.simpleMessage("Расскажи ещё"),
        "TellUsMoreAboutYourself": m54,
        "Terms": MessageLookupByLibrary.simpleMessage("Условия"),
        "TermsOfService":
            MessageLookupByLibrary.simpleMessage("Условия использования"),
        "ThatsAllForNow": MessageLookupByLibrary.simpleMessage("Пока это всё!"),
        "TheBestParties":
            MessageLookupByLibrary.simpleMessage("Лучшие вечеринки"),
        "TheBestTechConf":
            MessageLookupByLibrary.simpleMessage("Лучшая тех конференция"),
        "TheBestTechListSuccessfullyAdded":
            MessageLookupByLibrary.simpleMessage(
                "Список “Лучшая тех конференция” успешно добавлен"),
        "TheBestTechnologiesConf": MessageLookupByLibrary.simpleMessage(
            "Лучшая техническая конференция"),
        "TheMoreInfoWeAboutYouGetTheBetter":
            MessageLookupByLibrary.simpleMessage(
                "Чем больше узнаем о тебе, тем лучше"),
        "TheMoreInfoWeGetTheBetter": MessageLookupByLibrary.simpleMessage(
            "Чем больше инфы мы получим, тем лучше"),
        "ThenCheckThisOut":
            MessageLookupByLibrary.simpleMessage("Тогда зацени это"),
        "TheseContentIsOnYourOtherLists": MessageLookupByLibrary.simpleMessage(
            "Этот контент есть в других ваших списках. После добавления он будет удален из текущего."),
        "ThisIs": MessageLookupByLibrary.simpleMessage("Это"),
        "ThroughANonAggregatorSystem": MessageLookupByLibrary.simpleMessage(
            "Неагрегаторная система специально для вас"),
        "ThursdayShort": MessageLookupByLibrary.simpleMessage("Чт"),
        "Time": MessageLookupByLibrary.simpleMessage("Время"),
        "Title": MessageLookupByLibrary.simpleMessage("Название"),
        "TitleYourTop": MessageLookupByLibrary.simpleMessage("Назови свой ТОП"),
        "ToAccessAll": MessageLookupByLibrary.simpleMessage("Полный доступ"),
        "ToAllowAccessGoToSettings": MessageLookupByLibrary.simpleMessage(
            "Чтобы разрешить push-уведомления, зайдите в настройки телефона"),
        "ToBecomeAnInfluencerYouNeedToDo": MessageLookupByLibrary.simpleMessage(
            "Чтобы стать инфлюенсером вам необходимо выполнить"),
        "ToOpenTheNextSetOfToolsYouNeedToDo":
            MessageLookupByLibrary.simpleMessage(
                "Чтобы открыть следующий набор инструментов, вам нужно сделать"),
        "Today": MessageLookupByLibrary.simpleMessage("Сегодня"),
        "Top": MessageLookupByLibrary.simpleMessage("ТОП"),
        "TopNDonatorsReceiveXPoints": m55,
        "TopPlacesRatedBy": m56,
        "TrialPeriod": MessageLookupByLibrary.simpleMessage("Триал период"),
        "TryYourself": MessageLookupByLibrary.simpleMessage("Попробуйте\nсами"),
        "TuesdayShort": MessageLookupByLibrary.simpleMessage("Вт"),
        "TypeHere": MessageLookupByLibrary.simpleMessage("Напиши тут"),
        "TypeOfContent": MessageLookupByLibrary.simpleMessage("Тип контента"),
        "Undefined": MessageLookupByLibrary.simpleMessage("Неопределено"),
        "UnderDevelopmentMessage":
            MessageLookupByLibrary.simpleMessage("В разработке"),
        "UnderService": MessageLookupByLibrary.simpleMessage("В разработке"),
        "Unfollow": MessageLookupByLibrary.simpleMessage("Отписаться"),
        "UniqueProperties":
            MessageLookupByLibrary.simpleMessage("Уникальные свойства"),
        "UnknownRing":
            MessageLookupByLibrary.simpleMessage("Неизвестное кольцо"),
        "UnknownRingDescription": MessageLookupByLibrary.simpleMessage(
            "Странное кольцо. Не знаем откуда оно здесь…"),
        "UnsubscribeFromProfile":
            MessageLookupByLibrary.simpleMessage("Отписаться"),
        "UpcomingEvent":
            MessageLookupByLibrary.simpleMessage("Предстоящее событие"),
        "UpcomingGlobalEvents":
            MessageLookupByLibrary.simpleMessage("Грядущие глобальные"),
        "Update": MessageLookupByLibrary.simpleMessage("Обновить"),
        "UpdateAppMessage": MessageLookupByLibrary.simpleMessage(
            "Ты давно не обновлял приложение, а мы добавили много удобных штук"),
        "UpdateAppMessageTitle":
            MessageLookupByLibrary.simpleMessage("Пора обновиться"),
        "UpgradeAccount": m57,
        "UpgradeAccountConfirmation":
            MessageLookupByLibrary.simpleMessage("Оформить"),
        "UpgradeForNmoney": m58,
        "UploadingVideo":
            MessageLookupByLibrary.simpleMessage("Загрузка видео"),
        "User": MessageLookupByLibrary.simpleMessage("Юзер"),
        "UserTypeSelectionPrompt": MessageLookupByLibrary.simpleMessage(
            "Выбери тип аккаунта, который хочешь создать или войти"),
        "Users": m59,
        "UsingHealthKit":
            MessageLookupByLibrary.simpleMessage("Данные здоровья"),
        "UsingNotifications":
            MessageLookupByLibrary.simpleMessage("Уведомления"),
        "ValueMustBeAtLeast3Characters": MessageLookupByLibrary.simpleMessage(
            "Значение не менее 3 символов"),
        "VeryOften": MessageLookupByLibrary.simpleMessage("Часто"),
        "Video": MessageLookupByLibrary.simpleMessage("Видео"),
        "VideoFileNotCut":
            MessageLookupByLibrary.simpleMessage("Видео не обрезано"),
        "VideoReactionAdded": MessageLookupByLibrary.simpleMessage(
            "Твоя реакция успешно добавлена"),
        "VideoReactionUploadedMessage": MessageLookupByLibrary.simpleMessage(
            "Видео-реакция успешно загружена"),
        "VideoReactions": MessageLookupByLibrary.simpleMessage("Видео-реакции"),
        "VideoUploadFiles":
            MessageLookupByLibrary.simpleMessage("Видео (загрузить)"),
        "ViewAll": MessageLookupByLibrary.simpleMessage("Все"),
        "ViewHistory": MessageLookupByLibrary.simpleMessage("Просмотр истории"),
        "VisitFirstToOpenNext": MessageLookupByLibrary.simpleMessage(
            "Посети первое, открой следующее"),
        "Voice": MessageLookupByLibrary.simpleMessage("Аудиосообщения"),
        "Voices": MessageLookupByLibrary.simpleMessage("Голосовые записи"),
        "WeDoNotSpamAllKindsOfNotifications": MessageLookupByLibrary.simpleMessage(
            "Мы не спамим уведомлениями и рекламой. Только то, что важно для вас и соответствуют вашим предпочтениям."),
        "WeHavePlacesJustForYou": MessageLookupByLibrary.simpleMessage(
            "Есть решения именно для тебя"),
        "WeWillLetKnowResults": MessageLookupByLibrary.simpleMessage(
            "Мы оповестим вас о результатах"),
        "Weather": MessageLookupByLibrary.simpleMessage("Погода"),
        "Website": MessageLookupByLibrary.simpleMessage("Сайт"),
        "WednesdayShort": MessageLookupByLibrary.simpleMessage("Ср"),
        "WeekAgo": MessageLookupByLibrary.simpleMessage("неделю назад"),
        "Welcome": MessageLookupByLibrary.simpleMessage("Велкам"),
        "WhatIs": MessageLookupByLibrary.simpleMessage("Зачем нужен"),
        "WhatYouLike":
            MessageLookupByLibrary.simpleMessage("Что тебе нравится"),
        "WhiteTheme": MessageLookupByLibrary.simpleMessage("Светлая тема"),
        "WhyDoYouLoveIt": MessageLookupByLibrary.simpleMessage(
            "Почему тебе это так нравится?"),
        "WillBe": MessageLookupByLibrary.simpleMessage(" будет."),
        "WillBeImplementedSoon":
            MessageLookupByLibrary.simpleMessage("Скоро будет реализовано"),
        "WithInDays": m60,
        "WithYourPreferences":
            MessageLookupByLibrary.simpleMessage("С учетом твоих предпочтений"),
        "WorkHours": MessageLookupByLibrary.simpleMessage("Часы работы"),
        "WriteTheAnswer":
            MessageLookupByLibrary.simpleMessage("Напишите ответ"),
        "WrongSecurityCode":
            MessageLookupByLibrary.simpleMessage("Неверный код"),
        "XCouldNotBeEmpty": m61,
        "XIsRequired": m62,
        "XSuccessfullyUpdated": m63,
        "Year": MessageLookupByLibrary.simpleMessage("Год"),
        "Yearly": MessageLookupByLibrary.simpleMessage("Годовой"),
        "Yes": MessageLookupByLibrary.simpleMessage("Да"),
        "Yesterday": MessageLookupByLibrary.simpleMessage("Вчера"),
        "YouBetterCheckThisOut":
            MessageLookupByLibrary.simpleMessage("Тебе лучше взглянуть"),
        "YouCanGet": MessageLookupByLibrary.simpleMessage("Ты можешь получить"),
        "YouGetAccessToTrial": MessageLookupByLibrary.simpleMessage(
            "Ты получишь доступ ко всем функциям на"),
        "YouGetExactlyWhatYouNeed": MessageLookupByLibrary.simpleMessage(
            "Ты получаешь точно то, что нужно"),
        "YouMissedALot":
            MessageLookupByLibrary.simpleMessage("Вы многое пропустили"),
        "YouReceived": MessageLookupByLibrary.simpleMessage("Вы получили"),
        "YouSentInvitationToNPeople": m64,
        "YouSureToDeleteX": m65,
        "YouWillNoLongerSendMessagesTo": m66,
        "YouWillReceiveNewTools": MessageLookupByLibrary.simpleMessage(
            "Вы получите новые инструменты"),
        "YoullFindIt": MessageLookupByLibrary.simpleMessage("Ты найдёшь"),
        "YourAge": MessageLookupByLibrary.simpleMessage("Твой возраст"),
        "YourAudienceAge":
            MessageLookupByLibrary.simpleMessage("Возраст аудитории"),
        "YourClaimHasBeenSent":
            MessageLookupByLibrary.simpleMessage("Ваше заявление отправлено"),
        "YourEmail": MessageLookupByLibrary.simpleMessage("Твоя почта"),
        "YourLeisureSelection":
            MessageLookupByLibrary.simpleMessage("твой выбор досуга"),
        "YourName": MessageLookupByLibrary.simpleMessage("Твоё имя"),
        "YourNewTools": MessageLookupByLibrary.simpleMessage(
            "Теперь вам доступны инструменты"),
        "YourNiche": MessageLookupByLibrary.simpleMessage("Твоя ниша"),
        "YourPosition": MessageLookupByLibrary.simpleMessage("Ваша позиция"),
        "YourPriceSegment":
            MessageLookupByLibrary.simpleMessage("Your price segment"),
        "YourProgress": MessageLookupByLibrary.simpleMessage("Ваш прогресс"),
        "YourTraffic": MessageLookupByLibrary.simpleMessage("Ваш трафик"),
        "daynight": MessageLookupByLibrary.simpleMessage("Днём и ночью"),
        "key": MessageLookupByLibrary.simpleMessage("")
      };
}
