import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/fonts/google_poppins.dart';
import 'package:host_management/hostel_Management/view/pages/home/side_drawer/functions/room_management/room_details.dart';
import 'package:host_management/hostel_Management/view/widgets/responsive/responsive.dart';

/// Romms
roomsClickedFunction(BuildContext context, int index) {
  if (index == 2) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              GooglePoppinsWidgets(text: 'Manage Rooms', fontsize: 18),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: 30,
                      width: 180,
                      decoration: BoxDecoration(
                        border: Border.all(color: cBlack),
                      ),
                      child: Center(
                        child: GooglePoppinsWidgets(
                          text: '+ Add Floors',
                          fontsize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 300,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: cBlack),
                            ),
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 04),
                                    child: Container(
                                      height: 35,
                                      color: themeColorGreen.withOpacity(0.1),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.domain,
                                              size: 12,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () async {},
                                              child: GooglePoppinsWidgets(
                                                text: 'Floor ${index + 1}',
                                                fontWeight: FontWeight.bold,
                                                fontsize: 11,
                                                color: const Color.fromARGB(
                                                    255, 31, 31, 31),
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
                                itemCount: 10),
                          ),
                          Expanded(
                            child: Container(
                              height: 300,
                              // width: 300,
                              decoration: BoxDecoration(
                                color: themeColorBlue.withOpacity(0.1),
                                border: Border.all(color: cBlack),
                              ),
                              child: GridView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: 10,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            ResponsiveWebSite.isMobile(context)
                                                ? 2
                                                : 3),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      showRoomDetailsfunction(context);
                                    },
                                    child: Card(
                                      // color: themeColorGreen,
                                      margin: const EdgeInsets.only(
                                          bottom: 10, right: 06),
                                      elevation: 5.0,
                                      child: Center(
                                          child: GooglePoppinsWidgets(
                                        text: 'Rooms',
                                        fontsize: 11,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
