import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/directors_provider.dart';
import 'package:protocols/app/modules/directors_add/bindings/directors_add_binding.dart';
import 'package:protocols/app/modules/directors_add/views/directors_add_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirectorsController extends GetxController {
  final BuildContext context;
  RxList directors = [].obs;
  var loading = true.obs;
  var loadingDelete = false.obs;

  DirectorsController(this.context);
  getAllDirectors() async {
    await DirectorsProvider().getAllDirectors(context);
    update();
  }

  @override
  void onClose() {
    DirectorsProvider.isFinishedDirectors = true;
    DirectorsProvider().onClose();
    super.onClose();
  }

  @override
  void onInit() async {
    getAllDirectors();
    update();
    super.onInit();
  }
}

class DirectorsButtonView extends GetView {
  const DirectorsButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: TextButton(
        onPressed: () {
          Get.to(
              () => const DirectorsAddView(
                    title: 'Add Director',
                  ),
              binding: DirectorsAddBinding());
        },
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(8.h),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 35.w,
        ),
      ),
    );
  }
}
