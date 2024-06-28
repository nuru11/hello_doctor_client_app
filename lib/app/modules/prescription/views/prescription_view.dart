import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/utils/timeformat.dart';

import '../controllers/prescription_controller.dart';

class PrescriptionView extends GetView<PrescriptionController> {
  const PrescriptionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription'.tr),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: controller.obx(
            (listPrescription) {
              return ListView.builder(
                itemCount: listPrescription?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Prescription'),
                      subtitle: Text(TimeFormat()
                          .formatDate(listPrescription![index].createdAt)),
                      leading: Icon(Icons.list),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        // do something when the list tile is tapped
                        Get.defaultDialog(
                          title: 'Detail Prescription',
                          content: Text(
                              listPrescription[index].prescription.toString()),
                          textConfirm: 'Ok',
                          confirmTextColor: Colors.white,
                          onConfirm: () {
                            Get.back();
                          },
                        );
                      },
                    ),
                  );
                },
              );
            },
            onLoading: CircularProgressIndicator(),
            onError: (error) => Center(
              child: Center(child: Text(error.toString())),
            ),
            onEmpty: Center(
              child: Text('No Prescription Found'),
            ),
          ),
        ),
      ),
    );
  }
}
