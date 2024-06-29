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
    Service('Amin Hospital', 'https://media.licdn.com/dms/image/C4D03AQFDswODJD8u0A/profile-displayphoto-shrink_200_200/0/1621862706507?e=2147483647&v=beta&t=YpEpfpU5_556gXcUkQkuZNqh0TMmhbYd764aWMx8Sjw'),
    Service('Ethio Tebib', 'https://www.medanit.com/storage/images/ClVtz6Lu3h7bkLXFb2qHfUz796WS2KKYrnRGV9Qq.png'),
    Service('SAINT', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhXKzlxWT87tKn_eul8boEpqMWwtu47_lpxQ&s'),
    Service('Hayat Hospital', 'https://marketing.uz/brend-goda-2021/uploads/works/covers/0b81ebf7a76ea3712a14073d99f68aec.jpg'),
    Service('Bethzatha Hospital', 'https://www.ethiopianreporterjobs.com/wp-content/uploads/2020/10/download-1-1.jpg'),
    Service('Addis hiwot', 'https://ethiojobs.info/wp-content/uploads/2024/02/Addis-Hiwot-General-Hospital-.jpg'),
    Service('Salam Hopital', 'https://directory.africa-business.com/assets/uploadedimages/7429688_14shc_logo51.jpg'),
    Service('Yared Hopital', 'https://www.ethiopianreporterjobs.com/wp-content/uploads/2019/06/13873158_266011743783238_7393542163860992300_n.jpg'),
    Service('Land Mark Hospital', 'https://images1-fabric.practo.com/practices/728698/landmark-hospitals-hyderabad-58e394b66f15b.jpg'),
    Service('MEDCO hospital', 'https://medcosolutions.com/wp-content/uploads/2020/09/medco-logo2x.png'),
  ];

  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: mBackgroundColor,
        elevation: 0,
        title: Text(
          'Services'.tr,
          style: TextStyle(color: mTitleColor),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: selectedService >= 0 ? FloatingActionButton(
        onPressed: () {
           Get.toNamed('/list-doctor',
            arguments: DoctorCategory(
      categoryId: "JgtLjSs2xMxwshxXsDPm", categoryName: "Geriatric Center", iconUrl: "https://firebasestorage.googleapis.com/v0/b/doctor-208bc.appspot.com/o/uploads%2F1718198483105.jpg?alt=media&token=eabaeb16-685b-4735-8680-ae45c0bd1571",
    ));
        },
        child: Icon(Icons.arrow_forward_ios, size: 20,),
        backgroundColor: Colors.blue,
      ) : null,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                child: Text(
                  'Choose center where you want to \n attend?',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
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

