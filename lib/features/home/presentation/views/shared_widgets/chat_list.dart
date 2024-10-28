import 'package:flutter/material.dart';
import 'package:mentoracademyproject/features/home/data/models/others_chat_model.dart';
import 'package:mentoracademyproject/features/home/presentation/views/shared_widgets/user_chat_list_tile.dart';

import '../../../data/repo/others_list_tile_data.dart';

class ChatList extends StatelessWidget {
  ChatList({super.key});

  List<OthersChatModel> usersChats = OthersListTileData.usersList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) => UserChatListTile(
        userModel: usersChats[index],
      ),
    );
  }
}