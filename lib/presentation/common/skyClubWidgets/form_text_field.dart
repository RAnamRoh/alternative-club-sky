import 'package:flutter/material.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class FormTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final String? errorText; // ⬅️ kept from original version
  final String? Function(String)? validator; // ⬅️ added new

  const FormTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.textInputType,
    this.errorText,
    this.validator,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  String? _localErrorText;
  bool _isTouched = false;

  void _validate(String value) {
    if (!_isTouched) return; // prevent early validation

    if (widget.validator != null && widget.errorText == null) {
      setState(() {
        _localErrorText = widget.validator!(value);
      });
    }
  }

  void _onFocusChange(bool hasFocus) {
    if (!hasFocus) {
      setState(() {
        _isTouched = true;
      });
      _validate(widget.controller.text);
    }
  }

  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      _onFocusChange(_focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveErrorText = widget.errorText ?? _localErrorText;

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
         SizedBox(height: Dimens.dimen_5),
        TextField(
          focusNode: _focusNode,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          controller: widget.controller,
          textCapitalization: widget.textCapitalization,
          obscureText: widget.obscureText,
          keyboardType: widget.textInputType,
          textAlign: TextAlign.start,
          onChanged: (value) {
            if (!_isTouched) {
              setState(() {
                _isTouched = true;
              });
            }
            _validate(value);
          },
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: Dimens.dimen_12,
          ),
          decoration: InputDecoration(
            contentPadding:  EdgeInsets.all(Dimens.dimen_10),
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: Colors.grey)
                : null,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFF9B9B9B),
              fontWeight: FontWeight.w400,
              fontSize: Dimens.dimen_12,
            ),
            errorText: effectiveErrorText,
            errorStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.red.shade800,
              fontWeight: FontWeight.w400,
              fontSize: Dimens.dimen_12,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: BorderSide(color: Colors.red.shade800),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: BorderSide(color: Colors.grey.shade800),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.dimen_8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
