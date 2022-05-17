import 'package:get/get.dart';
import 'package:notes/controllers/category_controller.dart';
import 'package:notes/controllers/category_note_controller.dart';

class CategoryBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(()=> CategoryController(), fenix: true);
    Get.lazyPut(()=> CategoryNoteController(), fenix: true);
  }

}