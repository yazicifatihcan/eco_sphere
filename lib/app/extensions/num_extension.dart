extension RemoveDecimalFromString on num {
  String removeTrailingZeros() {
    if (this % 1 == 0) {
      return toStringAsFixed(0);
    } else {
      return toStringAsFixed(2);
    }
  }
}