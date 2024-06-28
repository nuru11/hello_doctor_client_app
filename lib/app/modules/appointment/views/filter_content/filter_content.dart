import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/appointment/controllers/appointment_controller.dart';

class FilterContent extends StatelessWidget {
  FilterContent({super.key, required this.controller});
  final AppointmentController controller;

  final List<String> options = [
    'Appointment Date',
    'Order Date',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 300,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(children: [
              Text(
                'Filter'.tr,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close)),
            ]),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  'Sort by'.tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => ChipsChoice<int>.single(
                        value: controller.sortByIndex.value,
                        onChanged: controller.sortByIndex,
                        choiceItems: C2Choice.listFrom<int, String>(
                          source: options,
                          value: (i, v) => i,
                          label: (i, v) => v,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Cancel"))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            controller
                                .filterSortBy(controller.sortByIndex.value);
                            Get.back();
                          },
                          child: Text("Apply")))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
