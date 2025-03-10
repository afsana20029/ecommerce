import 'package:ecommerce/features/auth/ui/controller/otp_verfication_controller.dart';
import 'package:ecommerce/features/auth/ui/controller/read_profile_controller.dart';
import 'package:ecommerce/features/auth/ui/controller/sign_in_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(SignInController());
    Get.put(OtpVerficationController());
    Get.put(ReadProfileController());

  }
}