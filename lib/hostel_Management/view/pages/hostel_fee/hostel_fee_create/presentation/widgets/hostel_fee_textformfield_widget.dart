import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HostelFeeTextFormFieldWidget extends StatelessWidget {
  const HostelFeeTextFormFieldWidget({
    super.key,
    required this.hintText,
    this.maxLine = 1,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.readOnly = false,
    this.inputFormatters,
    this.onTap,
    this.controller,
    this.initialValue,
  });
  final String hintText;
  final int? maxLine;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool readOnly;
  final List<TextInputFormatter>?
      inputFormatters; //amount field need only number
  final void Function()? onTap;
  final TextEditingController? controller;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLine,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
