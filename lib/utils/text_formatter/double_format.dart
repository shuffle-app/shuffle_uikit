String doubleFormat(double number) {
  double rounded = double.parse(number.toStringAsFixed(1));

  if (rounded == rounded.toInt()) {
    return rounded.toInt().toString();
  } else {
    return rounded.toString();
  }
}
