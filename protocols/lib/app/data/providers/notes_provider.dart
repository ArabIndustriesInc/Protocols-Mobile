// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/notes_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/notes/controllers/notes_controller.dart';

class NotesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Notes.fromJson(map);
      if (map is List) return map.map((item) => Notes.fromJson(item)).toList();
    };
    httpClient.baseUrl = '${baseUrlApi}notes/';
  }

  Future<Notes?> getNotes(int id) async {
    final response = await get('notes/$id');
    return response.body;
  }

  Future<List<Notes>> getAllNotes() async {
    final token = box.read('login_token');
    final response = await get('${baseUrlApi}notes/show',
        headers: {'Authorization': 'Bearer $token'});
    Get.find<NotesController>().loading.value = false;
    log(response.statusCode.toString());
    log(response.bodyString!.toString());
    NotesModel notes = notesFromJson(response.bodyString!);
    return notes.data;
  }

  addNote(AddNotes note, BuildContext context) async {
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
        getAllNotes();
        Get.find<NotesController>().getAllNotes();
        Get.back(
          result: Get.find<NotesController>().getAllNotes(),
        );
        SnackbarMessage()
            .snackBarMessage('New Notes added successfully!', context);
      } else {
        log('failed');
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  editNote(AddNotes note, BuildContext context, String id) async {
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
        getAllNotes();
        Get.find<NotesController>().getAllNotes();
        Get.back();
        SnackbarMessage()
            .snackBarMessage('Notes edited successfully!', context);
      } else {
        log('failed');
        log(response.body);
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  deleteNote(BuildContext context, String id) async {
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}notes/delete/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        Get.find<NotesController>().loadingDelete.value = false;
        getAllNotes();
        Get.find<NotesController>().getAllNotes();
        Get.back();
        SnackbarMessage()
            .snackBarMessage('Notes deleted successfully!', context);
      } else {
        log('failed');
        log(response.body);
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
