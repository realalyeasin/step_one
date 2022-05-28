import 'package:get/get.dart';
import '../Controller/controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
  }
}