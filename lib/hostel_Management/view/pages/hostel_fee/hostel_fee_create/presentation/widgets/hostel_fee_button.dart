import 'package:flutter/material.dart';

import '../hoste_fee_create_page.dart';

class HosteFeeButtonWidget extends StatelessWidget {
  const HosteFeeButtonWidget({
    super.key,
    required this.text,
    required this.callback,
  });
  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 35,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: adminePrimayColor,
        ),
        child: Text(text),
      ),
    );
  }
}
