class OthersChatModel {
  final String image;
  final String name;
  final String? lastMessage;
  final DateTime date;
  final int? notifications;

  OthersChatModel({required this.date, this.notifications, required this.image, required this.name, this.lastMessage});
}