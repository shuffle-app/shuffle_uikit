This project wraps widgets from library to make testing simpler.

## Run project

1. Open folder
```bash
cd testable_widget_generator
```
2. Run scripts
```bash
dart run
```
That will generate code similar to the example for every file

## Adding new files to process
Copy shuffle_uikit's file's relative path (for example, `lib/ui_kit/atoms/buttons/black_dialog_button.dart`) and paste it into `source_files.txt`


## Example of work:
### Source file

path:
`shuffle_uikit/lib/widget.dart`
```dart
class Widget {
    child: Child()
}
```

### Generated file

path: `shuffle_uikit/example/generated/widget.dart`

```dart
class WidgetWrapForTesting {
    child: MenuWrap(child: Child())
}
```

or in case of multiple children:

```dart
class Widget {
    children: [...]
}
```

```dart
class WidgetWrapForTesting {
    children: [...].map((e) => MenuWrap(child: e))
}
```