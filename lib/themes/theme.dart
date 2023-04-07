import 'package:flutter/material.dart';
import 'package:flutter/src/cupertino/theme.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

class UiKitThemeData extends ThemeExtension<UiKitThemeData> {
  final Color customColor;

  UiKitThemeData({required this.customColor});

  @override
  ThemeExtension<UiKitThemeData> copyWith({
    Color? customColor,
  }) {
    return UiKitThemeData(
      customColor: customColor ?? this.customColor,
    );
  }

  @override
  ThemeExtension<UiKitThemeData> lerp(ThemeExtension<UiKitThemeData>? other, double t) {
    if (other is! UiKitThemeData) {
      return this;
    }
    return UiKitThemeData(
      customColor: Color.lerp(customColor, other.customColor, t) ?? Colors.white,
    );
  }
}

class UiKitOtherThemeData implements ThemeData {
  @override
  Color get accentColor => Colors.amberAccent;

  @override
  Brightness get accentColorBrightness => Brightness.light;

  @override
  IconThemeData get accentIconTheme => const IconThemeData();

  @override
  TextTheme get accentTextTheme => const TextTheme();

  @override
  AndroidOverscrollIndicator? get androidOverscrollIndicator => AndroidOverscrollIndicator.stretch;

  @override
  AppBarTheme get appBarTheme => const AppBarTheme();

  @override
  bool get applyElevationOverlayColor => false;

  @override
  Color get backgroundColor => Colors.black;

  @override
  BadgeThemeData get badgeTheme => const BadgeThemeData();

  @override
  MaterialBannerThemeData get bannerTheme => const MaterialBannerThemeData();

  @override
  Color get bottomAppBarColor => Colors.brown;

  @override
  BottomAppBarTheme get bottomAppBarTheme => const BottomAppBarTheme();

  @override
  BottomNavigationBarThemeData get bottomNavigationBarTheme => const BottomNavigationBarThemeData();

  @override
  BottomSheetThemeData get bottomSheetTheme => const BottomSheetThemeData();

  @override
  Brightness get brightness => Brightness.light;

  @override
  ButtonBarThemeData get buttonBarTheme => const ButtonBarThemeData();

  @override
  Color get buttonColor => Colors.blue;

  @override
  ButtonThemeData get buttonTheme => const ButtonThemeData();

  @override
  Color get canvasColor => Colors.pinkAccent;

  @override
  Color get cardColor => Colors.pink;

  @override
  CardTheme get cardTheme => const CardTheme();

  @override
  CheckboxThemeData get checkboxTheme => const CheckboxThemeData();

  @override
  ChipThemeData get chipTheme => const ChipThemeData();

  @override
  ColorScheme get colorScheme => const ColorScheme.light();

  @override
  NoDefaultCupertinoThemeData? get cupertinoOverrideTheme => const NoDefaultCupertinoThemeData();

  @override
  DataTableThemeData get dataTableTheme => const DataTableThemeData();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {}

  @override
  Color get dialogBackgroundColor => Colors.white;

  @override
  DialogTheme get dialogTheme => const DialogTheme();

  @override
  Color get disabledColor => Colors.blueGrey;

  @override
  Color get dividerColor => Colors.grey;

  @override
  DividerThemeData get dividerTheme => const DividerThemeData();

  @override
  DrawerThemeData get drawerTheme => const DrawerThemeData();

  @override
  DropdownMenuThemeData get dropdownMenuTheme => const DropdownMenuThemeData();

  @override
  ElevatedButtonThemeData get elevatedButtonTheme => const ElevatedButtonThemeData();

  @override
  Color get errorColor => Colors.red;

  @override
  ExpansionTileThemeData get expansionTileTheme => const ExpansionTileThemeData();

  @override
  T? extension<T>() {
    return null;
  }

  @override
  Map<Object, ThemeExtension> get extensions => {};

  @override
  FilledButtonThemeData get filledButtonTheme => const FilledButtonThemeData();

  @override
  bool get fixTextFieldOutlineLabel => false;

  @override
  FloatingActionButtonThemeData get floatingActionButtonTheme => const FloatingActionButtonThemeData();

  @override
  Color get focusColor => Colors.amberAccent;

  @override
  Color get highlightColor => Colors.amberAccent;

  @override
  Color get hintColor => Colors.grey;

  @override
  Color get hoverColor => Colors.amberAccent;

  @override
  IconButtonThemeData get iconButtonTheme => const IconButtonThemeData();

  @override
  IconThemeData get iconTheme => const IconThemeData();

  @override
  Color get indicatorColor => Colors.amberAccent;

  @override
  InputDecorationTheme get inputDecorationTheme => const InputDecorationTheme();

  @override
  ListTileThemeData get listTileTheme => const ListTileThemeData();

  @override
  MaterialTapTargetSize get materialTapTargetSize => MaterialTapTargetSize.padded;

  @override
  MenuBarThemeData get menuBarTheme => const MenuBarThemeData();

  @override
  MenuButtonThemeData get menuButtonTheme => const MenuButtonThemeData();

  @override
  MenuThemeData get menuTheme => const MenuThemeData();

  @override
  NavigationBarThemeData get navigationBarTheme => const NavigationBarThemeData();

  @override
  NavigationDrawerThemeData get navigationDrawerTheme => const NavigationDrawerThemeData();

  @override
  NavigationRailThemeData get navigationRailTheme => const NavigationRailThemeData();

  @override
  OutlinedButtonThemeData get outlinedButtonTheme => const OutlinedButtonThemeData();

  @override
  PageTransitionsTheme get pageTransitionsTheme => const PageTransitionsTheme();

  @override
  TargetPlatform get platform => TargetPlatform.iOS;

  @override
  PopupMenuThemeData get popupMenuTheme => const PopupMenuThemeData();

  @override
  Color get primaryColor => Colors.blue;

  @override
  Brightness get primaryColorBrightness => Brightness.light;

  @override
  Color get primaryColorDark => Colors.teal;

  @override
  Color get primaryColorLight => Colors.tealAccent;

  @override
  IconThemeData get primaryIconTheme => const IconThemeData();

  @override
  TextTheme get primaryTextTheme => const TextTheme();

  @override
  ProgressIndicatorThemeData get progressIndicatorTheme => const ProgressIndicatorThemeData();

  @override
  RadioThemeData get radioTheme => const RadioThemeData();

  @override
  Color get scaffoldBackgroundColor => Colors.red;

  @override
  ScrollbarThemeData get scrollbarTheme => const ScrollbarThemeData();

  @override
  Color get secondaryHeaderColor => Colors.red;

  @override
  SegmentedButtonThemeData get segmentedButtonTheme => const SegmentedButtonThemeData();

  @override
  Color get selectedRowColor => Colors.black;

  @override
  Color get shadowColor => Colors.yellow;

  @override
  SliderThemeData get sliderTheme => const SliderThemeData();

  @override
  SnackBarThemeData get snackBarTheme => const SnackBarThemeData();

  @override
  Color get splashColor => Colors.yellow;

  @override
  InteractiveInkFeatureFactory get splashFactory => InkSplash.splashFactory;

  @override
  SwitchThemeData get switchTheme => const SwitchThemeData();

  @override
  TabBarTheme get tabBarTheme => const TabBarTheme();

  @override
  TextButtonThemeData get textButtonTheme => const TextButtonThemeData();

  @override
  TextSelectionThemeData get textSelectionTheme => const TextSelectionThemeData();

  @override
  TextTheme get textTheme => const TextTheme();

  @override
  TimePickerThemeData get timePickerTheme => const TimePickerThemeData();

  @override
  DiagnosticsNode toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) {
    return DiagnosticsNode.message('message', style: style ?? DiagnosticsTreeStyle.errorProperty);
  }

  @override
  String toStringShort() {
    return super.toString();
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }

  @override
  ToggleButtonsThemeData get toggleButtonsTheme => const ToggleButtonsThemeData();

  @override
  Color get toggleableActiveColor => Colors.white;

  @override
  TooltipThemeData get tooltipTheme => const TooltipThemeData();

  @override
  Typography get typography => Typography();

  @override
  Color get unselectedWidgetColor => Colors.black;

  @override
  bool get useMaterial3 => false;

  @override
  VisualDensity get visualDensity => VisualDensity.standard;

  @override
  ThemeData copyWith(
      {bool? applyElevationOverlayColor,
      NoDefaultCupertinoThemeData? cupertinoOverrideTheme,
      Iterable<ThemeExtension<dynamic>>? extensions,
      InputDecorationTheme? inputDecorationTheme,
      MaterialTapTargetSize? materialTapTargetSize,
      PageTransitionsTheme? pageTransitionsTheme,
      TargetPlatform? platform,
      ScrollbarThemeData? scrollbarTheme,
      InteractiveInkFeatureFactory? splashFactory,
      bool? useMaterial3,
      VisualDensity? visualDensity,
      Brightness? brightness,
      Color? canvasColor,
      Color? cardColor,
      ColorScheme? colorScheme,
      Color? dialogBackgroundColor,
      Color? disabledColor,
      Color? dividerColor,
      Color? focusColor,
      Color? highlightColor,
      Color? hintColor,
      Color? hoverColor,
      Color? indicatorColor,
      Color? primaryColor,
      Color? primaryColorDark,
      Color? primaryColorLight,
      Color? scaffoldBackgroundColor,
      Color? secondaryHeaderColor,
      Color? shadowColor,
      Color? splashColor,
      Color? unselectedWidgetColor,
      IconThemeData? iconTheme,
      IconThemeData? primaryIconTheme,
      TextTheme? primaryTextTheme,
      TextTheme? textTheme,
      Typography? typography,
      AppBarTheme? appBarTheme,
      BadgeThemeData? badgeTheme,
      MaterialBannerThemeData? bannerTheme,
      BottomAppBarTheme? bottomAppBarTheme,
      BottomNavigationBarThemeData? bottomNavigationBarTheme,
      BottomSheetThemeData? bottomSheetTheme,
      ButtonBarThemeData? buttonBarTheme,
      ButtonThemeData? buttonTheme,
      CardTheme? cardTheme,
      CheckboxThemeData? checkboxTheme,
      ChipThemeData? chipTheme,
      DataTableThemeData? dataTableTheme,
      DialogTheme? dialogTheme,
      DividerThemeData? dividerTheme,
      DrawerThemeData? drawerTheme,
      DropdownMenuThemeData? dropdownMenuTheme,
      ElevatedButtonThemeData? elevatedButtonTheme,
      ExpansionTileThemeData? expansionTileTheme,
      FilledButtonThemeData? filledButtonTheme,
      FloatingActionButtonThemeData? floatingActionButtonTheme,
      IconButtonThemeData? iconButtonTheme,
      ListTileThemeData? listTileTheme,
      MenuBarThemeData? menuBarTheme,
      MenuButtonThemeData? menuButtonTheme,
      MenuThemeData? menuTheme,
      NavigationBarThemeData? navigationBarTheme,
      NavigationDrawerThemeData? navigationDrawerTheme,
      NavigationRailThemeData? navigationRailTheme,
      OutlinedButtonThemeData? outlinedButtonTheme,
      PopupMenuThemeData? popupMenuTheme,
      ProgressIndicatorThemeData? progressIndicatorTheme,
      RadioThemeData? radioTheme,
      SegmentedButtonThemeData? segmentedButtonTheme,
      SliderThemeData? sliderTheme,
      SnackBarThemeData? snackBarTheme,
      SwitchThemeData? switchTheme,
      TabBarTheme? tabBarTheme,
      TextButtonThemeData? textButtonTheme,
      TextSelectionThemeData? textSelectionTheme,
      TimePickerThemeData? timePickerTheme,
      ToggleButtonsThemeData? toggleButtonsTheme,
      TooltipThemeData? tooltipTheme,
      Color? accentColor,
      Brightness? accentColorBrightness,
      TextTheme? accentTextTheme,
      IconThemeData? accentIconTheme,
      Color? buttonColor,
      bool? fixTextFieldOutlineLabel,
      Brightness? primaryColorBrightness,
      AndroidOverscrollIndicator? androidOverscrollIndicator,
      Color? toggleableActiveColor,
      Color? selectedRowColor,
      Color? errorColor,
      Color? backgroundColor,
      Color? bottomAppBarColor}) {
    return UiKitOtherThemeData();
  }
}

class ShuffleTheme extends InheritedTheme {
  final UiKitThemeData data;
  const ShuffleTheme({
    Key? key,
    required this.data,
    required super.child,
  }) : super(key: key);

  static UiKitThemeData of(BuildContext context) {
    final themeData = context.dependOnInheritedWidgetOfExactType<ShuffleTheme>()?.data;
    if (themeData == null) return UiKitThemeData(customColor: Colors.white);
    return themeData;
  }

  @override
  bool updateShouldNotify(ShuffleTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ShuffleTheme(data: data, child: child);
  }
}
