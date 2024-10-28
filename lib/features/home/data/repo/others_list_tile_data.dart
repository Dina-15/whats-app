import 'package:mentoracademyproject/core/utils/constants/app_assets.dart';

import '../models/others_chat_model.dart';

class OthersListTileData {
  static List<OthersChatModel> usersList = [
    OthersChatModel(
        image: AppAssets.profileImage,
        name: "Salma",
        lastMessage: "hi dina",
        date: DateTime.now(),
        notifications: 1),
    OthersChatModel(
        image: AppAssets.profileImage,
        name: "Ahmed",
        lastMessage: "hello!",
        date: DateTime.now(),
        notifications: 2),
    OthersChatModel(
        image: AppAssets.profileImage,
        name: "Sara",
        lastMessage: "ok",
        date: DateTime.now(),
        notifications: 5),
    OthersChatModel(
        image: AppAssets.profileImage,
        name: "Hala",
        lastMessage: "yes",
        date: DateTime.now(),
        notifications: 3),
    OthersChatModel(
      image: AppAssets.profileImage,
      name: "laila",
      lastMessage: "No",
      date: DateTime.now(),
    ),
    OthersChatModel(
      image: AppAssets.profileImage,
      name: "mena",
      lastMessage: "ok",
      date: DateTime.now(),
    ),
  ];
}
