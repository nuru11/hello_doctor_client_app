import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hallo_doctor_client/app/models/doctor_category_model.dart';
import 'package:hallo_doctor_client/app/modules/servicedetail.dart';
import 'package:hallo_doctor_client/app/utils/constants/style_constants.dart';

class SelectServiceHospital extends StatefulWidget {
  const SelectServiceHospital({ Key? key }) : super(key: key);

  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectServiceHospital> {
  List<Service> services = [
    Service('Delt Hospital', 'https://assets.thehansindia.com/h-upload/2021/02/12/1030884-doctor-news.webp'),
    Service('IFTU Hospital', 'https://assets.thehansindia.com/h-upload/2021/02/12/1030884-doctor-news.webp'),
    Service('Qedade Hospital','https://assets.thehansindia.com/h-upload/2021/02/12/1030884-doctor-news.webp'),
    Service('ART Hospital', 'https://assets.thehansindia.com/h-upload/2021/02/12/1030884-doctor-news.webp'),
    Service('Bilal Hospital ', 'https://assets.thehansindia.com/h-upload/2021/02/12/1030884-doctor-news.webp'),
    Service('Central City Hospital ', 'https://assets.thehansindia.com/h-upload/2021/02/12/1030884-doctor-news.webp'),
    // Service('Salam Hopital', 'https://assets.thehansindia.com/h-upload/2021/02/12/1030884-doctor-news.webp'),
    // Service('Yared Hopital', 'https://assets.thehansindia.com/h-upload/2021/02/12/1030884-doctor-news.webp'),
    // Service('Land Mark Hospital', 'https://assets.thehansindia.com/h-upload/2021/02/12/1030884-doctor-news.webp'),
    // Service('MEDCO hospital', 'https://assets.thehansindia.com/h-upload/2021/02/12/1030884-doctor-news.webp'),
  ];

  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: mBackgroundColor,
        elevation: 0,
        title: Text(
          'Hospitals'.tr,
          style: TextStyle(color: mTitleColor),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: selectedService >= 0 ? FloatingActionButton(
        onPressed: () {
    //        Get.toNamed('/list-doctor',
    //         arguments: DoctorCategory(
    //   categoryId: "JgtLjSs2xMxwshxXsDPm", categoryName: "Geriatric Center", iconUrl: "https://firebasestorage.googleapis.com/v0/b/doctor-208bc.appspot.com/o/uploads%2F1718198483105.jpg?alt=media&token=eabaeb16-685b-4735-8680-ae45c0bd1571",
    // ));
        },
        child: Icon(Icons.arrow_forward_ios, size: 20,),
        backgroundColor: Colors.blue,
      ) : null,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
            //     child: Text(
            //       'Choose center where you want to \n attend?',
            //       style: TextStyle(
            //         fontSize: 40,
            //         color: Colors.grey.shade900,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // )
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                    return serviceContainer(services[index].imageURL, services[index].name, index);
                  }
                ),
              ),
            ]
          ),
        ),
      )
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if  (selectedService == index) {
            selectedService = -1;
          }
          else {
            selectedService = index;
            print(services[index].name);
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.blue.shade50 : Colors.grey.shade100,
          // color: selectedService == index ? Colors.transparent : Colors.transparent,
          border: Border.all(
            color: selectedService == index ? Colors.blue : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 80),
              //  Image.asset("assets/images/D2.jpg"),
          
              SizedBox(height: 20,),
              Text(name, style: TextStyle(fontSize: 20),)
            ]
          ),
        ),
      ),
    );
  }
}

class Service {
  final String name;
  final String imageURL;

  Service(this.name, this.imageURL);
}

