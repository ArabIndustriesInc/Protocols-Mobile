// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/files_model.dart';
import 'package:protocols/app/data/providers/files_provider.dart';
import 'package:protocols/app/modules/docs_folder/controllers/folder_controller.dart';
// import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages

class FolderFunctions {
  String extentionFinder(String ext) {
    final extension = ext.toLowerCase();
    if (extension == '.jpeg' ||
        extension == '.jpg' ||
        extension == '.webp' ||
        extension == '.png' ||
        extension == '.svg' ||
        extension == '.gif' ||
        extension == '.heic' ||
        extension == '.tiff' ||
        extension == '.tif' ||
        extension == '.raw') {
      return 'assets/icons/image.svg';
    } else if (extension == '.wav' ||
        extension == '.aiff' ||
        extension == '.pcm' ||
        extension == '.mp3' ||
        extension == '.aac' ||
        extension == '.ogg' ||
        extension == '.flac' ||
        extension == '.alac' ||
        extension == '.wma') {
      return 'assets/icons/audio.svg';
    } else if (extension == '.mp4' ||
        extension == '.mov' ||
        extension == '.mpeg' ||
        extension == '.wmv' ||
        extension == '.flv' ||
        extension == '.avi' ||
        extension == '.avchd' ||
        extension == '.webm' ||
        extension == '.mkv' ||
        extension == '.f4v') {
      return 'assets/icons/video.svg';
    } else if (extension == '.doc' ||
        extension == '.docx' ||
        extension == '.html' ||
        extension == '.htm' ||
        extension == '.pdf' ||
        extension == '.odt' ||
        extension == '.xls' ||
        extension == '.xlsx' ||
        extension == '.ods' ||
        extension == '.ppt' ||
        extension == '.pptx' ||
        extension == '.txt') {
      return 'assets/icons/document.svg';
    } else if (extension == '.zip' ||
        extension == '.rar' ||
        extension == '.arj' ||
        extension == '.tar.gz' ||
        extension == '.tgz' ||
        extension == '.arc' ||
        extension == '.zipx') {
      return 'assets/icons/zip.png';
    } else {
      return 'assets/icons/unknown.png';
    }
  }
}

class FolderViewButton extends GetView {
  final String folderid;
  const FolderViewButton({Key? key, required this.folderid}) : super(key: key);
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
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
              allowMultiple: false
              //      type: FileType.custom,
              //  allowedExtensions: ['jpg', 'pdf', 'doc','jpeg','png','mpg','mov',''],
              );
          if (result == null) {
            return;
          } else {
            if (!Get.find<FolderController>().loadingAdd.value) {
              Get.find<FolderController>().loadingAdd.value = true;
              final filename = result.files.first.name;
              final image = File(result.files.first.path!);
              final file = AddFiles(
                  image: image, folderid: folderid, filename: filename);
              FilesProvider().addFile(file, context);
            }
          }
        },
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(8.h),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Obx(() {
          return (Get.find<FolderController>().loadingAdd.value)
              ? Transform.scale(
                  scale: 0.6,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.7,
                  ),
                )
              : Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 35.w,
                );
        }),
      ),
    );
  }
}
 // log('Name: ${file.name}');
          // log('Bytes: ${file.bytes}');
          // log('Size: ${file.size}');
          // log('Extension: ${file.extension}');
          // log('Path: ${file.path}');
          // final newFile = await saveFilePermenantly(file);
          // log('From Path: ${file.path!}');
          // log('To Path: ${newFile.path}');

  //   Future<File> saveFilePermenantly(String file) async {
  //   final appStorage = await getApplicationDocumentsDirectory();
  //   String fileName = file.split('/').last;
  //   String ext = p.extension(file).toUpperCase();
  //   final newFile = File('${appStorage.path}/$ext-$fileName');
  //   return File(file).copy(newFile.path);
  // }
