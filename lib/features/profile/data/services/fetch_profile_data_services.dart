import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FetchProfileDataServices {
  static final ImagePicker _picker = ImagePicker();
  String? imageURL;

  static Future<File?> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  static Future<String?> uploadImage(File? image) async {
    try {
      String fileName = 'profile_images/${DateTime.now().toString()}.png';
      final storageRef = FirebaseStorage.instance.ref(fileName);
      await storageRef.putFile(image!);
      return await storageRef.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  static Future<String?> fetchImageURL() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
          .instance
          .collection("users")
          .doc('JqcKeQmrjKUVLevQgbRl')
          .get();
      return doc.data()?['profile image'];
    } catch (e) {
      print("Error fetching image URL: $e");
    }
    return null;
  }
  static Future<String?> fetchUserName() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
          .instance
          .collection("users")
          .doc('JqcKeQmrjKUVLevQgbRl')
          .get();
      return doc.data()?['user name'];
    } catch (e) {
      print("Error fetching name: $e");
    }
    return null;
  }
  static Future<String?> fetchUserPhone() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
          .instance
          .collection("users")
          .doc('JqcKeQmrjKUVLevQgbRl')
          .get();
      return doc.data()?['user phone'];
    } catch (e) {
      print("Error fetching phone: $e");
    }
    return null;
  }
}
