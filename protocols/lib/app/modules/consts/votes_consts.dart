import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TimePickCardVoting extends GetView {
//   final IconData icon;
//   final double iconSize;
//   final String subTitle;
//   final Widget title;
//   const TimePickCardVoting(
//       {Key? key,
//       required this.icon,
//       required this.subTitle,
//       required this.title,
//       required this.iconSize})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(2, 2),
//             blurRadius: 4,
//             color: const Color(0xffABC2D4).withOpacity(.8),
//           ),
//         ],
//       ),
//       child: TextButton(
//         onPressed: () {
//           Get.find<VotingAddDateController>().timePicker(context);
//         },
//         style: TextButton.styleFrom(
//             padding:
//                 const EdgeInsets.only(top: 16, bottom: 16, right: 25, left: 15),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15))),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: Colors.black,
//               size: iconSize,
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   subTitle,
//                   style: TextStyle(
//                       color: const Color(0xffADADAD), fontSize: 14.sp),
//                 ),
//                 title,
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DatePickCardVoting extends GetView {
//   final IconData icon;
//   final double iconSize;
//   final String subTitle;
//   final Widget title;
//   const DatePickCardVoting(
//       {Key? key,
//       required this.icon,
//       required this.subTitle,
//       required this.title,
//       required this.iconSize})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(2, 2),
//             blurRadius: 4,
//             color: const Color(0xffABC2D4).withOpacity(.8),
//           ),
//         ],
//       ),
//       child: TextButton(
//         onPressed: () {
//           Get.find<VotingAddDateController>().datePicker(context);
//         },
//         style: TextButton.styleFrom(
//             padding:
//                 const EdgeInsets.only(top: 16, bottom: 16, right: 25, left: 15),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15))),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: Colors.black,
//               size: iconSize,
//             ),
//             SizedBox(
//               width: 10.h,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   subTitle,
//                   style: TextStyle(
//                       color: const Color(0xffADADAD), fontSize: 14.sp),
//                 ),
//                 title,
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class VotesDeco {
  final votesDescriptionDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 23.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Enter Description...',
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
  final votesTitleDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 23.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Enter Title...',
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
}
