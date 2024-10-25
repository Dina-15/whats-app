import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import 'package:mentoracademyproject/features/home/presentation/view_model/cubits/logout_cubit/logout_cubit.dart';
import 'chat_list.dart';
import 'logout_alert_dialog.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            " WhatsApp",
            style: AppStyles.font28DarkBlackBold.copyWith(fontSize: 24),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              iconSize: 27,
              color: Colors.black,
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert_rounded),
              iconSize: 27,
              color: Colors.white,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'Profile',
                    child: Text('Profile', style: AppStyles.font14Black),
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
          bottom: TabBar(tabs: [
            Tab(
              child: Text(
                "Chats",
                style: AppStyles.font18Black,
              ),
            ),
            Tab(
              child: Text(
                "Status",
                style: AppStyles.font18Black,
              ),
            ),
            Tab(
              child: Text(
                "Calls",
                style: AppStyles.font18Black,
              ),
            )
          ]),
        ),
        body: TabBarView(
          children: [
            Center(child: ChatList()),
            const Center(child: Text('Search Page')),
            const Center(child: Text('Settings Page')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.message,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
