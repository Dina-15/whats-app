import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoracademyproject/core/helpers/spacing.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import '../shared_widgets/admin_status_list_tile.dart';
import '../shared_widgets/others_status_list.dart';
import '../shared_widgets/viewed_updates_list_builder.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, left: 8.w),
      child: ListView(
        children: [
          const AdminStatusListTile(),
          verticalSpace(15),
          Text(
            "   Recent Updates",
            style: AppStyles.font16DarkGreyRegular,
          ),
          verticalSpace(10),
          const OthersStatusList(),
          verticalSpace(15),
          Text(
            "   Viewed Updates",
            style: AppStyles.font16DarkGreyRegular,
          ),
          verticalSpace(10),
          const ViewedUpdatesListBuilder(),
        ],
      ),
    );
  }
}