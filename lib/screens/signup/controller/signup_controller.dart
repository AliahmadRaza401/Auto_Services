import 'package:auto_services/widgets/widgets_imports.dart';

class SignUpController extends GetxController {
  var isChecked = false.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }
}
