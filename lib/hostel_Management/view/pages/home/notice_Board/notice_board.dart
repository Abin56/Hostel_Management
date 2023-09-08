import 'package:flutter/material.dart';
import 'package:host_management/hostel_Management/view/fonts/google_poppins.dart';

import '../../../colors/colors.dart';

class NoticeBoardWidget extends StatelessWidget {
  const NoticeBoardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        decoration: BoxDecoration(
            border:
                Border.all(color: const Color.fromARGB(255, 108, 174, 228))),
        height: 200,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              color: const Color.fromARGB(255, 108, 174, 228),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 05),
                child: GooglePoppinsWidgets(
                    text: '📅 Notice Board', color: cBlack, fontsize: 13),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      color: const Color.fromARGB(255, 177, 236, 179),
                      height: 40,
                      width: double.infinity,
                      child: const Center(
                        child: Text('21 st Onam Celebration'),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 05,
                    );
                  },
                  itemCount: 2),
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GooglePoppinsWidgets(
                        text: 'Top 4 Notice', fontsize: 12),
                  ),
                  const Spacer(),
                  GooglePoppinsWidgets(text: 'View All ', fontsize: 12),
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 15,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
