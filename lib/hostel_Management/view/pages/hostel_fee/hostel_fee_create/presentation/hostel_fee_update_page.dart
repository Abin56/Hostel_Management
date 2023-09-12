import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/constant/const.dart';
import 'package:provider/provider.dart';

import '../controller/hostel_fee_create_provider.dart';
import '../domain/hostel_fee_model.dart';
import '../domain/utils.dart';
import 'hoste_fee_create_page.dart';
import 'widgets/hostel_fee_button.dart';
import 'widgets/hostel_fee_create_dropdown_widget.dart';
import 'widgets/hostel_fee_leftside_widget.dart';
import 'widgets/hostel_fee_textformfield_widget.dart';

class HostelFeeUpdatePage extends StatelessWidget {
  HostelFeeUpdatePage({super.key, required this.data});
  final HostelFeeModel data;
  final TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dateData = timeStampToDateFormat(data.dueDate ?? -1);

    _dateController.text = dateData;

    return Scaffold(
      body: Row(
        children: <Widget>[
          //leftside widget
          const Expanded(
            child: HostelFeeLeftSideWidget(),
          ),
          //right side widget
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Consumer<HostelFeeCreateProvider>(
                  builder: (context, state, child) {
                if (state.isLoading) {
                  return circularPIndicator;
                } else {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //select category
                        FutureBuilder(
                            future:
                                Provider.of<HostelFeeCreateProvider>(context)
                                    .getCategoryName(
                                        categoryId: data.categoryId ?? ""),
                            builder: (context, snapshot) {
                              state.selectedCategory = HostelFeeCategoryModel(
                                id: data.categoryId,
                                categoryName: snapshot.data ?? "",
                              );
                              return HostelFeeCreateDropDownWidget<
                                  HostelFeeCategoryModel>(
                                selectedItem: state.selectedCategory,
                                onChanged: (value) {
                                  if (value != null) {
                                    state.selectedCategory = value;
                                    data.categoryId = value.id;
                                  }
                                },
                                labelText: "Please select category",
                                asyncItems: (value) =>
                                    state.fetchAllHostelFeesCategory(),
                                itemAsString: (value) =>
                                    value.categoryName ?? "Select category",
                              );
                            }),
                        //title form field
                        kHeight20,
                        HostelFeeTextFormFieldWidget(
                          hintText: 'Title',
                          initialValue: data.feesTitle,
                          onChanged: (value) => data.feesTitle = value,
                          validator: checkFieldEmpty,
                        ),
                        kHeight20,
                        //description form field
                        HostelFeeTextFormFieldWidget(
                          hintText: 'Description',
                          maxLine: null,
                          initialValue: data.feesDescription,
                          onChanged: (value) => data.feesDescription = value,
                          validator: checkFieldEmpty,
                        ),
                        kHeight20,
                        //payment amount text field
                        HostelFeeTextFormFieldWidget(
                          hintText: 'Amount',
                          initialValue: data.paymentAmount.toString(),
                          onChanged: (value) =>
                              data.paymentAmount = num.tryParse(value) ?? -1,
                          validator: checkFieldContainsOnlyNumbers,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            CustomDecimalInputFormatter(),
                          ],
                        ),
                        kHeight20,
                        //due date
                        HostelFeeTextFormFieldWidget(
                          hintText: 'Due Date',
                          validator: checkFieldEmpty,
                          controller: _dateController,
                          readOnly: true,
                          onTap: () async {
                            final date = await dateTimePicker(context);
                            if (date != -1) {
                              data.dueDate = date;
                              final timeData = timeStampToDateFormat(date);
                              _dateController.text = timeData;
                            }
                          },
                        ),
                        kHeight20,
                        //submit button

                        HosteFeeButtonWidget(
                            text: 'Update',
                            callback: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                await state
                                    .updateHostelFee(
                                      data: data,
                                    )
                                    .then(
                                        (value) => Navigator.of(context).pop());

                                _formKey.currentState?.reset();
                              }
                            }),
                      ],
                    ),
                  );
                }
              }),
            ),
          )),
        ],
      ),
    );
  }
}
