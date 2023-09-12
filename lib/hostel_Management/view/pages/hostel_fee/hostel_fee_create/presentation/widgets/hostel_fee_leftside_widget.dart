import 'package:flutter/material.dart';

import '../hoste_fee_create_page.dart';

class HostelFeeLeftSideWidget extends StatelessWidget {
  const HostelFeeLeftSideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: adminePrimayColor,
      child: Center(
        child: Stack(children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Hostel Fee',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}