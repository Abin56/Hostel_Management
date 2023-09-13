import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/fonts/google_poppins.dart';

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
