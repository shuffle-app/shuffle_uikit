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

  static String m3(x) => "Вы уверены что хотите заархивировать ${x}?";

  static String m4(x) => "Букинг (+${x})";

  static String m5(count) =>
      "${count} ${Intl.plural(count, zero: 'букингов', one: 'букинг', two: 'букинга', few: 'букинга', many: 'букингов', other: 'букингов')}";

  static String m6(count) =>
      "${Intl.plural(count, zero: 'броней', one: 'бронь', two: 'брони', few: 'броней', many: 'броней', other: 'броней')}";

  static String m7(sum, currency) => "Бюджет ${sum}${currency}";

  static String m8(count) =>
      "${count} ${Intl.plural(count, zero: 'открытий карточек', one: 'открытие карточки', two: 'открытия карточек', few: 'открытия карточек', many: 'открытий карточек', other: 'открытий карточек')}";

  static String m9(creationDate, deletionDate) =>
      "Создан ${creationDate}.\nУдалится ${deletionDate}";

  static String m10(item) =>
      "${Intl.plural(item, zero: '3 уровня сложности', one: 'посещай и открывай новое', two: 'посети и зачекинься', few: 'пройди и получи награду', other: 'пройди и получи награду')}";

  static String m11(x) => "Город автоматически определяется как ${x}.";

  static String m12(count) =>
      "${Intl.plural(count, zero: 'комментариев', one: 'комментарий', two: 'комментария', few: 'комментариев', many: 'комментариев', other: 'комментариев')}";

  static String m13(progress) => "Сжатие видео ${progress}%";

  static String m14(count) =>
      "${count} ${Intl.plural(count, zero: 'коннектов', one: 'коннект', two: 'коннекта', few: 'коннекта', many: 'коннектов', other: 'коннектов')}";

  static String m15(count) =>
      "${count} ${Intl.plural(count, zero: 'предложений', one: 'предложение', two: 'прижложения', few: 'предложения', many: 'предложений', other: 'предложений')} контента";

  static String m16(count) => "${count} Отзывов";

  static String m17(count) => "${count} Видео-Реакций";

  static String m18(count) => "Создайте УТП за \$${count} для своих клиентов";

  static String m19(x, y) =>
      "Создайте новое ${x} для своего ${y} и увеличьте посещаемость";

  static String m20(days) =>
      "${Intl.plural(days, zero: 'дней', one: 'день', two: 'дня', few: 'дня', many: 'дней', other: 'дней')}";

  static String m21(x) => "Вы уверены что хотите удалить ${x} навсегда?";

  static String m22(actuallyRaised, goal) =>
      "собрано ${actuallyRaised}/\$${goal}\$";

  static String m23(editingType) => "${editingType} место";

  static String m24(inputType) => "Ввести ${inputType}";

  static String m25(title) => "Введите ${title}";

  static String m26(x) => "Не удалось подключиться к ${x}";

  static String m27(count) =>
      "${Intl.plural(count, zero: 'событий', one: 'событие', two: 'события', few: 'событий', many: 'событий', other: 'событий')}";

  static String m28(item) =>
      "${Intl.plural(item, zero: 'зажми и перетяни карточку', one: 'создай стопку и назови', two: 'выстрой порядок стопок', few: 'поделись стопкой', other: 'поделись стопкой')}";

  static String m29(item) =>
      "${Intl.plural(item, zero: 'гео', one: 'интересы', two: 'погода вокруг', few: 'и еще 14 свойств', other: 'и еще 14 свойств')}";

  static String m30(item) =>
      "${Intl.plural(item, zero: 'выбераешь нишу', one: 'жмешь', two: 'получаешь подборку', few: 'выбираешь и планируешь', other: 'выбираешь и планируешь')}";

  static String m31(item) =>
      "${Intl.plural(item, zero: 'события и места', one: 'фильтруй по тэгам', two: 'выбирай и жми', few: 'прокрути\n', other: 'прокрути\n')}";

  static String m32(count) =>
      "${count} ${Intl.plural(count, zero: 'отзывов', one: 'отзыв', two: 'отзыва', few: 'отзыва', many: 'отзывов', other: 'отзывов')}";

  static String m33(count) =>
      "${count} ${Intl.plural(count, zero: 'челленджей', one: 'челлендж', two: 'челленджа', few: 'челленджа', many: 'челленджей', other: 'челленджей')} feelings";

  static String m34(count) =>
      "${Intl.plural(count, zero: '${count} поинтов', one: '${count} поинт', two: '${count} поинта', few: '${count} поинтов', many: '${count} поинтов', other: '${count} поинтов')}";

  static String m35(count) =>
      "${Intl.plural(count, zero: '${count} общих интересов', one: '${count} общий интерес', two: '${count} общих интереса', few: '${count} общих интересов', many: '${count} общих интересов', other: '${count} общих интересов')}";

  static String m36(count) =>
      "${Intl.plural(count, zero: 'подписчиков', one: 'подписчик', two: 'подписчика', few: 'подписчиков', many: 'подписчиков', other: 'подписчиков')}";

  static String m37(formattedPrice) => "За ${formattedPrice}";

  static String m38(count) => "Сейчас бесплатно, позже ${count}\$";

  static String m39(from, to) =>
      "${from} - ${to} ${Intl.plural(from, zero: 'лет', one: 'год', two: 'года', few: 'года', many: 'лет', other: 'лет')}";

  static String m40(helpfulCount) => "Полезно ${helpfulCount}";

  static String m41(days) =>
      "Система подсказок активирована на ${Intl.plural(days, zero: '${days} дней', one: '${days} день', two: '${days} дня', few: '${days} дня', many: '${days} дней', other: '${days} дней')}";

  static String m42(hours) => "${hours}ч назад";

  static String m43(count) =>
      "${count} ${Intl.plural(count, zero: 'приглашений', one: 'приглашение', two: 'приглашения', few: 'приглашения', many: 'приглашений', other: 'приглашений')}";

  static String m44(invitedPeopleCount) =>
      "Приглашает ${Intl.plural(invitedPeopleCount, zero: '${invitedPeopleCount} людей', one: '${invitedPeopleCount}-о', two: '${invitedPeopleCount}-х', few: '${invitedPeopleCount}-х', many: '${invitedPeopleCount}-х', other: '${invitedPeopleCount}-х')}";

  static String m45(invitedPeopleCount) =>
      "Приглашает ${Intl.plural(invitedPeopleCount, zero: '${invitedPeopleCount} людей', one: '${invitedPeopleCount}-о', two: '${invitedPeopleCount}-х', few: '${invitedPeopleCount}-х', many: '${invitedPeopleCount}-х', other: '${invitedPeopleCount}-х')} на";

  static String m46(count) =>
      "${Intl.plural(count, zero: 'досуг и бизнес события и места', one: 'закрытые разделы и функции', two: 'поинты, награды и деньги', few: 'приглашения, чаты, тусовки', other: 'Премиум, PRO и организация, аккаунт Инфлюенсера (пользуйся и создавай контент)')}";

  static String m47(count) =>
      "Вход в приложение ${count} ${Intl.plural(count, zero: 'дней', one: 'день', two: 'дня', few: 'дня', many: 'дней', other: 'дней')} подряд";

  static String m48(provider) => "Продолжить с ${provider}";

  static String m49(item) =>
      "${Intl.plural(item, zero: 'Участников', one: 'Участник', two: 'Участников', few: 'Участников', many: 'Участниками', other: 'Участники')}";

  static String m50(count) =>
      "${Intl.plural(count, zero: '${count} участников', one: '${count} участник', two: '${count} участника', few: '${count} участников', many: '${count} участников', other: '${count} участников')}";

  static String m51(minutes) => "${minutes}м назад";

  static String m52(placeIndex) => "${placeIndex} место";

  static String m53(elements) => "Ещё ${elements}";

  static String m54(amountOfPeople) => "Следующие ${amountOfPeople}";

  static String m55(count) => "Цена предложения ${count}\$";

  static String m56(count) =>
      "${Intl.plural(count, zero: 'визитов', one: 'визит', two: 'визитов', few: 'визитов', many: 'визитов', other: 'визитов')}";

  static String m57(x) => "Пожалуйста, введите действительную ${x} ссылку";

  static String m58(religionCount) =>
      "Пожалуйста, выбери из списка ${religionCount} религию";

  static String m59(x) =>
      "Пожалуйста проверьте детали ${x} перед отправкой на модерацию";

  static String m60(count) =>
      "${Intl.plural(count, zero: '+${count} комментариев', one: '+${count} комментарий', two: '+${count} комментария', few: '+${count} комментария', many: '+${count} комментариев', other: '+${count} комментариев')}";

  static String m61(count) =>
      "${Intl.plural(count, zero: '+${count} респектов', one: '+${count} респект', two: '+${count} респекта', few: '+${count} респекта', many: '+${count} респектов', other: '+${count} респектов')}";

  static String m62(count) =>
      "${Intl.plural(count, zero: '+${count} Новых отзывов', one: '+${count} Новый отзыв', two: '+${count} Новых отзыва', few: '+${count} Новых отзыва', many: '+${count} Новых отзывов', other: '+${count} Новых отзывов')}";

  static String m63(count) =>
      "${Intl.plural(count, zero: '+${count} видео реакций', one: '+${count} видео реакция', two: '+${count} видео реакции', few: '+${count} видео реакции', many: '+${count} видео реакций', other: '+${count} видео реакций')}";

  static String m64(count) =>
      "${Intl.plural(count, zero: '+${count} Новых аудиосообщений', one: '+${count} Новое аудиосообщение', two: '+${count} Новых аудиосообщения', few: '+${count} Новых аудиосообщения', many: '+${count} Новых аудиосообщений', other: '+${count} Новых аудиосообщений')}";

  static String m65(count) =>
      "${Intl.plural(count, zero: '+${count} Фото', one: '+${count} Фото', two: '+${count} Фото', few: '+${count} Фото', many: '+${count} Фото', other: '+${count} Фото')}";

  static String m66(count) =>
      "${Intl.plural(count, zero: 'поинтов', one: 'поинт', two: 'поинта', few: 'поинта', many: 'поинтов', other: 'поинтов')}";

  static String m67(count) =>
      "${Intl.plural(count, zero: 'поинтов', one: 'поинт', two: 'поинтов', few: 'поинтов', many: 'поинтов', other: 'поинтов')}";

  static String m68(item) =>
      "${Intl.plural(item, zero: 'репутация и валюта', one: 'повышай рейтинг или трать', two: 'делай действия', few: 'получай поинты', other: 'получай поинты')}";

  static String m69(count) =>
      "${Intl.plural(count, zero: 'Поинтов', one: 'Поинт', two: 'Поинта', few: 'Поинтов', many: 'Поинтов', other: 'Поинтов')} ";

  static String m70(count) =>
      "${count} ${Intl.plural(count, zero: 'продутов', one: 'проукт', two: 'продукта', few: 'продукта', many: 'продуктов', other: 'продуктов')}";

  static String m71(item) =>
      "${Intl.plural(item, zero: 'размести запрос', one: 'напиши и сделай видео', two: 'будь убедителен и честен', few: 'помогай другим', other: 'помогай другим')}";

  static String m72(item) =>
      "${Intl.plural(item, zero: 'найти компаньонов', one: 'похожие предпочтения', two: 'поинты = репутация', few: 'никаких неприятелей', other: 'никаких неприятелей')}";

  static String m73(count) =>
      "${count} ${Intl.plural(count, zero: 'видео-реакций', one: 'видео-реакция', two: 'видео-реакции', few: 'видео-реакции', many: 'видео-реакций', other: 'видео-реакций')}";

  static String m74(amount) => "Читать ${amount}";

  static String m75(message) => "Ответ на ${message}";

  static String m76(count) =>
      "${count} ${Intl.plural(count, zero: 'Обзоров', one: 'Обзор', two: 'Обзора', few: 'Обзора', many: 'Обзоров', other: 'Обзоров')}";

  static String m77(count) =>
      "${Intl.plural(count, zero: 'отзывов', one: 'отзыва', two: 'отзывов', few: 'отзывов', many: 'отзывов', other: 'отзывов')}";

  static String m78(count) =>
      "${Intl.plural(count, zero: 'отзывов', one: 'отзыв', two: 'отзыва', few: 'отзывов', many: 'отзывов', other: 'отзывов')}";

  static String m79(item) =>
      "${Intl.plural(item, zero: 'предпочтения не работают', one: 'события/места', two: 'введи и получай', few: 'смотри на рейтинги', other: 'смотри на рейтинги')}";

  static String m80(count) =>
      "${Intl.plural(count, zero: 'Систему рекомендаций контента специально для тебя', one: 'Встречи единомышленников с помощью системы соответствия пользователей', two: 'Каждый раз новые места и события, подходящие тебе', other: 'Легче найти нужных людей, а им найти тебя')}";

  static String m81(type) => "Выбрать ${type}";

  static String m82(count) =>
      "Поделиться ${count} ${Intl.plural(count, zero: 'карточек', one: 'карточкой', two: 'карточками', few: 'карточками', many: 'карточками', other: 'карточками')}";

  static String m83(x) => "Показать ${x} в профиле";

  static String m84(item) =>
      "${Intl.plural(item, zero: 'свайпай карточки', one: 'листай свойства места', two: 'ок/не ок/в избранное', few: 'учи нашу систему', other: 'учи нашу систему')}";

  static String m85(count) =>
      "Провести ${count} ${Intl.plural(count, zero: 'часов', one: 'час', two: 'часа', few: 'часа', many: 'часа', other: 'часов')} в неделю";

  static String m86(item) =>
      "${Intl.plural(item, zero: 'ради забавы', one: 'можно листать категорию', two: 'выбирай и планируй', few: 'ищи и бронируй', other: 'ищи и бронируй')}";

  static String m87(count) =>
      "поделиться ${count} ${Intl.plural(count, zero: 'стопок', one: 'стопкой', two: 'стопками', few: 'стопками', many: 'стопками', other: 'стопками')}";

  static String m88(x) => "Статус: ${x} - Доступно";

  static String m89(x) =>
      "Статус ${x} - Доступ ограничен или страница не найдена";

  static String m90(separator) => "Расскажи${separator}о себе";

  static String m91(count) =>
      "${count} ${Intl.plural(count, zero: 'билетов', one: 'билет', two: 'билета', few: 'билета', many: 'билета', other: 'билетов')} из";

  static String m92(count) =>
      "${count} ${Intl.plural(count, zero: 'билетов', one: 'билет', two: 'билета', few: 'билета', many: 'билета', other: 'билетов')}";

  static String m93(date) => "Топ событий на ${date}";

  static String m94(amountOfTopDonators, multiplier) =>
      "Топовые ${amountOfTopDonators} донаторы получают x${multiplier} поинтов";

  static String m95(separator) => "Топовый контент${separator}от";

  static String m96(x) => "Вы отправляете ${x} на модерацию";

  static String m97(type) => "Чтобы пользоваться этим нужен ${type} аккаунт";

  static String m98(forNMoney) => "Купить ${forNMoney}";

  static String m99(count) =>
      "${count} ${Intl.plural(count, zero: 'продутов', one: 'проукт', two: 'продукта', few: 'продукта', many: 'продукта', other: 'продукта')} дополнительных продаж из";

  static String m100(count) =>
      "${Intl.plural(count, zero: '${count} человек', one: '${count} человек', two: '${count} человека', few: '${count} людей', many: '${count} человек', other: '${count} человек')}";

  static String m101(days) =>
      "через ${days} ${Intl.plural(days, zero: 'дней', one: 'день', two: 'дня', few: 'дня', many: 'дней', other: 'дней')}";

  static String m102(value) => "${value} не может быть пустым";

  static String m103(x, y) => "${x} приглашает ${y}";

  static String m104(title) => "${title} требуется";

  static String m105(x) => "${x} успешно активировано";

  static String m106(x) => "${x} успешно созданно";

  static String m107(value) => "${value} успешно обновлено";

  static String m108(years) =>
      "${years}+ ${Intl.plural(years, zero: 'лет', one: 'год', two: 'года', few: 'года', many: 'лет', other: 'лет')}";

  static String m109(years) =>
      "${years} ${Intl.plural(years, zero: 'лет', one: 'год', two: 'года', few: 'года', many: 'лет', other: 'лет')}";

  static String m110(x) => "Вы можете увидеть своё ${x} в меню акции";

  static String m111(amountOfInvitedPersons) =>
      "Вы отправили приглашение ${amountOfInvitedPersons} людям";

  static String m112(name) => "Ты уверен, что хочешь удалить ${name}?";

  static String m113(name) =>
      "Ты больше не сможешь отправлять сообщения ${name}";

  static String m114(x) => "через ${x} дня";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "APeriodOrPartOfPeriodOfTimeCannotBeInPast":
        MessageLookupByLibrary.simpleMessage(
          "Промежуток или часть промежутка времени, не может находиться в прошлом",
        ),
    "AboutUs": MessageLookupByLibrary.simpleMessage("о нас"),
    "AcceptDonations": MessageLookupByLibrary.simpleMessage(
      "Принимать донаты или помогать другим воплотить мечты",
    ),
    "Account": MessageLookupByLibrary.simpleMessage("Аккаунт"),
    "Accrual": MessageLookupByLibrary.simpleMessage("Начисление"),
    "Activation": MessageLookupByLibrary.simpleMessage("Активация"),
    "ActivityType": MessageLookupByLibrary.simpleMessage("Тип активности"),
    "ActivityTypes": MessageLookupByLibrary.simpleMessage("Типы активности"),
    "Add": MessageLookupByLibrary.simpleMessage("Добавить"),
    "AddCategory": MessageLookupByLibrary.simpleMessage("Добавить категорию"),
    "AddFeedback": MessageLookupByLibrary.simpleMessage("Поставить оценку"),
    "AddFeedbackFieldHint": MessageLookupByLibrary.simpleMessage(
      "Расскажи что тебе понравилось или запомнилось",
    ),
    "AddFeedbackFieldTitle": MessageLookupByLibrary.simpleMessage(
      "Опиши свой опыт",
    ),
    "AddImage": MessageLookupByLibrary.simpleMessage("Добавить изображения"),
    "AddInfluencerFeedbackPopOverText": MessageLookupByLibrary.simpleMessage(
      "Напиши подробный отзыв, используй все доступные символы, чтобы как можно больше людей могли его оценить",
    ),
    "AddLink": MessageLookupByLibrary.simpleMessage("Добавить ссылку"),
    "AddPhotoHere": MessageLookupByLibrary.simpleMessage("Добавьте фото здесь"),
    "AddPlaceType": MessageLookupByLibrary.simpleMessage("Добавить тип места"),
    "AddPromotion": MessageLookupByLibrary.simpleMessage("Добавить промо"),
    "AddProperty": MessageLookupByLibrary.simpleMessage("Добавить свойство"),
    "AddReactions": MessageLookupByLibrary.simpleMessage("Добавить рекцию"),
    "AddReview": MessageLookupByLibrary.simpleMessage("Оставить отзыв"),
    "AddReviewFieldHint": MessageLookupByLibrary.simpleMessage(
      "Напиши полезное дополнение",
    ),
    "AddReviewFieldTitle": MessageLookupByLibrary.simpleMessage(
      "Опиши свой опыт",
    ),
    "AddReviewPopOverText": MessageLookupByLibrary.simpleMessage(
      "Напиши дополнение к отзыву, которое будет полезно для других посетителей",
    ),
    "AddToMyFavorites": MessageLookupByLibrary.simpleMessage(
      "Добавить в избранное",
    ),
    "AddToPersonalTop": MessageLookupByLibrary.simpleMessage(
      "Добавить в личный ТОП",
    ),
    "AddToScheduler": MessageLookupByLibrary.simpleMessage("Добавить в планы"),
    "AddYourselfToList": MessageLookupByLibrary.simpleMessage(
      "Добавиться в список",
    ),
    "Address": MessageLookupByLibrary.simpleMessage("Адрес"),
    "Admin": MessageLookupByLibrary.simpleMessage("Админ"),
    "Age": MessageLookupByLibrary.simpleMessage("Возраст"),
    "Album": MessageLookupByLibrary.simpleMessage("Альбом"),
    "Albums": MessageLookupByLibrary.simpleMessage("Альбомы"),
    "AllAlbums": MessageLookupByLibrary.simpleMessage("Все альбомы"),
    "AllAppNotification": MessageLookupByLibrary.simpleMessage(
      "Все уведомления",
    ),
    "AllXFeaturesAvailable": m0,
    "Allow": MessageLookupByLibrary.simpleMessage("Разрешить"),
    "AllowAll": MessageLookupByLibrary.simpleMessage("Разрешить все"),
    "AllowGeolocation": MessageLookupByLibrary.simpleMessage(
      "Использовать геолокацию",
    ),
    "AllowLocationServicesToUseThisFunction":
        MessageLookupByLibrary.simpleMessage("Разрешить гео для этой функции"),
    "AllowX": m1,
    "AllowedCaracters": m2,
    "AlreadyHaveActiveReminder": MessageLookupByLibrary.simpleMessage(
      "У тебя уже есть активное напоминание. Чтобы создать новое, приостанови или удали предыдущее.",
    ),
    "AlreadyInvited": MessageLookupByLibrary.simpleMessage(
      "Плз уважай свой выбор и чувства других",
    ),
    "AndGet": MessageLookupByLibrary.simpleMessage("и получи"),
    "AndWithWhitespaces": MessageLookupByLibrary.simpleMessage(" И "),
    "AnotherReason": MessageLookupByLibrary.simpleMessage("Другая причина"),
    "Archive": MessageLookupByLibrary.simpleMessage("Архив"),
    "ArchiveXAlert": m3,
    "Archived": MessageLookupByLibrary.simpleMessage("Архив"),
    "AreYouSureYouWantToDeleteYourAccount":
        MessageLookupByLibrary.simpleMessage(
          "Уверены, что хотите удалить аккаунт?",
        ),
    "AreYouSureYouWantToDeleteYourCompanyProfile":
        MessageLookupByLibrary.simpleMessage(
          "Уверены, что хотите удалить аккаунт компании?",
        ),
    "AreYouSureYouWantToLogOut": MessageLookupByLibrary.simpleMessage(
      "Уверены, что хотите выйти?",
    ),
    "AskForDonations": MessageLookupByLibrary.simpleMessage("Попросить донат"),
    "AskOrSupport": MessageLookupByLibrary.simpleMessage(
      "Попросить или помочь",
    ),
    "AskPeople": MessageLookupByLibrary.simpleMessage("Спросить"),
    "Atheism": MessageLookupByLibrary.simpleMessage("Атеизм"),
    "Athlete": MessageLookupByLibrary.simpleMessage("Спортсмен"),
    "AvailableSoon": MessageLookupByLibrary.simpleMessage(
      "Скоро будет доступно",
    ),
    "AverageBill": MessageLookupByLibrary.simpleMessage("Средний чек"),
    "AverageContentViewTime": MessageLookupByLibrary.simpleMessage(
      "Среднее время визита",
    ),
    "Back": MessageLookupByLibrary.simpleMessage("Назад"),
    "Balance": MessageLookupByLibrary.simpleMessage("Баланс "),
    "BarcodeAlreadyBeenActivated": MessageLookupByLibrary.simpleMessage(
      "Этот баркод уже активирован",
    ),
    "BaseProperties": MessageLookupByLibrary.simpleMessage("Базовые свойства"),
    "BasedOnYourActivityWeDetermineYourCondition":
        MessageLookupByLibrary.simpleMessage(
          "На основании вашей активности, пульса и других факторов мы определяем ваше состояние и стараемся рекомендовать то, что вам нужно прямо сейчас, конкретно для вас.",
        ),
    "BeFirstToInvite": MessageLookupByLibrary.simpleMessage("Будь первым"),
    "BeInSearch": MessageLookupByLibrary.simpleMessage("Быть в поиске"),
    "BecomePro": MessageLookupByLibrary.simpleMessage("Страть pro"),
    "BookIt": MessageLookupByLibrary.simpleMessage("Букинг"),
    "BookItX": m4,
    "Bookigns": m5,
    "Booking": MessageLookupByLibrary.simpleMessage("Бронирование"),
    "BookingLimit": MessageLookupByLibrary.simpleMessage("Лимит бронирования"),
    "BookingLimitError": MessageLookupByLibrary.simpleMessage(
      "Достигнут лимит бронирования на одного человека",
    ),
    "BookingLimitPerOne": MessageLookupByLibrary.simpleMessage(
      "Лимит бронирования для одного",
    ),
    "BookingList": MessageLookupByLibrary.simpleMessage("Список букингов"),
    "BookingPlural": MessageLookupByLibrary.simpleMessage("Брони"),
    "Bookings": m6,
    "BookingsAndFavorites": MessageLookupByLibrary.simpleMessage(
      "Букинг и Избранное",
    ),
    "BookingsAndInvites": MessageLookupByLibrary.simpleMessage(
      "Брони и Приглашения",
    ),
    "BookingsHeading": MessageLookupByLibrary.simpleMessage("Брони"),
    "Both": MessageLookupByLibrary.simpleMessage("Оба"),
    "Branches": MessageLookupByLibrary.simpleMessage("Сеть"),
    "Buddhism": MessageLookupByLibrary.simpleMessage("Буддизм"),
    "Budget": m7,
    "BuildYOurBusiness": MessageLookupByLibrary.simpleMessage(
      "Построй свой бизнес c",
    ),
    "BuildingNumber": MessageLookupByLibrary.simpleMessage("Номер дома"),
    "BurnedToday": MessageLookupByLibrary.simpleMessage("Сожжено сегодя"),
    "Business": MessageLookupByLibrary.simpleMessage("Бизнес"),
    "ByContinuingYouAcceptThe": MessageLookupByLibrary.simpleMessage(
      "Продолжая, ты принимаешь",
    ),
    "ByDefaultYourOfferWillDisplay": MessageLookupByLibrary.simpleMessage(
      "По умолчанию в вашем предложении будет отображаться изображение с загруженных фотографий места",
    ),
    "ByDefaultYourReminderWillDisplay": MessageLookupByLibrary.simpleMessage(
      "По умолчанию в вашем напоминании будет отображаться изображение с загруженных фотографий мест",
    ),
    "ByEmail": MessageLookupByLibrary.simpleMessage("через e-mail"),
    "ByMessage": MessageLookupByLibrary.simpleMessage("через сообщения"),
    "CalmAtmosphere": MessageLookupByLibrary.simpleMessage(
      "Спокойная атмосфера",
    ),
    "Cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "CannotFindThisPlaceOrEvent": MessageLookupByLibrary.simpleMessage(
      "Не удается найти это место или ивен",
    ),
    "CantSeePublicProfileMessage": MessageLookupByLibrary.simpleMessage(
      "Ты сможешь увидеть этот профиль, когда он станет инфлюенсером",
    ),
    "CardOpening": m8,
    "Categories": MessageLookupByLibrary.simpleMessage("Категории"),
    "Category": MessageLookupByLibrary.simpleMessage("категория"),
    "ChallengeFeelings": MessageLookupByLibrary.simpleMessage(
      "Бросьте вызов чувствам",
    ),
    "ChangeInSettings": MessageLookupByLibrary.simpleMessage(
      "Вы можете изменить это в настройках.",
    ),
    "ChangePhoto": MessageLookupByLibrary.simpleMessage("Изменить фото"),
    "ChangingScheduleTypeAlert": MessageLookupByLibrary.simpleMessage(
      "Изменив тип расписания, занесенные данные очистятся!",
    ),
    "Chat": MessageLookupByLibrary.simpleMessage("Чат"),
    "ChatDeletionAndCreationMessage": m9,
    "ChatName": MessageLookupByLibrary.simpleMessage("Название чата"),
    "CheckIn": MessageLookupByLibrary.simpleMessage("Check in"),
    "CheckInHiwHint": m10,
    "CheckInHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "излечит ваше чувство или усилит!",
    ),
    "CheckInHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Подходящий контент...",
    ),
    "CheckItOut": MessageLookupByLibrary.simpleMessage("Зацени"),
    "ChooseOption": MessageLookupByLibrary.simpleMessage("Выбери"),
    "ChooseYourself": MessageLookupByLibrary.simpleMessage("Выбери себя"),
    "Christianity": MessageLookupByLibrary.simpleMessage("Христианство"),
    "City": MessageLookupByLibrary.simpleMessage("Город"),
    "CityXWasDetected": m11,
    "ClickEnterToSearch": MessageLookupByLibrary.simpleMessage(
      "Нажми Ввод для поиска",
    ),
    "CodeScanner": MessageLookupByLibrary.simpleMessage("Сканер кода"),
    "CollapseThread": MessageLookupByLibrary.simpleMessage("Свернуть ветку"),
    "Comments": m12,
    "Common": MessageLookupByLibrary.simpleMessage("Общий"),
    "Company": MessageLookupByLibrary.simpleMessage("Компания"),
    "CompanyAnswered": MessageLookupByLibrary.simpleMessage("Ответ компании"),
    "CompanyCredentials": MessageLookupByLibrary.simpleMessage(
      "Данные компании",
    ),
    "CompanyName": MessageLookupByLibrary.simpleMessage("Название компании"),
    "CompanyPosition": MessageLookupByLibrary.simpleMessage("Позиция компания"),
    "CompanyPresentationSlider1": MessageLookupByLibrary.simpleMessage(
      "Это закрытый профиль, который позволяет вам публиковать свои места, филиалы и события",
    ),
    "CompanyPresentationSlider2": MessageLookupByLibrary.simpleMessage(
      "Вы можете создавать филиалы; в карточке места пользователи увидят всю сеть",
    ),
    "CompanyPresentationSlider3": MessageLookupByLibrary.simpleMessage(
      "Ваш контент появляется в ротации приложения и рекомендуется пользователям через уникальную систему Shuffle.",
    ),
    "CompanyPresentationSlider4": MessageLookupByLibrary.simpleMessage(
      "Повысьте узнаваемость и посещаемость ваших мест и событий. Все функции приложения и пользователей находятся в вашем контенте",
    ),
    "CompanyPresentationSlider5": MessageLookupByLibrary.simpleMessage(
      "Вы привлекаете специализированных инфлюенсеров Shuffle, которые повысят статус ваших мест",
    ),
    "CompanyPresentationSlider6": MessageLookupByLibrary.simpleMessage(
      "Вы можете взаимодействовать со своей аудиторией через уникальный функционал специальных уведомлений, напоминаний, предложений и пресейлов",
    ),
    "CompanyPresentationSlider7": MessageLookupByLibrary.simpleMessage(
      "Вы можете использовать внутреннюю систему таргетированной рекламы",
    ),
    "CompanyPresentationSlider8": MessageLookupByLibrary.simpleMessage(
      "Вы можете интегрировать свою систему бронирования в контент или использовать систему бронирования Shuffle в будущем",
    ),
    "CompressingVideo": MessageLookupByLibrary.simpleMessage("Сжатие видео"),
    "CompressingVideoProgress": m13,
    "Confirm": MessageLookupByLibrary.simpleMessage("Подтвердить"),
    "Confirmed": MessageLookupByLibrary.simpleMessage("Подтверждено"),
    "Congratulations": MessageLookupByLibrary.simpleMessage("Поздравляем"),
    "Connected": MessageLookupByLibrary.simpleMessage("Connected"),
    "Connects": m14,
    "Contact": MessageLookupByLibrary.simpleMessage("Связаться"),
    "ContactPerson": MessageLookupByLibrary.simpleMessage("Контактное лицо"),
    "ContactWith": MessageLookupByLibrary.simpleMessage("Связаться с"),
    "Contacts": MessageLookupByLibrary.simpleMessage("Контакты"),
    "ContentIdNotProvidedError": MessageLookupByLibrary.simpleMessage(
      "Не предоставлен ID контента",
    ),
    "ContentOffers": m15,
    "ContentQualityNotice": MessageLookupByLibrary.simpleMessage(
      "Контент будет проходить модерацию, ожидаем высокое качество контента",
    ),
    "ContentThatIsAvailableForYouToViewWillAppearHere":
        MessageLookupByLibrary.simpleMessage(
          "Контент, доступный вам для просмотра, появится здесь",
        ),
    "Contest": MessageLookupByLibrary.simpleMessage("Конкурс"),
    "Continue": MessageLookupByLibrary.simpleMessage("Продолжить"),
    "Control": MessageLookupByLibrary.simpleMessage("Контроль"),
    "ConvenientClearAndUseful": MessageLookupByLibrary.simpleMessage(
      "удобно, чётко и полезно",
    ),
    "CopyrightInfringement": MessageLookupByLibrary.simpleMessage(
      "Нарушение авторских прав",
    ),
    "CouldNotFindThisReview": MessageLookupByLibrary.simpleMessage(
      "Не удалось найти этот отзыв",
    ),
    "CouldNotFindThisTicket": MessageLookupByLibrary.simpleMessage(
      "Не удалось найти этот билет",
    ),
    "CouldntFindInvite": MessageLookupByLibrary.simpleMessage(
      "Не удалось найти приглашение",
    ),
    "CountReviews": m16,
    "CountVideoReaction": m17,
    "Cover": MessageLookupByLibrary.simpleMessage("Обложка"),
    "Coverage": MessageLookupByLibrary.simpleMessage("Охваты"),
    "Create": MessageLookupByLibrary.simpleMessage("Создать"),
    "CreateAUSP": m18,
    "CreateBooking": MessageLookupByLibrary.simpleMessage("Создать букинг"),
    "CreateEvent": MessageLookupByLibrary.simpleMessage("Создать событие"),
    "CreateNewXForYourY": m19,
    "CreatePlace": MessageLookupByLibrary.simpleMessage("Создать место"),
    "CreateReminderDescription": MessageLookupByLibrary.simpleMessage(
      "Создай бесплатное напоминание для твоих клиентов",
    ),
    "CreateSubs": MessageLookupByLibrary.simpleMessage("Создать сабы"),
    "CreateUpsales": MessageLookupByLibrary.simpleMessage(
      "Создать дополнительные продажи",
    ),
    "CreateYourEventAndInvitePeople": MessageLookupByLibrary.simpleMessage(
      "Создай своё событие и пригласи людей",
    ),
    "CreateYourPlaceAndInvitePeople": MessageLookupByLibrary.simpleMessage(
      "Создай своё место и пригласи людей",
    ),
    "CredentialsCodeVerificationSubtitle": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введи код, отправленный на",
    ),
    "CredentialsVerificationPrompt": MessageLookupByLibrary.simpleMessage(
      "Чтобы продолжить, сначала пройди регистрацию",
    ),
    "CredentialsVerificationTitle": MessageLookupByLibrary.simpleMessage(
      "Мы рады тебя видеть",
    ),
    "CropHorizontal": MessageLookupByLibrary.simpleMessage(
      "Обрезать для горизонтали",
    ),
    "CropVertical": MessageLookupByLibrary.simpleMessage(
      "Обрезать для вертикали",
    ),
    "CuisineType": MessageLookupByLibrary.simpleMessage("Тип кухни"),
    "CurrentLocation": MessageLookupByLibrary.simpleMessage(
      "Текущее местоположение: ",
    ),
    "CuttingVideo": MessageLookupByLibrary.simpleMessage("Обрезка видео"),
    "Daily": MessageLookupByLibrary.simpleMessage("Ежедневно "),
    "Date": MessageLookupByLibrary.simpleMessage("Дата"),
    "DateOfBirth": MessageLookupByLibrary.simpleMessage("Дата рождения"),
    "DateRange": MessageLookupByLibrary.simpleMessage("Диапазон дат"),
    "Dates": MessageLookupByLibrary.simpleMessage("Даты"),
    "Day": MessageLookupByLibrary.simpleMessage("День"),
    "Days": m20,
    "DaysOfWeek": MessageLookupByLibrary.simpleMessage("Дни недели"),
    "Delete": MessageLookupByLibrary.simpleMessage("Удалить"),
    "DeleteAccount": MessageLookupByLibrary.simpleMessage("Удалить аккаунт"),
    "DeleteCompany": MessageLookupByLibrary.simpleMessage("Удалить компанию"),
    "DeleteFolderAlert": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите удалить папку?",
    ),
    "DeleteFromList": MessageLookupByLibrary.simpleMessage("Удалить из списка"),
    "DeleteXAlert": m21,
    "DependingOn": MessageLookupByLibrary.simpleMessage("Зависит от..."),
    "DescribeYourBusiness": MessageLookupByLibrary.simpleMessage(
      "Опиши свой бизнес",
    ),
    "DescribeYourClaim": MessageLookupByLibrary.simpleMessage("Рассказывай"),
    "DescribeYourIssue": MessageLookupByLibrary.simpleMessage("Опиши проблему"),
    "DescribeYourWishes": MessageLookupByLibrary.simpleMessage(
      "Опиши пожелания",
    ),
    "DescribeYourself": MessageLookupByLibrary.simpleMessage("Опиши себя"),
    "Description": MessageLookupByLibrary.simpleMessage("Описание"),
    "Details": MessageLookupByLibrary.simpleMessage("Детали"),
    "DifferentNumberOfPoints": MessageLookupByLibrary.simpleMessage(
      "Разное количество поинтов",
    ),
    "Directions": MessageLookupByLibrary.simpleMessage("Направления"),
    "DistributeInformation": MessageLookupByLibrary.simpleMessage(
      "Распространяем информацию",
    ),
    "DonationHint": MessageLookupByLibrary.simpleMessage(
      "Ты можешь создавать один запрос в месяц и потратить деньги только на свою мечту ",
    ),
    "DonationRaised": m22,
    "DontBeAlone": MessageLookupByLibrary.simpleMessage("Не будьте одиноки"),
    "DontLiveAlone": MessageLookupByLibrary.simpleMessage(
      "Не живи один, подпишись на людей, которые тебе нравятся",
    ),
    "DontMissIt": MessageLookupByLibrary.simpleMessage("Не пропусти"),
    "DownloadPdf": MessageLookupByLibrary.simpleMessage("Скачать PDF"),
    "DubaiEventTicket": MessageLookupByLibrary.simpleMessage(
      "Билет на события в Дубае",
    ),
    "Easy": MessageLookupByLibrary.simpleMessage("Изи"),
    "Edit": MessageLookupByLibrary.simpleMessage("Редактировать"),
    "EditProfile": MessageLookupByLibrary.simpleMessage("Редактировать"),
    "EditingTypePlace": m23,
    "Email": MessageLookupByLibrary.simpleMessage("Email"),
    "EmailVerification": MessageLookupByLibrary.simpleMessage(
      "Подтверждение email",
    ),
    "EnableHintSystem": MessageLookupByLibrary.simpleMessage(
      "Включить подсказки",
    ),
    "EnterExternalLink": MessageLookupByLibrary.simpleMessage(
      "Добавить внешнюю ссылку",
    ),
    "EnterInputType": m24,
    "EnterLocation": MessageLookupByLibrary.simpleMessage(
      "Введите местоположение",
    ),
    "EnterNewPassword": MessageLookupByLibrary.simpleMessage("Новый пароль"),
    "EnterPlaceAddressPrompt": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введи адрес места",
    ),
    "EnterPrice": MessageLookupByLibrary.simpleMessage("Введи цену"),
    "EnterTitle": MessageLookupByLibrary.simpleMessage("Введите название"),
    "EnterX": m25,
    "EnterYourEmailAddress": MessageLookupByLibrary.simpleMessage(
      "Введи адрес эл. почты",
    ),
    "Entertainment": MessageLookupByLibrary.simpleMessage("Развлечения"),
    "EntertainmentSpecialist": MessageLookupByLibrary.simpleMessage(
      "Специалист развлечений",
    ),
    "ErrorFailedConnectToX": m26,
    "ErrorOccured": MessageLookupByLibrary.simpleMessage("Возникла ошибка"),
    "ErrorOccuredWithoutMessage": MessageLookupByLibrary.simpleMessage(
      "Ошибка без сообщения",
    ),
    "Event": MessageLookupByLibrary.simpleMessage("Событие"),
    "EventRatingByFeedback": MessageLookupByLibrary.simpleMessage(
      "Общий рейтинг (по отзывам)",
    ),
    "EventType": MessageLookupByLibrary.simpleMessage("Тип события"),
    "Events": MessageLookupByLibrary.simpleMessage("События"),
    "EventsCount": m27,
    "EventsReminders": MessageLookupByLibrary.simpleMessage(
      "Напоминания о событиях",
    ),
    "Exit": MessageLookupByLibrary.simpleMessage("Выход"),
    "ExpandThread": MessageLookupByLibrary.simpleMessage("Развернуть ветку"),
    "Expired": MessageLookupByLibrary.simpleMessage("Истек"),
    "Fair": MessageLookupByLibrary.simpleMessage("Средне"),
    "Faq": MessageLookupByLibrary.simpleMessage("ЧаВО"),
    "FaqUnderDev": MessageLookupByLibrary.simpleMessage(
      "Сбор запросов для FAQ. \nРаздел находится в разработке",
    ),
    "Favorites": MessageLookupByLibrary.simpleMessage("Избранное"),
    "FeaturesEnableGeolocation": MessageLookupByLibrary.simpleMessage(
      "Функции включают геолокацию",
    ),
    "FeedFavoritesHiwItems": m28,
    "FeedFeelingsHiwItems": m29,
    "FeedFeelingsHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "получаешь то, что нужно конкретно тебе",
    ),
    "FeedFeelingsHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Полагаясь на...",
    ),
    "FeedNichesHiwItems": m30,
    "FeedNichesHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "получаешь то, что есть в твоей нише",
    ),
    "FeedNichesHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Отличное совпадение...",
    ),
    "FeedRandomizerHiwItems": m31,
    "FeedRandomizerHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "нажимаешь и случайная выдача",
    ),
    "FeedRandomizerHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Его величество случай...",
    ),
    "Feedback": MessageLookupByLibrary.simpleMessage("Отзыв"),
    "FeedbackAddedSuccessfullyMessage": MessageLookupByLibrary.simpleMessage(
      "Твой отзыв успешно добавлен",
    ),
    "FeedbackPluralNoNumber": MessageLookupByLibrary.simpleMessage("Отзывы"),
    "Feedbacks": m32,
    "Feeling": MessageLookupByLibrary.simpleMessage("Чувство"),
    "FeelingsGuesses": m33,
    "Female": MessageLookupByLibrary.simpleMessage("Женщина"),
    "FileNotExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Файл не существует",
    ),
    "FillTheAirWithFreshPaint": MessageLookupByLibrary.simpleMessage(
      "Наполняем воздух свежей краской",
    ),
    "Filters": MessageLookupByLibrary.simpleMessage("Фильтры"),
    "FindSomeoneCardPoints": m34,
    "FindSomeoneCardSameInterests": m35,
    "FindSomeoneToHangOutWith": MessageLookupByLibrary.simpleMessage(
      "Найти с кем затусить",
    ),
    "FindSomeoneToNetworkWith": MessageLookupByLibrary.simpleMessage(
      "Найти кого-то для нетворкинга",
    ),
    "FocusOfLight": MessageLookupByLibrary.simpleMessage("Средоточие Света"),
    "FocusOfLightDescription": MessageLookupByLibrary.simpleMessage(
      "Свет вселенной заключён здесь. Если потемнеет в душе - свет с тобой. Посмотри и преисполнись покоем.",
    ),
    "Follow": MessageLookupByLibrary.simpleMessage("Подписаться"),
    "Followers": MessageLookupByLibrary.simpleMessage("Подписчики"),
    "FollowersCount": m36,
    "Followings": MessageLookupByLibrary.simpleMessage("Подписки"),
    "For": MessageLookupByLibrary.simpleMessage("Для"),
    "ForFormattedPrice": m37,
    "ForPeriod": MessageLookupByLibrary.simpleMessage("на"),
    "ForgotPassword": MessageLookupByLibrary.simpleMessage("Забыл пароль"),
    "Free": MessageLookupByLibrary.simpleMessage("Бесплатно"),
    "FreeNowXLater": m38,
    "FreePlaces": MessageLookupByLibrary.simpleMessage("\nбесплатных мест"),
    "Friday": MessageLookupByLibrary.simpleMessage("Пятница"),
    "FridayShort": MessageLookupByLibrary.simpleMessage("Пт"),
    "FromGallery": MessageLookupByLibrary.simpleMessage("Из галлереи"),
    "FromToYearsOld": m39,
    "FulfillTheDream": MessageLookupByLibrary.simpleMessage("Исполнить мечту"),
    "Full": MessageLookupByLibrary.simpleMessage("полный"),
    "FullRefund": MessageLookupByLibrary.simpleMessage("Полный возврат"),
    "GalleryType": MessageLookupByLibrary.simpleMessage("Тип галлереи"),
    "Gender": MessageLookupByLibrary.simpleMessage("Пол"),
    "GenderAndAge": MessageLookupByLibrary.simpleMessage("Пол и возраст"),
    "GeneraFem": MessageLookupByLibrary.simpleMessage("Общая"),
    "GeneralMas": MessageLookupByLibrary.simpleMessage("Общий"),
    "GetCode": MessageLookupByLibrary.simpleMessage("Получить код"),
    "GetReward": MessageLookupByLibrary.simpleMessage("Забрать награду"),
    "GetStarted": MessageLookupByLibrary.simpleMessage("Начать"),
    "Global": MessageLookupByLibrary.simpleMessage("Глобально"),
    "GlobalAlertText": MessageLookupByLibrary.simpleMessage(
      "ТОЛЬКО ОПУБЛИКОВАННЫЕ МОЖНО СДЕЛАТЬ ГЛОБАЛ",
    ),
    "Go": MessageLookupByLibrary.simpleMessage("Go!"),
    "GoAhead": MessageLookupByLibrary.simpleMessage("Вперед"),
    "GoAheadAndGrowYourBusiness": MessageLookupByLibrary.simpleMessage(
      "Продолжай и позволь бизнесу расти",
    ),
    "GoNoExclamation": MessageLookupByLibrary.simpleMessage("Go"),
    "GoPremium": MessageLookupByLibrary.simpleMessage("Перейти на премиум"),
    "GoPro": MessageLookupByLibrary.simpleMessage("Перейти на про"),
    "GoToPayment": MessageLookupByLibrary.simpleMessage("Перейти к оплате"),
    "GoToSettings": MessageLookupByLibrary.simpleMessage("Перейти в настройки"),
    "GreatInterviewWithOwner": MessageLookupByLibrary.simpleMessage(
      "Отличное интервью с владельцем",
    ),
    "Guess": MessageLookupByLibrary.simpleMessage("Угадать"),
    "HallOfFame": MessageLookupByLibrary.simpleMessage("Зал славы"),
    "HardToAnswer": MessageLookupByLibrary.simpleMessage("Сложно ответить"),
    "Hardcore": MessageLookupByLibrary.simpleMessage("Хардкор"),
    "HealthKit": MessageLookupByLibrary.simpleMessage("Данные здоровья"),
    "HealthRandomAlert": MessageLookupByLibrary.simpleMessage(
      "Предоставь доступ к хэлс киту иначе результат будет рандомным",
    ),
    "Helpful": MessageLookupByLibrary.simpleMessage("Полезно"),
    "HelpfulNCount": m40,
    "HiHereTicket": MessageLookupByLibrary.simpleMessage("Привет, держи билет"),
    "Hindu": MessageLookupByLibrary.simpleMessage("Индуизм"),
    "HintAverageBill": MessageLookupByLibrary.simpleMessage(
      "Выбери цену или диапазон цен",
    ),
    "HintNumberEventsForPro": MessageLookupByLibrary.simpleMessage(
      "3 события доступны & добавь больше за отдельную цену",
    ),
    "HintSystemDisabled": MessageLookupByLibrary.simpleMessage(
      "Система подсказок деактивирована",
    ),
    "HintSystemEnabled": m41,
    "HorizontalFormat": MessageLookupByLibrary.simpleMessage(
      "Горизонтальный формат",
    ),
    "HoursAgo": m42,
    "HowAreYouFeelingThisMorning": MessageLookupByLibrary.simpleMessage(
      "Как себя чувствуешь этим утром?",
    ),
    "HowAreYouFeelingToday": MessageLookupByLibrary.simpleMessage(
      "Как себя чувствуешь сегодня?",
    ),
    "HowAreYouFeelingTonight": MessageLookupByLibrary.simpleMessage(
      "Как себя чувствуешь этим вечером?",
    ),
    "HowItWorks": MessageLookupByLibrary.simpleMessage("Как\nэто?"),
    "HowMuchDoYouWantToDonate": MessageLookupByLibrary.simpleMessage(
      "Сколько \$ хочешь задонатить?",
    ),
    "IChangedMyMind": MessageLookupByLibrary.simpleMessage("Я передумал"),
    "Icon": MessageLookupByLibrary.simpleMessage("Иконка"),
    "Icons": MessageLookupByLibrary.simpleMessage("Иконки"),
    "IdealRoute": MessageLookupByLibrary.simpleMessage("Идеальный маршрут"),
    "IfPlaceAlreadyExistsIn": MessageLookupByLibrary.simpleMessage(
      "Если место уже существует в",
    ),
    "IncorrectLoginOrPassword": MessageLookupByLibrary.simpleMessage(
      "Не тот логин или пароль",
    ),
    "Influencer": MessageLookupByLibrary.simpleMessage("Инфлюенсер"),
    "InfluencerSubscriptionFeature1": MessageLookupByLibrary.simpleMessage(
      "Заяви о себе показав свою экспертизу в одной из сфер жизни города или мира",
    ),
    "InfluencerSubscriptionFeature2": MessageLookupByLibrary.simpleMessage(
      "Собери свою аудиторию или дополни существующую",
    ),
    "InfluencerSubscriptionFeature3": MessageLookupByLibrary.simpleMessage(
      "Используй набор инструментов для работы с ",
    ),
    "InfluencerSubscriptionFeature3v1": MessageLookupByLibrary.simpleMessage(
      " контентом и своей аудиторией",
    ),
    "InfluencerSubscriptionFeature4": MessageLookupByLibrary.simpleMessage(
      "Стань лидером и зарабатывай репутацию в своей сфере",
    ),
    "InfluencerSubscriptionFeature5": MessageLookupByLibrary.simpleMessage(
      "Влияй на выбор людей и усиливай значимость мест и событий",
    ),
    "InfluencerSubscriptionFeature6": MessageLookupByLibrary.simpleMessage(
      "Монетизация",
    ),
    "Info": MessageLookupByLibrary.simpleMessage("Информация"),
    "InstallingCurtains": MessageLookupByLibrary.simpleMessage(
      "Устанавливаем занавески",
    ),
    "InstructionsToEnableHealthKit": MessageLookupByLibrary.simpleMessage(
      "Чтобы включить кит здоровья, перейдите в раздел «Конфиденциальность и безопасность» в настройках, затем перейдите в раздел «Здоровье» и выберите там «Shuffle app».",
    ),
    "Interests": MessageLookupByLibrary.simpleMessage("Интересы"),
    "Interview": MessageLookupByLibrary.simpleMessage("Интервью"),
    "InventoryItems": MessageLookupByLibrary.simpleMessage(
      "Предметы инвентаря",
    ),
    "Invitations": MessageLookupByLibrary.simpleMessage("Приглашения"),
    "InvitationsCanBeViewedInPrivateMessages":
        MessageLookupByLibrary.simpleMessage(
          "Приглашения можно посмотреть в сообщениях",
        ),
    "Invite": MessageLookupByLibrary.simpleMessage("Пригласить"),
    "InviteList": MessageLookupByLibrary.simpleMessage("Cписок\nприглашений"),
    "InviteMore": MessageLookupByLibrary.simpleMessage("Пригласить ещё"),
    "InvitePeople": MessageLookupByLibrary.simpleMessage("Пригласить"),
    "InviteToFavoritePlaces": MessageLookupByLibrary.simpleMessage(
      "Пригласить в \"Избранное\"",
    ),
    "InvitedPeople": MessageLookupByLibrary.simpleMessage("Участники"),
    "Invites": MessageLookupByLibrary.simpleMessage("Приглашения"),
    "InvitesCount": m43,
    "InvitesNPeopleInfo": m44,
    "InvitesNPeopleTo": m45,
    "InvitesTo": MessageLookupByLibrary.simpleMessage("на"),
    "InvitesVerb": MessageLookupByLibrary.simpleMessage("Приглашает"),
    "InvitesYouTo": MessageLookupByLibrary.simpleMessage("Приглашает вас на"),
    "IsRecurrent": MessageLookupByLibrary.simpleMessage("Повторяется"),
    "Islam": MessageLookupByLibrary.simpleMessage("Ислам"),
    "ItNecessaryToChooseADay": MessageLookupByLibrary.simpleMessage(
      "Необходимо выбрать день",
    ),
    "Judaism": MessageLookupByLibrary.simpleMessage("Иудаизм"),
    "JustConfirmIt": MessageLookupByLibrary.simpleMessage(
      "просто подтверди это",
    ),
    "Latest": MessageLookupByLibrary.simpleMessage("Свежее"),
    "Launched": MessageLookupByLibrary.simpleMessage("Запущен"),
    "LeaveFeedback": MessageLookupByLibrary.simpleMessage("Оставьте отзыв"),
    "Leisure": MessageLookupByLibrary.simpleMessage("Досуг"),
    "Less": MessageLookupByLibrary.simpleMessage("меньше"),
    "LightingUpTimeTableau": MessageLookupByLibrary.simpleMessage(
      "Зажигаем табло времени",
    ),
    "Limit": MessageLookupByLibrary.simpleMessage("Лимит"),
    "LimitLessSumLimitsSubs": MessageLookupByLibrary.simpleMessage(
      "Лимит меньше суммы лимитов у сабов",
    ),
    "LimitLessTotalLimit": MessageLookupByLibrary.simpleMessage(
      "Этот лимит должен быть меньше общего лимита",
    ),
    "LimitMustBeGreaterThanZero": MessageLookupByLibrary.simpleMessage(
      "Лимит должен быть больше нуля",
    ),
    "Links": MessageLookupByLibrary.simpleMessage("Ссылки"),
    "Loading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
    "Location": MessageLookupByLibrary.simpleMessage("Локация"),
    "LocationIsRequired": MessageLookupByLibrary.simpleMessage(
      "Локация необходима для использования функции",
    ),
    "Locked": MessageLookupByLibrary.simpleMessage("Заперто"),
    "LogIn": MessageLookupByLibrary.simpleMessage("Log in"),
    "LogInTo": MessageLookupByLibrary.simpleMessage("Залогинься"),
    "LogInWithEmail": MessageLookupByLibrary.simpleMessage(
      "Продолжить с email",
    ),
    "LoginBenefits": m46,
    "LoginInAppDaysInARow": m47,
    "LoginWith": m48,
    "Logo": MessageLookupByLibrary.simpleMessage("Лого"),
    "LogoUploadFiles": MessageLookupByLibrary.simpleMessage("Лого (загрузить)"),
    "LongTapCardEdit": MessageLookupByLibrary.simpleMessage(
      "Чтобы отредактировать зажмите карточку",
    ),
    "LovelyTouchAmazingInteraction": MessageLookupByLibrary.simpleMessage(
      "Приятный на ощупь интерфейс",
    ),
    "LuckyCoin": MessageLookupByLibrary.simpleMessage("Монета удачи"),
    "LuckyCoinDescription": MessageLookupByLibrary.simpleMessage(
      "Пока она у тебя в инвентаре - удача с тобой. Покрути, поверти её, прикоснись к ней, чтобы наполниться энергией удачи.",
    ),
    "MakeSureYouAreCloseToMakeCheckIn": MessageLookupByLibrary.simpleMessage(
      "Убедись что ты близко и повтори",
    ),
    "Male": MessageLookupByLibrary.simpleMessage("Мужчина"),
    "MaxNumberOfEvents": MessageLookupByLibrary.simpleMessage(
      "Достигнуто максимальное количество созданных событий",
    ),
    "Members": m49,
    "MembersCount": m50,
    "Message": MessageLookupByLibrary.simpleMessage("Сообщение"),
    "MessageNotFound": MessageLookupByLibrary.simpleMessage(
      "Сообщение не найдено",
    ),
    "Messages": MessageLookupByLibrary.simpleMessage("Сообщения"),
    "Min": MessageLookupByLibrary.simpleMessage("мин"),
    "MinutesAgo": m51,
    "MinutesShort": MessageLookupByLibrary.simpleMessage("мин"),
    "Misleading": MessageLookupByLibrary.simpleMessage("Вводит в заблуждение"),
    "Moderated": MessageLookupByLibrary.simpleMessage("Модерировано"),
    "Monday": MessageLookupByLibrary.simpleMessage("Понедельник"),
    "MondayShort": MessageLookupByLibrary.simpleMessage("Пн"),
    "Month": MessageLookupByLibrary.simpleMessage("Месяц"),
    "Monthly": MessageLookupByLibrary.simpleMessage("Месячный"),
    "More": MessageLookupByLibrary.simpleMessage("больше"),
    "MoreAboutThisEvent": MessageLookupByLibrary.simpleMessage(
      "Больше об этом событии",
    ),
    "MoreAboutThisPlace": MessageLookupByLibrary.simpleMessage(
      "Больше об этом месте",
    ),
    "MostActiveAgeSegment": MessageLookupByLibrary.simpleMessage(
      "Портрет самого активного сегмента",
    ),
    "MuseumType": MessageLookupByLibrary.simpleMessage("Тип музея"),
    "MusicType": MessageLookupByLibrary.simpleMessage("Тип музыки"),
    "MustSelectVideo": MessageLookupByLibrary.simpleMessage(
      "Вы должны выбрать хотя бы одно видео",
    ),
    "MustVisitTechnologyConf": MessageLookupByLibrary.simpleMessage(
      "Обязательно посетите технологическую конференцию",
    ),
    "My": MessageLookupByLibrary.simpleMessage("Мой"),
    "MyBooking": MessageLookupByLibrary.simpleMessage("Мои букинги"),
    "MyCard": MessageLookupByLibrary.simpleMessage("Профиль"),
    "MyEvents": MessageLookupByLibrary.simpleMessage("Мои события"),
    "MyFeedback": MessageLookupByLibrary.simpleMessage("Мои отзывы"),
    "MyReactions": MessageLookupByLibrary.simpleMessage("Мои реакции"),
    "NFT": MessageLookupByLibrary.simpleMessage("NFT"),
    "NPlace": m52,
    "Name": MessageLookupByLibrary.simpleMessage("Имя"),
    "NameOrNickname": MessageLookupByLibrary.simpleMessage("Имя или ник"),
    "NeedEmailVerification": MessageLookupByLibrary.simpleMessage(
      "Требуется подтвердить email",
    ),
    "New": MessageLookupByLibrary.simpleMessage("Новое"),
    "NewDonates": MessageLookupByLibrary.simpleMessage("Новые донаты"),
    "NewFeatures": MessageLookupByLibrary.simpleMessage("Новые функции"),
    "NewFollowers": MessageLookupByLibrary.simpleMessage("Новые подписчики"),
    "NewLocationHasOpenedToday": MessageLookupByLibrary.simpleMessage(
      "Сегодня открылось новое место. Приходи! Понравится!",
    ),
    "NewPlace": MessageLookupByLibrary.simpleMessage("Новое место"),
    "News": MessageLookupByLibrary.simpleMessage("Новости"),
    "Next": MessageLookupByLibrary.simpleMessage("Далее"),
    "NextElements": m53,
    "NextNPeople": m54,
    "NextWithChevrons": MessageLookupByLibrary.simpleMessage("Далее >>>"),
    "Niche": MessageLookupByLibrary.simpleMessage("Ниша"),
    "Nickname": MessageLookupByLibrary.simpleMessage("Ник"),
    "NicknameIsTakenTryAnotherOne": MessageLookupByLibrary.simpleMessage(
      "Ник занят, попробуй другой",
    ),
    "NoBookingsYet": MessageLookupByLibrary.simpleMessage("Букингов пока нет"),
    "NoConnection": MessageLookupByLibrary.simpleMessage(
      "Потеряно соединение с интернетом",
    ),
    "NoDateSelected": MessageLookupByLibrary.simpleMessage("Дата не выбрана"),
    "NoEndTime": MessageLookupByLibrary.simpleMessage("Без времени окончания"),
    "NoFavoritesFound": MessageLookupByLibrary.simpleMessage("Нет избранных"),
    "NoFeedbacksYet": MessageLookupByLibrary.simpleMessage(
      "Посещайте места и события в Shuffle и делитесь впечатлениями",
    ),
    "NoHealthKitAvailableOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "Не доступны данные здоровья, результат будет случайным",
    ),
    "NoMessagesYet": MessageLookupByLibrary.simpleMessage("Пока нет сообщений"),
    "NoPastBookings": MessageLookupByLibrary.simpleMessage(
      "Нет прошедших броней",
    ),
    "NoPeopleAvailableToInvite": MessageLookupByLibrary.simpleMessage(
      "Нет пользователей для инвайта",
    ),
    "NoPhotoHereYet": MessageLookupByLibrary.simpleMessage(
      "Тут пока нет фото!",
    ),
    "NoPreferencesChosen": MessageLookupByLibrary.simpleMessage(
      "Предпочтения не выбраны",
    ),
    "NoReactionsMessage": MessageLookupByLibrary.simpleMessage(
      "Здесь пока нет реакций, будь первым",
    ),
    "NoReviewsMessage": MessageLookupByLibrary.simpleMessage(
      "Оставь отзыв первым",
    ),
    "NoThx": MessageLookupByLibrary.simpleMessage("Нет, спс"),
    "NoVideoReactionsYet": MessageLookupByLibrary.simpleMessage(
      "Посещайте места и события в Shuffle и делитесь видеореакциями",
    ),
    "NotNow": MessageLookupByLibrary.simpleMessage("Не сейчас"),
    "NotOften": MessageLookupByLibrary.simpleMessage("Не часто"),
    "NotSet": MessageLookupByLibrary.simpleMessage("Не указано"),
    "NothingFound": MessageLookupByLibrary.simpleMessage("Ничего не найдено"),
    "NothingWasFoundWithEmoji": MessageLookupByLibrary.simpleMessage(
      "Ничего не найдено :c",
    ),
    "Notification": MessageLookupByLibrary.simpleMessage("Уведомление"),
    "NotificationText": MessageLookupByLibrary.simpleMessage(
      "Текст уведомления",
    ),
    "Notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
    "NotifyTheAudience": MessageLookupByLibrary.simpleMessage(
      "Оповестите аудиторию",
    ),
    "NowLetsGetToKnowEachOther": MessageLookupByLibrary.simpleMessage(
      "Теперь давай узнаем друг друга поближе",
    ),
    "NowWeKnowYouBetter": MessageLookupByLibrary.simpleMessage(
      "Спасибо!\nТеперь мы знаем тебя лучше",
    ),
    "Off": MessageLookupByLibrary.simpleMessage("Выкл"),
    "Offer": MessageLookupByLibrary.simpleMessage("Предложение"),
    "OfferContent": MessageLookupByLibrary.simpleMessage("Предложить контент"),
    "OfferInfo": MessageLookupByLibrary.simpleMessage(
      "Информация о предложении",
    ),
    "OfferPrice": m55,
    "Offers": MessageLookupByLibrary.simpleMessage("Предложения"),
    "OfficeAppartmentNumber": MessageLookupByLibrary.simpleMessage(
      "Номер офиса",
    ),
    "OhYeahSure": MessageLookupByLibrary.simpleMessage("О да, конечно!"),
    "Ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "Okay": MessageLookupByLibrary.simpleMessage("Окей"),
    "OkayCool": MessageLookupByLibrary.simpleMessage("Ок, круто!"),
    "OnboardingSlide1": MessageLookupByLibrary.simpleMessage("веселиться"),
    "OnboardingSlide2": MessageLookupByLibrary.simpleMessage(
      "развлечения\nи бизнес",
    ),
    "OnboardingSlide3": MessageLookupByLibrary.simpleMessage("просто чилить"),
    "Ooops": MessageLookupByLibrary.simpleMessage("Ууупс!"),
    "Oops": MessageLookupByLibrary.simpleMessage("Уупс"),
    "OopsIWillTryAgain": MessageLookupByLibrary.simpleMessage(
      "Уупс, попробую ещё",
    ),
    "Open": MessageLookupByLibrary.simpleMessage("Открыто"),
    "OpenEvent": MessageLookupByLibrary.simpleMessage("Открыть ивент"),
    "OpenFrom": MessageLookupByLibrary.simpleMessage("С"),
    "OpenNow": MessageLookupByLibrary.simpleMessage("Часы работы"),
    "OpenPlace": MessageLookupByLibrary.simpleMessage("Открыть место"),
    "OpenTo": MessageLookupByLibrary.simpleMessage("До"),
    "OpenedUpcomingEvents": MessageLookupByLibrary.simpleMessage(
      "Открытие блока \"Предстоящие события\"",
    ),
    "OpeningHours": MessageLookupByLibrary.simpleMessage("Часы работы"),
    "OrDragFilesHere": MessageLookupByLibrary.simpleMessage(
      "Или перетащи файлы",
    ),
    "Organic": MessageLookupByLibrary.simpleMessage("Органическая"),
    "OrganicStatistics": MessageLookupByLibrary.simpleMessage("Органика"),
    "Original": MessageLookupByLibrary.simpleMessage("Оригинал"),
    "Other": MessageLookupByLibrary.simpleMessage("Другое"),
    "OurRecommendationsAboutGeolocation": MessageLookupByLibrary.simpleMessage(
      "Система рекомендаций основана на многих факторах. Геолокация – лишь часть системы, которая позволит правильно расставить приоритеты, по расстоянию, по ближайшим особенностям ландшафта (горы, водоемы, равнины, пустыни)",
    ),
    "OverallRatingOfInterest": MessageLookupByLibrary.simpleMessage(
      "Общий рейтинг интереса",
    ),
    "Partial": MessageLookupByLibrary.simpleMessage("частичный"),
    "PartialRefund": MessageLookupByLibrary.simpleMessage("Частичный возврат"),
    "Password": MessageLookupByLibrary.simpleMessage("Пароль"),
    "PasswordConditions": MessageLookupByLibrary.simpleMessage(
      "Пароль должен содержать хотя бы одну заглавную букву, одну строчную, одну цифру и один специальный символ",
    ),
    "PasswordHint": MessageLookupByLibrary.simpleMessage(
      "Буквы, цифры, ! “ @ # \$ % &, не менее 8 символов",
    ),
    "PasswordMustBeAtLeast8Characters": MessageLookupByLibrary.simpleMessage(
      "Пароль не менее 8 символов",
    ),
    "Past": MessageLookupByLibrary.simpleMessage("Прошедшие"),
    "Paused": MessageLookupByLibrary.simpleMessage("Остановлен"),
    "Pay": MessageLookupByLibrary.simpleMessage("Оплатить"),
    "PayForTheBonusOffer": MessageLookupByLibrary.simpleMessage(
      "Оплатите бонусное предложение",
    ),
    "PayForTheNotification": MessageLookupByLibrary.simpleMessage(
      "Оплатите уведомление",
    ),
    "PeopleStartingToTalkAboutYou": MessageLookupByLibrary.simpleMessage(
      "Люди начинают говорить про вас",
    ),
    "Permissions": MessageLookupByLibrary.simpleMessage("Разрешения"),
    "Personal": MessageLookupByLibrary.simpleMessage("Личный"),
    "PersonalCredentials": MessageLookupByLibrary.simpleMessage(
      "Личные данные",
    ),
    "PersonalRespect": MessageLookupByLibrary.simpleMessage(
      "Персональный респект",
    ),
    "PersonalTop": MessageLookupByLibrary.simpleMessage("Личный ТОП"),
    "PersonalizeYourOffer": MessageLookupByLibrary.simpleMessage(
      "Персонализируйте свое предложение",
    ),
    "PersonalizeYourReminder": MessageLookupByLibrary.simpleMessage(
      "Персонализируйте свое напоминание",
    ),
    "Phone": MessageLookupByLibrary.simpleMessage("Телефон"),
    "PhoneVerification": MessageLookupByLibrary.simpleMessage(
      "Подтверждение номера телефона",
    ),
    "Photo": MessageLookupByLibrary.simpleMessage("Фото"),
    "PhotoUploadFiles": MessageLookupByLibrary.simpleMessage(
      "Фото (загрузить)",
    ),
    "Photos": MessageLookupByLibrary.simpleMessage("Фото"),
    "PickFromMap": MessageLookupByLibrary.simpleMessage("Выбрать на карте"),
    "Place": MessageLookupByLibrary.simpleMessage("Место"),
    "PlaceCompanyInfo": MessageLookupByLibrary.simpleMessage(
      "В случае остановки подписки, ваш контент будет удален из ротации до тех пор, пока подписка не будет возобновлена.",
    ),
    "PlaceRatingByFeedback": MessageLookupByLibrary.simpleMessage(
      "Рейтинг мест (по отзывам)",
    ),
    "PlaceSubmittedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Предложение успешно отправлено",
    ),
    "PlaceType": MessageLookupByLibrary.simpleMessage("Тип места"),
    "Places": MessageLookupByLibrary.simpleMessage("Места"),
    "PlacesVisited": m56,
    "PleaseAddDatePeriod": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, добавьте даты(-у)",
    ),
    "PleaseAddPhoto": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, добавьте фото",
    ),
    "PleaseEnterCurrentLimit": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введите допустимый лимит",
    ),
    "PleaseEnterLimit": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, добавьте лимит",
    ),
    "PleaseEnterLink": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введите ссылку",
    ),
    "PleaseEnterValidDescription": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введите допустимое описание",
    ),
    "PleaseEnterValidTitle": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введите допустимое название",
    ),
    "PleaseEnterValidXLink": m57,
    "PleaseFillOutDate": MessageLookupByLibrary.simpleMessage(
      "Заполни дату, пожалуйста",
    ),
    "PleaseFillOutYourWishes": MessageLookupByLibrary.simpleMessage(
      "Заполни пожелания, пожалуйста",
    ),
    "PleaseFillOutYourWishesAndSelectDate":
        MessageLookupByLibrary.simpleMessage(
          "Пожалуйста, заполни пожелания и выбери дату",
        ),
    "PleaseSelectANiche": MessageLookupByLibrary.simpleMessage(
      "Выбери нишу, пожалуйста",
    ),
    "PleaseSelectAtLeastNReligion": m58,
    "PleaseSelectAtLeastOneAgeRange": MessageLookupByLibrary.simpleMessage(
      "Выбери хотя бы одну возрастную группу",
    ),
    "PleaseSelectAtLeastOnePriceSegment": MessageLookupByLibrary.simpleMessage(
      "Выбери хотя бы один ценовой сегмент",
    ),
    "PleaseSelectGender": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, укажи пол",
    ),
    "PleaseSelectOneType": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, выбери один тип",
    ),
    "PleaseValidateXDetailsBeforeModeration": m59,
    "PlusXNewChatComments": m60,
    "PlusXNewContests": MessageLookupByLibrary.simpleMessage("+ Новый конкурс"),
    "PlusXNewInterviews": MessageLookupByLibrary.simpleMessage(
      "+ Новое интервью",
    ),
    "PlusXNewRespects": m61,
    "PlusXNewReviews": m62,
    "PlusXNewRoutes": MessageLookupByLibrary.simpleMessage("+ Новый маршрут"),
    "PlusXNewVideoReactions": m63,
    "PlusXNewVideos": MessageLookupByLibrary.simpleMessage("+ Новое видео"),
    "PlusXNewVoices": m64,
    "PlusXPhotos": m65,
    "PlzEnterName": MessageLookupByLibrary.simpleMessage(
      "Плз, введи свое имя & никнейм",
    ),
    "PointBalance": MessageLookupByLibrary.simpleMessage("Баланс\nпоинтов"),
    "Points": MessageLookupByLibrary.simpleMessage("Поинты"),
    "PointsAre": MessageLookupByLibrary.simpleMessage("Поинты это..."),
    "PointsCount": m66,
    "PointsEarned": m67,
    "PointsHiwItems": m68,
    "PointsInOffer": m69,
    "Position": MessageLookupByLibrary.simpleMessage("Позиция"),
    "Preferences": MessageLookupByLibrary.simpleMessage("Предпочтения"),
    "Premium": MessageLookupByLibrary.simpleMessage("Premium"),
    "PremiumAccount": MessageLookupByLibrary.simpleMessage("Premium аккаунт"),
    "PremiumSubscriptionFeature1": MessageLookupByLibrary.simpleMessage(
      "Уникальная функция “Connects”. Поиск, общение, встречи с компаньонами, нетворкинг",
    ),
    "PremiumSubscriptionFeature2": MessageLookupByLibrary.simpleMessage(
      "Специальный бейдж в профиле",
    ),
    "PremiumSubscriptionFeature3": MessageLookupByLibrary.simpleMessage(
      "Возможность оставлять отзывы, видео-реакции о местах и событиях, участвовать в рейтинге",
    ),
    "PremiumSubscriptionFeature4": MessageLookupByLibrary.simpleMessage(
      "Предлагать приложению любимые места",
    ),
    "PremiumSubscriptionFeature5": MessageLookupByLibrary.simpleMessage(
      "Переключать темную и светлую темы",
    ),
    "PremiumSubscriptionFeature6": MessageLookupByLibrary.simpleMessage(
      "Возможность стать Инфлюенсером",
    ),
    "PremiumSubscriptionFeature7": MessageLookupByLibrary.simpleMessage(
      "Возможность создавать удобные стопки избранного и делиться ими",
    ),
    "PremiumSubscriptionFeature8": MessageLookupByLibrary.simpleMessage(
      "Свой собственный планировщик событий",
    ),
    "Price": MessageLookupByLibrary.simpleMessage("Цена"),
    "PriceRange": MessageLookupByLibrary.simpleMessage("Диапазон цен"),
    "PrintingCalendar": MessageLookupByLibrary.simpleMessage(
      "Печатаем календарик",
    ),
    "Privacy": MessageLookupByLibrary.simpleMessage("Конфиденциальность"),
    "PrivacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Политика конфиденциальности",
    ),
    "PrivateChatApply": MessageLookupByLibrary.simpleMessage(
      "Приватный чат. Пожалуйста, подайте заявку на вход, нажав",
    ),
    "Pro": MessageLookupByLibrary.simpleMessage("Pro"),
    "ProAccount": MessageLookupByLibrary.simpleMessage("Pro аккаунт"),
    "ProSubscriptionFeature1": MessageLookupByLibrary.simpleMessage(
      "Специальный бейдж в профиле",
    ),
    "ProSubscriptionFeature2": MessageLookupByLibrary.simpleMessage(
      "Возможность создавать свои собственные события",
    ),
    "ProSubscriptionFeature3": MessageLookupByLibrary.simpleMessage(
      "Дополнительная мотивация потенциальной аудитории (клиентов/посетителей) с помощью системы поинтов",
    ),
    "ProSubscriptionFeature4": MessageLookupByLibrary.simpleMessage(
      "Возможность продавать дополнительный сервис через систему бронирования",
    ),
    "ProSubscriptionFeature5": MessageLookupByLibrary.simpleMessage(
      "Допродажи",
    ),
    "ProSubscriptionFeature6": MessageLookupByLibrary.simpleMessage(
      "Внутренняя таргетированная реклама ваших событий, статистика и аналитика",
    ),
    "ProSubscriptionFeature7": MessageLookupByLibrary.simpleMessage(
      "Возможность использовать специальные уведомления",
    ),
    "ProTools": MessageLookupByLibrary.simpleMessage("Pro tools"),
    "Product": MessageLookupByLibrary.simpleMessage("Продукт"),
    "Products": m70,
    "ProfileAskOrSupportHiwHint": m71,
    "ProfileAskOrSupportHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "свою или чью-то",
    ),
    "ProfileAskOrSupportHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Исполни мечту...",
    ),
    "ProfileFindSomeoneHiwHint": m72,
    "ProfileFindSomeoneHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "пойти куда-нибудь вместе",
    ),
    "ProfileFindSomeoneHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Не будь один...",
    ),
    "Promotion": MessageLookupByLibrary.simpleMessage("Промо"),
    "Properties": MessageLookupByLibrary.simpleMessage("Свойства"),
    "Published": MessageLookupByLibrary.simpleMessage("Опубликовано"),
    "PushUpYourBusiness": MessageLookupByLibrary.simpleMessage(
      "Прокачай свой бизнес",
    ),
    "PutItInRotation": MessageLookupByLibrary.simpleMessage(
      "Закидываем в ротацию",
    ),
    "PuttingUpPoster": MessageLookupByLibrary.simpleMessage("Вешаем плакат"),
    "RangeEndValueIsLessThanBeginingOne": MessageLookupByLibrary.simpleMessage(
      "Конечное значение диапазона меньше начального",
    ),
    "Rating": MessageLookupByLibrary.simpleMessage("Рейтинг"),
    "Reactions": m73,
    "ReactionsBy": MessageLookupByLibrary.simpleMessage("Реакции\nот"),
    "ReactionsByCritics": MessageLookupByLibrary.simpleMessage(
      "Отзывы от критиков",
    ),
    "Read": m74,
    "RealMoney": MessageLookupByLibrary.simpleMessage("Реальные деньги"),
    "RecentlyAdded": MessageLookupByLibrary.simpleMessage("Недавно добавлено"),
    "Recommended": MessageLookupByLibrary.simpleMessage("Рекомендуем"),
    "Refund": MessageLookupByLibrary.simpleMessage("возврат"),
    "RefundEveryone": MessageLookupByLibrary.simpleMessage("Вернуть всем"),
    "RelatedPersonalProperties": MessageLookupByLibrary.simpleMessage(
      "Относительные личные свойства",
    ),
    "RelatedProperties": MessageLookupByLibrary.simpleMessage(
      "Связанные свойства",
    ),
    "Religion": MessageLookupByLibrary.simpleMessage("Религия"),
    "RemainsToCreate": MessageLookupByLibrary.simpleMessage("Осталось создать"),
    "Reminder": MessageLookupByLibrary.simpleMessage("Напоминание"),
    "Reminders": MessageLookupByLibrary.simpleMessage("Напоминания"),
    "Remove": MessageLookupByLibrary.simpleMessage("Удалить"),
    "Rename": MessageLookupByLibrary.simpleMessage("Переименовать"),
    "Reply": MessageLookupByLibrary.simpleMessage("Ответить"),
    "ReplyingTo": m75,
    "Requests": MessageLookupByLibrary.simpleMessage("запросил"),
    "ResendCode": MessageLookupByLibrary.simpleMessage("Отправить код еще раз"),
    "Reset": MessageLookupByLibrary.simpleMessage("Сбросить"),
    "ResetFilters": MessageLookupByLibrary.simpleMessage("Сбросить фильтры"),
    "ResetPassword": MessageLookupByLibrary.simpleMessage("Сбросить пароль"),
    "Respect": MessageLookupByLibrary.simpleMessage("Респект"),
    "Restaurant": MessageLookupByLibrary.simpleMessage("Рестораны"),
    "RestorePurchase": MessageLookupByLibrary.simpleMessage(
      "Восстановить покупки",
    ),
    "ReviewWasSuccessfullyEdited": MessageLookupByLibrary.simpleMessage(
      "Отзыв был успешно изменён",
    ),
    "Reviews": MessageLookupByLibrary.simpleMessage("Отзывы"),
    "ReviewsByCritics": MessageLookupByLibrary.simpleMessage("Отзывы критиков"),
    "ReviewsCount": m76,
    "ReviewsPosted": m77,
    "ReviewsReceived": m78,
    "Routes": MessageLookupByLibrary.simpleMessage("Маршруты"),
    "Saturday": MessageLookupByLibrary.simpleMessage("Суббота"),
    "SaturdayShort": MessageLookupByLibrary.simpleMessage("Сб"),
    "Save": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "SaveAndPay": MessageLookupByLibrary.simpleMessage("Сохранить и оплатить"),
    "SaveTemplate": MessageLookupByLibrary.simpleMessage("Сохранить шаблон"),
    "ScanControllerNotReady": MessageLookupByLibrary.simpleMessage(
      "Контроллер не готов",
    ),
    "ScanGenericError": MessageLookupByLibrary.simpleMessage("Общая ошибка"),
    "ScanPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "В разрешении отказано",
    ),
    "Scanner": MessageLookupByLibrary.simpleMessage("Сканер"),
    "ScanningIsUnsupported": MessageLookupByLibrary.simpleMessage(
      "Сканирование на этом устройстве не поддерживается",
    ),
    "Schedule": MessageLookupByLibrary.simpleMessage("График"),
    "Scheduler": MessageLookupByLibrary.simpleMessage("Планировщик"),
    "Search": MessageLookupByLibrary.simpleMessage("Поиск"),
    "SearchBusinessChooseYourself1": MessageLookupByLibrary.simpleMessage(
      "Бизнес-клубы",
    ),
    "SearchBusinessChooseYourself2": MessageLookupByLibrary.simpleMessage(
      "Digital & IT конференции",
    ),
    "SearchBusinessChooseYourself3": MessageLookupByLibrary.simpleMessage(
      "Питч сессии",
    ),
    "SearchBusinessChooseYourself4": MessageLookupByLibrary.simpleMessage(
      "Бизнес игры",
    ),
    "SearchBusinessChooseYourself5": MessageLookupByLibrary.simpleMessage(
      "Форумы (отраслевые выставки)",
    ),
    "SearchBusinessChooseYourself6": MessageLookupByLibrary.simpleMessage(
      "Нетворкинг",
    ),
    "SearchBusinessChooseYourself7": MessageLookupByLibrary.simpleMessage(
      "Семинары и тренинги",
    ),
    "SearchChooseYourself1": MessageLookupByLibrary.simpleMessage(
      "Счастье детям и семье",
    ),
    "SearchChooseYourself2": MessageLookupByLibrary.simpleMessage(
      "Жажда приключений",
    ),
    "SearchChooseYourself3": MessageLookupByLibrary.simpleMessage(
      "Вечеринки и танцы",
    ),
    "SearchChooseYourself4": MessageLookupByLibrary.simpleMessage(
      "Экстрим и острые ощущения",
    ),
    "SearchChooseYourself5": MessageLookupByLibrary.simpleMessage(
      "Эпоха просвещения",
    ),
    "SearchChooseYourself6": MessageLookupByLibrary.simpleMessage(
      "Изысканная кухня",
    ),
    "SearchChooseYourself7": MessageLookupByLibrary.simpleMessage(
      "Блаженство и чилл",
    ),
    "SearchChooseYourself8": MessageLookupByLibrary.simpleMessage(
      "Спортивные движения",
    ),
    "SearchChooseYourself9": MessageLookupByLibrary.simpleMessage(
      "Забота о себе любимом",
    ),
    "SearchHiwHint": m79,
    "SearchHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "поиск или выбрать другие варианты",
    ),
    "SearchHiwTitle": MessageLookupByLibrary.simpleMessage("Обычный поиск..."),
    "SearchOrAddTag": MessageLookupByLibrary.simpleMessage(
      "Поиск или добавить тег",
    ),
    "SearchProperty": MessageLookupByLibrary.simpleMessage("Поиск свойств"),
    "SeeAll": MessageLookupByLibrary.simpleMessage("Посмотреть всё"),
    "SeeList": MessageLookupByLibrary.simpleMessage("Посмотреть лист"),
    "SeeMore": MessageLookupByLibrary.simpleMessage("Ещё"),
    "SeekingWandererMen": MessageLookupByLibrary.simpleMessage(
      "Ищущий странник",
    ),
    "SeekingWandererWom": MessageLookupByLibrary.simpleMessage(
      "Ищущая странница",
    ),
    "SelectCity": MessageLookupByLibrary.simpleMessage("Выберите город"),
    "SelectCurrency": MessageLookupByLibrary.simpleMessage("Выбери валюту"),
    "SelectDate": MessageLookupByLibrary.simpleMessage("Выбери дату"),
    "SelectDateRange": MessageLookupByLibrary.simpleMessage(
      "Выбери диапазон дат",
    ),
    "SelectDateTime": MessageLookupByLibrary.simpleMessage(
      "Выберите дату и время",
    ),
    "SelectDays": MessageLookupByLibrary.simpleMessage("Выбрать дни "),
    "SelectEndTime": MessageLookupByLibrary.simpleMessage(
      "Выберите время окончания",
    ),
    "SelectGender": MessageLookupByLibrary.simpleMessage("Выберите пол"),
    "SelectLanguage": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста выбери язык",
    ),
    "SelectLocation": MessageLookupByLibrary.simpleMessage(
      "Выберите местоположение",
    ),
    "SelectMindsetInvitation": m80,
    "SelectOption": MessageLookupByLibrary.simpleMessage("Выбирай"),
    "SelectOptionSchedule": MessageLookupByLibrary.simpleMessage(
      "Выберите опцию",
    ),
    "SelectPeriodOfValid": MessageLookupByLibrary.simpleMessage(
      "Выберите период действия",
    ),
    "SelectPriceAndCurrency": MessageLookupByLibrary.simpleMessage(
      "Выберите цену и валюту",
    ),
    "SelectStartTime": MessageLookupByLibrary.simpleMessage(
      "Выберите время старта",
    ),
    "SelectSubs": MessageLookupByLibrary.simpleMessage("Выберите сабы"),
    "SelectTemplate": MessageLookupByLibrary.simpleMessage("Выберите шаблон"),
    "SelectTimeCorrespondingToContentCard":
        MessageLookupByLibrary.simpleMessage(
          "Выберите время соответствующее карточке контента",
        ),
    "SelectToSetPreview": MessageLookupByLibrary.simpleMessage(
      "Выберите фото чтобы задать превью",
    ),
    "SelectType": m81,
    "SelectYourBooking": MessageLookupByLibrary.simpleMessage(
      "Выберите вариант бронирования",
    ),
    "SelectYourFavoriteProduct": MessageLookupByLibrary.simpleMessage(
      "Выберите свой любимый продукт",
    ),
    "SelectYourReligions": MessageLookupByLibrary.simpleMessage(
      "Укажи свою религию",
    ),
    "SelectYourSpecialty": MessageLookupByLibrary.simpleMessage(
      "Выберите свою специальность",
    ),
    "SelectionOfTheBest": MessageLookupByLibrary.simpleMessage("Выбор лучших"),
    "Send": MessageLookupByLibrary.simpleMessage("Отправить"),
    "SendIt": MessageLookupByLibrary.simpleMessage("Отправить"),
    "SendingGeologistToPoint": MessageLookupByLibrary.simpleMessage(
      "Высылаем геолога на точку",
    ),
    "SendingGoogleCarForVerification": MessageLookupByLibrary.simpleMessage(
      "Посылаем Google-авто для проверки",
    ),
    "Services": MessageLookupByLibrary.simpleMessage("Услуги"),
    "SetWorkHours": MessageLookupByLibrary.simpleMessage("Часы работы"),
    "SettingUpAlarmClocks": MessageLookupByLibrary.simpleMessage(
      "Заводим будильники",
    ),
    "Settings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "SexualContent": MessageLookupByLibrary.simpleMessage(
      "Сексуальный контент",
    ),
    "Share": MessageLookupByLibrary.simpleMessage("Поделиться"),
    "ShareCard": m82,
    "SharedWithYou": MessageLookupByLibrary.simpleMessage("поделилась с вами"),
    "ShockingContent": MessageLookupByLibrary.simpleMessage(
      "Шокирующий контент",
    ),
    "ShowDeleted": MessageLookupByLibrary.simpleMessage("Показать удаленные"),
    "ShowInContentCard": MessageLookupByLibrary.simpleMessage(
      "Показать в карточке контента",
    ),
    "ShowMore": MessageLookupByLibrary.simpleMessage("Показать\nбольше"),
    "ShowResult": MessageLookupByLibrary.simpleMessage("Показать результат"),
    "ShowTheBarcode": MessageLookupByLibrary.simpleMessage(
      "Показывайте штрих-код при оплате",
    ),
    "ShowTheBarcodeCheckout": MessageLookupByLibrary.simpleMessage(
      "Покажите штрих-код на кассе",
    ),
    "ShowXInProfile": m83,
    "ShraziidGoblet": MessageLookupByLibrary.simpleMessage("Кубок Шразиида"),
    "ShraziidGobletDescription": MessageLookupByLibrary.simpleMessage(
      "Древний кубок, найденный в песках пустыни. Говорят, что из него пил сам Шразиид, правитель великого Песчаного царства.",
    ),
    "Shuffle": MessageLookupByLibrary.simpleMessage("Shuffle"),
    "ShuffleDigest": MessageLookupByLibrary.simpleMessage("Shuffle дайджест"),
    "ShuffleExchangeSystem": MessageLookupByLibrary.simpleMessage(
      "...система обмена Shuffle",
    ),
    "ShuffleHiwHint": m84,
    "ShuffleHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "поиск персонализированных мест",
    ),
    "ShuffleHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Перетасовка мест...",
    ),
    "ShuffleWithRightWhitespace": MessageLookupByLibrary.simpleMessage(
      "Shuffle ",
    ),
    "Skip": MessageLookupByLibrary.simpleMessage("Пропустить"),
    "SkipIt": MessageLookupByLibrary.simpleMessage("Пропустить это"),
    "Small": MessageLookupByLibrary.simpleMessage("Небольшой"),
    "SmartLeisureSelection": MessageLookupByLibrary.simpleMessage(
      "Умный подбор досуга каждому, везде",
    ),
    "SocialSubtitle": MessageLookupByLibrary.simpleMessage(
      "Полезные сервисы и места",
    ),
    "SomethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Что-то пошло не так. Попробуй еще раз.",
    ),
    "Soon": MessageLookupByLibrary.simpleMessage("Скоро"),
    "Spend": MessageLookupByLibrary.simpleMessage("Потратить"),
    "SpendHoursPerWeek": m85,
    "SpendIt": MessageLookupByLibrary.simpleMessage("Потратить"),
    "Spent": MessageLookupByLibrary.simpleMessage("Потрачено"),
    "SpentMyPoints": MessageLookupByLibrary.simpleMessage(
      "Потратить мои баллы",
    ),
    "SpinnerHiwHint": m86,
    "SpinnerHiwSubtitle": MessageLookupByLibrary.simpleMessage(
      "ты найдешь персонализированные мероприятия",
    ),
    "SpinnerHiwTitle": MessageLookupByLibrary.simpleMessage(
      "Ты крутишь его...",
    ),
    "SpinnerTitle": MessageLookupByLibrary.simpleMessage(
      "События. Не пропусти!",
    ),
    "StacksAndSomethingElseAreAvailableForYou":
        MessageLookupByLibrary.simpleMessage(
          "Для вас доступны стопки и кое-что еще...",
        ),
    "StacksAreOn": MessageLookupByLibrary.simpleMessage("Для пользователей"),
    "StacksShares": m87,
    "StartBookingCreation": MessageLookupByLibrary.simpleMessage(
      "Начать создание бронирования",
    ),
    "StartTimeShouldBeEarlierThanEndTime": MessageLookupByLibrary.simpleMessage(
      "Начальное время должно быть раньше конечного",
    ),
    "StartToExplore": MessageLookupByLibrary.simpleMessage("Начать изучать"),
    "Statistics": MessageLookupByLibrary.simpleMessage("Статистика"),
    "StatusXAvailable": m88,
    "StatusXIsNotAvailable": m89,
    "Submit": MessageLookupByLibrary.simpleMessage("Отправить"),
    "SubmitContent": MessageLookupByLibrary.simpleMessage("Предложить контент"),
    "Subs": MessageLookupByLibrary.simpleMessage("Сабы"),
    "SubscribeToProfile": MessageLookupByLibrary.simpleMessage("Подписаться"),
    "Success": MessageLookupByLibrary.simpleMessage("Успешно"),
    "SuccessfullyAnswered": MessageLookupByLibrary.simpleMessage(
      "Успешно отправлен ответ",
    ),
    "Sunday": MessageLookupByLibrary.simpleMessage("Воскресенье"),
    "SundayShort": MessageLookupByLibrary.simpleMessage("Вс"),
    "Sunny": MessageLookupByLibrary.simpleMessage("Солнечно"),
    "Support": MessageLookupByLibrary.simpleMessage("Помощь"),
    "SupportPeopleAroundYou": MessageLookupByLibrary.simpleMessage(
      "Помочь людям вокруг",
    ),
    "SupportedFormatsBooking": MessageLookupByLibrary.simpleMessage(
      "Поддерживаемые форматы: JPEG/JPG/PNG.\nМаксимальный размер - 10 MB.\nМаксимальное разрешение - 3840 x 2200 px",
    ),
    "SureYouWantToDeleteChat": MessageLookupByLibrary.simpleMessage(
      "Точно хочешь удалить чат?",
    ),
    "SureYouWantToExit": MessageLookupByLibrary.simpleMessage(
      "Точно хочешь выйти?",
    ),
    "SwipeToStart": MessageLookupByLibrary.simpleMessage("Свайп чтобы начать"),
    "SwitchAnyTime": MessageLookupByLibrary.simpleMessage(
      "Можно переключить в любое время в настройках профиля",
    ),
    "Tags": MessageLookupByLibrary.simpleMessage("Ярлыки"),
    "TapIt": MessageLookupByLibrary.simpleMessage("Нажми"),
    "TapOnceToChoose": MessageLookupByLibrary.simpleMessage(
      "Нажми, чтобы выбрать",
    ),
    "TapToSeeMore": MessageLookupByLibrary.simpleMessage("Увидеть больше"),
    "TapToSetAddress": MessageLookupByLibrary.simpleMessage(
      "Нажми, чтобы ввести адрес",
    ),
    "TapTwiceToMarkYourFavorites": MessageLookupByLibrary.simpleMessage(
      ". Нажми дважды, чтобы отметить избранное.",
    ),
    "TastyCoffee": MessageLookupByLibrary.simpleMessage("Вкусный кофе"),
    "Taxi": MessageLookupByLibrary.simpleMessage("Taxi"),
    "TeaList": MessageLookupByLibrary.simpleMessage("Чайная карта"),
    "TellUsAbout": MessageLookupByLibrary.simpleMessage("Расскажи о"),
    "TellUsMore": MessageLookupByLibrary.simpleMessage("Расскажи ещё"),
    "TellUsMoreAboutYourself": m90,
    "TemplateName": MessageLookupByLibrary.simpleMessage("Имя шаблона"),
    "Terms": MessageLookupByLibrary.simpleMessage("Условия"),
    "TermsOfService": MessageLookupByLibrary.simpleMessage(
      "Условия использования",
    ),
    "ThatsAllForNow": MessageLookupByLibrary.simpleMessage("Пока это всё!"),
    "TheBestParties": MessageLookupByLibrary.simpleMessage("Лучшие вечеринки"),
    "TheBestTechConf": MessageLookupByLibrary.simpleMessage(
      "Лучшая тех конференция",
    ),
    "TheBestTechListSuccessfullyAdded": MessageLookupByLibrary.simpleMessage(
      "Список “Лучшая тех конференция” успешно добавлен",
    ),
    "TheBestTechnologiesConf": MessageLookupByLibrary.simpleMessage(
      "Лучшая техническая конференция",
    ),
    "TheMoreInfoWeAboutYouGetTheBetter": MessageLookupByLibrary.simpleMessage(
      "Чем больше узнаем о тебе, тем лучше",
    ),
    "TheMoreInfoWeGetTheBetter": MessageLookupByLibrary.simpleMessage(
      "Чем больше инфы мы получим, тем лучше",
    ),
    "TheOfferWillBeAddedToPersonal": MessageLookupByLibrary.simpleMessage(
      "Предложение будет добавлено в личный профиль пользователей, которые просматривают ваш контент или совершают бронирование",
    ),
    "TheSelectedTimeCannotBeElapsed": MessageLookupByLibrary.simpleMessage(
      "Выбранное время не может быть прошедшим",
    ),
    "ThenCheckThisOut": MessageLookupByLibrary.simpleMessage(
      "Тогда зацени это",
    ),
    "ThereNoEventsYet": MessageLookupByLibrary.simpleMessage(
      "Ивентов пока нет",
    ),
    "ThereNoPlacesYet": MessageLookupByLibrary.simpleMessage("Мест пока нет"),
    "ThereNoUsersWhoHaveBoughtOfferYet": MessageLookupByLibrary.simpleMessage(
      "Пока еще нет пользователей, которые купили это предложение",
    ),
    "TheseContentIsOnYourOtherLists": MessageLookupByLibrary.simpleMessage(
      "Этот контент есть в других ваших списках. После добавления он будет удален из текущего.",
    ),
    "ThisIs": MessageLookupByLibrary.simpleMessage("Это"),
    "ThisIsEmptyNowBook": MessageLookupByLibrary.simpleMessage(
      "Пока здесь пусто, забронируйте посещение и оно появится здесь",
    ),
    "ThroughANonAggregatorSystem": MessageLookupByLibrary.simpleMessage(
      "Неагрегаторная система специально для вас",
    ),
    "Thursday": MessageLookupByLibrary.simpleMessage("Четверг"),
    "ThursdayShort": MessageLookupByLibrary.simpleMessage("Чт"),
    "Ticket": MessageLookupByLibrary.simpleMessage("Билет"),
    "TicketFrom": m91,
    "TicketPrice": MessageLookupByLibrary.simpleMessage("Цена билета"),
    "TicketSuccessfullyActivated": MessageLookupByLibrary.simpleMessage(
      "Билет успешно активирован",
    ),
    "Tickets": m92,
    "Time": MessageLookupByLibrary.simpleMessage("Время"),
    "TimeRange": MessageLookupByLibrary.simpleMessage("Промежуток времени"),
    "TimeRangeError": MessageLookupByLibrary.simpleMessage(
      "Время окончания не может быть раньше времени начала",
    ),
    "Title": MessageLookupByLibrary.simpleMessage("Название"),
    "TitleYourTop": MessageLookupByLibrary.simpleMessage("Назови свой ТОП"),
    "ToAccessAll": MessageLookupByLibrary.simpleMessage("Полный доступ"),
    "ToAllowAccessGoToSettings": MessageLookupByLibrary.simpleMessage(
      "Чтобы разрешить push-уведомления, зайдите в настройки телефона",
    ),
    "ToBecomeAnInfluencerYouNeedToDo": MessageLookupByLibrary.simpleMessage(
      "Чтобы стать инфлюенсером вам необходимо выполнить",
    ),
    "ToExtendYourUseSelectPayment": MessageLookupByLibrary.simpleMessage(
      "Чтобы продлить срок использования, выберите пункт оплата",
    ),
    "ToFavorites": MessageLookupByLibrary.simpleMessage("В избранное"),
    "ToOpen": MessageLookupByLibrary.simpleMessage("Чтобы открыть"),
    "ToOpenTheNextSetOfToolsYouNeedToDo": MessageLookupByLibrary.simpleMessage(
      "Чтобы открыть следующий набор инструментов, вам нужно сделать",
    ),
    "ToPlan": MessageLookupByLibrary.simpleMessage("Планировать"),
    "ToUnlock": MessageLookupByLibrary.simpleMessage("Чтобы открыть"),
    "Today": MessageLookupByLibrary.simpleMessage("Сегодня"),
    "Top": MessageLookupByLibrary.simpleMessage("ТОП"),
    "TopEventsFor": m93,
    "TopNDonatorsReceiveXPoints": m94,
    "TopPlacesRatedBy": m95,
    "TopographingLocation": MessageLookupByLibrary.simpleMessage(
      "Топографируем локацию",
    ),
    "Total": MessageLookupByLibrary.simpleMessage("Сумма"),
    "Translate": MessageLookupByLibrary.simpleMessage("Перевод"),
    "TravelerMen": MessageLookupByLibrary.simpleMessage("Путник"),
    "TravelerWom": MessageLookupByLibrary.simpleMessage("Путница"),
    "TrialPeriod": MessageLookupByLibrary.simpleMessage("Триал период"),
    "TryYourself": MessageLookupByLibrary.simpleMessage("Попробуйте\nсами"),
    "Tuesday": MessageLookupByLibrary.simpleMessage("Вторник"),
    "TuesdayShort": MessageLookupByLibrary.simpleMessage("Вт"),
    "TypeHere": MessageLookupByLibrary.simpleMessage("Напиши тут"),
    "TypeOfContent": MessageLookupByLibrary.simpleMessage("Тип контента"),
    "UnArchive": MessageLookupByLibrary.simpleMessage("Вернуть из архива"),
    "UnArchiveXAlert": m96,
    "Undefined": MessageLookupByLibrary.simpleMessage("Неопределено"),
    "UnderDevelopmentMessage": MessageLookupByLibrary.simpleMessage(
      "В разработке",
    ),
    "UnderService": MessageLookupByLibrary.simpleMessage("В разработке"),
    "Unfollow": MessageLookupByLibrary.simpleMessage("Отписаться"),
    "UniqueProperties": MessageLookupByLibrary.simpleMessage(
      "Уникальные свойства",
    ),
    "UniqueStatistics": MessageLookupByLibrary.simpleMessage(
      "Уникальная статистика",
    ),
    "UnknownRing": MessageLookupByLibrary.simpleMessage("Неизвестное кольцо"),
    "UnknownRingDescription": MessageLookupByLibrary.simpleMessage(
      "Странное кольцо. Не знаем откуда оно здесь…",
    ),
    "UnloadingTheCanvases": MessageLookupByLibrary.simpleMessage(
      "Выгружаем полотна",
    ),
    "Unread": MessageLookupByLibrary.simpleMessage("Новое"),
    "UnsubscribeFromProfile": MessageLookupByLibrary.simpleMessage(
      "Отписаться",
    ),
    "Upcoming": MessageLookupByLibrary.simpleMessage("Грядущие"),
    "UpcomingEvent": MessageLookupByLibrary.simpleMessage(
      "Предстоящее событие",
    ),
    "UpcomingGlobalEvents": MessageLookupByLibrary.simpleMessage(
      "Грядущие глобальные",
    ),
    "Update": MessageLookupByLibrary.simpleMessage("Обновить"),
    "UpdateAppMessage": MessageLookupByLibrary.simpleMessage(
      "Ты давно не обновлял приложение, а мы добавили много удобных штук",
    ),
    "UpdateAppMessageTitle": MessageLookupByLibrary.simpleMessage(
      "Пора обновиться",
    ),
    "UpgradeAccount": m97,
    "UpgradeAccountConfirmation": MessageLookupByLibrary.simpleMessage(
      "Оформить",
    ),
    "UpgradeForFree": MessageLookupByLibrary.simpleMessage(
      "обновитесь бесплатно",
    ),
    "UpgradeForNmoney": m98,
    "UploadingVideo": MessageLookupByLibrary.simpleMessage("Загрузка видео"),
    "Upsales": MessageLookupByLibrary.simpleMessage("Дополнительные продажи"),
    "UpsalesAvailable": MessageLookupByLibrary.simpleMessage(
      "Доступны дополнительные продажи",
    ),
    "UpsalesAvailableHint": MessageLookupByLibrary.simpleMessage(
      "футболка, шапочка, коврик для йоги, кружка",
    ),
    "UpsalesProductsFrom": m99,
    "User": MessageLookupByLibrary.simpleMessage("Юзер"),
    "UserHasNoPublicProfileEnd": MessageLookupByLibrary.simpleMessage(
      "нет публичного профиля",
    ),
    "UserHasNoPublicProfileStart": MessageLookupByLibrary.simpleMessage(
      "У пользователя",
    ),
    "UserTypeSelectionPrompt": MessageLookupByLibrary.simpleMessage(
      "Выбери тип аккаунта, который хочешь создать или войти",
    ),
    "Users": m100,
    "UsingHealthKit": MessageLookupByLibrary.simpleMessage("Данные здоровья"),
    "UsingNotifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
    "ValueMustBeAtLeast3Characters": MessageLookupByLibrary.simpleMessage(
      "Значение не менее 3 символов",
    ),
    "VerticalFormat": MessageLookupByLibrary.simpleMessage(
      "Вертикальный формат",
    ),
    "VeryOften": MessageLookupByLibrary.simpleMessage("Часто"),
    "Video": MessageLookupByLibrary.simpleMessage("Видео"),
    "VideoFileNotCut": MessageLookupByLibrary.simpleMessage(
      "Видео не обрезано",
    ),
    "VideoReactionAdded": MessageLookupByLibrary.simpleMessage(
      "Твоя реакция успешно добавлена",
    ),
    "VideoReactionUploadedMessage": MessageLookupByLibrary.simpleMessage(
      "Видео-реакция успешно загружена",
    ),
    "VideoReactions": MessageLookupByLibrary.simpleMessage("Видео-реакции"),
    "VideoUploadFiles": MessageLookupByLibrary.simpleMessage(
      "Видео (загрузить)",
    ),
    "ViewAll": MessageLookupByLibrary.simpleMessage("Все"),
    "ViewHistory": MessageLookupByLibrary.simpleMessage("Просмотр истории"),
    "ViewSources": MessageLookupByLibrary.simpleMessage("Источники просмотров"),
    "Views": MessageLookupByLibrary.simpleMessage("Просмотры"),
    "VisitFirstToOpenNext": MessageLookupByLibrary.simpleMessage(
      "Посети первое, открой следующее",
    ),
    "Visitors": MessageLookupByLibrary.simpleMessage("Визиты"),
    "Voice": MessageLookupByLibrary.simpleMessage("Аудиосообщения"),
    "Voices": MessageLookupByLibrary.simpleMessage("Голосовые записи"),
    "WaitAdminResponse": MessageLookupByLibrary.simpleMessage(
      "Ждите ответа админа чата",
    ),
    "WantToChange": MessageLookupByLibrary.simpleMessage("Хотите изменить?"),
    "WantToJoin": MessageLookupByLibrary.simpleMessage("хочет присоединиться"),
    "WeBringStillLifes": MessageLookupByLibrary.simpleMessage(
      "Подвозим натюрморты",
    ),
    "WeDoNotSpamAllKindsOfNotifications": MessageLookupByLibrary.simpleMessage(
      "Мы не спамим уведомлениями и рекламой. Только то, что важно для вас и соответствуют вашим предпочтениям.",
    ),
    "WeHavePlacesJustForYou": MessageLookupByLibrary.simpleMessage(
      "Есть решения именно для тебя",
    ),
    "WeInstallAndWashShowcase": MessageLookupByLibrary.simpleMessage(
      "Устанавливаем и моем витрину",
    ),
    "WeWillLetKnowResults": MessageLookupByLibrary.simpleMessage(
      "Мы оповестим вас о результатах",
    ),
    "Weather": MessageLookupByLibrary.simpleMessage("Погода"),
    "Website": MessageLookupByLibrary.simpleMessage("Сайт"),
    "Wednesday": MessageLookupByLibrary.simpleMessage("Среда"),
    "WednesdayShort": MessageLookupByLibrary.simpleMessage("Ср"),
    "WeekAgo": MessageLookupByLibrary.simpleMessage("неделю назад"),
    "Welcome": MessageLookupByLibrary.simpleMessage("Велкам"),
    "WhatIs": MessageLookupByLibrary.simpleMessage("Зачем нужен"),
    "WhatYouLike": MessageLookupByLibrary.simpleMessage("Что тебе нравится"),
    "WheresTheActivity": MessageLookupByLibrary.simpleMessage("Где движ?"),
    "WhiteTheme": MessageLookupByLibrary.simpleMessage("Светлая тема"),
    "WhyDoYouLoveIt": MessageLookupByLibrary.simpleMessage(
      "Почему тебе это так нравится?",
    ),
    "WillBe": MessageLookupByLibrary.simpleMessage(" будет."),
    "WillBeImplementedSoon": MessageLookupByLibrary.simpleMessage(
      "Скоро будет реализовано",
    ),
    "WiseacreLadyOfSands": MessageLookupByLibrary.simpleMessage(
      "Мудрая леди песков",
    ),
    "WiseacreOfSands": MessageLookupByLibrary.simpleMessage("Мудрец песков"),
    "WithInDays": m101,
    "WithYourPreferences": MessageLookupByLibrary.simpleMessage(
      "С учетом твоих предпочтений",
    ),
    "WorkHours": MessageLookupByLibrary.simpleMessage("Часы работы"),
    "WriteTheAnswer": MessageLookupByLibrary.simpleMessage("Напишите ответ"),
    "WrongSecurityCode": MessageLookupByLibrary.simpleMessage("Неверный код"),
    "XCouldNotBeEmpty": m102,
    "XInvitesY": m103,
    "XIsRequired": m104,
    "XSuccessfullyActivated": m105,
    "XSuccessfullyCreated": m106,
    "XSuccessfullyUpdated": m107,
    "XYearsPlus": m108,
    "Year": MessageLookupByLibrary.simpleMessage("Год"),
    "Yearly": MessageLookupByLibrary.simpleMessage("Годовой"),
    "YearsOld": m109,
    "YearsOldShort": MessageLookupByLibrary.simpleMessage("лет"),
    "Yes": MessageLookupByLibrary.simpleMessage("Да"),
    "Yesterday": MessageLookupByLibrary.simpleMessage("Вчера"),
    "You": MessageLookupByLibrary.simpleMessage("Ты"),
    "YouAskedToBeAddedToTheChat": MessageLookupByLibrary.simpleMessage(
      "Вы запросили добавиться в чат",
    ),
    "YouBetterCheckThisOut": MessageLookupByLibrary.simpleMessage(
      "Тебе лучше взглянуть",
    ),
    "YouCanGet": MessageLookupByLibrary.simpleMessage("Ты можешь получить"),
    "YouCanSeeYourXPromotionMenu": m110,
    "YouCanStillRequestRefundYourComplaint":
        MessageLookupByLibrary.simpleMessage(
          "Вы все еще можете запросить возврат средств по вашей жалобе",
        ),
    "YouCannotCreateOfferDate": MessageLookupByLibrary.simpleMessage(
      "Вы не можете создать оффер, так как ивент или место уже завершено",
    ),
    "YouGetAccessToTrial": MessageLookupByLibrary.simpleMessage(
      "Ты получишь доступ ко всем функциям на",
    ),
    "YouGetExactlyWhatYouNeed": MessageLookupByLibrary.simpleMessage(
      "Ты получаешь точно то, что нужно",
    ),
    "YouMissedALot": MessageLookupByLibrary.simpleMessage(
      "Вы многое пропустили",
    ),
    "YouProgressed": MessageLookupByLibrary.simpleMessage("Вы продвинулись!"),
    "YouReceived": MessageLookupByLibrary.simpleMessage("Вы получили"),
    "YouSentInvitationToNPeople": m111,
    "YouSharedTicket": MessageLookupByLibrary.simpleMessage(
      "Вы поделились билетом",
    ),
    "YouSureToDeleteX": m112,
    "YouWillNoLongerSendMessagesTo": m113,
    "YouWillNoLongerSendMessagesToChat": MessageLookupByLibrary.simpleMessage(
      "Ты больше не сможешь отправлять сообщения в чат",
    ),
    "YouWillReceiveNewTools": MessageLookupByLibrary.simpleMessage(
      "Вы получите новые инструменты",
    ),
    "YoullFindIt": MessageLookupByLibrary.simpleMessage("Ты найдёшь"),
    "YourAge": MessageLookupByLibrary.simpleMessage("Твой возраст"),
    "YourAudienceAge": MessageLookupByLibrary.simpleMessage(
      "Возраст аудитории",
    ),
    "YourClaim": MessageLookupByLibrary.simpleMessage("Ваша претензия"),
    "YourClaimHasBeenSent": MessageLookupByLibrary.simpleMessage(
      "Ваше заявление отправлено",
    ),
    "YourEmail": MessageLookupByLibrary.simpleMessage("Твоя почта"),
    "YourEvent": MessageLookupByLibrary.simpleMessage("Ваше событие"),
    "YourLeisureSelection": MessageLookupByLibrary.simpleMessage(
      "твой выбор досуга",
    ),
    "YourName": MessageLookupByLibrary.simpleMessage("Твоё имя"),
    "YourNewTools": MessageLookupByLibrary.simpleMessage(
      "Теперь вам доступны инструменты",
    ),
    "YourNiche": MessageLookupByLibrary.simpleMessage("Твоя ниша"),
    "YourNotificationWillBeShown": MessageLookupByLibrary.simpleMessage(
      "Ваше уведомление будет показываться 3 раза в неделю в течение указанного срока действия, не более 1 показа на человека.",
    ),
    "YourOfferHasAlreadyBeenPublishedToYourAudience":
        MessageLookupByLibrary.simpleMessage(
          "Ваше предложение уже было опубликовано для вашей аудитории, изменяя или удаляя его, вы несете ответственность за их потенциальное негативное отношение.",
        ),
    "YourOfferWillShown1Time": MessageLookupByLibrary.simpleMessage(
      "Ваше предложение будет показано 1 раз и включено в список предложений вашей аудитории. Оно исчезнет после окончания мероприятия.",
    ),
    "YourPosition": MessageLookupByLibrary.simpleMessage("Твоя позиция"),
    "YourPriceSegment": MessageLookupByLibrary.simpleMessage(
      "Твой ценовой сегмент",
    ),
    "YourProgress": MessageLookupByLibrary.simpleMessage("Ваш прогресс"),
    "YourReminderIsShown1Time": MessageLookupByLibrary.simpleMessage(
      "Ваше напоминание отображается 1 раз в указанный день.",
    ),
    "YourReminderIsShown1TimeMax3": MessageLookupByLibrary.simpleMessage(
      "Ваше напоминание отображается 1 раз в указанный день. У вас есть максимум 3 попытки получить напоминание.",
    ),
    "YourReminderShown1TimeOnTheSpecifiedDate":
        MessageLookupByLibrary.simpleMessage(
          "Ваше напоминание показывается 1 раз в указанную дату.",
        ),
    "YourTraffic": MessageLookupByLibrary.simpleMessage("Твой трафик"),
    "Yourself": MessageLookupByLibrary.simpleMessage("Себе"),
    "daynight": MessageLookupByLibrary.simpleMessage("Днём и ночью"),
    "inXDays": m114,
    "key": MessageLookupByLibrary.simpleMessage(""),
  };
}
