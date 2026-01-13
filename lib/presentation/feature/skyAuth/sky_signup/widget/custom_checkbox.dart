
import 'package:flutter/material.dart';


class CustomCheckbox extends StatelessWidget {

  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return _customCheckbox(value: value, onChanged: onChanged);
  }

  Widget _customCheckbox({
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        height: 18, // Exact size for the checkbox
        width: 18,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: value ? const Color(0xFF0FDEFF) : Colors.transparent,
          border: value ? null : Border.all(color: Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(4), // Rounded corners
        ),
        child: value
            ? const Icon(
          Icons.check,
          color: Colors.white,
          weight: 2,
          size: 10,
        )
            : null,
      ),
    );
  }




}



