import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/pages/hostel_fee/hostel_fee_create/domain/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../colors/colors.dart';
import '../../../../../constant/const.dart';
import '../../controller/hostel_fee_create_provider.dart';
import '../hoste_fee_create_page.dart';
import 'hostel_fee_textformfield_widget.dart';

void showDialogHostelFee(BuildContext context) {
  final provider = context.read<HostelFeeCreateProvider>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<HostelFeeCreateProvider>(
          builder: (context, state, child) {
        if (state.isLoadingC) {
          return circularPIndicator;
        } else {
          return AlertDialog(
            title: const Text('Create new category'),
            content: HostelFeeTextFormFieldWidget(
                hintText: 'Category Name',
                onChanged: (value) {
                  provider.newCategoryName = value;
                }),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: adminePrimayColor),
                onPressed: () async {
                  if (provider.newCategoryName.isEmpty) {
                    showToast(
                        msg: "Category name not valid",
                        linearGradientString: linearGradientRedClr);
                    return;
                  }
                  await provider
                      .createNewFeeCategory(
                          categoryName: provider.newCategoryName)
                      .then((value) => Navigator.of(context).pop());
                },
                child: const Text('Create'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: adminePrimayColor),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.spaceBetween,
          );
        }
      });
    },
  );
}
