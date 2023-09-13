import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/colors/colors.dart';
import 'package:host_management/hostel_Management/view/fonts/google_poppins.dart';

showRoomDetailsfunction(BuildContext context) async {
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
            GooglePoppinsWidgets(
              text: 'Room 1',
              fontsize: 18,
              fontWeight: FontWeight.w500,
            ),
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
                        text: '+ Add Bed',
                        fontsize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    width: 500,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 04),
                            child: Container(
                              height: 35,
                              color: themeColorGreen.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.bed,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () async {},
                                          child: GooglePoppinsWidgets(
                                            text: 'Bed  ${index + 1}',
                                            fontWeight: FontWeight.bold,
                                            fontsize: 12,
                                            color: const Color.fromARGB(
                                                255, 31, 31, 31),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.people,
                                      size: 12,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () async {},
                                      child: GooglePoppinsWidgets(
                                        text: 'Student ${index + 1}',
                                        fontWeight: FontWeight.bold,
                                        fontsize: 11,
                                        color: const Color.fromARGB(
                                            255, 31, 31, 31),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: index % 2 == 0
                                              ? const Color.fromARGB(
                                                  255, 130, 231, 133)
                                              : const Color.fromARGB(
                                                  255, 255, 93, 81)),
                                      height: 20,
                                      width: 100,
                                      child: Center(
                                        child: GooglePoppinsWidgets(
                                            text: studentsStatus[index],
                                            fontsize: 11),
                                      ),
                                    )
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

List<String> studentsStatus = [
  'Paid',
  'Not paid',
  'Paid',
  'Not paid',
  'Paid',
  'Not paid',
  'Paid',
  'Not paid',
  'Paid',
  'Not paid',
];
