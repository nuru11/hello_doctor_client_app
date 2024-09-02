import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hallo_doctor_client/app/modules/servicedetail.dart';
import 'package:hallo_doctor_client/app/utils/constants/style_constants.dart';

class SelectService extends StatefulWidget {
  const SelectService({ Key? key }) : super(key: key);

  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  List<Service> services = [
    Service('Addis ababa', 'assets/images/1.png'),
    Service('Dire dawa', 'assets/images/2.png'),
    Service('Gondar', 'assets/images/3.png'),
    Service('Bhar dare', 'assets/images/4.png'),
    Service('Jimma', 'assets/images/5.png'),
    Service('Hawasa', 'assets/images/6.png'),
    Service('axum', 'assets/images/7.png'),
    Service('mekelle', 'assets/images/8.png'),
    Service('jijiga', 'assets/images/9.png'),
    Service('Adama', 'assets/images/10.png'),
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CleaningPage(),
            ),
          );
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
          // color: selectedService == index ? Colors.blue.shade50 : Colors.grey.shade100,
          color: selectedService == index ? Colors.transparent : Colors.transparent,
          border: Border.all(
            color: selectedService == index ? Colors.blue : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.network(image, height: 80),
            //  Image.asset("assets/images/D2.jpg"),
            Image.asset(image),
            // SizedBox(height: 20,),
            // Text(name, style: TextStyle(fontSize: 20),)
          ]
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

// class CleaningPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("kkkkkkkkkkk"),
//         actions: [],),
//     );
//   }
// }