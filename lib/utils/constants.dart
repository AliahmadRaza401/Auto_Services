import 'package:auto_services/common_models/user.dart';

import '../widgets/widgets_imports.dart';

/// App Constants

String appVersion = "0.0.0";

/// GetX Constants

var obscureText = true.obs;
var obscureTextCP = true.obs;
var defaultObscureText = false.obs;
final selectedService = Rxn<String>();
final userData = Rxn<UserModel>();

/// API Constants

const Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};
