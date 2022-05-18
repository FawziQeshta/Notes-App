import 'package:notes/utils/constants.dart';

class CategoryNote {

  String id = '';
  String title = '';
  String description = '';
  String categoryId = '';
  int status = 0;
  bool isDeleted = false;

  CategoryNote(this.id, this.title, this.description, this.categoryId, this.status);

  CategoryNote.fromMap(this.id, Map<String, dynamic> map) {
    title = map[Constants.NOTE_TITLE_KEY];
    description = map[Constants.NOTE_DESC_KEY];
    categoryId = map[Constants.NOTE_CAT_ID_KEY];
    status = map[Constants.NOTE_STATUS_KEY];
    isDeleted = map[Constants.NOTE_IS_DELETED_KEY];
  }

}