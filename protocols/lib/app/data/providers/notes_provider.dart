// ignore_for_file: use_build_context_synchronously
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/notes_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/notes/controllers/notes_controller.dart';
import 'package:protocols/app/modules/notes_add/controllers/notes_add_controller.dart';
import 'package:protocols/app/modules/notes_edit/controllers/notes_edit_controller.dart';

class NotesProvider extends GetConnect {
  static var isFinishedNotes = false;
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Notes.fromJson(map);
      if (map is List) return map.map((item) => Notes.fromJson(item)).toList();
    };
    httpClient.baseUrl = '${baseUrlApi}notes/';
  }

  getAllNotes(BuildContext context) async {
    isFinishedNotes = false;

    try {
      final token = box.read('login_token');
      final response = await get('${baseUrlApi}notes/show',
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loading');
        NotesModel notes = notesFromJson(response.bodyString!);
        isClosedList(notes.data);
      } else {
        isClosedFunctionLoading('loading');
        isClosedList([]);
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loading');
      isClosedList([]);
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Try again later', context));
    }
  }

  addNote(AddNotes note, BuildContext context) async {
    isFinishedNotes = false;
    try {
      final token = box.read('login_token');
      final response =
          await http.post(Uri.parse('${baseUrlApi}notes/addnotes'), body: {
        'title': note.title,
        'description': note.description,
      }, headers: {
        'Authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loadingAdd');
        getAllNotes(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('New Notes added successfully!', context));
      } else {
        isClosedFunctionLoading('loadingAdd');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingAdd');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Try again later', context));
    }
  }

  editNote(AddNotes note, BuildContext context, String id) async {
    isFinishedNotes = false;
    try {
      final token = box.read('login_token');
      final response =
          await http.post(Uri.parse('${baseUrlApi}notes/editnotes/$id'), body: {
        'title': note.title,
        'description': note.description,
      }, headers: {
        'Authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loadingEdit');
        getAllNotes(context);
        Get.back();
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Notes edited successfully!', context));
      } else {
        isClosedFunctionLoading('loadingEdit');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingEdit');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Try again later', context));
    }
  }

  deleteNote(BuildContext context, String id) async {
    isFinishedNotes = false;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}notes/delete/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loadingDelete');
        getAllNotes(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Notes deleted successfully!', context));
      } else {
        isClosedFunctionLoading('loadingDelete');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingDelete');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Try again later', context));
    }
  }

  @override
  void onClose() {
    isFinishedNotes = true;
    super.onClose();
  }

  isClosedList(List<Notes> notes) {
    if (isFinishedNotes == false) {
      Get.find<NotesController>().notes = notes;
    }
    if (isFinishedNotes == false) {
      Get.find<NotesController>().notesDetails.clear();
    }
    if (isFinishedNotes == false) {
      Get.find<NotesController>().notesDetails.addAll(notes);
    }
    if (isFinishedNotes == false) {
      Get.find<NotesController>().update();
    }
  }

  isClosedMessage(dynamic message) {
    if (isFinishedNotes == false) {
      message;
    }
  }

  isClosedFunctionLoading(String name) {
    if (isFinishedNotes == false) {
      switch (name) {
        case 'loading':
          Get.find<NotesController>().loading.value = false;
          break;
        case 'loadingAdd':
          Get.find<NotesAddController>().loadingAdd.value = false;
          break;
        case 'loadingEdit':
          Get.find<NotesEditController>().loadingEdit.value = false;
          break;
        case 'loadingDelete':
          Get.find<NotesController>().loadingDelete.value = false;
          break;
      }
    }
  }
}
