import 'widgets_imports.dart';

class KSnackBar {
  successSnackBar(
    message, {
    position = SnackPosition.BOTTOM,
    duration = 1500,
    overlay = false,
  }) {
    return Get.snackbar(
      "Success",
      message,
      titleText: CustomText(
        text: "Success",
        textStyle: KTextStyles().subHeading(),
      ),
      messageText: CustomText(
        text: message,
        maxLines: 2,
        textStyle: KTextStyles().normal(
          textColor: KColors.kWhite,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      overlayBlur: overlay ? 2.0 : null,
      overlayColor: overlay ? KColors.kBlack.withOpacity(.2) : null,
      colorText: KColors.kWhite,
      backgroundColor: KColors.kGreen,
      snackPosition: position,
      margin: EdgeInsets.all(kWidth(.05)),
      duration: Duration(
        milliseconds: duration,
      ),
    );
  }

  errorSnackBar(
    message, {
    position = SnackPosition.BOTTOM,
    duration = 1500,
    overlay = false,
  }) {
    return Get.snackbar(
      "Error",
      message,
      titleText: CustomText(
        text: "Error",
        textStyle: KTextStyles().subHeading(),
      ),
      messageText: CustomText(
        text: message,
        maxLines: 2,
        textStyle: KTextStyles().normal(
          textColor: KColors.kWhite,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      overlayBlur: overlay ? 2.0 : null,
      overlayColor: overlay ? KColors.kBlack.withOpacity(.2) : null,
      colorText: KColors.kWhite,
      backgroundColor: KColors.kRed,
      snackPosition: position,
      margin: EdgeInsets.all(kWidth(.05)),
      duration: Duration(
        milliseconds: duration,
      ),
    );
  }

  infoSnackBar(
    message, {
    String title = "Info",
    Color backgroundColor = KColors.kPrimary,
    Color textColor = KColors.kWhite,
    position = SnackPosition.BOTTOM,
    duration = 1500,
    overlay = false,
  }) {
    return Get.snackbar(
      title,
      message,
      titleText: CustomText(
        text: title,
        textStyle: KTextStyles().subHeading(),
      ),
      messageText: CustomText(
        text: message,
        maxLines: 2,
        textStyle: KTextStyles().normal(
          textColor: KColors.kWhite,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      colorText: textColor,
      backgroundColor: backgroundColor,
      snackPosition: position,
      margin: EdgeInsets.all(kWidth(.05)),
      duration: Duration(
        milliseconds: duration,
      ),
    );
  }
}
