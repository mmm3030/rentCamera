import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/modules/profile/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('ProfileView'),
      ),
    );
  }
}
