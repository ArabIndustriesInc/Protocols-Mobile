import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/modules/consts/appbar.dart';

class AccountDetailsController extends GetxController {
  final siz1_5 = SizedBox(
    height: 20.h,
  );
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController accNameController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController acNoController = TextEditingController();
  TextEditingController brNameController = TextEditingController();
  final suggNameDeco = SuggestionsBoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
  );

  List<String> suggestons = [
    'Andhra Pradesh Grameena Vikas Bank',
    'Andhra Pragathi Grameena Bank',
    // -'Arunachal Pradesh Rural Bank',
    'Aryavart Bank',
    'Assam Gramin Vikash Bank',
    'Axis Bank',
    'Bandhan Bank',
    'Bangiya Gramin Vikash Bank',
    'Bank of Baroda',
    'Bank of India',
    'Bank of Maharashtra',
    'Baroda Gujarat Gramin Bank',
    'Baroda Rajasthan Kshetriya Gramin Bank',
    'Baroda UP Bank',
    'Central Bank of India',
    'CSB Bank',
    'Canara Bank',
    'Chaitanya Godavari Gramin Bank',
    'Chhattisgarh Rajya Gramin Bank',
    'City Union Bank',
    'DCB Bank',
    'Dakshin Bihar Gramin Bank',
    'Dhanlaxmi Bank',
    // -'Ellaquai Dehati Bank',
    'Federal Bank',
    'HDFC Bank',
    'Himachal Pradesh Gramin Bank',
    'ICICI Bank',
    'IDBI Bank',
    'IDFC First Bank',
    'Indian Bank',
    'Indian Overseas Bank',
    'IndusInd Bank',
    'Jammu & Kashmir Bank',
    'Jammu And Kashmir Grameen Bank',
    'Jharkhand Rajya Gramin Bank',
    'Karnataka Bank',
    'Karnataka Gramin Bank',
    'Karnataka Vikas Grameena Bank',
    'Karur Vysya Bank',
    'Kerala Gramin Bank',
    'Kotak Mahindra Bank',
    'Madhya Pradesh Gramin Bank',
    'Madhyanchal Gramin Bank',
    'Maharashtra Gramin Bank',
    'Manipur Rural Bank',
    'Meghalaya Rural Bank',
    'Mizoram Rural Bank',
    'Nagaland Rural Bank',
    'Nainital Bank',
    'Odisha Gramya Bank',
    'Paschim Banga Gramin Bank',
    'Prathama UP Gramin Bank',
    'Puduvai Bharathiar Grama Bank',
    'Punjab Gramin Bank',
    'Punjab and Sind Bank',
    'RBL Bank',
    'Rajasthan Marudhara Gramin Bank',
    'Saptagiri Gramin Bank',
    'Sarva Haryana Gramin Bank',
    'Saurashtra Gramin Bank',
    'South Indian Bank',
    'SBI Bank',
    'Tamil Nadu Grama Bank',
    'Tamilnad Mercantile Bank',
    'Telangana Grameena Bank',
    'Tripura Gramin Bank',
    'UCO Bank',
    'Union Bank of India',
    'Utkal Grameen Bank',
    // -'Uttar Bihar Gramin Bank',
    'Uttarakhand Gramin Bank',
    // -'Uttarbanga Kshetriya Gramin Bank',
    'Vidarbha Konkan Gramin Bank',
    'Yes Bank',
  ];

  final bankNameDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: border,
      errorBorder: border,
      contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
      focusedBorder: border,
      enabledBorder: border,
      hintText: 'Bank Name',
      hintStyle: TextStyle(
        fontSize: 15.5.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
  final brNameDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: border,
      errorBorder: border,
      contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
      focusedBorder: border,
      enabledBorder: border,
      hintText: 'Branch Name',
      hintStyle: TextStyle(
        fontSize: 15.5.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final nickNameDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: border,
      errorBorder: border,
      contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
      focusedBorder: border,
      enabledBorder: border,
      hintText: 'Nick Name',
      hintStyle: TextStyle(
        fontSize: 15.5.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final accNameDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: border,
      errorBorder: border,
      contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
      focusedBorder: border,
      enabledBorder: border,
      hintText: 'Account Name',
      hintStyle: TextStyle(
        fontSize: 15.5.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final ifscDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: border,
      errorBorder: border,
      contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
      focusedBorder: border,
      enabledBorder: border,
      hintText: 'IFSC',
      hintStyle: TextStyle(
        fontSize: 15.5.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final accNoDeco = InputDecoration(
    filled: true,
    fillColor: const Color(0xffF5FAFF),
    focusedErrorBorder: border,
    errorBorder: border,
    contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 22.h),
    focusedBorder: border,
    enabledBorder: border,
    hintText: 'Account No.',
    hintStyle: TextStyle(
      fontSize: 15.5.sp,
      fontFamily: 'Montserrat SemiBold',
      color: const Color(0xffADADAD),
    ),
  );
}

final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
);

class AccDetailsButtonView extends GetView {
  const AccDetailsButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            label: const Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
    );
    // return Row(
    //   children: [
    //     const SizedBox(
    //       width: 15,
    //     ),
    //     ElevatedButton.icon(
    //       onPressed: () {
    //         Get.back();
    //       },
    //       icon: const Icon(
    //         Icons.arrow_back_rounded,
    //         color: Colors.black,
    //         size: 30,
    //       ),
    //       style: ElevatedButton.styleFrom(
    //         padding: const EdgeInsets.only(bottom: 10),
    //         shadowColor: Colors.transparent,
    //         backgroundColor: Colors.transparent,
    //         elevation: 0,
    //       ),
    //       label: const Text(
    //         'Back',
    //         style: TextStyle(
    //             color: Colors.black,
    //             fontFamily: 'Montserrat SemiBold',
    //             fontSize: 18),
    //       ),
    //     ),
    //   ],
    // );
  }
}

class EditAccButtonView extends GetView {
  const EditAccButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.h),
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
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            label: const Text(
              'Back',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat SemiBold',
                  fontSize: 18),
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
                Get.back();
                SnackbarMessage()
                    .snackBarMessage('Account edited successfully!', context);
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(8.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 30.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BankDetailsTableContent extends GetView {
  final String title;
  final String content;
  const BankDetailsTableContent(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.8,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat SemiBold',
                  fontSize: 15.5.sp,
                  color: const Color.fromARGB(255, 0, 33, 84),
                ),
              ),
            ),
            Text(
              ':',
              style: TextStyle(
                fontFamily: 'Montserrat Bold',
                fontSize: 15.5.sp,
              ),
            )
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Flexible(
          child: Text(
            content,
            style: TextStyle(
              fontFamily: 'Montserrat Medium',
              fontSize: 15.5.sp,
              color: const Color.fromARGB(255, 0, 33, 84),
            ),
          ),
        ),
      ],
    );
  }
}
