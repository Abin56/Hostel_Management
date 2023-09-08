import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/pages/drawer/drawer.dart';
import 'package:host_management/hostel_Management/view/pages/home/school_deatils_BAr/schools_details_bar.dart';
import 'package:host_management/hostel_Management/view/pages/home/widget/appBar.dart';
import 'package:host_management/hostel_Management/view/widgets/responsive/responsive.dart';

import 'home/home_screeen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWebSite(
        mobile: HomeScreen(
          respones: 'mobile',
          drawer: Drawer(
            surfaceTintColor: cBlack,
            backgroundColor: cWhite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HeaderDrawer(),
                  MyDrawerList(context),
                ],
              ),
            ),
          ),
        ),
        tablet: Scaffold(
          body: ListView(
            children: [
              ResAppBarWidget(
                response: 'tablet',
              ),
              SchoolDetailsBarWidget(
                response: 'tablet',
              )
            ],
          ),
        ),
        desktop: HomeScreen(
            respones: 'desktop',
            appBar: ResAppBarWidget(
              response: 'desktop',
            )),
      ),
    );
  }
}
