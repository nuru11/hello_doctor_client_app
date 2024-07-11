// import 'package:flutter/material.dart';

// class AboutUsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('About Us'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 24.0),
//             Center(
//               child: CircleAvatar(
//                 radius: 50.0,
//                 backgroundImage: AssetImage('assets/logo.png'),
//               ),
//             ),
//             SizedBox(height: 24.0),
//             Text(
//               'Our Mission',
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             SizedBox(height: 12.0),
//             Text(
//               'Our mission is to provide high-quality products and services that enhance the lives of our customers. We strive to be a trusted partner and to deliver exceptional value through innovation, integrity, and a deep understanding of our customers\' needs.',
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//             SizedBox(height: 24.0),
//             Text(
//               'Our Team',
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             SizedBox(height: 12.0),
//             _TeamMemberCard(
//               name: 'John Doe',
//               title: 'Founder and CEO',
//               imageAsset: 'assets/john_doe.jpg',
//             ),
//             SizedBox(height: 16.0),
//             _TeamMemberCard(
//               name: 'Jane Smith',
//               title: 'Head of Product',
//               imageAsset: 'assets/jane_smith.jpg',
//             ),
//             SizedBox(height: 16.0),
//             _TeamMemberCard(
//               name: 'Michael Johnson',
//               title: 'Lead Engineer',
//               imageAsset: 'assets/michael_johnson.jpg',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _TeamMemberCard extends StatelessWidget {
//   final String name;
//   final String title;
//   final String imageAsset;

//   _TeamMemberCard({
//     required this.name,
//     required this.title,
//     required this.imageAsset,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CircleAvatar(
//           radius: 30.0,
//           backgroundImage: AssetImage(imageAsset),
//         ),
//         SizedBox(width: 16.0),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 name,
//                 style: Theme.of(context).textTheme.subtitle1,
//               ),
//               SizedBox(height: 4.0),
//               Text(
//                 title,
//                 style: Theme.of(context).textTheme.bodyText2,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }


////////////////////////////////////////////////////   


import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0),
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/icons/ic_launcher.png'),
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Who we are',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 12.0),
              Text(
                'Dire Digital health Care PLC (DDC PLC) is a registered and operating company in Dire Dawa, Ethiopia. DDC PLC is founded by experienced health professionals and has a single focus on healthcare which is connecting Doctors with their Patients as fast as possible Via digital health systems. We Provide the fastest, most reliable, and high quality services using the latest technology and experienced professionals. Elders (with or without chronic illness) and women are prioritized in our organization.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 24.0),
              Text(
                'Our Team',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 12.0),
              _TeamMemberCard(
                name: 'Dr. Sadam',
                title: 'Founder and CEO',
                imageAsset: 'assets/images/user.png',
              ),
              SizedBox(height: 16.0),
              _TeamMemberCard(
                name: 'Jane Smith',
                title: 'Head of Product',
                imageAsset: 'assets/images/user.png',
              ),
              SizedBox(height: 16.0),
              _TeamMemberCard(
                name: 'Michael Johnson',
                title: 'Lead Engineer',
                imageAsset: 'assets/images/user.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamMemberCard extends StatelessWidget {
  final String name;
  final String title;
  final String imageAsset;

  _TeamMemberCard({
    required this.name,
    required this.title,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage(imageAsset),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 4.0),
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}