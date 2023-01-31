import 'package:get/get.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/files_model.dart';
import 'package:protocols/app/modules/docs_folder/controllers/folder_controller.dart';

class FilesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Files.fromJson(map);
      if (map is List) return map.map((item) => Files.fromJson(item)).toList();
    };
    httpClient.baseUrl = '${baseUrlApi}folder/';
  }

  Future<Files?> getFiles(int id) async {
    final response = await get('files/$id');
    return response.body;
  }

  Future<List<Files>> getAllFolders() async {
    final token = box.read('login_token');
    final response = await get('${baseUrlApi}folder/show',
        headers: {'Authorization': 'Bearer $token'});
    Get.find<FolderController>().loading.value = false;
    FilesModel folder = filesModelFromJson(response.bodyString!);
    return folder.data;
  }

  Future<Response<Files>> postFiles(Files files) async =>
      await post('files', files);
  Future<Response> deleteFiles(int id) async => await delete('files/$id');
}
