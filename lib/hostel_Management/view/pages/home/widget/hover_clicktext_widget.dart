import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/widgets/hover_mouse/hover.dart';

import '../../../fonts/google_poppins.dart';

// ignore: must_be_immutable
class HoverClickTextWidget extends StatelessWidget {
  String text;
  double paddingRight;
  double fontsize;

  HoverClickTextWidget({
    required this.text,
    required this.paddingRight,
    required this.fontsize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(builder: (isHovered) {
      return Padding(
        padding: EdgeInsets.only(right: paddingRight),
        child: GooglePoppinsWidgets(
          text: text,
          fontsize: fontsize,
          color: isHovered ? themeColorGreen : cBlack.withOpacity(0.7),
        ),
      );
    });
  }
}
