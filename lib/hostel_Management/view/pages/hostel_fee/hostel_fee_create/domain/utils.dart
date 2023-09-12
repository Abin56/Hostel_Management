import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

String timeStampToDateFormat(int timeStamp) {
  if (timeStamp == -1) {
    return "";
  }
  try {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    String d12 = DateFormat('dd-MM-yyyy').format(dt);

    return d12;
  } catch (e) {
    log("Format error");
    return "";
  }
}

Future<int> dateTimePicker(BuildContext context) async {
  DateTime? dateTime = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2500),
  );
  if (dateTime != null) {
    return dateTime.millisecondsSinceEpoch;
  } else {
    return -1;
  }
}

void showToast({required String msg, String? linearGradientString}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.green,
    webBgColor: linearGradientString,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

String? checkFieldEmpty(String? fieldContent) {
  //<-- add String? as a return type
  if (fieldContent == null || fieldContent.isEmpty) {
    return "Field is mandatory";
  }
  return null;
}

String? checkFieldContainsOnlyNumbers(String? fieldContent) {
  if (fieldContent == null || fieldContent.isEmpty) {
    return "Field is mandatory";
  }

  // Use a regular expression to check if the string contains only numbers
  if (!RegExp(r'^\d*\.?\d*$').hasMatch(fieldContent)) {
    return "Field must contain only numbers";
  }

  return null;
}

//this class for custom text field
class CustomDecimalInputFormatter extends TextInputFormatter {
  // Regular expression pattern to allow digits and a single decimal point
  static final RegExp _decimalRegExp = RegExp(r'^\d*\.?\d*$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_decimalRegExp.hasMatch(newValue.text)) {
      return newValue;
    } else {
      // If the input doesn't match the pattern, return the old value.
      return oldValue;
    }
  }
}
