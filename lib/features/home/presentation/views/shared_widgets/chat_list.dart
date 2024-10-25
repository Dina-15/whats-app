import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/utils/constants/app_assets.dart';
import 'package:mentoracademyproject/features/home/data/models/user_model.dart';
import 'package:mentoracademyproject/features/home/presentation/views/shared_widgets/user_list_tile.dart';

class ChatList extends StatelessWidget {
  ChatList({super.key});

  final List<UserModel> usersList = [
    UserModel(
        image: AppAssets.logo,
        name: "Salma",
        lastMessage: "hi dina",
        date: DateTime.now(),
        notifications: 1),
    UserModel(
        image: AppAssets.metaIcon,
        name: "Ahmed",
        lastMessage: "hello!",
        date: DateTime.now(),
        notifications: 2),
    UserModel(
        image: AppAssets.logo,
        name: "Sara",
        lastMessage: "ok",
        date: DateTime.now(),),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => UserListTile(
              userModel: usersList[index],
            ));
  }
}
