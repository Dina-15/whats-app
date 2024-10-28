import 'package:mentoracademyproject/core/utils/constants/app_assets.dart';

import '../models/others_calls_model.dart';

class OthersData {
  static List<OthersCallsModel> callsList = [
    OthersCallsModel(
      image: AppAssets.profileImage,
      name: "Salma",
      date: DateTime.now(),
    ),
    OthersCallsModel(
      image: AppAssets.profileImage,
      name: "Ahmed",
      date: DateTime.now(),
    ),
    OthersCallsModel(
      image: AppAssets.profileImage,
      name: "Sara",
      date: DateTime.now(),
    ),
    OthersCallsModel(
      image: AppAssets.profileImage,
      name: "Hala",
      date: DateTime.now(),
    ),
    OthersCallsModel(
      image: AppAssets.profileImage,
      name: "Rana",
      date: DateTime.now(),
    ),
  ];
}
