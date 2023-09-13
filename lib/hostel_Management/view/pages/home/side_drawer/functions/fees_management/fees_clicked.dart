import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/pages/hostel_fee/hostel_fee_create/presentation/hoste_fee_create_page.dart';

hostelFeesPage(BuildContext context, int index) {
  if (index == 8) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return HostelFeeCreatePage();
      },
    ));
  }
}