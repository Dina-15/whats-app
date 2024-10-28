import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';

class AppTabBar extends StatefulWidget implements PreferredSizeWidget {
  const AppTabBar({super.key});

  @override
  State<AppTabBar> createState() => _AppTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _AppTabBarState extends State<AppTabBar> {
  @override
  Widget build(BuildContext context) {
    return const TabBar(
        indicatorColor: AppColors.primaryColor,
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(
            child: Text(
              "Chats",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Tab(
            child: Text(
              "Status",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Tab(
            child: Text(
              "Calls",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          )
        ]);
  }
}
