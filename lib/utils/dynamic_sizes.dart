import '../widgets/widgets_imports.dart';

kWidth(double dynamicSize) {
  return Get.width * dynamicSize;
}

kHeight(double dynamicSize) {
  return Get.height * dynamicSize;
}

widthBox(double dynamicSize) {
  return SizedBox(
    width: Get.width * dynamicSize,
  );
}

heightBox(double dynamicSize) {
  return SizedBox(
    height: Get.height * dynamicSize,
  );
}
