import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import 'package:mentoracademyproject/core/utils/constants/app_assets.dart';
import 'package:mentoracademyproject/core/shared_widgets/image_circular_avatar.dart';
import 'package:mentoracademyproject/core/shared_widgets/app_icon_badge.dart';
import 'status_border.dart';

class AdminStatusListTile extends StatelessWidget {
  const AdminStatusListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, //! To do: add  new admin status
      child: ListTile(
        leading: Stack(clipBehavior: Clip.none, children: [
          const Positioned(
            top: -4,
            left: -15,
            child: StatusBorder(borderColor: Colors.grey),
          ),
          const ImageCircularAvatar(
            image: AppAssets.profileImage,
          ),
          Positioned(
              top: 35,
              left: 40,
              child: SizedBox(
                height: 25.h,
            width: 26.w,
            child: AppIconBadge(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 22.r,
              ),
            ),
          ))
        ]),
        title: Text(
          "My Status",
          style: AppStyles.font28DarkBlackBold.copyWith(fontSize: 22.sp),
        ),
        subtitle: Text("Tab to add status update",
            style: AppStyles.font16DarkGreyRegular),
      ),
    );
  }
}