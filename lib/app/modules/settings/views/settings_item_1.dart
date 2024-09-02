import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hallo_doctor_client/app/modules/profile/views/widgets/profile_button.dart';

class SettingItem extends ProfileButton {
  SettingItem({required super.icon, required super.text, required super.onTap});
}
// class SettingItem extends StatelessWidget {
//   const SettingItem({super.key,});
//   final String text;
//   final VoidCallback onTap;
//   final IconData icon;
//   final bool hide
//   @override
//   Widget build(BuildContext context) {
//     return  InkWell(
//       onTap: onTap,
//       child: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//           child: Row(
//             children: [
//               Icon(
//                 icon,
//                 size: 30,
//                 color: Colors.grey[700],
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Text(text),
//               Spacer(),
//               hideArrowIcon
//                   ? SizedBox.shrink()
//                   : Icon(
//                       Icons.arrow_forward_ios_rounded,
//                       size: 20,
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
