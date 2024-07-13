import 'package:flutter/material.dart';
import 'package:meal/palette.dart';

class MealRadio<T> extends StatelessWidget {
  const MealRadio({
    super.key,
    required this.value,
    required this.onChanged,
    this.groupValue,
    required this.child,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T> onChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Checkbox(
            shape: const CircleBorder(),
            side: const BorderSide(color: Palette.grey, width: 1.5),
            activeColor: Palette.primary,
            value: value == groupValue,
            onChanged: (_) => onChanged(value),
          ),
          child,
        ],
      ),
    );
  }
}
