import 'package:ecommerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EmailVerificationController extends GetxController{

  bool _inProgress = false;
  bool get inProgress => _inProgress;
  Future <void> verifyEmail(String email) async {
    _inProgress = true;
    update();
    final NetworkResponse response =await Get.find<NetworkCaller>().getRequest();
  }

}