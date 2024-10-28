import 'package:flutter/material.dart';
import 'package:mentoracademyproject/features/status/data/models/others_status_model.dart';
import 'package:mentoracademyproject/features/status/data/repo/others_data.dart';
import 'user_status_list_tile.dart';

class OthersStatusList extends StatefulWidget {
  OthersStatusList({super.key});

  @override
  State<OthersStatusList> createState() => _OthersStatusListState();
}

class _OthersStatusListState extends State<OthersStatusList> {
  @override
  Widget build(BuildContext context) {

    final List<OthersStatusModel> unViewedUsersStatus =
        OthersData.unSeenUserStatusList;

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: unViewedUsersStatus.length,
        itemBuilder: (context, index) =>
            UserStatusListTile(userModel: unViewedUsersStatus[index]));
  }
}