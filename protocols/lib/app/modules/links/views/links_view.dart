import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/links/controllers/links_controller.dart';
import 'package:protocols/app/modules/links/views/links_card_view.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class LinksView extends GetView<LinksController> {
  const LinksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Have something to deal with?',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.9,
          child: ScrollSnapList(
            scrollPhysics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            dynamicItemSize: true,
            itemBuilder: (context, index) {
              final appName = Get.find<LinksController>().appName[index];
              final appIcon = Get.find<LinksController>().appIcons[index];
              final appLink = Get.find<LinksController>().appLink[index];
              final appDesc = Get.find<LinksController>().appDescription[index];
              return LinksCardView(
                image: appIcon,
                link: appLink,
                name: appName,
                desc: appDesc,
              );
            },
            itemCount: Get.find<LinksController>().appName.length,
            itemSize: MediaQuery.of(context).size.width / 1.5,
            onItemFocus: (index) {},
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Swipe the card',
              style: TextStyle(fontSize: 17.sp),
            ),
            SizedBox(
              width: 5.w,
            ),
            Icon(
              Icons.east_rounded,
              size: 30.w,
            ),
          ],
        ),
      ],
    );
  }
}
