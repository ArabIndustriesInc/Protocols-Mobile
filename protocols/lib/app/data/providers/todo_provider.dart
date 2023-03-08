// ignore_for_file: use_build_context_synchronously
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/todo_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/todo/controllers/todo_controller.dart';
import 'package:protocols/app/modules/todo_add/controllers/todo_add_controller.dart';
import 'package:protocols/app/modules/todo_edit/controllers/todo_edit_controller.dart';
import 'package:protocols/app/routes/app_pages.dart';

class TodoProvider extends GetConnect {
  static var isFinishedTodo = false;
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Todo.fromJson(map);
      if (map is List) return map.map((item) => Todo.fromJson(item)).toList();
    };
    httpClient.baseUrl = '${baseUrlApi}todo/';
  }

  getAllTodo(BuildContext context) async {
    isFinishedTodo = false;
    try {
      final token = box.read('login_token');
      final response = await get('${baseUrlApi}todo/showtodo',
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loading');
        TodoModel todo = todoModelFromJson(response.bodyString!);
        isClosedList(todo.data);
      } else if (response.statusCode == 400) {
        var data = jsonDecode(response.bodyString!);
        if (data['payment'] == false) {
          Get.back();
          Get.toNamed(Routes.UPGRADE_PLAN);
        }
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

  addTodo(AddTodo todo, BuildContext context) async {
    isFinishedTodo = false;
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
        getAllTodo(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('New Task added successfully!', context));
      } else {
        isClosedFunctionLoading('loadingAdd');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingAdd');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong. Try again later', context));
    }
  }

  editTodo(AddTodo todo, String id, BuildContext context) async {
    isFinishedTodo = false;
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
        getAllTodo(context);
        Get.back();
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Task edited successfully!', context));
      } else {
        isClosedFunctionLoading('loadingEdit');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingEdit');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong. Try again later', context));
    }
  }

  deleteTodo(String id, BuildContext context) async {
    isFinishedTodo = false;
    Get.find<TodoController>().loadingDelete.value = true;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}todo/delete/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        getAllTodo(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Task deleted successfully!', context));
      } else {
        isClosedFunctionLoading('loadingDelete');
        isClosedMessage(SnackbarMessage())
            .snackBarMessage('Oops! Action failed, Please try again', context);
      }
    } catch (e) {
      isClosedFunctionLoading('loadingDelete');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong. Try again later', context));
    }
  }

  @override
  void onClose() {
    isFinishedTodo = true;
    super.onClose();
  }

  isClosedList(List<Todo> todo) {
    if (isFinishedTodo == false) {
      Get.find<TodoController>().todoDetails.value = todo;
      Get.find<TodoController>().update();
    }
  }

  isClosedMessage(dynamic message) {
    if (isFinishedTodo == false) {
      message;
    }
  }

  isClosedFunctionLoading(String name) {
    if (isFinishedTodo == false) {
      switch (name) {
        case 'loading':
          Get.find<TodoController>().loading.value = false;
          break;
        case 'loadingAdd':
          Get.find<TodoAddController>().loadingAdd.value = false;
          break;
        case 'loadingEdit':
          Get.find<TodoEditController>().loadingEdit.value = false;
          break;
        case 'loadingDelete':
          Get.find<TodoController>().loadingDelete.value = false;
          break;
      }
    }
  }
}
