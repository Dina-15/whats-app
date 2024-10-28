import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mentoracademyproject/core/helpers/spacing.dart';
import 'package:mentoracademyproject/core/shared_widgets/image_circular_avatar.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import 'package:mentoracademyproject/features/home/data/models/others_chat_model.dart';

import 'messages_count_badge.dart';

class UserChatListTile extends StatelessWidget {
  UserChatListTile({super.key, required this.userModel});

  OthersChatModel userModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, //! To do: navigate to user chat screen
      child: ListTile(
        leading: ImageCircularAvatar(
          image: userModel.image,
        ),
        title: Text(userModel.name,
            style: AppStyles.font28DarkBlackBold.copyWith(fontSize: 22.sp)),
        subtitle: Text(userModel.lastMessage ?? "",
            style: AppStyles.font16DarkGreyRegular),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(" ${DateFormat('hh:mm a').format(userModel.date)}",
                style:
                    AppStyles.font16DarkGreyRegular.copyWith(fontSize: 14.sp)),
            verticalSpace(5),
            MessagesCountBadge(
              count: userModel.notifications,
            ),
          ],
        ),
      ),
    );
  }
}
