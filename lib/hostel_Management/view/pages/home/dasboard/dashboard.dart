import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/fonts/google_monstre.dart';
import 'package:host_management/hostel_Management/view/pages/home/widget/appBar.dart';

class DashBoradStatusWidget extends StatelessWidget {
  const DashBoradStatusWidget({
    super.key,
    required this.response,
  });

  final String response;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: response == 'tablet' ? 400 : 140,
      width: double.infinity,
      child: response == 'mobile' || response == 'tablet'
          ? GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: dashboardText.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 70, right: 10),
                  elevation: 5.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          color: dashboardColors[index],
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  dasboardIcons[index],
                                  color: cWhite,
                                  size: 60,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GoogleMonstserratWidgets(
                                      overflow: TextOverflow.fade,
                                      text: '289',
                                      fontsize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: cWhite,
                                    ),
                                    GoogleMonstserratWidgets(
                                      overflow: TextOverflow.visible,
                                      text: dashboardText[index],
                                      fontsize: 13,
                                      color: cWhite,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            color: dashboardColors[index],
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    dasboardIcons[index],
                                    color: cWhite,
                                    size: 60,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GoogleMonstserratWidgets(
                                        text: '289',
                                        fontsize: 23,
                                        fontWeight: FontWeight.w500,
                                        color: cWhite,
                                      ),
                                      GoogleMonstserratWidgets(
                                        text: dashboardText[index],
                                        fontsize: 15,
                                        // fontWeight: FontWeight.w500,
                                        color: cWhite,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemCount: dashboardText.length),
            ),
    );
  }
}
