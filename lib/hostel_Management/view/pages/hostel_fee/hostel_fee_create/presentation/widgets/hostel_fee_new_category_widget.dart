import 'package:flutter/material.dart';

import 'hostel_fee_create_category_dialogue.dart';

class HosteNewCategoryCreateWidget extends StatelessWidget {
  const HosteNewCategoryCreateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          showDialogHostelFee(context);
        },
        child: const Text(
          "Create new category",
        ),
      ),
    );
  }
}
