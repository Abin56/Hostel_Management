import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/fonts/google_poppins.dart';

class SchoolDetailsBarWidget extends StatelessWidget {
  String response;
  SchoolDetailsBarWidget({
    required this.response,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (response == 'mobile') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GooglePoppinsWidgets(
            text: "Marthoma Higher Secondary School",
            fontsize: 13,
            color: themeColorBlue,
            fontWeight: FontWeight.w600,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GooglePoppinsWidgets(
                text: "Academic Year : 2023 - 2024",
                fontsize: 13,
                color: cBlack,
                fontWeight: FontWeight.w600,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined)),
            ],
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: GooglePoppinsWidgets(
              text: "Marthoma Higher Secondary School",
              fontsize: 13,
              color: themeColorBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                GooglePoppinsWidgets(
                  text: "Academic Year : 2023 - 2024",
                  fontsize: 13,
                  color: cBlack,
                  fontWeight: FontWeight.w600,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined)),
              ],
            ),
          ),
        ],
      );
    }
  }
}