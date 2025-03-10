import 'package:ecommerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../data/models/sign_in_model.dart';

class SignInController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final requestParams = {
      "email": email,
      "password": password,
    };
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.signInUrl, body: requestParams);
    if (response.isSuccess) {
      SignInModel signInModel = SignInModel.fromJson(response.responseData);
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
