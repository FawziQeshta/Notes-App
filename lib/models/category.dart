import 'package:notes/utils/constants.dart';

class Category {

  String id = '';
  String title = '';
  String description = '';
  String uid = '';

  Category(this.id, this.uid, this.title, this.description);
  Category.update(this.id, this.title, this.description);
  Category.addNew(this.title, this.description);

  Category.fromMap(this.id, Map<String, dynamic> map) {
    title = map[Constants.CATEGORY_TITLE_KEY];
    uid = map[Constants.USER_ID_KEY];
    description = map[Constants.CATEGORY_DESC_KEY];
  }

}