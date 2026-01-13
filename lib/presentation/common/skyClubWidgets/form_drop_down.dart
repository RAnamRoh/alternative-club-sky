import 'package:flutter/material.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class FormDropDown<T> extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemToString; // Converts item to a displayable string
  final void Function(T?) onItemSelected;

  const FormDropDown({
    super.key,
    required this.label,
    required this.items,
    required this.itemToString,
    required this.onItemSelected,
    this.prefixIcon,
    this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: const Color(0xFF4F4F4F),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: Dimens.dimen_5,
        ),
        DropdownButtonFormField<T>(
          value: selectedItem,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(Dimens.dimen_10),
            prefixIcon: prefixIcon != null
                ? Icon(
              prefixIcon,
              color: Colors.grey,
            )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<T>(
            value: item,
            child: Text(itemToString(item),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: Dimens.dimen_12,
              ),
            ),
          ))
              .toList(),
          onChanged: onItemSelected,
          menuMaxHeight: Dimens.dimen_200,
        ),
      ],
    );
  }
}
