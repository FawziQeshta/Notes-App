import 'package:get/get.dart';
import 'package:notes/controllers/auth_controller.dart';

class AuthBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(()=> AuthController(), fenix: true);
  }

}