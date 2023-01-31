// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';

class EmployeeAddDateController extends GetxController {
  final todayDay = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  DateTime pickedDateWork = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  var todayMonthWork = DateFormat.MMM().format(DateTime.now()).obs;
  var todayDateWork = DateFormat.d().format(DateTime.now()).obs;
  var todayYearWork = DateFormat.y().format(DateTime.now());
  var yrShortWork = DateFormat.y().format(DateTime.now()).substring(2, 4).obs;
  DateTime pickedDatePersonal = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  var todayMonthPersonal = DateFormat.MMM().format(DateTime.now()).obs;
  var todayDatePersonal = DateFormat.d().format(DateTime.now()).obs;
  var todayYearPersonal = DateFormat.y().format(DateTime.now());
  var yrShortPersonal =
      DateFormat.y().format(DateTime.now()).substring(2, 4).obs;
  Future datePickerWork(BuildContext context) async {
    pickedDateWork = (await showDatePicker(
            context: context,
            initialDate:
                (pickedDateWork != todayDay) ? pickedDateWork : todayDay,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        pickedDateWork;

    if (pickedDateWork.toString().isEmpty) {
      pickedDateWork = todayDay;
    }
    todayDateWork.value = DateFormat.d().format(pickedDateWork);
    todayMonthWork.value = DateFormat.MMM().format(pickedDateWork);
    todayYearWork = DateFormat.y().format(pickedDateWork);
    yrShortWork.value = todayYearWork.substring(2, 4);
    update();
  }

  Future datePickerPersonal(BuildContext context) async {
    pickedDatePersonal = (await showDatePicker(
            context: context,
            initialDate: (pickedDatePersonal != DateTime.now())
                ? pickedDatePersonal
                : todayDay,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        pickedDatePersonal;

    if (pickedDatePersonal.toString().isEmpty) {
      pickedDatePersonal = todayDay;
    }
    todayDatePersonal.value = DateFormat.d().format(pickedDatePersonal);
    todayMonthPersonal.value = DateFormat.MMM().format(pickedDatePersonal);
    todayYearPersonal = DateFormat.y().format(pickedDatePersonal);
    yrShortPersonal.value = todayYearPersonal.substring(2, 4);
    update();
  }

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
}
