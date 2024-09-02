// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:hallo_doctor_client/app/modules/list_doctor/views/widgets/list_doctor_card.dart';
// import 'package:hallo_doctor_client/app/modules/widgets/empty_list.dart';
// import 'package:hallo_doctor_client/app/utils/constants/constants.dart';

// import '../controllers/list_doctor_controller.dart';

// class ListDoctorView extends GetView<ListDoctorController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Doctor'.tr),
//         centerTitle: true,
//       ),
//       body: Container(
//         child: Column(children: [
//           Expanded(
//             child: controller.obx(
//                 (listDoctor) => ListView.builder(
//                       padding: EdgeInsets.only(top: 10.0),
//                       itemCount: listDoctor!.length,
//                       itemBuilder: (context, index) {
//                         return DoctorCard(
//                             doctorName: listDoctor[index].doctorName ?? '',
//                             doctorCategory: listDoctor[index]
//                                     .doctorCategory!
//                                     .categoryName ??
//                                 '',
//                             doctorPrice: currencySign +
//                                 listDoctor[index].doctorPrice.toString(),
//                             doctorPhotoUrl: listDoctor[index].doctorPicture ??
//                                 'https://t3.ftcdn.net/jpg/00/64/67/80/360_F_64678017_zUpiZFjj04cnLri7oADnyMH0XBYyQghG.jpg',
//                             doctorHospital:
//                                 listDoctor[index].doctorHospital ?? '',
//                             onTap: () {
//                               Get.toNamed('/detail-doctor',
//                                   arguments: listDoctor[index]);
//                             });
//                       },
//                     ),
//                 onEmpty: Center(
//                     child: EmptyList(
//                         msg: 'No Doctor Registered in this Category'.tr))),
//           )
//         ]),
//       ),
//     );
//   }
// }



//////////////////////////////////////////  

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/list_doctor/views/widgets/list_doctor_card.dart';
import 'package:hallo_doctor_client/app/modules/widgets/empty_list.dart';
import 'package:hallo_doctor_client/app/utils/constants/constants.dart';

import '../controllers/list_doctor_controller.dart';

class ListDoctorView extends GetView<ListDoctorController> {
  @override
  Widget build(BuildContext context) {
    var _selectedLang = 'All'.obs; // 'English', 'Amharic', 'Arabic'

    void _toggleLang(String value) {
      _selectedLang.value = value;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor'.tr),
        centerTitle: true,
      ),
      body: Obx( () =>
       Container(
          child: Column(children: [
            Text(_selectedLang.value.toLowerCase(), style: TextStyle(color: Colors.transparent, )),
            // Add the FilterChip widget here
            Padding(
  padding: EdgeInsets.all(16.0),
  child: Obx(() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 8.0,
          children: [
            // Text(_selectedLang.value.toLowerCase()),
            FilterChip(
              label: Text('All'),
              selected: _selectedLang.value == 'All',
              onSelected: (value) => _toggleLang('All'),
            ),
            FilterChip(
              label: Text('English'),
              selected: _selectedLang.value == 'English',
              onSelected: (value) => _toggleLang('English'),
            ),
            FilterChip(
              label: Text('Amharic'),
              selected: _selectedLang.value == 'Amharic',
              onSelected: (value) => _toggleLang('Amharic'),
            ),
            FilterChip(
              label: Text('Afan Oromo'),
              selected: _selectedLang.value == 'Afan Oromo',
              onSelected: (value) => _toggleLang('Afan Oromo'),
            ),
             FilterChip(
              label: Text('Somali'),
              selected: _selectedLang.value == 'Somali',
              onSelected: (value) => _toggleLang('Somali'),
            ),
          ],
        ),
      )),
),
            Expanded(
              child: controller.obx(
                  (listDoctor) => ListView.builder(
                        padding: EdgeInsets.only(top: 10.0),
                        itemCount: listDoctor!.length,
                        itemBuilder: (context, index) {
                          if (listDoctor[index].doctorShortBiography!.toLowerCase().contains(_selectedLang.value.toLowerCase())  && _selectedLang.value.toLowerCase() != "all") {
                           
                            return DoctorCard(
                                doctorName: listDoctor[index].doctorName ?? '',
                                doctorCategory: listDoctor[index]
                                        .doctorCategory!
                                        .categoryName ??
                                    '',
                                doctorPrice: currencySign +
                                    listDoctor[index].doctorPrice.toString(),
                                doctorPhotoUrl: listDoctor[index].doctorPicture ??
                                    'https://t3.ftcdn.net/jpg/00/64/67/80/360_F_64678017_zUpiZFjj04cnLri7oADnyMH0XBYyQghG.jpg',
                                doctorHospital:
                                    listDoctor[index].doctorHospital ?? '',
                                onTap: () {
                                  Get.toNamed('/detail-doctor',
                                      arguments: listDoctor[index]);
                                });
                          } else if(_selectedLang.value.toLowerCase() == "all"){
                                return DoctorCard(
                                doctorName: listDoctor[index].doctorName ?? '',
                                doctorCategory: listDoctor[index]
                                        .doctorCategory!
                                        .categoryName ??
                                    '',
                                doctorPrice: currencySign +
                                    listDoctor[index].doctorPrice.toString(),
                                doctorPhotoUrl: listDoctor[index].doctorPicture ??
                                    'https://t3.ftcdn.net/jpg/00/64/67/80/360_F_64678017_zUpiZFjj04cnLri7oADnyMH0XBYyQghG.jpg',
                                doctorHospital:
                                    listDoctor[index].doctorHospital ?? '',
                                onTap: () {
                                  Get.toNamed('/detail-doctor',
                                      arguments: listDoctor[index]);
                                });

                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                  onEmpty: Center(
                      child: EmptyList(
                          msg: 'No Doctor Registered in this Category'.tr
                          ))),
            )
          ]),
        ),
      ),
    );
  }
}