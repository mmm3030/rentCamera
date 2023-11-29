import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/values/text_styles.dart';
import 'package:rent_camera/app/modules/contact/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Coming soon',
          style: h5,
        ),
      ),
    );
  }
}
