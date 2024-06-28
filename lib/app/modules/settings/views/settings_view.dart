import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/settings/views/settings_item.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'.tr),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              SettingItem(
                  icon: Icons.delete,
                  text: "Delete Account".tr,
                  onTap: () {
                    controller.toDeleteAccount();
                  })
            ],
          ),
        ));
  }
}
