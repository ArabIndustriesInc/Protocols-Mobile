import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmpInvDirImageShow extends GetView {
  final String img;
  final Widget image;
  const EmpInvDirImageShow({required this.img, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      filterQuality: FilterQuality.low,
      imageUrl: img,
      imageBuilder: (context, imageProvider) {
        return image;
      },
      progressIndicatorBuilder: (context, url, progress) {
        return Transform.scale(
          scale: 0.8,
          child: Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: const CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        );
      },
      // placeholder: (context, url) {
      //   return Transform.scale(
      //     scale: 0.8,
      //     child: Padding(
      //       padding: EdgeInsets.only(right: 15.w),
      //       child: const CircularProgressIndicator(
      //         color: Colors.blue,
      //       ),
      //     ),
      //   );
      // },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

class EmpInvDirImageShowCircle extends GetView {
  final String img;
  const EmpInvDirImageShowCircle({required this.img, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      filterQuality: FilterQuality.low,
      imageUrl: img,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          backgroundColor: Colors.grey,
          radius: MediaQuery.of(context).size.width / 7,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: MediaQuery.of(context).size.width / 7.15,
            backgroundImage: NetworkImage(
              img,
            ),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        return const Text(
          'Loading...',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        );
      },
      // placeholder: (context, url) {
      //   return Transform.scale(
      //     scale: 0.8,
      //     child: Padding(
      //       padding: EdgeInsets.only(right: 15.w),
      //       child: const CircularProgressIndicator(
      //         color: Colors.blue,
      //       ),
      //     ),
      //   );
      // },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
