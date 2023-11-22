# Shuffle UiKit

## Описание проекта

**shuffle_uikit** представляет собой набор базовых элементов пользовательского интерфейса. UiKit содержит готовые к использованию виджеты и компоненты для проекта shuffle_app.

## Установка

Для установки UiKit добавьте его в зависимости файла `pubspec.yaml`:

```yaml
dependencies:
  shuffle_uikit: ^latest_version
```

Затем выполните `flutter pub get` для установки пакета.

## Общая структура пакета
![ui_kit (1)](https://github.com/shuffle-app/shuffle_uikit/assets/101862863/348d43ea-611e-4505-b298-ce422b12a9dd)

## Работа с `UiKitTheme` 
**UiKitTheme** - это набор инструментов для работы с темами в приложении, он позволяет систематизировать изменения цветов графических элементов при смене темы. Необходимые составляющие для работы с темой:

1. [UiKitTheme](https://github.com/shuffle-app/shuffle_uikit/blob/master/lib/themes/ui_kit_theme.dart). Это виджет, который отвечает за смену темы и локализации приложения, его использование ограничивается только сменой текущей темы/локализации на предоставляемую в методе изменения. Обращение для смены темы происходит следующим образом: 

```dart
ElevatedButton(
  onPressed: () => UiKitTheme.of(context).onThemeUpdated(UiKitThemeFoundation.lightTheme),
  child: MyWidget(),
),
```
2. [UiKitThemeFoundation](https://github.com/shuffle-app/shuffle_uikit/blob/master/lib/foundation/ui_kit_theme_foundation.dart). Основной источник, куда стоит обратиться при нужде получить объект ThemeData из доступных. Тут хранятся ThemeData'ы приложения, получаемые через класс _UiKitThemes_.

3. [UiKitThemes](https://github.com/shuffle-app/shuffle_uikit/blob/master/lib/themes/ui_kit_themes.dart). Класс, содержащий подробное описание цветов и конфигураций под каждую тему. В каждую тему внесены ThemeExtension'ы, в которых описываются конфигурации отдельных UiKit элементов(_uiKitTabBarTheme_, _bottomSheetTheme_ и т.д), а также настройки _UiKitColorScheme_. 
4. [UiKitColorScheme](https://github.com/shuffle-app/shuffle_uikit/blob/master/lib/themes/ui_kit_color_scheme.dart). Используется для хранения цветов и их предоставления в UiKitThemeData, а также для получения базовых цветов, таких как surface1, primary и т.д. К примеру, если повявилась необходимость использования _UiKitColorScheme_ для получения цвета surface3 для виджета, то возможно обращение к цвету благодаря [UiKitThemeExtention](https://github.com/shuffle-app/shuffle_uikit/blob/master/lib/utils/extentions/ui_kit_theme_extention.dart):
```dart
ColoredBox(
  color: context.uiKitTheme!.colorScheme.surface3,
  child: MyWidget(),
),
```


## Работа с `Flutter Intl` для локализации приложения
**Flutter Intl** - это инструмент для работы с локализацией Flutter, он позволяет выделять строки для перевода и автоматически создавать файлы формата `.arb` для хранения переводов. Далее описан план по работе с `Flutter Intl` в Visual Studio Code и Android Studio.

### Установка расширения `Flutter Intl`

Установите `Flutter Intl` в проект, выполнив следующие шаги:

1. Откройте магазин расширений и скачайте `flutter intl` для [VScode](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl) или [Android Studio](https://plugins.jetbrains.com/plugin/13666-flutter-intl)

2. Добавьте `flutter_intl` в зависимости:

```yaml
dev_dependencies:
  flutter_intl: ^latest_version
```

3. Запустите команду `flutter pub get`

### Использование Flutter Intl расширения

1. Чтобы использовать расширение потребуется базовая настройка горячих клавиш для Android Studio: откройте _settings -> keymap -> flutter intl_ и настройте конфигурацию. 
2. Выделите необходимые строки, которые вы хотите вынести для локализации, а затем воспользуйтесь [Code Actions](https://code.visualstudio.com/docs/editor/refactoring#_code-actions-quick-fixes-and-refactorings) -> extract to ARB. Далее введите название будущей переменной и завершите операцию. 
3. Для ознакомления со всеми возможностями этого пакета перейдите по [ссылке](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl).

### Внесение изменений

Если вы хотите внести изменения в локализацию, добавьте новые строки в файлы `.arb`, затем расширение автоматически сгенерирует необходимый код для работы с новыми строками.
