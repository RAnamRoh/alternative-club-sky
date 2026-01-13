import 'package:flutter/material.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class SearchableFormDropDown<T> extends StatefulWidget {
  final String label;
  final IconData? prefixIcon;
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemToString;
  final void Function(T?) onItemSelected;
  final double dropdownMaxHeight;

  const SearchableFormDropDown({
    super.key,
    required this.label,
    required this.items,
    required this.itemToString,
    required this.onItemSelected,
    this.prefixIcon,
    this.selectedItem,
    this.dropdownMaxHeight = 200.0,
  });

  @override
  State<SearchableFormDropDown<T>> createState() => _SearchableFormDropDownState<T>();
}

class _SearchableFormDropDownState<T> extends State<SearchableFormDropDown<T>> {
  late List<T> filteredItems;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items; // Initially show all items
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = widget.items;
      } else {
        filteredItems = widget.items
            .where((item) => widget.itemToString(item).toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
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
          value: widget.selectedItem,
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(Dimens.dimen_10),
            prefixIcon: widget.prefixIcon != null
                ? Icon(
              widget.prefixIcon,
              color: Colors.grey,
            )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: BorderSide(
                color: Colors.grey.shade800,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          items: [
            DropdownMenuItem<T>(
              enabled: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: _filterItems,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    contentPadding: EdgeInsets.symmetric(horizontal: Dimens.dimen_10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimens.dimen_8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            ...filteredItems.map(
                  (item) => DropdownMenuItem<T>(
                value: item,
                child: Text(widget.itemToString(item)),
              ),
            ),
          ],
          onChanged: (selected) {
            widget.onItemSelected(selected);
            FocusScope.of(context).unfocus(); // Close the keyboard when an item is selected
          },
          menuMaxHeight: widget.dropdownMaxHeight,
        ),
      ],
    );
  }
}
