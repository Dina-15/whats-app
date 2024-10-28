import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/shared_widgets/image_circular_avatar.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import 'package:mentoracademyproject/features/home/data/models/others_chat_model.dart';

import 'messages_count_badge.dart';

class UserChatListTile extends StatelessWidget {
  UserChatListTile({super.key, required this.userModel});

  OthersChatModel userModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageCircularAvatar(
        image: userModel.image,
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
            style: AppStyles.font14LightGray
                .copyWith(color: AppColors.darkGrey, fontSize: 12)
                .copyWith(color: AppColors.darkGrey),
          ),
          MessagesCountBadge(count: userModel.notifications,),
        ],
      ),
    );
  }
}
