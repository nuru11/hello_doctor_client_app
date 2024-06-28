import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_prescription_controller.dart';

class ListPrescriptionView extends GetView<ListPrescriptionController> {
  const ListPrescriptionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListPrescriptionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListPrescriptionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
