class Category {

  String id = '';
  String title = '';
  String description = '';

  Category(this.id, this.title, this.description);

  Category.fromMap(this.id, Map<String, dynamic> map) {
    title = map['title'];
    description = map['description'];
  }

  // Map<String, dynamic> getDataMap(Map<String, dynamic> map) {
  //   return {
  //     "id": id,
  //     "title": title,
  //     "description": description,
  //   };
  // }

}