import 'package:flutter/material.dart';
import 'package:mentoracademyproject/features/calls/presentation/views/ui/calls_screen.dart';
import 'package:mentoracademyproject/features/status/presentation/views/ui/status_screen.dart';

import '../../features/home/presentation/views/shared_widgets/chat_list.dart';

class AppTabBarView extends StatelessWidget {
  const AppTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Center(child: ChatList(),),
        const Center(child: StatusScreen()),
        const Center(child: CallsScreen()),
      ],
    );
  }
}
