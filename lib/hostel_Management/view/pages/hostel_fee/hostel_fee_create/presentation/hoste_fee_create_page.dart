import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../controller/hostel_fee_create_provider.dart';
import '../domain/hostel_fee_model.dart';
import '../domain/utils.dart';
import 'hostel_fee_show_page.dart';
import 'widgets/hostel_fee_button.dart';
import 'widgets/hostel_fee_create_dropdown_widget.dart';
import 'widgets/hostel_fee_leftside_widget.dart';
import 'widgets/hostel_fee_new_category_widget.dart';
import 'widgets/hostel_fee_textformfield_widget.dart';

SizedBox kHeight20 = const SizedBox(
  height: 20,
);
const Color adminePrimayColor = Color.fromARGB(255, 6, 71, 157);

class HostelFeeCreatePage extends StatelessWidget {
  HostelFeeCreatePage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //select category
                        HostelFeeCreateDropDownWidget<HostelFeeCategoryModel>(
                          onChanged: (value) {
                            if (value != null) {
                              state.selectedCategory = value;
                            }
                          },
                          labelText: "Please select category",
                          asyncItems: (value) =>
                              state.fetchAllHostelFeesCategory(),
                          itemAsString: (value) =>
                              value.categoryName ?? "Select category",
                          selectedItem: state.selectedCategory,
                        ),
                        //create category
                        const HosteNewCategoryCreateWidget(),
                        //title form field
                        kHeight20,
                        HostelFeeTextFormFieldWidget(
                          hintText: 'Title',
                          onChanged: (value) => state.feesTitle = value,
                          validator: checkFieldEmpty,
                        ),
                        kHeight20,
                        //description form field
                        HostelFeeTextFormFieldWidget(
                          hintText: 'Description',
                          maxLine: null,
                          onChanged: (value) => state.description = value,
                          validator: checkFieldEmpty,
                        ),
                        kHeight20,
                        //payment amount text field
                        HostelFeeTextFormFieldWidget(
                          hintText: 'Amount(Numbers Only)',
                          onChanged: (value) =>
                              state.amount = num.tryParse(value) ?? -1,
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
                              state.dueDate = date;
                              final timeData =
                                  timeStampToDateFormat(state.dueDate);
                              _dateController.text = timeData;
                            }
                          },
                        ),
                        kHeight20,
                        //submit button

                        HosteFeeButtonWidget(
                          text: 'Submit',
                          callback: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              await state.createNewHostelFee();
                              _formKey.currentState?.reset();
                              _dateController.clear();
                            } else {
                              //todo:showToast
                            }
                          },
                        ),
                        kHeight20,
                        HosteFeeButtonWidget(
                          text: 'Show Fee',
                          callback: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HostelFeeShowPage(),
                            ));
                          },
                        ),
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
