class CategoryNote {

  String id = '';
  String title = '';
  String description = '';
  String categoryId = '';

  CategoryNote(this.id, this.title, this.description, this.categoryId);

  CategoryNote.fromMap(this.id, Map<String, dynamic> map) {
    title = map['title'];
    description = map['description'];
    categoryId = map['category_id'];
  }

}