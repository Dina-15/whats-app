import 'package:mentoracademyproject/core/utils/constants/app_assets.dart';

import '../models/others_status_model.dart';

class OthersData {
  static List<OthersStatusModel> unSeenUserStatusList = [
    OthersStatusModel(
      seen: false,
      image: AppAssets.profileImage,
      name: "Salma",
      date: DateTime.now(),
    ),
    OthersStatusModel(
      seen: false,
      image: AppAssets.profileImage,
      name: "Ahmed",
      date: DateTime.now(),
    ),
    OthersStatusModel(
      seen: false,
      image: AppAssets.profileImage,
      name: "Sara",
      date: DateTime.now(),
    ),
    OthersStatusModel(
      seen: false,
      image: AppAssets.profileImage,
      name: "Hala",
      date: DateTime.now(),
    ),
    OthersStatusModel(
      seen: false,
      image: AppAssets.profileImage,
      name: "Rana",
      date: DateTime.now(),
    ),
  ];

  static List<OthersStatusModel> seenUserStatusList = [
    OthersStatusModel(
      seen: true,
      image: AppAssets.profileImage,
      name: "Laila",
      date: DateTime.now(),
    ),
    OthersStatusModel(
      seen: true,
      image: AppAssets.profileImage,
      name: "Fatma",
      date: DateTime.now(),
    ),
    OthersStatusModel(
      seen: true,
      image: AppAssets.profileImage,
      name: "Mena",
      date: DateTime.now(),
    ),
  ];
}
