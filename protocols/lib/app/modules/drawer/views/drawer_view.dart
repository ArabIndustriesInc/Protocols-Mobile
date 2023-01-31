// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/drawer/views/contents_view.dart';
import 'package:protocols/app/routes/app_pages.dart';

class DrawerView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(
                0xffECF5FF,
              ),
            ),
            child: DrawerHeadingContents(),
          ),
          const SizedBox(
            height: 20,
          ),
          DashbaordNavButtons(
            title: 'Dashboard',
            onTap: () {
              Get.offAllNamed(Routes.HOME);
            },
          ),

          DashbaordNavButtons(
            title: 'About',
            onTap: () {
              //  Scaffold.of(context).closeDrawer();
              // Get.offAllNamed(Routes.HOME);
            },
          ),
          DashbaordNavButtons(
            title: 'Help',
            onTap: () {
              //  Scaffold.of(context).closeDrawer();
              // Get.offAllNamed(Routes.HOME);
            },
          ),
          DashbaordNavButtons(
            title: 'Logout',
            onTap: () {
              Scaffold.of(context).closeDrawer();
              showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteAlertView(
                      subtitle:
                          'Are you sure, you want to logout from this account?',
                      title: 'Logout',
                      action: InkWell(
                        highlightColor: Colors.grey[200],
                        onTap: () {
                          Get.back();
                          Get.offAllNamed(Routes.WELCOME);
                          box.write('login_token', '');
                          SnackbarMessage().snackBarMessage(
                              'Logged out successfully!', context);
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 227, 0, 0),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
          // DashbaordNavButtons(
          //   title: 'Logout',
          //   onTap: () {
          //     // Get.offAllNamed(Routes.HOME);
          //   },
          // ),
        ],
      ),
    );
  }
}

//   ListTile drawerItems(
//       {required String title, required GestureTapCallback onTap}) {
//     return ListTile(
//         onTap: onTap,
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         title: Text(
//           title,
//           style: const TextStyle(
//             fontSize: 20,
//             color: Colors.black,
//           ),
//         ),
//         trailing: const Icon(
//           Icons.arrow_forward_ios_rounded,
//           color: Colors.black,
//         ));
//   }
// }
// Container(
            //   height: 140,
            //   color: const Color(0xffECF5FF),
            //   child: Column(
            //     children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Builder(builder: (context) {
                  //       return IconButton(
                  //         padding: const EdgeInsets.only(right: 30),
                  //         onPressed: () {
                  //           Scaffold.of(context).closeDrawer();
                  //         },
                  //         icon: const Icon(
                  //           Icons.close_rounded,
                  //           color: Color(0xff2D9CEA),
                  //           size: 33,
                  //         ),
                  //       );
                  //     }),
                  //   ],
                  // ),
            //       SizedBox(height: MediaQuery.of(context).size.height / 25),
            //       Image.asset(
            //         'assets/images/logo.png',
            //         height: 26,
            //       )
            //     ],
            //   ),
            // ),
            // const Expanded(
            //   child: SizedBox(),
            // ),
            // Container(
            //   height: 8.h,
            //   color: const Color(0xffECF5FF),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       TextButton(
            //         style: TextButton.styleFrom(shape: const CircleBorder()),
            //         onPressed: () {},
            //         child: Image.asset(
            //           'assets/icons/profile.png',
            //           height: MediaQuery.of(context).size.height * 0.045,
            //         ),
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(shape: const CircleBorder()),
            //         onPressed: () {},
            //         child: Image.asset(
            //           'assets/icons/notification.png',
            //           height: MediaQuery.of(context).size.height * 0.045,
            //         ),
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(shape: const CircleBorder()),
            //         onPressed: () {},
            //         child: Image.asset(
            //           'assets/icons/logout.png',
            //           height: MediaQuery.of(context).size.height * 0.045,
            //         ),
            //       ),
            //     ],
            //   ),
            // )