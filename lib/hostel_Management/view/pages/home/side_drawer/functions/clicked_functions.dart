import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/fonts/google_poppins.dart';
import 'package:host_management/hostel_Management/view/widgets/responsive/responsive.dart';

/// Romms
roomsClickedFunction(BuildContext context, int index) {
  if (index == 0) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: GooglePoppinsWidgets(text: 'Manage Rooms', fontsize: 18),
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
                                  return Card(
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

rulesClickedFunction(BuildContext context, int index) async {
  if (index == 11) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: GooglePoppinsWidgets(
            text: 'Rules Management',
            fontsize: 15,
            fontWeight: FontWeight.w600,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 400,
                      decoration:
                          BoxDecoration(border: Border.all(color: cBlack)),
                      child: Center(
                          child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: '   Enter your rules here....'),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: cBlack),
                            ),
                            child: Center(
                              child: GooglePoppinsWidgets(
                                text: '+ Add Rules',
                                fontsize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 300,
                        width: 400,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Container(
                                width: double.infinity,
                                height: 35,
                                color: themeColorGreen.withOpacity(0.1),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: cBlack,
                                      radius: 06,
                                    ),
                                    const SizedBox(
                                      width: 05,
                                    ),
                                    GooglePoppinsWidgets(
                                        text: 'Rules${index + 1}', fontsize: 12)
                                  ],
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
