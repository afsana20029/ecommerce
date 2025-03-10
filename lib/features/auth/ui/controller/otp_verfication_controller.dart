import 'package:ecommerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../data/models/sign_in_model.dart';

class OtpVerficationController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.verifyOtpUrl(email, otp));
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
