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
