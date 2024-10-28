import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';

class AppTabBar extends StatefulWidget implements PreferredSizeWidget {
  const AppTabBar({super.key});

  @override
  State<AppTabBar> createState() => _AppTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(50.0.h);
}

class _AppTabBarState extends State<AppTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorColor: AppColors.primaryColor,
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(
            child: Text(
              "Chats",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Tab(
            child: Text(
              "Status",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Tab(
            child: Text(
              "Calls",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
          )
        ]);
  }
}