// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:hallo_doctor_client/app/modules/profile/views/widgets/header_curve_widget.dart';
// import 'package:hallo_doctor_client/app/modules/profile/views/widgets/profile_button.dart';
// import 'package:hallo_doctor_client/app/utils/localization.dart';
// import '../controllers/profile_controller.dart';
// import 'widgets/display_image_widget.dart';

// class ProfileView extends GetView<ProfileController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[300],
//         elevation: 0,
//         title: Text(
//           'Profile'.tr,
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Stack(children: [
//         CustomPaint(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//           ),
//           painter: HeaderCurvedContainer(),
//         ),
//         Obx(
//           () => Column(
//             children: [
//               InkWell(
//                   onTap: () {},
//                   child: DisplayImage(
//                     imagePath: controller.profilePic.value,
//                     onPressed: () {
//                       controller.toEditImage();
//                     },
//                   )),
//               Card(
//                 margin: EdgeInsets.only(top: 50, left: 20, right: 20),
//                 elevation: 3,
//                 child: Column(
//                   children: [
//                     ProfileButton(
//                       icon: Icons.person,
//                       text: controller.username.value,
//                       onTap: () {},
//                       hideArrowIcon: true,
//                     ),
//                     ProfileButton(
//                       icon: Icons.email,
//                       text: controller.email.value,
//                       onTap: () {
//                         controller.toUpdateEmail();
//                       },
//                     ),
//                     ProfileButton(
//                       icon: Icons.password,
//                       text: 'Change Password'.tr,
//                       onTap: () {
//                         controller.toChangePassword();
//                       },
//                     ),
//                     ProfileButton(
//                       icon: Icons.settings,
//                       text: 'Settings'.tr,
//                       onTap: () {
//                         controller.toSettings();
//                       },
//                     ),
//                     ProfileButton(
//                       icon: Icons.account_balance_wallet,
//                       text: 'Wallet'.tr,
//                       onTap: () {
//                         controller.toWallet();
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           controller.logout();
//                         },
//                         child: Text('Logout'.tr),
//                       ),
//                     ),
//                     //uncomment if you wanto test something
//                     // ElevatedButton(
//                     //   key: Key('testButton'),
//                     //   onPressed: () {
//                     //     controller.testButton();
//                     //     //LocalizationService().changeLocale('France');
//                     //   },
//                     //   child: Text('test button'),
//                     // )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Expanded(
//                 child: Center(
//                   child:
//                       Text('App Version : '.tr + controller.appVersion.value),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }

//   // Widget builds the display item with the proper formatting to display the user's info
//   Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
//       Padding(
//         padding: EdgeInsets.only(bottom: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin: EdgeInsets.only(left: 10, top: 5),
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 1,
//             ),
//             Container(
//               width: 350,
//               height: 40,
//               decoration: BoxDecoration(
//                   border: Border(
//                       bottom: BorderSide(
//                 color: Colors.grey,
//                 width: 1,
//               ))),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {
//                         Get.to(() => editPage);
//                       },
//                       child: Text(
//                         getValue,
//                         style: TextStyle(fontSize: 16, height: 1.4),
//                       ),
//                     ),
//                   ),
//                   Icon(
//                     Icons.keyboard_arrow_right,
//                     color: Colors.grey,
//                     size: 40.0,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       );
// }






/////////////////////////////////////////////////////////////////////////


import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/profile/views/widgets/header_curve_widget.dart';
import 'package:hallo_doctor_client/app/modules/profile/views/widgets/profile_button.dart';
// import 'package:hallo_doctor_client/app/utils/localization.dart';
import '../controllers/profile_controller.dart';
import 'widgets/display_image_widget.dart';
import 'package:get_storage/get_storage.dart';



class ProfileView extends GetView<ProfileController> {

final LocaleController localeController = Get.put(LocaleController());

   final List locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},
    {'name':'SOMALI','locale': Locale('et','ET')},
   
  ];







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0,
        title: Text(
          'Profile'.tr,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        CustomPaint(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          painter: HeaderCurvedContainer(),
        ),
        Obx(
          () => Column(
            children: [
              InkWell(
                  onTap: () {},
                  child: DisplayImage(
                    imagePath: controller.profilePic.value,
                    onPressed: () {
                      controller.toEditImage();
                    },
                  )),
              Card(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                elevation: 3,
                child: Column(
                  children: [
                    ProfileButton(
                      icon: Icons.person,
                      text: controller.username.value,
                      onTap: () {},
                      hideArrowIcon: true,
                    ),
                    ProfileButton(
                      icon: Icons.email,
                      text: controller.email.value,
                      onTap: () {
                        controller.toUpdateEmail();
                      },
                    ),
                    ProfileButton(
                      icon: Icons.password,
                      text: 'Change Password'.tr,
                      onTap: () {
                        controller.toChangePassword();
                      },
                    ),
                    ProfileButton(
                      icon: Icons.settings,
                      text: 'Settings'.tr,
                      onTap: () {
                        controller.toSettings();
                      },
                    ),
                    ProfileButton(
                      icon: Icons.language,
                      text: 'Change Language'.tr,
                      onTap: () {
                       buildLanguageDialog(context);
                      },
                    ),
                    // ProfileButton(
                    //   icon: Icons.account_balance_wallet,
                    //   text: 'Wallet'.tr,
                    //   onTap: () {
                    //     controller.toWallet();
                    //   },
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.logout();
                        },
                        child: Text('Logout'.tr),
                      ),
                    ),
                    //uncomment if you wanto test something
                    // ElevatedButton(
                    //   key: Key('testButton'),
                    //   onPressed: () {
                    //     controller.testButton();
                    //     //LocalizationService().changeLocale('France');
                    //   },
                    //   child: Text('test button'),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Expanded(
              //   child: Center(
              //     child:
              //         Text('App Version : '.tr + controller.appVersion.value),
              //   ),
              // ),
            ],
          ),
        ),
      ]),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 5),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              width: 350,
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => editPage);
                      },
                      child: Text(
                        getValue,
                        style: TextStyle(fontSize: 16, height: 1.4),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  )
                ],
              ),
            )
          ],
        ),
      );


      void buildLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('Choose Your Language'),
          content: Container(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Text(locale[index]['name']),
                    onTap: () {
                      updateLanguage(locale[index]['locale']);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.blue,
                );
              },
              itemCount: locale.length,
            ),
          ),
        );
      },
    );
  }






       void updateLanguage(Locale locale) {
    print("this is local $locale");
    Get.back();
    Get.updateLocale(locale);
    localeController.saveLocale(locale);
  }

}



class LocaleController extends GetxController {
  final GetStorage _storage = GetStorage();
  static const _localeKey = 'locale';
  

  Future<void> init() async {
    await GetStorage.init(); // Initialize the GetStorage
  }

  Locale get locale {
    print("lkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    final localeJson = _storage.read<String>(_localeKey);
    print("llllllllllll key: $_localeKey");
    if (localeJson != null) {
      try {
        final Map<String, dynamic> localeMap = jsonDecode(localeJson);
        return Locale(localeMap['languageCode'], localeMap['countryCode']);
      } catch (e) {
        print('Error decoding locale: $e');
      }
    }
    return const Locale('et', 'ET'); // Return a default locale
  }

  void saveLocale(Locale locale) {
    print("Nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn ${locale.languageCode}  countrycode: ${locale.countryCode}");
    _storage.write(_localeKey, jsonEncode({
      'languageCode': locale.languageCode,
      'countryCode': locale.countryCode,
    }));
  }
}
