import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/test.dart';
import 'package:hallo_doctor_client/app/modules/testhomescroll.dart';
import 'package:hallo_doctor_client/app/utils/constants/style_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CleaningPage extends StatefulWidget {
  const CleaningPage({ Key? key }) : super(key: key);

  @override
  _CleaningPageState createState() => _CleaningPageState();
}

class _CleaningPageState extends State<CleaningPage> {
  // Rooms to clean
 List<dynamic> _rooms = [
  [
    'Home Care',
    'https://www.shutterstock.com/image-vector/home-care-concept-hands-holding-260nw-1656059389.jpg',
    Colors.red,
    1,
    'Providing compassionate in-home assistance for patients'
  ],
  [
    'Nursing',
    'https://thumbs.dreamstime.com/b/healthcare-nurse-icon-outline-style-vector-web-design-isolated-white-background-178855215.jpg',
    Colors.orange,
    1,
    'Specialized care and support for individuals with medical needs'
  ],
  [
    'Medication',
    'https://cdn-icons-png.freepik.com/512/1608/1608795.png',
    Colors.blue,
    1,
    'Comprehensive management and administration of medications'
  ],
  [
    'Procedure',
    'https://cdn-icons-png.freepik.com/512/1608/1608795.png',
    Colors.purple,
    1,
    'Specialized medical procedures and treatments'
  ],
  // [
  //   'Office',
  //   'https://cdn-icons-png.freepik.com/512/1608/1608795.png',
  //   Colors.green,
  //   1,
  //   'Administrative and logistical support for healthcare operations'
  // ]
];
  List<int> _selectedRooms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        elevation: 0,
        title: Text(
          'Services'.tr,
          style: TextStyle(color: mTitleColor),
        ),
        centerTitle: true,
      ),
      // floatingActionButton: _selectedRooms.length > 0 ? FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => DateAndTime()
      //       ),
      //     );
      //   },
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('${_selectedRooms.length}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      //       SizedBox(width: 2),
      //       Icon(Icons.arrow_forward_ios, size: 18,),
      //     ],
      //   ),
      //   backgroundColor: Colors.blue,
      // ) : null,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                child: Text(
                  'Services you will get',
                  style: TextStyle(
                    fontSize: 35,
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
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: _rooms.length,
            itemBuilder: (BuildContext context, int index) {
              return room(_rooms[index], index);
            }
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the next screen
            
          //     Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => HomeViewTest(),
          //   ),

            
          // );
          launch('tel:9390');
          },
          child: Text('Call For More Info'),
        ),
      ),
    );
  }
  
  room(List room, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedRooms.contains(index))
            _selectedRooms.remove(index);
          else 
            _selectedRooms.add(index);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // color: _selectedRooms.contains(index) ? room[2].shade50.withOpacity(0.5) : Colors.grey.shade100,
          color: room[2].shade50.withOpacity(0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Image.network(room[1], width: 35, height: 35,),
                    SizedBox(width: 10.0,),
                    Text(room[0], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  ],
                ),
                Spacer(),
                _selectedRooms.contains(index) ? 
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(Icons.check, color: Colors.green, size: 20,)
                  ) : 
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(Icons.check, color: Colors.green, size: 20,)
                  )
              ],
            ),
            (_selectedRooms.contains(index) && room[3] >= 1) ?
            // Container(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       SizedBox(height: 20.0,),
            //       Text("Detail", style: TextStyle(fontSize: 15),),
            //       SizedBox(height: 10.0,),
            //       Container(
            //         height: 45,
            //         child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: 4,
            //           itemBuilder: (BuildContext context, int index) {
            //             return GestureDetector(
            //               onTap: () {
            //                 setState(() {
            //                   room[3] = index + 1;
            //                 });
            //               },
            //               child: Container(
            //                 margin: EdgeInsets.only(right: 10.0),
            //                 padding: EdgeInsets.all(10.0),
            //                 width: 50,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10.0),
            //                   color: room[3] == index + 1 ? room[2].withOpacity(0.5) : room[2].shade200.withOpacity(0.5),
            //                 ),
            //                 child: Center(child: Text((index + 1).toString() , style: TextStyle(fontSize: 22, color: Colors.white),)),
            //               ),
            //             );
            //           }
            //         ),
            //       )
            //     ],
            //   ),
            // ) 
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0,),
                  // Text("Detail", style: TextStyle(fontSize: 15),),
                  SizedBox(height: 10.0,),
                  Container(
                    height: 45,
                    // color: Colors.white,
                    child: Text(
    room[4],
    style: TextStyle(
      // color: Colors.white,
      fontSize: 16.0,
    ),
  ),
                    // child: ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: 4,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return GestureDetector(
                    //       onTap: () {
                    //         setState(() {
                    //           room[3] = index + 1;
                    //         });
                    //       },
                    //       child: Container(
                    //         margin: EdgeInsets.only(right: 10.0),
                    //         padding: EdgeInsets.all(10.0),
                    //         width: 50,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10.0),
                    //           color: room[3] == index + 1 ? room[2].withOpacity(0.5) : room[2].shade200.withOpacity(0.5),
                    //         ),
                    //         child: Center(child: Text((index + 1).toString() , style: TextStyle(fontSize: 22, color: Colors.white),)),
                    //       ),
                    //     );
                    //   }
                    // ),
                  )
                ],
              ),
            )
            :
             Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0,),
                  Text("Detail...", style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10.0,),
                  // Container(
                  //   height: 45,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: 4,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             room[3] = index + 1;
                  //           });
                  //         },
                  //         child: Container(
                  //           margin: EdgeInsets.only(right: 10.0),
                  //           padding: EdgeInsets.all(10.0),
                  //           width: 50,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10.0),
                  //             color: room[3] == index + 1 ? room[2].withOpacity(0.5) : room[2].shade200.withOpacity(0.5),
                  //           ),
                  //           child: Center(child: Text((index + 1).toString() , style: TextStyle(fontSize: 22, color: Colors.white),)),
                  //         ),
                  //       );
                  //     }
                  //   ),
                  // )
                ],
              ),
            )
            //  Container(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       SizedBox(height: 20.0,),
            //       Text("Detail", style: TextStyle(fontSize: 15),),
            //       SizedBox(height: 10.0,),
            //       Container(
            //         height: 45,
            //         child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: 4,
            //           itemBuilder: (BuildContext context, int index) {
            //             return GestureDetector(
            //               onTap: () {
            //                 setState(() {
            //                   room[3] = index + 1;
            //                 });
            //               },
            //               child: Container(
            //                 margin: EdgeInsets.only(right: 10.0),
            //                 padding: EdgeInsets.all(10.0),
            //                 width: 50,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10.0),
            //                   color: room[3] == index + 1 ? room[2].withOpacity(0.5) : room[2].shade200.withOpacity(0.5),
            //                 ),
            //                 child: Center(child: Text((index + 1).toString() , style: TextStyle(fontSize: 22, color: Colors.white),)),
            //               ),
            //             );
            //           }
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        )
      ),
    );
  }
}