
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/doctor_category_model.dart';
import 'package:hallo_doctor_client/app/models/doctor_model.dart';
import 'package:hallo_doctor_client/app/modules/doctor_category/controllers/doctor_category_controller.dart';
import 'package:hallo_doctor_client/app/modules/doctor_hospital/views/doctor_category_view.dart';
import 'package:hallo_doctor_client/app/modules/home/controllers/home_controller.dart';
import 'package:hallo_doctor_client/app/modules/home/views/components/icon_card.dart';
import 'package:hallo_doctor_client/app/modules/home/views/components/list_doctor_card.dart';
import 'package:hallo_doctor_client/app/modules/servicedetail.dart';
import 'package:hallo_doctor_client/app/modules/serviceslist.dart';
import 'package:hallo_doctor_client/app/modules/temporaryClinic.dart';
import 'package:hallo_doctor_client/app/modules/temporaryHospital.dart';
import 'package:hallo_doctor_client/app/modules/test.dart';
import 'package:hallo_doctor_client/app/service/doctor_service.dart';
import 'package:hallo_doctor_client/app/utils/constants/style_constants.dart';

// import '../../doctor_category/controllers/doctor_category_controller.dart';
// import '../controllers/home_controller.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:url_launcher/url_launcher.dart';


class HomeView extends GetView<HomeController> {
 
  @override
  Widget build(BuildContext context) {
    final CarouselController caoruselController = CarouselController();
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
         actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality
              controller.toSearchDoctor();
            },
          ),
        ],
      ),
      drawer: Drawer(
          
          backgroundColor: Colors.grey[200], // Set the desired background color
        
        child: ListView(
          children: [
           
              Obx(() => UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
          color: Colors.blue, 
        ),
              accountName: Text(controller.userService.currentUserFirebase!
                                        .displayName!),

              accountEmail: Text(controller.userService.currentUserFirebase!
                                        .email!),

              currentAccountPicture: controller.userPicture.value.isEmpty
                  ? Image.asset('assets/images/user.png')
                  : CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                          controller.userPicture.value),
                    ),

            )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
             
              onTap: () {
               
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
             
              onTap: () {
               
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              // selected: _selectedIndex == 2,
              onTap: () {
               
                 Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AboutUsPage(),
            ),
          );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () {
                // Add your exit logic here
              },
            ),
          ],
        ),
      ),
      backgroundColor: mBackgroundColor,
      floatingActionButton: SpeedDial(
        child: Icon(
          Icons.add
        ),
       activeIcon: Icons.close,
       iconTheme: IconThemeData(color: Colors.white,),
       foregroundColor: Colors.white,
       backgroundColor: Colors.blue,
       buttonSize: Size(58, 58),
       curve: Curves.bounceIn,
       shape: CircleBorder(),

       children: [
        SpeedDialChild(
          elevation: 0,
          child: Icon(
            Icons.phone,
            color: Colors.blue
          ),
          labelWidget: Text("call", style: TextStyle(color:Colors.blue),),
          backgroundColor: Colors.white,
          onTap: () {launch('tel:9390');}
        ),
         SpeedDialChild(
          elevation: 0,
          child: Icon(
            Icons.message,
            color: Colors.blue
          ),
          labelWidget: Text("message", style: TextStyle(color:Colors.blue),),
          backgroundColor: Colors.white,
          onTap: () {launch('sms:9390');}
        ),

         SpeedDialChild(
          elevation: 0,
          child: Icon(
            Icons.health_and_safety,
            color: Colors.blue
          ),
          labelWidget: Text("book appointment", style: TextStyle(color:Colors.blue),),
          backgroundColor: Colors.white,
          onTap: () {
            _showCategoriesList(context);
            }
        ),
         SpeedDialChild(
          elevation: 0,
          child: Icon(
            Icons.health_and_safety,
            color: Colors.blue
          ),
          labelWidget: Text("Centers", style: TextStyle(color:Colors.blue),),
          backgroundColor: Colors.white,
          onTap: () {
            Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectService(),
      ),
    );
            }
        ),

        SpeedDialChild(
  elevation: 0,
  child: Icon(Icons.handshake, color: Colors.blue),
  labelWidget: Text("Geriatric Center", style: TextStyle(color: Colors.blue)),
  backgroundColor: Colors.white,
  onTap: () {
    
    Get.toNamed('/list-doctor',
            arguments: DoctorCategory(
      categoryId: "JgtLjSs2xMxwshxXsDPm", categoryName: "Geriatric Center", iconUrl: "https://firebasestorage.googleapis.com/v0/b/doctor-208bc.appspot.com/o/uploads%2F1718198483105.jpg?alt=media&token=eabaeb16-685b-4735-8680-ae45c0bd1571",
    ));

  },
),




       ],

      ),
      body: SafeArea(
        child: Obx(
          () => CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        padding: EdgeInsets.fromLTRB(17, 15, 17, 10),
                        child: Container(
                          child: Row(
                            children: [
                              controller.userPicture.value.isEmpty
                                  ? Image.asset('assets/images/user.png')
                                  : CircleAvatar(
                                      backgroundImage: CachedNetworkImageProvider(
                                          controller.userPicture.value),
                                    ),
                              Padding(
                                padding: EdgeInsets.only(left: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Welcome Back,'.tr,
                                      style: mWelcomeTitleStyle,
                                    ),
                                    Text(
                                      controller.userService.currentUserFirebase!
                                          .displayName!,
                                      style: mUsernameTitleStyle,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.notifications_none)),
                              ))
                            ],
                          ),
                        ),
                      ),
                      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                           // width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                               
                               _showPopupDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF01616),
                                
                              ),
                              child: Text('Call Ambulance'.tr, style: TextStyle(color: Colors.white)),
                            ),
                          ), 
                  
                                Container(
                                 // width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                     
                      //                 Get.toNamed('/list-doctor',
                      //         arguments: DoctorCategory(
                      //   categoryId: "JgtLjSs2xMxwshxXsDPm", categoryName: "Geriatric Center", iconUrl: "https://firebasestorage.googleapis.com/v0/b/doctor-208bc.appspot.com/o/uploads%2F1718198483105.jpg?alt=media&token=eabaeb16-685b-4735-8680-ae45c0bd1571",
                      // ));
                       Navigator.push(
      context,
      MaterialPageRoute(
        // builder: (context) => HDoctorCategoryView(), 
        builder: (context) => SelectServiceClinic(),
        
      ),
    );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      
                                    ),
                                    child: Text('Clinics List'.tr, style: TextStyle(color: Colors.white)),
                                  ),
                                ), 
                  
                        
                                ]
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GetBuilder<HomeController>(
                          builder: (_) {
                            return CarouselSlider(
                              carouselController: caoruselController,
                              options: CarouselOptions(
                                  height: 200,
                                  autoPlay: true,
                                  aspectRatio: 2.0,
                                  viewportFraction: 0.9,
                                  onPageChanged: (index, reason) {
                                    controller.carouselChange(index);
                                  }),
                              items: imgListAssetSlider(
                                  controller.listImageCarousel),
                            );
                          },
                        ),
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: controller.listImageCarousel.isNotEmpty
                              ? controller.listImageCarousel
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                  return GestureDetector(
                                    onTap: () => caoruselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: 12.0,
                                      height: 12.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black)
                                              .withOpacity(
                                                  controller.getcaoruselIndex ==
                                                          entry.key
                                                      ? 0.9
                                                      : 0.4)),
                                    ),
                                  );
                                }).toList()
                              : imgListAsset.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => caoruselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: 12.0,
                                      height: 12.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black)
                                              .withOpacity(
                                                  controller.getcaoruselIndex ==
                                                          entry.key
                                                      ? 0.9
                                                      : 0.4)),
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                  
                    Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                               
                                _showCategoriesList(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                
                              ),
                              child: Text('Book Appointment'.tr, style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                  
                        
                  
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconCard(
                              key: Key('iconDoctorSpecialist'),
                              iconData: Icons.category,
                              text: "Doctor Specialist".tr,
                              onTap: () {
                                controller.toDoctorCategory();
                              },
                            ),
                            IconCard(
                              key: Key('iconTopRatedDoctor'),
                              iconData: Icons.local_hospital,
                              text: "Hospitals".tr,
                              onTap: () {
                                // controller.toTopRatedDoctor();
                                 Navigator.push(
      context,
      MaterialPageRoute(
        // builder: (context) => HDoctorCategoryView(), 
        builder: (context) => SelectServiceHospital(),
      ),
    );
                                
                              },
                            ),
                            // IconCard(
                            //   key: Key('iconSearchDoctor'),
                            //   iconData: Icons.search,
                            //   text: "Search Doctor".tr,
                            //   onTap: () {
                            //     controller.toSearchDoctor();
                            //   },
                            // ),
                            IconCard(
                              key: Key('homeCare'),
                              iconData: Icons.home,
                              text: "Home Care".tr,
                              onTap: () {
                                // controller.toSearchDoctor();
                                 Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CleaningPage(),
      ),
    );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Top Rated Doctor'.tr,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: TextButton(
                                key: Key('buttonViewAllTopRatedDoctor'),
                                onPressed: () {
                                  controller.toTopRatedDoctor();
                                },
                                child: Text('View All'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[300])),
                              ),
                            )
                          ],
                        ),
                      ),
                     Container(
                      height: 300,
                       child: FutureBuilder<List<Doctor>>(
                               future: DoctorService().getTopRatedDoctor(),
                               builder: (context, snapshot) {
                                 switch (snapshot.connectionState) {
                                   case ConnectionState.waiting:
                                     return Center(child: CircularProgressIndicator());
                                   default:
                                     if (snapshot.hasError) {
                                       return Center(
                                         child: Text('error '.tr + snapshot.error.toString()),
                                       );
                                     } else if (snapshot.data!.isEmpty) {
                                       return Center(
                                         child: Text('Top Rated Doctor is empty '.tr),
                                       );
                                     } else {
                                       return ListView.builder(
                                         shrinkWrap: true,
                                         physics: NeverScrollableScrollPhysics(),
                                         itemCount: snapshot.data!.length,
                                         itemBuilder: (context, index) => DoctorCard(
                                           doctorName: snapshot.data![index].doctorName,
                                           doctorSpecialty: snapshot.data![index].doctorCategory!.categoryName,
                                           imageUrl: snapshot.data![index].doctorPicture,
                                           onTap: () {
                        Get.toNamed('/detail-doctor', arguments: snapshot.data![index]);
                                           },
                                         ),
                                       );
                                     }
                                 }
                               },
                             ),
                     ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> test() async {
    return Future.delayed(Duration(seconds: 5));
  }

  void _showCategoriesList(BuildContext context) {
   
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Select',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: dummyNames.length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         title: Text(dummyNames[index]),
              //         onTap: () {
              //           // Perform email-related action here
              //           Navigator.of(context).pop();
              //         },
              //       );
              //     },
              //   ),
              // ),
              Expanded(
            child: GetBuilder<DoctorCategoryController>(
              init: DoctorCategoryController(),
              builder: (categoryController) {
                return categoryController.obx(
                  (categoryList) {
                    return ListView.builder(
                      itemCount: categoryList?.length ?? 0,
                      itemBuilder: (context, index) {
                        final category = categoryList?[index];
                        return ListTile(
                          leading: category?.iconUrl != null
                              ? Image.network(
                                  category!.iconUrl!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.contain,
                                )
                              :  Image.asset('assets/icons/Stethoscope.png'),
                          title: Text(category?.categoryName ?? ''),
                          onTap: () {
                            // Navigate to the details page for the selected category
                             Get.toNamed('/list-doctor',
                            arguments: category);

                            print("kkkdkdkdk;;;;;;; ${category!.toJson()}");
                            
                             
                           
                          },
                        );
                      },
                    );
                  },
                  onError: (error) {
                    return Center(
                      child: Text('Error: $error'),
                    );
                  },
                  onLoading: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
            ],
          ),
        );
      },
    );
  }



  void _showPopupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emergency or Not?'),
          actions: <Widget>[
            TextButton(
              child: Text('Emergency'),
              onPressed: () {
                // Handle "Emergency" button press
                launch('tel:9390');
                // Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Not Emergency'),
              onPressed: () {
                // Handle "Not Emergency" button press
                launch('tel:9390');
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}

final List<String> imgListAsset = [
  'assets/images/carousel1.jpg',
  'assets/images/carousel2.jpg'
];

List<Widget> imgListAssetSlider(List<String?> imgCarouselList) {
  if (imgCarouselList.isEmpty) {
    return imgListAsset
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                      ],
                    )),
              ),
            ))
        .toList();
  }
  return imgCarouselList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item ?? "",
                          fit: BoxFit.cover, width: 1000.0),
                    ],
                  )),
            ),
          ))
      .toList();
}

