import 'package:get/get.dart';
import 'package:protocols/app/data/models/notes_model.dart';
import 'package:protocols/app/data/providers/notes_provider.dart';

class NotesController extends GetxController {
  RxList notesDetails = [].obs;
  List<Notes> notes = [];
  var loading = true.obs;
  var loadingDelete = false.obs;
  getAllNotes() async {
    notes = await NotesProvider()
        .getAllNotes()
        .whenComplete(() => loading.value = false);
    notesDetails.clear();
    notesDetails.addAll(notes);
    update();
  }

  @override
  void onInit() async {
    getAllNotes();
    update();
    super.onInit();
  }
}

class NoteModel {
  final String title;
  final String description;
  final List<String> sections;
  final String time;

  NoteModel({
    required this.title,
    required this.description,
    required this.sections,
    required this.time,
  });
}
