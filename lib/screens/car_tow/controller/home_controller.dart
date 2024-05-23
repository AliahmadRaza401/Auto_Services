import 'package:auto_services/widgets/widgets_imports.dart';

class HomeController extends GetxController {
  TextEditingController pickup = TextEditingController();
  TextEditingController dropOff = TextEditingController();
  var startPoint = ''.obs;
  var destination = ''.obs;
  void swapLocations() {
    var temp = startPoint.value;
    startPoint.value = destination.value;
    destination.value = temp;
  }
}
