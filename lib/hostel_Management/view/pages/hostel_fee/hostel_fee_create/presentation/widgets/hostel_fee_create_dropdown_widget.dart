import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class HostelFeeCreateDropDownWidget<T> extends StatelessWidget {
  const HostelFeeCreateDropDownWidget({
    super.key,
    this.onChanged,
    this.asyncItems,
    required this.labelText,
    this.selectedItem,
    this.itemAsString,
  });
  final void Function(T?)? onChanged;
  final Future<List<T>> Function(String)? asyncItems;
  final String labelText;
  final T? selectedItem;
  final String Function(T)? itemAsString;
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      validator: (value) {
        if (value != null) {
          return null;
        } else {
          return "Please select category";
        }
      },
      asyncItems: asyncItems,
      onChanged: onChanged,
      selectedItem: selectedItem,
      itemAsString: itemAsString,
      
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
