import 'package:flutter/material.dart';

import '../../../data/models/others_status_model.dart';
import '../../../data/repo/others_data.dart';
import 'user_status_list_tile.dart';

class ViewedUpdatesListBuilder extends StatefulWidget {
  const ViewedUpdatesListBuilder({super.key});

  @override
  State<ViewedUpdatesListBuilder> createState() => _ViewedUpdatesListBuilderState();
}

class _ViewedUpdatesListBuilderState extends State<ViewedUpdatesListBuilder> {
  @override
  Widget build(BuildContext context) {

    final List<OthersStatusModel> viewedUsersStatus =
    OthersData.seenUserStatusList;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewedUsersStatus.length,
      itemBuilder: (context, index) => UserStatusListTile(
        userModel: viewedUsersStatus[index],
      ),
    );
  }
}