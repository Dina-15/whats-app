import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import 'package:mentoracademyproject/features/home/data/models/user_model.dart';
import 'package:badges/badges.dart' as badges;

class UserListTile extends StatelessWidget {
  UserListTile({super.key, required this.userModel});

  UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        child: Image.asset(userModel.image),
      ),
      title: Text(userModel.name,
          style: AppStyles.font28DarkBlackBold.copyWith(fontSize: 22)),
      subtitle: Text(userModel.lastMessage ?? "",
          style: AppStyles.font16DarkGreyRegular
              .copyWith(color: AppColors.darkGrey)),
      trailing: Column(
        children: [
          Text(
            "${userModel.date.hour}:${userModel.date.minute}",
            style: AppStyles.font14LightGray.copyWith(color: AppColors.darkGrey, fontSize: 12)
                .copyWith(color: AppColors.darkGrey),
          ),
            badges.Badge(badgeStyle: const badges.BadgeStyle(badgeColor: AppColors.primaryColor),
              showBadge: userModel.notifications!= null,
              position: badges.BadgePosition.center(),
              badgeContent: Text(
                '${userModel.notifications}',
                style: AppStyles.font18Black.copyWith(fontSize: 20, color: Colors.white),
              ),
            )
        ],
      ),
    );
  }
}
