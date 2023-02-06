// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/todo_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/todo/controllers/todo_controller.dart';
import 'package:protocols/app/modules/todo_add/controllers/todo_add_controller.dart';

class TodoProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Todo.fromJson(map);
      if (map is List) return map.map((item) => Todo.fromJson(item)).toList();
    };
    httpClient.baseUrl = '${baseUrlApi}todo/';
  }

  Future<List<Todo>> getAllTodo() async {
    final token = box.read('login_token');
    final response = await get('${baseUrlApi}todo/showtodo',
        headers: {'Authorization': 'Bearer $token'});
    Get.find<TodoController>().loading.value = false;
    // log(response.statusCode.toString());
    TodoModel todo = todoModelFromJson(response.bodyString!);
    return todo.data;
  }

  addTodo(AddTodo todo, BuildContext context) async {
    try {
      final token = box.read('login_token');
      final response =
          await http.post(Uri.parse('${baseUrlApi}todo/addtodo'), body: {
        'title': todo.title,
        'task': todo.task,
        'deadline': todo.deadline,
      }, headers: {
        'Authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        getAllTodo();
        Get.find<TodoController>().getAllTodo();
        Get.back(
          result: Get.find<TodoController>().getAllTodo(),
        );
        SnackbarMessage()
            .snackBarMessage('New Task added successfully!', context);
      } else {
        Get.find<TodoAddController>().loadingAdd.value = false;
        log('failed');
        log(response.statusCode.toString());
        SnackbarMessage()
            .snackBarMessage('Oops! Action Failed. Please try again', context);
      }
    } catch (e) {
      Get.find<TodoAddController>().loadingAdd.value = false;
      log(e.toString());
      SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong. Try again later', context);
    }
  }

  editTodo(AddTodo todo, String id, BuildContext context) async {
    try {
      final token = box.read('login_token');
      final response =
          await http.post(Uri.parse('${baseUrlApi}todo/edittodo/$id'), body: {
        'title': todo.title,
        'task': todo.task,
        'deadline': todo.deadline,
      }, headers: {
        'Authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        log(response.body);
        getAllTodo();
        Get.find<TodoController>().getAllTodo();
        Get.back(
          result: Get.find<TodoController>().getAllTodo(),
        );
        SnackbarMessage().snackBarMessage('Task edited successfully!', context);
      } else {
        Get.find<TodoAddController>().loadingAdd.value = false;
        log('failed');
        log(response.statusCode.toString());
        SnackbarMessage()
            .snackBarMessage('Oops! Action Failed. Please try again', context);
      }
    } catch (e) {
      Get.find<TodoAddController>().loadingAdd.value = false;
      log(e.toString());
      SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong. Try again later', context);
    }
  }

  deleteTodo(String id, BuildContext context) async {
    Get.find<TodoController>().loadingDelete.value = true;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}todo/delete/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        log(response.body);
        getAllTodo();
        Get.find<TodoController>().getAllTodo();
        Get.back(
          result: Get.find<TodoController>().getAllTodo(),
        );
        SnackbarMessage()
            .snackBarMessage('Task deleted successfully!', context);
      } else {
        Get.find<TodoController>().loadingDelete.value = true;
        log('failed');
        log(response.statusCode.toString());
        SnackbarMessage()
            .snackBarMessage('Oops! Action Failed. Please try again', context);
      }
    } catch (e) {
      Get.find<TodoController>().loadingDelete.value = true;
      log(e.toString());
      SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong. Try again later', context);
    }
  }
}
