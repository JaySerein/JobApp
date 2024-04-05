import 'package:get/get.dart';
import 'package:job_app/src/utils/network/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
