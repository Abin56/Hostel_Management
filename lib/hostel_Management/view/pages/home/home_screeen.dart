// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/fonts/google_monstre.dart';
import 'package:host_management/hostel_Management/view/pages/home/dasboard/dashboard.dart';
import 'package:host_management/hostel_Management/view/pages/home/notice_Board/notice_board.dart';
import 'package:host_management/hostel_Management/view/pages/home/school_deatils_BAr/schools_details_bar.dart';
import 'package:host_management/hostel_Management/view/pages/home/today_calender/today_calender.dart';

class HomeScreen extends StatelessWidget {
  DateTime todayController = DateTime.now();
  String respones;
  Widget? drawer;

  Widget? appBar;

  HomeScreen({this.drawer, this.appBar, required this.respones, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      appBar: appBar == null
          ? AppBar(
              centerTitle: false,
              backgroundColor: cBlack,
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                GoogleMonstserratWidgets(
                  text: "Hostel ",
                  fontsize: 18,
                  color: cWhite,
                  fontWeight: FontWeight.bold,
                ),
                GoogleMonstserratWidgets(
                  text: "Management ",
                  fontsize: 16,
                  color: themeColorGreen,
                  fontWeight: FontWeight.bold,
                ),
              ]),
            )
          : null,
      backgroundColor: themeColorGreen.withOpacity(0.1),
      body: ListView(
        children: [
          respones == 'mobile'
              ? SchoolDetailsBarWidget(
                  response: 'mobile',
                )
              : const SizedBox(
                  height: 0,
                ),
          appBar ??
              Column(
                children: [
                  const SizedBox(
                    height: 370,
                    width: double.infinity,
                    child: DashBoradStatusWidget(response: 'mobile'),
                  ),
                  const NoticeBoardWidget(), ////     Notice
                  TodayCalenderWidget(todayController: todayController)
                ],
              )
        ],
      ),
    );
  }
}
