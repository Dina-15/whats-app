import 'package:flutter/material.dart';

import '../../../data/models/others_calls_model.dart';
import '../../../data/repo/others_data.dart';
import 'user_call_list_tile.dart';

class CallsListView extends StatelessWidget {
  const CallsListView({super.key});

  @override
  Widget build(BuildContext context) {

    final List<OthersCallsModel> callsList =
        OthersData.callsList;

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: callsList.length,
        itemBuilder: (context, index) =>
            UserCallListTile(userModel: callsList[index]));
  }
}