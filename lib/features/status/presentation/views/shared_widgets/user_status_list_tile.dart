import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';

import '../../../data/models/others_status_model.dart';
import 'package:mentoracademyproject/core/shared_widgets/image_circular_avatar.dart';
import 'status_border.dart';

class UserStatusListTile extends StatelessWidget {
  UserStatusListTile({super.key, required this.userModel});

  OthersStatusModel userModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){}, //! To do: show status
      child: ListTile(
        leading: Stack(clipBehavior: Clip.none,
          children: [
          Positioned(
          top: -4,
          left: -15,
          child: StatusBorder(borderColor: userModel.seen? Colors.grey : AppColors.primaryColor),
        ),
            ImageCircularAvatar(image: userModel.image,),]),
        title: Text(userModel.name,
            style: AppStyles.font28DarkBlackBold.copyWith(fontSize: 22)),
        subtitle: Text("${userModel.date.day}, ${userModel.date.hour}:${userModel.date.minute}",
            style: AppStyles.font16DarkGreyRegular
                .copyWith(color: AppColors.darkGrey)),
      ),
    );
  }
}