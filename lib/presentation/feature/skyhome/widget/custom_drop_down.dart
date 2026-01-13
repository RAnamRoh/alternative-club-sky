import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  final String initialOption;
  final ValueNotifier<String> selectedValue;

  const CustomDropdown({
    Key? key,
    required this.options,
    required this.initialOption,
    required this.selectedValue,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  void initState() {
    super.initState();
    widget.selectedValue.value = widget.initialOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: ValueListenableBuilder<String>(
        valueListenable: widget.selectedValue,
        builder: (context, selectedOption, _) {
          return DropdownButton<String>(
            value: selectedOption,
            isExpanded: true,
            underline: const SizedBox.shrink(),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
            onChanged: (String? newValue) {
              if (newValue != null) {
                widget.selectedValue.value = newValue;
              }
            },
            items: widget.options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
