import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/notes_provider.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/notes/controllers/notes_controller.dart';
import 'package:protocols/app/modules/notes_details/bindings/notes_details_binding.dart';
import 'package:protocols/app/modules/notes_details/views/notes_details_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesCardView extends GetView<NotesController> {
  final int index;
  const NotesCardView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: const Border(
        //   left: BorderSide(width: 1.0, color: Colors.black),
        // ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color: const Color.fromARGB(255, 162, 178, 190),
        // border: Border.all(width: .6, color: Colors.blueGrey),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            color: const Color(0xffABC2D4).withOpacity(.5),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 7,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.white,
                //border: Border.all(width: .6, color: Colors.blueGrey),
              ),
              child: TextButton(
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteAlertView(
                          subtitle:
                              'Are you sure, you want to delete this Note? This action can\'t be reversed!',
                          title: 'Delete Folder',
                          action: InkWell(
                            highlightColor: Colors.grey[200],
                            onTap: () {
                              if (!Get.find<NotesController>()
                                  .loadingDelete
                                  .value) {
                                Get.find<NotesController>()
                                    .loadingDelete
                                    .value = true;
                                final id =
                                    Get.find<NotesController>().notes[index].id;
                                NotesProvider().deleteNote(context, id);
                              }
                            },
                            child: Obx(() {
                              return (Get.find<NotesController>()
                                      .loadingDelete
                                      .value)
                                  ? Transform.scale(
                                      scale: 0.6,
                                      child: const CircularProgressIndicator(
                                        color: Colors.blue,
                                        strokeWidth: 1.7,
                                      ),
                                    )
                                  : const Text(
                                      "Confirm",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xffE30000),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    );
                            }),
                          ),
                        );
                      });
                },
                onPressed: () {
                  Get.to(
                    () => NotesDetailsView(index: index),
                    binding: NotesDetailsBinding(),
                  );
                },
                style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                        top: 17, bottom: 17, right: 20, left: 15),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Get.find<NotesController>().notes[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          letterSpacing: .3,
                          color: Colors.black,
                          fontFamily: 'Montserrat Bold',
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.circleChevronRight,
                        color: Colors.black,
                        size: 15.w,
                      )
                    ],
                  ),
                ),
                //
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Flexible(
//       child: Text(
//         Get.find<NotesController>().notes[index].noteid.title,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(
//           fontSize: 16.sp,
//           letterSpacing: .3,
//           color: Colors.black,
//           fontFamily: 'Montserrat Bold',
//         ),
//       ),
//     ),
//     Text(
//       TimeOfDay.fromDateTime(DateTime.parse(
//               Get.find<NotesController>().notes[index].noteid
//                 .))
//           .format(context),
//       style: TextStyle(
//           fontSize: 14.sp, color: const Color(0xff787878)),
//     ),
//   ],
// ),
