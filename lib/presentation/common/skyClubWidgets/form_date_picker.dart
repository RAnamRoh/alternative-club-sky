import 'package:flutter/material.dart';
import 'package:club_alt/presentation/values/dimens.dart';
import 'package:intl/intl.dart';

class FormDatePicker extends StatefulWidget {
  final String label;
  final IconData? prefixIcon;
  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime) onDateSelected;
  final String? errorText;

  FormDatePicker({
    super.key,
    required this.label,
    this.prefixIcon = Icons.calendar_today,
    this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
    this.errorText,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<FormDatePicker> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? widget.lastDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
      widget.onDateSelected(pickedDate);
    }
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
        GestureDetector(
          onTap: () => _pickDate(context),
          child: Container(
            padding: EdgeInsets.all(Dimens.dimen_10),
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.errorText == null ? Colors.grey : Colors.red.shade800,
              ),
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
            ),
            child: Row(
              children: [
                if (widget.prefixIcon != null)
                  Icon(
                    widget.prefixIcon,
                    color: Colors.grey,
                  ),
                SizedBox(width: Dimens.dimen_10),
                Expanded(
                  child: Text(
                    _selectedDate != null
                        ? DateFormat.yMMMd().format(_selectedDate!)
                        : 'Select a date',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: _selectedDate != null ? Colors.black : const Color(0xFF9B9B9B),
                      fontWeight: FontWeight.w400,
                      fontSize: Dimens.dimen_12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: EdgeInsets.only(top: Dimens.dimen_5),
            child: Text(
              widget.errorText!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.red.shade800,
                fontWeight: FontWeight.w400,
                fontSize: Dimens.dimen_12,
              ),
            ),
          ),
      ],
    );
  }
}
