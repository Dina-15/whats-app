import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoracademyproject/core/routing/routes.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import 'package:mentoracademyproject/features/home/presentation/view_model/cubits/logout_cubit/logout_cubit.dart';
import 'package:mentoracademyproject/features/home/presentation/views/shared_widgets/chat_floating_action_button.dart';
import 'package:mentoracademyproject/core/shared_widgets/app_tab_bar_view.dart';
import 'package:mentoracademyproject/core/shared_widgets/app_tab_bar.dart';
import 'logout_alert_dialog.dart';
import 'search_icon.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, left: 8.w),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              " WhatsApp",
              style: AppStyles.font28DarkBlackBold.copyWith(fontSize: 24.sp),
            ),
            actions: [
              const SearchIcon(),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert_rounded),
                iconSize: 27.r,
                color: Colors.white,
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'Profile',
                      child: Text('Profile', style: AppStyles.font14Black),
                      onTap: (){
                        Navigator.pushNamed(context, Routes.profileScreen);
                      },
                    ),
                    PopupMenuItem<String>(
                      value: 'Log out',
                      child: Text('Log out', style: AppStyles.font14Black),
                      onTap: () async {
                        String? confirmed =
                            await LogoutAlertDialog().ShowLogoutDialog(context);
                        if (confirmed == 'true') {
                          context.read<LogoutCubit>().logoutUser();
                        }
                      },
                    ),
                  ];
                },
              ),
            ],
            bottom: const AppTabBar(),
          ),
          body: const AppTabBarView(),
          floatingActionButton: const ChatFloatingActionButton(),
        ),
      ),
    );
  }
}