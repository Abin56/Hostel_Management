import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/hostel_fee_create_provider.dart';
import 'hostel_fee_update_page.dart';
import 'widgets/hostel_fee_leftside_widget.dart';

class HostelFeeShowPage extends StatelessWidget {
  const HostelFeeShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            child: HostelFeeLeftSideWidget(),
          ),
          Expanded(
            child: StreamBuilder(
                stream: Provider.of<HostelFeeCreateProvider>(
                  context,
                  listen: false,
                ).fetchAllHostelFees(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HostelFeeUpdatePage(
                                data: snapshot.data![index]),
                          )),
                          child: Card(
                            child: ListTile(
                              title:
                                  Text(snapshot.data?[index].feesTitle ?? ""),
                              subtitle: Text(snapshot.data?[index].paymentAmount
                                      .toString() ??
                                  ""),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
