// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/voting_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/voting/controllers/voting_controller.dart';
import 'package:protocols/app/modules/voting_details/controllers/voting_details_controller.dart';

class VotingProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Voting.fromJson(map);
      if (map is List) return map.map((item) => Voting.fromJson(item)).toList();
    };
    httpClient.baseUrl = '${baseUrlApi}vote/showvote';
  }

  Future<Voting?> getVoting(int id) async {
    final response = await get('voting/$id');
    return response.body;
  }

  Future<List<Voting>> getAllVotes() async {
    final token = box.read('login_token');
    final response = await get('${baseUrlApi}vote/showvote',
        headers: {'Authorization': 'Bearer $token'});
    Get.find<VotingController>().loading.value = false;
    VotingModel transactions = votingFromJson(response.bodyString!);
    return transactions.data;
  }

  addVote(AddVoting vote, BuildContext context) async {
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
      log(response.body);
      if (response.statusCode == 200) {
        getAllVotes();
        Get.find<VotingController>().getAllVotes();
        Get.back(result: Get.find<VotingController>().getAllVotes());
        SnackbarMessage()
            .snackBarMessage('New vote added successfully!', context);
      } else {
        SnackbarMessage()
            .snackBarMessage('Oops! Action failed! Try again later.', context);
      }
    } catch (e) {
      Get.find<VotingDetailsController>().loadingVoteStatus.value = false;
      SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Please try again', context);
    }
  }

  addVoteStatus(VotingStatus voteStatus, BuildContext context) async {
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
      log(response.body);
      if (response.statusCode == 200) {
        showVoteStatus(voteStatus.voteId, context);
        Get.find<VotingDetailsController>().loadingVoteStatus.value = false;
        SnackbarMessage()
            .snackBarMessage('Voted casted successfully!', context);
      } else if (response.statusCode == 400) {
        showVoteStatus(voteStatus.voteId, context);
        Get.find<VotingDetailsController>().loadingVoteStatus.value = false;
        SnackbarMessage()
            .snackBarMessage('Oops! you have already voted once.', context);
      } else {
        Get.find<VotingDetailsController>().loadingVoteStatus.value = false;
        SnackbarMessage()
            .snackBarMessage('Oops! Action failed. Please try again', context);
      }
    } catch (e) {
      Get.find<VotingDetailsController>().loadingVoteStatus.value = false;
      SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Please try again', context);
    }
  }

  showVoteStatus(String voteId, BuildContext context) async {
    try {
      final token = box.read('login_token');
      final response = await http.get(
          Uri.parse('${baseUrlApi}vote/showvote/$voteId'),
          headers: {'Authorization': 'Bearer $token'});
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        final countYes = data['datayes'];
        final countNo = data['datano'];
        Get.find<VotingDetailsController>().percent(countYes, countNo);
      } else {
        SnackbarMessage()
            .snackBarMessage('Oops! Action failed. Please try again', context);
      }
    } catch (e) {
      log(e.toString());
      SnackbarMessage().snackBarMessage('Oops! $e. Please try again', context);
    }
  }
}
