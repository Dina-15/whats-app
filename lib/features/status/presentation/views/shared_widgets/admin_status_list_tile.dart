import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import 'package:mentoracademyproject/core/utils/constants/app_assets.dart';
import 'package:mentoracademyproject/core/shared_widgets/image_circular_avatar.dart';
import 'add_icon_badge.dart';
import 'status_border.dart';

class AdminStatusListTile extends StatelessWidget {
  const AdminStatusListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, //! To do: add  new admin status
      child: ListTile(
        leading: const Stack(clipBehavior: Clip.none, children: [
          Positioned(
            top: -4,
            left: -15,
            child: StatusBorder(borderColor: Colors.grey),
          ),
          ImageCircularAvatar(
            image: AppAssets.profileImage,
          ),
          Positioned(top: 35, left: 34, child: AddIconBadge())
        ]),
        title: Text(
          "My Status",
          style: AppStyles.font28DarkBlackBold.copyWith(fontSize: 22),
        ),
        subtitle: Text("Tab to add status update",
            style: AppStyles.font16DarkGreyRegular),
      ),
    );
  }
}