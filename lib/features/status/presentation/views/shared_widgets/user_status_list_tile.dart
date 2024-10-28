import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
            style: AppStyles.font28DarkBlackBold.copyWith(fontSize: 22.sp)),
        subtitle: Text("${userModel.date.year == DateTime.now().year && userModel.date.month == DateTime.now().month && userModel.date.day == DateTime.now().day ? "Today" : DateFormat('EEEE').format(userModel.date)},"
            " ${DateFormat('hh:mm a').format(userModel.date)}",
            style: AppStyles.font16DarkGreyRegular),
      ),
    );
  }
}