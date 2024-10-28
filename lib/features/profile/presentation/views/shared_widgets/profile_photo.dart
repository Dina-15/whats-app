import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../data/services/fetch_profile_data_services.dart';
import 'mod_icon_badge.dart';
import 'profile_image_circle_avatar.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({super.key});

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  File? _image;
  bool _isUploading = false;
  String? imageURL;
@override
  initState() {
    super.initState();
    fetchImageURL();
  }
  Future<void> fetchImageURL() async {
    imageURL = await FetchProfileDataServices.fetchImageURL();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ProfileImageCircleAvatar(imageURL: imageURL),
        Positioned(
          top: 100,
          left: 95,
          child: SizedBox(
            height: 42,
            width: 42,
            child: InkWell(
              onTap: () async {
                _image = await FetchProfileDataServices.pickImage();
                if (_image != null) {
                  setState(() {
                    _isUploading = true;
                  });
                  imageURL = await FetchProfileDataServices.uploadImage(_image);
                  if (imageURL != null) {
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc('JqcKeQmrjKUVLevQgbRl')
                        .update({'profile image': imageURL});
                    setState(() {
                      _isUploading = false;
                    });
                  }
                }
              },
              child: const ModIconBadge(),
            ),
          ),
        ),
        if (_isUploading)
          const Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}