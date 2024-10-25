class UserModel {
  final String image;
  final String name;
  final String? lastMessage;
  final DateTime date;
  final int? notifications;

  UserModel({required this.date, this.notifications, required this.image, required this.name, this.lastMessage});
}