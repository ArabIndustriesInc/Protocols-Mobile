// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/voting_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/voting/controllers/voting_controller.dart';
import 'package:protocols/app/modules/voting_add/controllers/voting_add_controller.dart';
import 'package:protocols/app/modules/voting_details/controllers/voting_details_controller.dart';

class VotingProvider extends GetConnect {
  static var isFinishedVoting = false;
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Voting.fromJson(map);
      if (map is List) return map.map((item) => Voting.fromJson(item)).toList();
    };
    httpClient.baseUrl = '${baseUrlApi}vote/showvote';
  }

  getAllVotes(BuildContext context) async {
    isFinishedVoting = false;
    try {
      final token = box.read('login_token');
      final response = await get('${baseUrlApi}vote/showvote',
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loading');
        VotingModel voting = votingFromJson(response.bodyString!);
        isClosedList(voting.data);
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

  addVote(AddVoting vote, BuildContext context) async {
    isFinishedVoting = false;
    try {
      final token = box.read('login_token');
      final response =
          await http.post(Uri.parse('${baseUrlApi}vote/addvote'), body: {
        'title': vote.title,
        'description': vote.description,
        'selectdate': vote.selectdate,
      }, headers: {
        'Authorization': 'Bearer $token'
      });
      // var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        getAllVotes(context);
        isClosedFunctionLoading('loadingAdd');
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('New vote added successfully!', context));
      } else {
        isClosedFunctionLoading('loadingAdd');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Try again later.', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingAdd');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Please try again', context));
    }
  }

  addVoteStatus(VotingStatus voteStatus, BuildContext context) async {
    isFinishedVoting = false;
    try {
      final token = box.read('login_token');
      final response =
          await http.post(Uri.parse('${baseUrlApi}vote/addstatus'), body: {
        'voteid': voteStatus.voteId,
        'status': voteStatus.status,
      }, headers: {
        'Authorization': 'Bearer $token'
      });
      // var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        showVoteStatus(voteStatus.voteId, context);
        isClosedFunctionLoading('loadingVoteStatus');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Voted casted successfully!', context));
      } else if (response.statusCode == 400) {
        showVoteStatus(voteStatus.voteId, context);
        isClosedFunctionLoading('loadingVoteStatus');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! you have already voted once.', context));
      } else {
        isClosedFunctionLoading('loadingVoteStatus');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingVoteStatus');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Please try again', context));
    }
  }

  showVoteStatus(String voteId, BuildContext context) async {
    isFinishedVoting = false;
    try {
      final token = box.read('login_token');
      final response = await http.get(
          Uri.parse('${baseUrlApi}vote/showvote/$voteId'),
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        final countYes = data['datayes'];
        final countNo = data['datano'];
        percentCount(countYes, countNo);
      } else {
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Somethng went wrong. Try again later', context));
    }
  }

  deleteVote(String voteId, BuildContext context) async {
    isFinishedVoting = false;
    Get.find<VotingController>().loadingDelete.value = true;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}vote/delete/$voteId'),
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        getAllVotes(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Vote deleted successfully!', context));
        isClosedFunctionLoading('loadingDelete');
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
    isFinishedVoting = true;
    super.onClose();
  }

  isClosedList(List<Voting> votes) {
    if (isFinishedVoting == false) {
      Get.find<VotingController>().votes = votes;
      Get.find<VotingController>().update();
    }
  }

  isClosedMessage(dynamic message) {
    if (isFinishedVoting == false) {
      message;
    }
  }

  percentCount(countYes, countNo) {
    if (isFinishedVoting == false) {
      Get.find<VotingDetailsController>().percent(countYes, countNo);
    }
  }

  isClosedFunctionLoading(String name) {
    if (isFinishedVoting == false) {
      switch (name) {
        case 'loading':
          Get.find<VotingController>().loading.value = false;
          break;
        case 'loadingAdd':
          Get.find<VotingAddController>().loadingAdd.value = false;
          break;
        case 'loadingVoteStatus':
          Get.find<VotingDetailsController>().loadingVoteStatus.value = false;
          break;
        case 'loadingDelete':
          Get.find<VotingController>().loadingDelete.value = false;
          break;
      }
    }
  }
}
