class TitledFilterModel<T> {
  final String title;
  final List<TitledFilterItem<T>> items;
  final TitledFilterItem<T>? selectedItem;

  TitledFilterModel({
    required this.title,
    required this.items,
    this.selectedItem,
  });

  TitledFilterModel<T> copyWith({
    String? title,
    List<TitledFilterItem<T>>? items,
    TitledFilterItem<T>? selectedItem,
  }) {
    return TitledFilterModel<T>(
      title: title ?? this.title,
      items: items ?? this.items,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }
}

class TitledFilterItem<T> {
  final String mask;
  final T value;

  TitledFilterItem({
    required this.mask,
    required this.value,
  });
}
