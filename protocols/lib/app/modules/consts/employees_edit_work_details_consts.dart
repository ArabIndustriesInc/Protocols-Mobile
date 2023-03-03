import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/employees_add/controllers/employee_add_date_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_date_controller.dart';

class DatePickEmployeeCardEdit extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final String date;
  final Widget title;
  const DatePickEmployeeCardEdit(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.date,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 4,
            color: const Color(0xffABC2D4).withOpacity(.8),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          final dateTime = DateTime.parse(date);
          Get.find<EmployeesEditDateController>()
              .datePickerWork(context, dateTime);
        },
        style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 25, left: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                icon,
                color: Colors.black,
                size: iconSize,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subTitle,
                    style:
                        const TextStyle(color: Color(0xffADADAD), fontSize: 14),
                  ),
                  title,
                ],
              ),
            ),
            const Icon(
              Icons.expand_more_rounded,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class DatePickEmployeeCardAdd extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  const DatePickEmployeeCardAdd(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 4,
            color: const Color(0xffABC2D4).withOpacity(.8),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          Get.find<EmployeeAddDateController>().datePickerWork(context);
        },
        style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 25, left: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                icon,
                color: Colors.black,
                size: iconSize,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subTitle,
                    style:
                        const TextStyle(color: Color(0xffADADAD), fontSize: 14),
                  ),
                  title,
                ],
              ),
            ),
            const Icon(
              Icons.expand_more_rounded,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class DatePickEmployeePeronalCardEdit extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  final String date;
  const DatePickEmployeePeronalCardEdit(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.date,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 4,
            color: const Color(0xffABC2D4).withOpacity(.8),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          final dateTime = DateTime.parse(date);
          Get.find<EmployeesEditDateController>()
              .datePickerPersonal(context, dateTime);
        },
        style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 25, left: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                icon,
                color: Colors.black,
                size: iconSize,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subTitle,
                    style:
                        const TextStyle(color: Color(0xffADADAD), fontSize: 14),
                  ),
                  title,
                ],
              ),
            ),
            const Icon(
              Icons.expand_more_rounded,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class DatePickEmployeePeronalCardAdd extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  const DatePickEmployeePeronalCardAdd(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 4,
            color: const Color(0xffABC2D4).withOpacity(.8),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          Get.find<EmployeeAddDateController>().datePickerPersonal(context);
        },
        style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 25, left: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                icon,
                color: Colors.black,
                size: iconSize,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subTitle,
                    style:
                        const TextStyle(color: Color(0xffADADAD), fontSize: 14),
                  ),
                  title,
                ],
              ),
            ),
            const Icon(
              Icons.expand_more_rounded,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class PickerTheme extends GetView {
  final Widget child;
  const PickerTheme(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            dialogTheme: const DialogTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)))),
            fontFamily: 'Montserrat SemiBold',
            colorScheme: const ColorScheme.light(primary: Color(0xff68B9EB)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary)),
        child: child);
  }
}

class EmpDrsInvTextField extends GetView {
  final TextEditingController contrlr;
  final String required;
  final TextInputType type;
  final InputDecoration deco;
  final bool Function(String) validate;
  final TextCapitalization capType;

  const EmpDrsInvTextField({
    Key? key,
    required this.contrlr,
    required this.required,
    required this.type,
    required this.validate,
    required this.deco,
    required this.capType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: (required == 'Mail ID') ? false : true,
      controller: contrlr,
      validator: ((value) {
        if (value!.isEmpty) {
          return "$required is required!";
        } else if (!validate(value)) {
          return "Invalid data! Enter a valid one!";
        } else {
          return null;
        }
      }),
      style: TextStyle(
          color: (required == 'Mail ID') ? Colors.grey[500] : Colors.black),
      textCapitalization: capType,
      keyboardType: type,
      decoration: deco,
      maxLines: (required == 'Work Location' || required == 'Address') ? 4 : 1,
      cursorColor: Colors.grey[600],
    );
  }
}

class FieldPadding extends GetView {
  final Widget child;
  const FieldPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: child,
    );
  }
}
