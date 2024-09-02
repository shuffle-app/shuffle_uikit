class TitledFilterModel<T> {
  final String title;
  final List<TitledFilterItem<T>> items;

  TitledFilterModel({
    required this.title,
    required this.items,
  });

  List<TitledFilterItem<T>> get onlySelectedItems => items.where((item) => item.selected).toList();

  List<TitledFilterItem<T>> get onlyUnselectedItems => items.where((item) => !item.selected).toList();

  TitledFilterModel<T> copyWith({
    String? title,
    List<TitledFilterItem<T>>? items,
  }) {
    return TitledFilterModel<T>(
      title: title ?? this.title,
      items: items ?? this.items,
    );
  }
}

class TitledFilterItem<T> {
  final String mask;
  final T value;
  final bool selected;

  TitledFilterItem({
    required this.mask,
    required this.value,
    required this.selected,
  });

  TitledFilterItem<T> copyWith({
    String? mask,
    T? value,
    bool? selected,
  }) =>
      TitledFilterItem<T>(
        mask: mask ?? this.mask,
        value: value ?? this.value,
        selected: selected ?? this.selected,
      );

  String toString() => 'TitledFilterItem(mask: $mask, value: $value, selected: $selected)';
}
