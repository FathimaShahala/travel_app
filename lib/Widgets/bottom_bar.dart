// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class BottomBarItrem extends StatelessWidget {
//   final IconData icon;
//   final Function onTap;
//   final bool isSelected;

//   const BottomBarItrem(
//       {super.key,
//       required this.icon,
//       required this.onTap,
//       required this.isSelected});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => onTap(),
//       child: Container(
//         padding: EdgeInsets.all(18.r),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: isSelected ? Colors.white : Colors.black12,
//         ),
//         child: Icon(
//           icon,
//           size: 24.sp,
//           color: isSelected ? Colors.black : Colors.white,
//         ),
//       ),
//     );
//   }
// }
