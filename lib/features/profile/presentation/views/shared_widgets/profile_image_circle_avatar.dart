import 'package:flutter/material.dart';

class ProfileImageCircleAvatar extends StatelessWidget {
  const ProfileImageCircleAvatar({super.key, this.imageURL});

  final String? imageURL;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: imageURL != null
            ? Image.network(
          imageURL!,
          fit: BoxFit.cover,
          height: 200,
          width: 200,
        )
            : const Icon(Icons.account_circle, size: 143),
      ),
    );
  }
}