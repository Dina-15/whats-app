import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoracademyproject/core/helpers/spacing.dart';
import 'package:mentoracademyproject/core/shared_widgets/app_text_form_field.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import 'package:mentoracademyproject/features/profile/presentation/views/shared_widgets/profile_photo.dart';

import '../../../data/services/fetch_profile_data_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userName;
  String? userPhone;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  @override
  initState() {
    super.initState();
    fetchUserData();
  }
  Future<void> fetchUserData() async {
    userName = await FetchProfileDataServices.fetchUserName();
    userPhone = await FetchProfileDataServices.fetchUserPhone();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: AppStyles.font28DarkBlackBold.copyWith(fontSize: 24.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalSpace(20),
                const Center(child: ProfilePhoto()),
                verticalSpace(30),
                Row(
                  children: [
                    horizontalSpace(12),
                    Text(
                      "Name",
                      style: AppStyles.font16DarkGreyRegular,
                    ),
                    const Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                verticalSpace(10),
                AppTextFormField(
                  onSubmitted: (value)async {
                      await FirebaseFirestore.instance.collection("users").doc('JqcKeQmrjKUVLevQgbRl').update({
                        'user name': value,
                    });
                  },
                  hintText: userName??"Name",
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  enabledRadius: 30,
                  fillColor: Colors.white,
                ),
                verticalSpace(30),
                Row(
                  children: [
                    horizontalSpace(12),
                    Text(
                      "Phone",
                      style: AppStyles.font16DarkGreyRegular,
                    ),
                    const Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                verticalSpace(10),
                AppTextFormField(
                  onSubmitted: (value) async{
                     await FirebaseFirestore.instance.collection("users").doc('JqcKeQmrjKUVLevQgbRl').update({
                       'user phone': value
                    });
                  },
                  hintText: userPhone?? "Phone",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  enabledRadius: 30,
                  fillColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
