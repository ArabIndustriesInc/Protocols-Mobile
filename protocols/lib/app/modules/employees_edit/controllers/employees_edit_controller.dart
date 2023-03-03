import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:protocols/app/modules/employees_edit/functions/employees_edit_upload_function.dart';

class EmployeesEditController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController midNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController empIdController = TextEditingController();
  TextEditingController pfAccNoController = TextEditingController();
  TextEditingController workLocController = TextEditingController();
  TextEditingController uanNoController = TextEditingController();
  TextEditingController esiNoController = TextEditingController();

  TextEditingController mobNoController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController mailIdController = TextEditingController();
  TextEditingController panNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController accHolderNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController payModeController = TextEditingController();
  TextEditingController accTypeController = TextEditingController();
  TextEditingController accNoController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  String picked = '';
  RxString image = ''.obs;
  RxString imageSample = ''.obs;
  XFile? pickedImage;
  String? deleteFile;
  var loadingEdit = false.obs;

  pickImageEdit() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      picked = '';
      return;
    } else {
      imageSample.value = pickedImage!.path;
      picked = 'done';
    }
  }

  var initTimes = 0.obs;
}

class EditEmployeeButton extends GetView {
  final int index;
  const EditEmployeeButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            label: const Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: TextButton(
              onPressed: () {
                if (!Get.find<EmployeesEditController>().loadingEdit.value) {
                  EmployeesServerUpload(index: index, context: context)
                      .editFunction();
                }
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(8.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Obx(() {
                return (Get.find<EmployeesEditController>().loadingEdit.value)
                    ? Transform.scale(
                        scale: 0.6,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.7,
                        ),
                      )
                    : Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 30.h,
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
