class CategoryNote {

  String id;
  String title;
  String description;
  String categoryId;

  CategoryNote(this.id, this.title, this.description, this.categoryId);

  Map<String, dynamic> getDataMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "categoryId": categoryId,
    };
  }

}