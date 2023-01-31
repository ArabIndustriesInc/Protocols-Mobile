import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var style = TextStyle(
  fontSize: 15.sp,
  fontFamily: 'Montserrat SemiBold',
  color: const Color(0xffADADAD),
);
TextEditingController ifscController = TextEditingController();
var border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
);
final padding = EdgeInsets.symmetric(horizontal: 25.w, vertical: 22.h);

class TextDecoEmp {
  final firstNameDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'First Name',
    hintStyle: style,
  );

  final midNameDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Middle Name',
    hintStyle: style,
  );

  final lastNameDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Last Name',
    hintStyle: style,
  );

  final designationDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Designation',
    hintStyle: style,
  );
  final empIdDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Employee ID',
    hintStyle: style,
  );

  final pfAccNoDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'PF Account No.',
    hintStyle: style,
  );

  final workLocDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Work Location',
    hintStyle: style,
  );
  final uanNoDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'UAN No.',
    hintStyle: style,
  );
  final esiNoDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'ESI No.',
    hintStyle: style,
  );

  final mobNoDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Mobile Number',
    hintStyle: style,
  );
  final mailIdDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Mail ID',
    hintStyle: style,
  );
  final panNoDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'PAN No.',
    hintStyle: style,
  );
  final fatherNameDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Father\'s Name',
    hintStyle: style,
  );
  final addressDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Address',
    hintStyle: style,
  );
  final payModeDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Payment Mode',
    hintStyle: style,
  );
  final accHldNameDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Account Holder',
    hintStyle: style,
  );
  final bankNameDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Bank Name',
    hintStyle: style,
  );
  final accTypeDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: padding,
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Account Type',
    hintStyle: style,
  );
  final accNoDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: const EdgeInsets.all(23),
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Account No.',
    hintStyle: style,
  );
  final ifscDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: const EdgeInsets.all(23),
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'IFSC Code',
    hintStyle: style,
  );
}
