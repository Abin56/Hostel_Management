import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/fonts/google_monstre.dart';
import 'package:host_management/hostel_Management/view/fonts/google_poppins.dart';
import 'package:host_management/hostel_Management/view/pages/home/dasboard/dashboard.dart';
import 'package:host_management/hostel_Management/view/pages/home/notice_Board/notice_board.dart';
import 'package:host_management/hostel_Management/view/pages/home/school_deatils_BAr/schools_details_bar.dart';
import 'package:host_management/hostel_Management/view/pages/home/today_calender/today_calender.dart';
import 'package:host_management/hostel_Management/view/pages/home/widget/hover_clicktext_widget.dart';
import 'package:popover/popover.dart';

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
              Container(
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
                                        padding:
                                            const EdgeInsets.only(left: 10),
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
                                              onTap: () {
                                                // showPopover(
                                                //   context: context,
                                                //   bodyBuilder: (context) =>
                                                //       const ListItems(),
                                                //   onPop: () => print(
                                                //       'Popover was popped!'),
                                                //   direction:
                                                //       PopoverDirection.right,
                                                //   width: 200,
                                                //   height: 400,
                                                //   arrowHeight: 15,
                                                //   arrowWidth: 30,
                                                // );
                                              },
                                              child: GooglePoppinsWidgets(
                                                text: dasboardText[index],
                                                fontWeight: FontWeight.bold,
                                                fontsize: 14,
                                                color: const Color.fromARGB(
                                                    255, 0, 38, 161),
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
                // child: Container(
                //   color: Colors.red,
                //   height: 100,
                //   // width: double.infinity,
                //   // child:

                // ),
              ),
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
                      DashBoradStatusWidget(response: response),
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

class PopoverExample extends StatelessWidget {
  const PopoverExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Popover Example')),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Button(),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      child: GestureDetector(
        child: const Center(child: Text('Click Me')),
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const ListItems(),
            onPop: () => print('Popover was popped!'),
            direction: PopoverDirection.bottom,
            width: 200,
            height: 400,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute<SecondRoute>(
                    builder: (context) => const SecondRoute(),
                  ),
                );
            },
            child: Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry A')),
            ),
          ),
          const Divider(),
          Container(
            height: 50,
            color: Colors.amber[200],
            child: const Center(child: Text('Entry B')),
          ),
          const Divider(),
          Container(
            height: 50,
            color: Colors.amber[300],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
