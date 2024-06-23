import 'package:flutter/material.dart';
import 'package:rice/palette.dart';

class RiceRadio<T> extends StatelessWidget {
  const RiceRadio({
    super.key,
    required this.value,
    required this.onChanged,
    this.groupValue,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: const CircleBorder(),
      side: const BorderSide(color: Palette.grey, width: 1.5),
      activeColor: Palette.primary,
      value: value == groupValue,
      onChanged: (_) => onChanged(value),
    );
  }
}
