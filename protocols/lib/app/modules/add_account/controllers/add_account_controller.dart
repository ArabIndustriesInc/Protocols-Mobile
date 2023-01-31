import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAccountController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController accNameController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController acNoController = TextEditingController();
  TextEditingController brNameController = TextEditingController();
  var loadingAdd = false.obs;
  final brNameDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: borderDeco,
      errorBorder: borderDeco,
      contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
      focusedBorder: borderDeco,
      enabledBorder: borderDeco,
      hintText: 'Branch Name',
      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
  final suggNameDeco = SuggestionsBoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
  );
  final bankNameDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: borderDeco,
    errorBorder: borderDeco,
    contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
    focusedBorder: borderDeco,
    enabledBorder: borderDeco,
    hintText: 'Bank Name',
    hintStyle: TextStyle(
      fontSize: 15.sp,
      fontFamily: 'Montserrat SemiBold',
      color: const Color(0xffADADAD),
    ),
  );

  final nickNameDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: borderDeco,
      errorBorder: borderDeco,
      contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
      focusedBorder: borderDeco,
      enabledBorder: borderDeco,
      hintText: 'Nick Name',
      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final accNameDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: borderDeco,
      errorBorder: borderDeco,
      contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
      focusedBorder: borderDeco,
      enabledBorder: borderDeco,
      hintText: 'Account Name',
      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final ifscDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: borderDeco,
      errorBorder: borderDeco,
      contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
      focusedBorder: borderDeco,
      enabledBorder: borderDeco,
      hintText: 'IFSC',
      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final accNoDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: borderDeco,
    errorBorder: borderDeco,
    contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
    focusedBorder: borderDeco,
    enabledBorder: borderDeco,
    hintText: 'Account No.',
    hintStyle: const TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat SemiBold',
      color: Color(0xffADADAD),
    ),
  );
}

final borderDeco = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
);
