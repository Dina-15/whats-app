import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/helpers/spacing.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import '../shared_widgets/calls_list_view.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 8),
      child: ListView(
        children: [
          Text("    Recent", style: AppStyles.font16DarkGreyRegular,),
          verticalSpace(5),
          const CallsListView(),
        ],
      ),
    );
  }
}