import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController countryController = TextEditingController();
  late TextEditingController cityController = TextEditingController();
  late TextEditingController phoneNumber = TextEditingController();
  late TextEditingController addressController = TextEditingController();

  var setPrimaryAddress = false.obs;
}
