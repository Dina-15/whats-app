import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import '../../../data/models/others_calls_model.dart';
import 'package:mentoracademyproject/core/shared_widgets/image_circular_avatar.dart';

class UserCallListTile extends StatelessWidget {
  UserCallListTile({super.key, required this.userModel});

  OthersCallsModel userModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(clipBehavior: Clip.none, children: [
        ImageCircularAvatar(
          image: userModel.image,
        ),
      ]),
      title: Text(
        userModel.name,
        style: AppStyles.font28DarkBlackBold.copyWith(
          fontSize:
              22.sp, //! To do: change text color and add icon call mad regards call status
        ),
      ),
      subtitle: Text(
          "${userModel.date.year == DateTime.now().year && userModel.date.month == DateTime.now().month && userModel.date.day == DateTime.now().day ? "Today" : DateFormat('EEEE').format(userModel.date)},"
          " ${DateFormat('hh:mm a').format(userModel.date)}",
          style: AppStyles.font16DarkGreyRegular),
      trailing: IconButton(
          onPressed: () {}, //! To DO: navigate to call handler
          icon: Icon(
            Icons.call,
            size: 25.r,
            color: AppColors.darkGrey,
          )),
    );
  }
}
