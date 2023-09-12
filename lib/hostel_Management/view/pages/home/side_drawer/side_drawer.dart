import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/fonts/google_poppins.dart';
import 'package:host_management/hostel_Management/view/pages/home/side_drawer/functions/clicked_functions.dart';

class SideDrawerWidget extends StatelessWidget {
  const SideDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: 300,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GooglePoppinsWidgets(
                text: '🛠️  Management System',
                fontsize: 18,
                color: cBlack,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: SizedBox(
                  height: 800,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 04),
                          child: Container(
                            height: 35,
                            color: themeColorGreen.withOpacity(0.2),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    dashBoardIcons[index],
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      roomsClickedFunction(
                                          context, index); // Romms Management
                                      rulesClickedFunction(
                                          context, index); // Rules Management

                                      hostelFeesPage(
                                          context, index); // Hostel Fees
                                    },
                                    child: GooglePoppinsWidgets(
                                      text: dasboardText[index],
                                      fontWeight: FontWeight.bold,
                                      fontsize: 14,
                                      color:
                                          const Color.fromARGB(255, 0, 38, 161),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: dasboardText.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> dasboardText = [
  'Attendence',
  'Food Manage',
  'Rooms Manage',
  'Leave Requests',
  'Visitors Pass',
  'Students Manage',
  'Students Payment',
  'Employee Manage',
  'Bill Manage',
  'Notice Board',
  'Settings',
  'Rules',
];
List<IconData> dashBoardIcons = [
  Icons.format_list_numbered_sharp,
  Icons.no_food_outlined,
  Icons.bed_sharp,
  Icons.mail,
  Icons.confirmation_number_outlined,
  Icons.people,
  Icons.attach_money_outlined,
  Icons.people,
  Icons.receipt_long,
  Icons.keyboard_alt_outlined,
  Icons.settings,
  Icons.gavel,
];
