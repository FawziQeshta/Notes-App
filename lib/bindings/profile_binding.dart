import 'package:get/get.dart';
import 'package:notes/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
  }

}
