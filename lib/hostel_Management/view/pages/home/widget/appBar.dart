import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/fonts/google_monstre.dart';
import 'package:host_management/hostel_Management/view/pages/home/dasboard/dashboard.dart';
import 'package:host_management/hostel_Management/view/pages/home/notice_Board/notice_board.dart';
import 'package:host_management/hostel_Management/view/pages/home/school_deatils_BAr/schools_details_bar.dart';
import 'package:host_management/hostel_Management/view/pages/home/side_drawer/side_drawer.dart';
import 'package:host_management/hostel_Management/view/pages/home/today_calender/today_calender.dart';
import 'package:host_management/hostel_Management/view/pages/home/widget/hover_clicktext_widget.dart';

class ResAppBarWidget extends StatelessWidget {
  String response;
  DateTime todayController = DateTime.now();
  ResAppBarWidget({
    required this.response,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 800,
      width: double.infinity,
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            height: 60,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GoogleMonstserratWidgets(
                        text: "Hostel ",
                        fontsize: 20,
                        color: cBlack,
                        fontWeight: FontWeight.bold,
                      ),
                      GoogleMonstserratWidgets(
                        text: "Management ",
                        fontsize: 19,
                        color: themeColorGreen,
                        fontWeight: FontWeight.bold,
                      ),
                      response == 'desktop'
                          ? SchoolDetailsBarWidget(
                              response: 'desktop',
                            )
                          : const Text(''),
                      const Spacer(),
                      HoverClickTextWidget(
                          text: 'Home', paddingRight: 22, fontsize: 15),
                      HoverClickTextWidget(
                          text: 'Rooms', paddingRight: 22, fontsize: 15),
                      HoverClickTextWidget(
                          text: '🔍 Search', paddingRight: 22, fontsize: 15),
                      HoverClickTextWidget(
                          text: 'Logout', paddingRight: 22, fontsize: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
          response == 'tablet'
              ? Container(
                  color: cWhite,
                  height: 50,
                  width: 200,
                  child: SchoolDetailsBarWidget(
                    response: 'tablet',
                  ))
              : const SizedBox(
                  height: 0,
                ),
          Row(
            children: [
              const SideDrawerWidget(), // Side Drawer.....
              Expanded(
                child: SizedBox(
                  height: 800,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GoogleMonstserratWidgets(
                              text: "Dash Board",
                              fontsize: 30,
                              color: themeColorBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      DashBoradStatusWidget(
                          response: response), // Dash Boared.....
                      Expanded(
                        child: SizedBox(
                          // height: 200,
                          width: double.infinity,

                          child: ListView(
                            children: [
                              response == 'desktop'
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const NoticeBoardWidget(), ////     Notice
                                        TodayCalenderWidget(
                                            todayController:
                                                todayController) // Calender>>>
                                      ],
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          const NoticeBoardWidget(), ////     Notice
                                          TodayCalenderWidget(
                                              todayController:
                                                  todayController) // Calender>>>
                                        ],
                                      ),
                                    )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

List<String> dashboardText = [
  'Total Students',
  'Current Stundets',
  'Total Rooms',
  "Today Meals",
];
List<Color> dashboardColors = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.red,
];
List<IconData> dasboardIcons = [
  Icons.people,
  Icons.people_alt_outlined,
  Icons.home_work_outlined,
  Icons.fastfood_rounded
];
List<Widget> dasboardContainer = [
  Container(
    height: 100,
    width: 250,
    color: Colors.red,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.people,
                color: cWhite,
              ),
              GoogleMonstserratWidgets(
                text: '289',
                fontsize: 18,
                color: cWhite,
              )
            ],
          ),
        )
      ],
    ),
  ),
  Container(
    height: 100,
    width: 250,
    color: Colors.amber,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.people,
                color: cWhite,
              ),
              GoogleMonstserratWidgets(
                text: '289',
                fontsize: 18,
                color: cWhite,
              )
            ],
          ),
        )
      ],
    ),
  ),
  Container(
    height: 100,
    width: 250,
    color: Colors.orange,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.people,
                color: cWhite,
              ),
              GoogleMonstserratWidgets(
                text: '289',
                fontsize: 18,
                color: cWhite,
              )
            ],
          ),
        )
      ],
    ),
  ),
  Container(
    height: 100,
    width: 250,
    color: Colors.green,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.people,
                color: cWhite,
              ),
              GoogleMonstserratWidgets(
                text: '289',
                fontsize: 18,
                color: cWhite,
              )
            ],
          ),
        )
      ],
    ),
  ),
];
